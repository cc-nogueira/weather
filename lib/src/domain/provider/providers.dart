import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiver/async.dart';
import 'package:quiver/time.dart';
import 'package:tuple/tuple.dart';

import '../entity/common/location.dart';
import '../entity/time_zone/time_zone.dart';
import '../entity/weather/city.dart';
import '../entity/weather/current_weather.dart';
import '../entity/weather/one_call_weather.dart';
import '../layer/domain_layer.dart';
import '../usecase/preferences_usecase.dart';
import '../usecase/weather_usecase.dart';

// -- Preferences:

/// System locales obtained on main() and updated by PresentationLayer App.
final systemLocalesProvider = StateProvider<List<Locale>>((ref) => []);

// -- Cities:

/// Provider for city search service accessed through the usecase.
final citiesSearchProvider = FutureProvider.autoDispose.family<List<City>, City>(
  (ref, city) => ref.watch(
    weatherUsecaseProvider.select((usecase) => usecase.searchCitiesLike(city)),
  ),
);

/// StreamProvider to watch the live list of registered cities.
/// This providers is hooked to the City repository state.
final watchAllCitiesProvider = StreamProvider((ref) => ref.watch(citiesUsecaseProvider).watchAll());

// -- Time Zone:

/// Provider for a location timezone service accessed through the usecase.
final timeZoneProvider = FutureProvider.family<TimeZone, Location>(
  (ref, location) {
    ref.watch(currentWeatherMetronomeProvider);
    return ref.watch(
      timeZoneUsecaseProvider.select((usecase) => usecase.getTimeZone(location)),
    );
  },
);

// -- Weather:

/// CurrentWeather provider for a location.
/// This provider auto refreshs on currentWeatherMetronomeProvider.
final currentWeatherByLocationAutoRefreshProvider = FutureProvider.family<CurrentWeather, Location>((ref, location) {
  ref.watch(currentWeatherMetronomeProvider);
  return ref.watch(weatherUsecaseProvider).getCurrentWeatherByLocation(location);
});

/// OneCallWeather tuple provider for a location.
/// Returns the current weather and a timestamp.
/// This provider is invalidated manually by a RefreshButton or RefreshIndicator.
/// The timestamp is avalilable to permit frequent refresh prevention.
final oneCallWeatherTupleByLocationProvider =
    FutureProvider.family<Tuple2<OneCallWeather, DateTime>, Location>((ref, location) async {
  final weather = await ref.watch(weatherUsecaseProvider).getOneCallByLocation(location);
  return Tuple2(weather, DateTime.now());
});

/// OneCallWeather auto evict provider for a location.
/// This autodispose provider relies on OneCallWeatherTuple provider for the caching, verifying
/// the refresh interval defined in the Usecase class.
/// It invalidates the referenced provider when necessary (time elapsed > refreshInterval).
final oneCallWeatherByLocationAutoEvictProvider =
    FutureProvider.autoDispose.family<OneCallWeather, Location>((ref, location) async {
  final tuple = await ref.read(oneCallWeatherTupleByLocationProvider(location).future);
  if (DateTime.now().difference(tuple.item2) < WeatherUsecase.oneCallWeatherRefreshInterval) {
    return tuple.item1;
  }
  ref.invalidate(oneCallWeatherTupleByLocationProvider(location));
  final refreshedTuple = await ref.read(oneCallWeatherTupleByLocationProvider(location).future);
  return refreshedTuple.item1;
});

// -- Metronome:

/// minuteMetronome provider subscribes to a Metronome with aMinute interval.
/// This provider is invalidated by AppLifecycleUsecase when App is put in background.
/// It will resume execution when observed next time by the resumed user interface.
///
/// This provider is used to show up to date local time for all locations.
final minuteMetronomeProvider = Provider<DateTime>((ref) {
  final subscription = Metronome.epoch(aMinute).listen((dt) => ref.state = dt);
  ref.onDispose(() => subscription.cancel());
  return DateTime.now();
});

/// hourMetronome provider subscribes to a Metronome with anHour interval.
/// This provider is invalidated by AppLifecycleUsecase when App is put in background.
/// It will resume execution when observed next time by the resumed user interface.
///
/// This provider is used to refresh chart information that is hour based.
final hourMetronomeProvider = Provider<DateTime>((ref) {
  final subscription = Metronome.epoch(anHour).listen((dt) => ref.state = dt);
  ref.onDispose(() => subscription.cancel());
  return DateTime.now();
});

/// currentWeatherMetronome provider subscrive to a Metronome with the interval defined in the Usecase.
/// This provider is invalidated by AppLifecycleUsecase when App is put in background.
/// It will resume execution when observed next time by the resumed user interface.
///
/// This provider is used to refresh current weather for all locations..
final currentWeatherMetronomeProvider = Provider<DateTime>((ref) {
  ref.watch(languageOptionProvider);
  final subscription = Metronome.periodic(WeatherUsecase.currentWeatherRefreshInterval).listen((dt) => ref.state = dt);
  ref.onDispose(() {
    subscription.cancel();
  });
  return DateTime.now();
});
