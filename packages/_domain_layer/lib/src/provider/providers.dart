import 'package:flutter/material.dart';
import 'package:qty/qty.dart';
import 'package:riverpod/riverpod.dart';

import '../entity/common/location.dart';
import '../entity/time_zone/time_zone.dart';
import '../entity/weather/city.dart';
import '../entity/weather/weather.dart';
import '../entity/weather/weather_order.dart';
import '../layer/domain_layer.dart';
import '../usecase/cities_usecase.dart';
import '../usecase/preferences_usecase.dart';
import '../usecase/time_usecase.dart';
import '../usecase/weather_usecase.dart';

/// Domain Layer provider
final domainLayerProvider = Provider((ref) => DomainLayer(read: ref.read));

/// Function provider for dependency configuration (implementation injection)
final domainConfigurationProvider =
    Provider<DomainConfiguration>((ref) => ref.watch(domainLayerProvider).configure);

// -- Preferences:

final preferencesUsecaseProvider =
    Provider<PreferencesUsecase>((ref) => ref.watch(domainLayerProvider).preferencesUsecase);

final themeModeProvider = Provider<ThemeMode>((ref) {
  final usecase = ref.watch(preferencesUsecaseProvider);
  return ref.watch(usecase.themeProvider);
});

final weatherOrderProvider = Provider<WeatherOrder>((ref) {
  final usecase = ref.watch(preferencesUsecaseProvider);
  return ref.watch(usecase.weatherOrderProvider);
});

final temperatureUnitProvider = Provider<Unit<Temperature>>((ref) {
  final usecase = ref.watch(preferencesUsecaseProvider);
  return ref.watch(usecase.temperatureUnitProvider);
});

final windSpeedUnitProvider = Provider<Unit<Speed>>((ref) {
  final usecase = ref.watch(preferencesUsecaseProvider);
  return ref.watch(usecase.windSpeedUnitProvider);
});

// -- Time Zone:

final timeUsecaseProvider =
    Provider<TimeUsecase>((ref) => ref.watch(domainLayerProvider).timeUsecase);

final timeZoneProvider = FutureProvider.autoDispose.family<TimeZone, Location>(
  (ref, location) => ref.watch(
    timeUsecaseProvider.select((usecase) => usecase.getTimeZone(location)),
  ),
);

// -- Weather:

final weatherUsecaseProvider =
    Provider<WeatherUsecase>((ref) => ref.watch(domainLayerProvider).weatherUsecase);

final citiesUsecaseProvider =
    Provider<CitiesUsecase>((ref) => ref.watch(domainLayerProvider).citiesUsecase);

final citiesSearchProvider = FutureProvider.autoDispose.family<List<City>, City>(
  (ref, city) => ref.watch(
    weatherUsecaseProvider.select((usecase) => usecase.searchCitiesLike(city)),
  ),
);

/// currentWeatherByLocation FutureProvider
final currentWeatherByLocationProvider = FutureProvider.autoDispose.family<Weather, Location>(
    (ref, location) => ref.watch(weatherUsecaseProvider).getCurrentWeatherByLocation(location));

/// watchAllCities StreamProvider
final watchAllCitiesProvider = StreamProvider((ref) => ref.watch(citiesUsecaseProvider).watchAll());
