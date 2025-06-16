import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart';
import 'package:qty/qty.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entity/common/language_option.dart';
import '../entity/common/preference.dart';
import '../entity/weather/weather_order.dart';
import '../layer/domain_layer.dart';
import '../repository/preferences_repository.dart';

part 'preferences_usecase.g.dart';

/// LanguageOption preference provider
final languageOptionProvider = Provider<LanguageOption>((ref) {
  final usecase = ref.watch(preferencesUsecaseProvider);
  return ref.watch(usecase._languageOptionProvider);
});

/// ThemeMode preference provider
final themeModeProvider = Provider<ThemeMode>((ref) {
  final usecase = ref.watch(preferencesUsecaseProvider);
  return ref.watch(usecase._themeProvider);
});

/// AddTempToRainChart preference provider
final addTempToRainChartProvider = Provider<bool>((ref) {
  final usecase = ref.watch(preferencesUsecaseProvider);
  return ref.watch(usecase._addTempToRainChartProvider);
});

/// AddTempToSnowChart preference provider
final addTempToSnowChartProvider = Provider<bool>((ref) {
  final usecase = ref.watch(preferencesUsecaseProvider);
  return ref.watch(usecase._addTempToSnowChartProvider);
});

/// AddTempToWindChart preference provider
final addTempToWindChartProvider = Provider<bool>((ref) {
  final usecase = ref.watch(preferencesUsecaseProvider);
  return ref.watch(usecase._addTempToWindChartProvider);
});

/// WeatherOrder preference provider
final weatherOrderProvider = Provider<WeatherOrder>((ref) {
  final usecase = ref.watch(preferencesUsecaseProvider);
  return ref.watch(usecase._weatherOrderProvider);
});

/// TemperatureUnit preference provider
final temperatureUnitProvider = Provider<Unit<Temperature>>((ref) {
  final usecase = ref.watch(preferencesUsecaseProvider);
  return ref.watch(usecase._temperatureUnitProvider);
});

/// WindSpeedUnit preference provider
final windSpeedUnitProvider = Provider<Unit<Speed>>((ref) {
  final usecase = ref.watch(preferencesUsecaseProvider);
  return ref.watch(usecase._windSpeedUnitProvider);
});

/// PrecipitationUnit preference provider
final precipitationUnitProvider = Provider<Unit<Speed>>((ref) {
  final usecase = ref.watch(preferencesUsecaseProvider);
  return ref.watch(usecase._precipitationUnitProvider);
});

@Riverpod(keepAlive: true)
// ignore: deprecated_member_use_from_same_package
PreferencesUsecase preferencesUsecase(PreferencesUsecaseRef ref) =>
    PreferencesUsecase(ref: ref, repository: domainLayer.dataProvision.preferencesRepositoryBuilder());

/// PreferencesUsecase manages a well defined domain of preferences.
///
/// All preferences are stored with well known keys defined as static variables.
/// Preferences values are stored as Strings and converted on its getter/setters to/from a variety
/// of classes such as ThemeMode, WeatherOrder and different Units.
///
/// Preferences keys and initial values are private to the class.
///
/// All setter methods do save the preference to storage and updates the corresponding StateProvider,
/// making it very convenient to rely on providers and stay up to date with preferences state.
/// This strategy works combined with those public read only Providers available above in this file.
///
/// These providers are late initialized retrieving the storage state on first access with default
/// initial values.
///
/// Preferences allowed values are available through this usecase singleton instance API.
class PreferencesUsecase {
  /// Constructor requires the injection of [PreferencesRepository] implementation and a Riverpod
  /// [Reader].
  ///
  /// The repository is used for preferences persistence.
  /// The Reader is used to manipulate local StateProviders that store and notify changes for  all
  /// preferences.
  PreferencesUsecase({required this.ref, required this.repository});

  static const _languageOptionKey = 'language';
  static const _themeKey = 'theme';
  static const _addTempToRainChartKey = 'addTempToRainChart';
  static const _addTempToSnowChartKey = 'addTempToSnowChart';
  static const _addTempToWindChartKey = 'addTempToWindChart';
  static const _weatherOrderKey = 'weatherOrder';
  static const _temperatureUnitKey = 'temperatureUnit';
  static const _windSpeedUnitKey = 'windSpeedUnit';
  static const _precipitationUnitKey = 'precipitationUnit';

  static const _initialTheme = ThemeMode.dark;
  static const _initialAddTempToCharts = false;
  static const _initialWeatherOrder = WeatherOrder.byTemp;
  static Unit<Temperature> get _initialTemperatureUnit => Temperature().celcius;
  static Unit<Speed> get _initialWindSpeedUnit => Speed().knot;
  static Unit<Speed> get _initialPrecipitationUnit => Speed().millimeterPerHour;

  /// Internal Riverpod [Reader].
  @internal
  final Ref ref;

  /// Internal [PreferencesRepositoty] implementation.
  @internal
  final PreferencesRepository repository;

  /// Available themes.
  final themes = const [ThemeMode.dark, ThemeMode.light];

  /// Available WeatherOrder values.
  final weatherOrders = WeatherOrder.values;

  /// Available temperature units.
  final temperatureUnits = [Temperature().celcius, Temperature().fahrenheit];

  /// Available wind speed units.
  final windSpeedUnits = [
    Speed().knot,
    Speed().meterPerSecond,
    Speed().kilometerPerHour,
    Speed().milePerHour,
  ];

  /// Available precipitation (rain and snow) units.
  final precipitationUnits = [Speed().millimeterPerHour, Speed().inchPerHour];

  // Private prividers:
  late final _languageOptionProvider = StateProvider((_) => _languageOption);
  late final _themeProvider = StateProvider((_) => _theme);
  late final _addTempToRainChartProvider = StateProvider((_) => _addTempToRainChart);
  late final _addTempToSnowChartProvider = StateProvider((_) => _addTempToSnowChart);
  late final _addTempToWindChartProvider = StateProvider((_) => _addTempToWindChart);
  late final _weatherOrderProvider = StateProvider((_) => _weatherOrder);
  late final _temperatureUnitProvider = StateProvider<Unit<Temperature>>((ref) => _temperatureUnit);
  late final _windSpeedUnitProvider = StateProvider<Unit<Speed>>((ref) => _windSpeedUnit);
  late final _precipitationUnitProvider = StateProvider<Unit<Speed>>((ref) => _precipitationUnit);

  /// Setter to change the [LanguageOption] preference.
  ///
  /// This setter will trigger this preference change notification through the correpondent provider.
  set languageOption(LanguageOption languageOption) {
    final optionStr = '${languageOption.languageCode}_${languageOption.countryCode ?? ''}';
    repository.saveByKey(Preference(key: _languageOptionKey, value: optionStr));
    ref.read(_languageOptionProvider.notifier).state = languageOption;
  }

  /// Internal getter for [LanguageOption] preference.
  ///
  /// This method reads the preference from the [PreferencesRepository] with a default initialValue.
  /// Use the correspondent public provider instead.
  LanguageOption get _languageOption {
    final pref = repository.getByKey(_languageOptionKey);
    if (pref == null) return LanguageOption.none;
    final split = pref.value.split('_');
    final languageCode = split[0];
    final countryCode = (split.length == 2) ? split[1] : null;
    return LanguageOption.matching(languageCode, countryCode);
  }

  /// Setter to change the [ThemeMode] preference.
  ///
  /// This setter will trigger this preference change notification through the correpondent provider.
  set theme(ThemeMode theme) {
    repository.saveByKey(Preference(key: _themeKey, value: theme.name));
    ref.read(_themeProvider.notifier).state = theme;
  }

  /// Internal getter for [ThemeMode] preference.
  ///
  /// This method reads the preference from the [PreferencesRepository] with a default initialValue.
  /// Use the correspondent public provider instead.
  ThemeMode get _theme {
    final pref = repository.getByKey(_themeKey);
    if (pref?.value == ThemeMode.light.name) return ThemeMode.light;
    if (pref?.value == ThemeMode.dark.name) return ThemeMode.dark;
    return _initialTheme;
  }

  /// Setter to change the addTempToRainChart preference.
  ///
  /// This setter will trigger this preference change notification through the correpondent provider.
  set addTempToRainChart(bool option) {
    repository.saveByKey(Preference(key: _addTempToRainChartKey, value: option.toString()));
    ref.read(_addTempToRainChartProvider.notifier).state = option;
  }

  /// Internal getter for addTempToRainChart preference.
  ///
  /// This method reads the preference from the [PreferencesRepository] with a default initialValue.
  /// Use the correspondent public provider instead.
  bool get _addTempToRainChart {
    final pref = repository.getByKey(_addTempToRainChartKey);
    if (pref?.value == "true") return true;
    if (pref?.value == "false") return false;
    return _initialAddTempToCharts;
  }

  /// Setter to change the addTempToSnowChart preference.
  ///
  /// This setter will trigger this preference change notification through the correpondent provider.
  set addTempToSnowChart(bool option) {
    repository.saveByKey(Preference(key: _addTempToSnowChartKey, value: option.toString()));
    ref.read(_addTempToSnowChartProvider.notifier).state = option;
  }

  /// Internal getter for addTempToSnowChart preference.
  ///
  /// This method reads the preference from the [PreferencesRepository] with a default initialValue.
  /// Use the correspondent public provider instead.
  bool get _addTempToSnowChart {
    final pref = repository.getByKey(_addTempToSnowChartKey);
    if (pref?.value == "true") return true;
    if (pref?.value == "false") return false;
    return _initialAddTempToCharts;
  }

  /// Setter to change the addTempToWindChart preference.
  ///
  /// This setter will trigger this preference change notification through the correpondent provider.
  set addTempToWindChart(bool option) {
    repository.saveByKey(Preference(key: _addTempToWindChartKey, value: option.toString()));
    ref.read(_addTempToWindChartProvider.notifier).state = option;
  }

  /// Internal getter for addTempToWindChart preference.
  ///
  /// This method reads the preference from the [PreferencesRepository] with a default initialValue.
  /// Use the correspondent public provider instead.
  bool get _addTempToWindChart {
    final pref = repository.getByKey(_addTempToWindChartKey);
    if (pref?.value == "true") return true;
    if (pref?.value == "false") return false;
    return _initialAddTempToCharts;
  }

  /// Setter to change the weatherOrder preference.
  ///
  /// This setter will trigger this preference change notification through the correpondent provider.
  set weatherOrder(WeatherOrder order) {
    repository.saveByKey(Preference(key: _weatherOrderKey, value: order.name));
    ref.read(_weatherOrderProvider.notifier).state = order;
  }

  /// Internal getter for weatherOrder preference.
  ///
  /// This method reads the preference from the [PreferencesRepository] with a default initialValue.
  /// Use the correspondent public provider instead.
  WeatherOrder get _weatherOrder {
    final pref = repository.getByKey(_weatherOrderKey);
    for (final option in WeatherOrder.values) {
      if (pref?.value == option.name) return option;
    }
    return _initialWeatherOrder;
  }

  /// Setter to change the temperatureUnit preference.
  ///
  /// This setter will trigger this preference change notification through the correpondent provider.
  set temperatureUnit(Unit<Temperature> unit) {
    repository.saveByKey(Preference(key: _temperatureUnitKey, value: unit.symbol));
    ref.read(_temperatureUnitProvider.notifier).state = unit;
  }

  /// Internal getter for temperatureUnit preference.
  ///
  /// This method reads the preference from the [PreferencesRepository] with a default initialValue.
  /// Use the correspondent public provider instead.
  Unit<Temperature> get _temperatureUnit {
    final pref = repository.getByKey(_temperatureUnitKey);
    for (final option in temperatureUnits) {
      if (pref?.value == option.symbol) return option;
    }

    return _initialTemperatureUnit;
  }

  /// Setter to change the windSpeedUnit preference.
  ///
  /// This setter will trigger this preference change notification through the correpondent provider.
  set windSpeedUnit(Unit<Speed> unit) {
    repository.saveByKey(Preference(key: _windSpeedUnitKey, value: unit.symbol));
    ref.read(_windSpeedUnitProvider.notifier).state = unit;
  }

  /// Internal getter for windSpeedUnit preference.
  ///
  /// This method reads the preference from the [PreferencesRepository] with a default initialValue.
  /// Use the correspondent public provider instead.
  Unit<Speed> get _windSpeedUnit {
    final pref = repository.getByKey(_windSpeedUnitKey);
    for (final option in windSpeedUnits) {
      if (pref?.value == option.symbol) return option;
    }
    return _initialWindSpeedUnit;
  }

  /// Setter to change the precipitationUnit preference.
  ///
  /// This setter will trigger this preference change notification through the correpondent provider.
  set precipitationUnit(Unit<Speed> unit) {
    repository.saveByKey(Preference(key: _precipitationUnitKey, value: unit.symbol));
    ref.read(_precipitationUnitProvider.notifier).state = unit;
  }

  /// Internal getter for precipitationUnit preference.
  ///
  /// This method reads the preference from the [PreferencesRepository] with a default initialValue.
  /// Use the correspondent public provider instead.
  Unit<Speed> get _precipitationUnit {
    final pref = repository.getByKey(_precipitationUnitKey);
    for (final option in precipitationUnits) {
      if (pref?.value == option.symbol) return option;
    }
    return _initialPrecipitationUnit;
  }
}
