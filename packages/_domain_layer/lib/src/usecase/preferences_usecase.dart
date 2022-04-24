import 'package:flutter/material.dart';
import 'package:qty/qty.dart';
import 'package:riverpod/riverpod.dart';

import '../entity/common/preference.dart';
import '../entity/weather/weather_order.dart';
import '../repository/preferences_repository.dart';

class PreferencesUsecase {
  PreferencesUsecase({required this.read, required PreferencesRepository repository})
      : _repository = repository;

  static const themeKey = 'theme';
  static const weatherOrderKey = 'weatherOrder';
  static const temperatureUnitKey = 'temperatureUnit';
  static const windSpeedUnitKey = 'windSpeedUnit';

  static const defaultTheme = ThemeMode.dark;
  static const defaultWeatherOrder = WeatherOrder.byTemp;
  static get defaultTemperatureUnit => Temperature().celcius;
  static get defaultWindSpeedUnit => Speed().knot;

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

  set theme(ThemeMode theme) {
    _repository.saveByKey(Preference(key: themeKey, value: theme.name));
    read(themeProvider.notifier).state = theme;
  }

  ThemeMode get theme {
    final pref = _repository.getByKey(themeKey);
    if (pref?.value == ThemeMode.light.name) return ThemeMode.light;
    if (pref?.value == ThemeMode.dark.name) return ThemeMode.dark;
    return defaultTheme;
  }

  set weatherOrder(WeatherOrder order) {
    _repository.saveByKey(Preference(key: weatherOrderKey, value: order.name));
    read(weatherOrderProvider.notifier).state = order;
  }

  WeatherOrder get weatherOrder {
    final pref = _repository.getByKey(weatherOrderKey);
    for (final option in WeatherOrder.values) {
      if (pref?.value == option.name) return option;
    }
    return defaultWeatherOrder;
  }

  set temperatureUnit(Unit<Temperature> unit) {
    _repository.saveByKey(Preference(key: temperatureUnitKey, value: unit.symbol));
    read(temperatureUnitProvider.notifier).state = unit;
  }

  Unit<Temperature> get temperatureUnit {
    final pref = _repository.getByKey(temperatureUnitKey);
    for (final option in temperatureUnits) {
      if (pref?.value == option.symbol) return option;
    }

    return defaultTemperatureUnit;
  }

  set windSpeedUnit(Unit<Speed> unit) {
    _repository.saveByKey(Preference(key: windSpeedUnitKey, value: unit.symbol));
    read(windSpeedUnitProvider.notifier).state = unit;
  }

  Unit<Speed> get windSpeedUnit {
    final pref = _repository.getByKey(windSpeedUnitKey);
    for (final option in windSpeedUnits) {
      if (pref?.value == option.symbol) return option;
    }
    return defaultWindSpeedUnit;
  }
}
