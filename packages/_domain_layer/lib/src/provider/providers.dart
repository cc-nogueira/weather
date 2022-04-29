import 'package:flutter/material.dart';
import 'package:qty/qty.dart';
import 'package:quiver/async.dart';
import 'package:quiver/time.dart';
import 'package:riverpod/riverpod.dart';

import '../entity/common/location.dart';
import '../entity/time_zone/time_zone.dart';
import '../entity/weather/city.dart';
import '../entity/weather/current_weather.dart';
import '../entity/weather/one_call_weather.dart';
import '../entity/weather/weather_order.dart';
import '../layer/domain_layer.dart';
import '../usecase/cities_usecase.dart';
import '../usecase/preferences_usecase.dart';
import '../usecase/time_zone_usecase.dart';
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

// -- Cities:

final citiesUsecaseProvider =
    Provider<CitiesUsecase>((ref) => ref.watch(domainLayerProvider).citiesUsecase);

final citiesSearchProvider = FutureProvider.autoDispose.family<List<City>, City>(
  (ref, city) => ref.watch(
    weatherUsecaseProvider.select((usecase) => usecase.searchCitiesLike(city)),
  ),
);

final watchAllCitiesProvider = StreamProvider((ref) => ref.watch(citiesUsecaseProvider).watchAll());

// -- Time Zone:

final timeUsecaseProvider =
    Provider<TimeZoneUsecase>((ref) => ref.watch(domainLayerProvider).timeUsecase);

final timeZoneProvider = FutureProvider.autoDispose.family<TimeZone, Location>(
  (ref, location) {
    ref.watch(currentWeatherMetronomeProvider);
    return ref.watch(
      timeUsecaseProvider.select((usecase) => usecase.getTimeZone(location)),
    );
  },
);

// -- Weather:

final weatherUsecaseProvider =
    Provider<WeatherUsecase>((ref) => ref.watch(domainLayerProvider).weatherUsecase);

final currentWeatherByLocationProvider =
    FutureProvider.autoDispose.family<CurrentWeather, Location>((ref, location) {
  ref.watch(currentWeatherMetronomeProvider);
  return ref.watch(weatherUsecaseProvider).getCurrentWeatherByLocation(location);
});

final oneCallWeatherByLocationProvider =
    FutureProvider.autoDispose.family<OneCallWeather, Location>((ref, location) async {
  //ref.watch(oneCallWeatherMetronomeProvider);
  final cache = ref.watch(oneCallWeatherCacheProvider);
  var weather = cache[location];
  if (weather != null) {
    print('Constructed oneCallProvider for $location from cache');
    return weather;
  }
  weather = await ref.watch(weatherUsecaseProvider).getOneCallByLocation(location);
  print('Constructed oneCallProvider for $location from service');

  return cache[location] = weather;
});

final oneCallWeatherCacheProvider = Provider<Map<Location, OneCallWeather>>((ref) {
  ref.watch(oneCallWeatherMetronomeProvider);
  return <Location, OneCallWeather>{};
});

// -- Metronome:

final minuteMetronomeProvider = Provider<DateTime>((ref) {
  Metronome.epoch(aMinute).listen((dt) {
    print('minuteMetronome with $dt');
    ref.state = dt;
  });
  return DateTime.now();
});

final currentWeatherMetronomeProvider = Provider<DateTime>((ref) {
  Metronome.periodic(WeatherUsecase.currentWeatherRefreshInterval).listen((dt) => ref.state = dt);
  return DateTime.now();
});

final oneCallWeatherMetronomeProvider = Provider<DateTime>((ref) {
  Metronome.periodic(WeatherUsecase.oneCallWeatherRefreshInterval).listen((dt) => ref.state = dt);
  return DateTime.now();
});
