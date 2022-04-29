import 'package:flutter/material.dart';
import 'package:qty/qty.dart';
import 'package:riverpod/riverpod.dart';

import '../entity/common/preference.dart';
import '../entity/weather/weather_order.dart';
import '../repository/preferences_repository.dart';

/// PreferencesUsecase manages a well defined domain of preferences.
///
/// All preferences are stored with well known keys defined as static variables.
/// Preferences values are stored as Strings and converted on its getter/setters to/from a variety
/// of classes such as ThemeMode, WeatherOrder and different Units.
///
/// Preferences keys and initial values are private to the class.
///
/// All setter methods do save the preference to storage and updates the corresponding Provider,
/// making it very convenient to rely on providers for stay up to date with preferences state.
///
/// These providers are late initialized retrieving the storage state on first access with default
/// initial values.
///
/// Preferences allowed values are available through the and instance lists of values that can be
/// accesse by the usecase provider state instance.
class PreferencesUsecase {
  PreferencesUsecase({required this.read, required PreferencesRepository repository})
      : _repository = repository;

  static const _themeKey = 'theme';
  static const _weatherOrderKey = 'weatherOrder';
  static const _temperatureUnitKey = 'temperatureUnit';
  static const _windSpeedUnitKey = 'windSpeedUnit';

  static const _initialTheme = ThemeMode.dark;
  static const _initialWeatherOrder = WeatherOrder.byTemp;
  static get _initialTemperatureUnit => Temperature().celcius;
  static get _initialWindSpeedUnit => Speed().knot;

  final themes = const [ThemeMode.dark, ThemeMode.light];
  final weatherOrders = WeatherOrder.values;
  final temperatureUnits = [Temperature().celcius, Temperature().fahrenheit];
  final windSpeedUnits = [
    Speed().knot,
    Speed().meterPerSecond,
    Speed().kilometerPerHour,
    Speed().milePerHour,
  ];

  final Reader read;
  late final themeProvider = StateProvider((_) => theme);
  late final weatherOrderProvider = StateProvider((_) => weatherOrder);
  late final temperatureUnitProvider = StateProvider<Unit<Temperature>>((ref) => temperatureUnit);
  late final windSpeedUnitProvider = StateProvider<Unit<Speed>>((ref) => windSpeedUnit);

  final PreferencesRepository _repository;

  /// Save the theme preference and updates this usecase [themeProvider].
  set theme(ThemeMode theme) {
    _repository.saveByKey(Preference(key: _themeKey, value: theme.name));
    read(themeProvider.notifier).state = theme;
  }

  /// Read the theme from storage using a default initial value
  ThemeMode get theme {
    final pref = _repository.getByKey(_themeKey);
    if (pref?.value == ThemeMode.light.name) return ThemeMode.light;
    if (pref?.value == ThemeMode.dark.name) return ThemeMode.dark;
    return _initialTheme;
  }

  /// Save the weather order preference and update this usecase [weatherOrderProvider].
  set weatherOrder(WeatherOrder order) {
    _repository.saveByKey(Preference(key: _weatherOrderKey, value: order.name));
    read(weatherOrderProvider.notifier).state = order;
  }

  /// Read the weather order preference from storage using a default initial value
  WeatherOrder get weatherOrder {
    final pref = _repository.getByKey(_weatherOrderKey);
    for (final option in WeatherOrder.values) {
      if (pref?.value == option.name) return option;
    }
    return _initialWeatherOrder;
  }

  /// Save the temperature unit preference and update this usecase [temperatureUnitProvider].
  set temperatureUnit(Unit<Temperature> unit) {
    _repository.saveByKey(Preference(key: _temperatureUnitKey, value: unit.symbol));
    read(temperatureUnitProvider.notifier).state = unit;
  }

  /// Read the temperature unit preference from storage using a default initial value
  Unit<Temperature> get temperatureUnit {
    final pref = _repository.getByKey(_temperatureUnitKey);
    for (final option in temperatureUnits) {
      if (pref?.value == option.symbol) return option;
    }

    return _initialTemperatureUnit;
  }

  /// Save the wind speed unit preference and update this usecase [windSpeedUnitProvider].
  set windSpeedUnit(Unit<Speed> unit) {
    _repository.saveByKey(Preference(key: _windSpeedUnitKey, value: unit.symbol));
    read(windSpeedUnitProvider.notifier).state = unit;
  }

  /// Read the wind speed unit preference from storage using a default initial value
  Unit<Speed> get windSpeedUnit {
    final pref = _repository.getByKey(_windSpeedUnitKey);
    for (final option in windSpeedUnits) {
      if (pref?.value == option.symbol) return option;
    }
    return _initialWindSpeedUnit;
  }
}
