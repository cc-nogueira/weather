import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tuple/tuple.dart';

import '../entity/common/location.dart';
import '../entity/weather/city.dart';
import '../entity/weather/current_weather.dart';
import '../entity/weather/one_call_weather.dart';
import '../layer/domain_layer.dart';
import '../service/weather_service.dart';
import 'state/metronome_state.dart';

part 'weather_usecase.g.dart';

@Riverpod(keepAlive: true)
WeatherUsecase weatherUsecase(WeatherUsecaseRef ref) => WeatherUsecase(
      service: domainLayer.serviceProvision.weatherServiceBuilder(),
      log: Logger('usecase'),
    );

/// CurrentWeather provider for a location.
/// This provider auto refreshs on currentWeatherMetronomeProvider.
@Riverpod(keepAlive: true)
Future<CurrentWeather> currentWeatherByLocationAutoRefresh(
    CurrentWeatherByLocationAutoRefreshRef ref, Location location) {
  ref.watch(currentWeatherMetronomeProvider);
  return ref.watch(weatherUsecaseProvider).getCurrentWeatherByLocation(location);
}

/// OneCallWeather tuple provider for a location.
/// Returns the current weather and a timestamp.
/// This provider is invalidated manually by a RefreshButton or RefreshIndicator.
/// The timestamp is avalilable to permit frequent refresh prevention.
@Riverpod(keepAlive: true)
Future<Tuple2<OneCallWeather, DateTime>> oneCallWeatherTupleByLocation(
  OneCallWeatherTupleByLocationRef ref,
  Location location,
) async {
  final weather = await ref.watch(weatherUsecaseProvider).getOneCallByLocation(location);
  return Tuple2(weather, DateTime.now());
}

/// OneCallWeather auto evict provider for a location.
/// This autodispose provider relies on OneCallWeatherTuple provider for the caching, verifying
/// the refresh interval defined in the Usecase class.
/// It invalidates the referenced provider when necessary (time elapsed > refreshInterval).
@riverpod
Future<OneCallWeather> oneCallWeatherByLocationAutoEvict(
  OneCallWeatherByLocationAutoEvictRef ref,
  Location location,
) async {
  final tuple = await ref.read(oneCallWeatherTupleByLocationProvider(location).future);
  if (DateTime.now().difference(tuple.item2) < WeatherUsecase.oneCallWeatherRefreshInterval) {
    return tuple.item1;
  }
  ref.invalidate(oneCallWeatherTupleByLocationProvider(location));
  final refreshedTuple = await ref.read(oneCallWeatherTupleByLocationProvider(location).future);
  return refreshedTuple.item1;
}

/// Provider for weather city search service accessed through the usecase.
@riverpod
Future<List<City>> weatherCitiesSearch(WeatherCitiesSearchRef ref, City city) {
  return ref.watch(weatherUsecaseProvider).searchCitiesLike(city);
}

/// WeatherUsecase is a service use case.
///
/// It has a only business rules to difene static values for weather refresh intervals.
/// This constants are used to configure automatic refresh of weather information directly at
/// the definition of weather providers (@see [providers.dart])
class WeatherUsecase {
  /// Constructor receives injection of WeatherService implementation and a Logger.
  const WeatherUsecase({required this.service, required this.log});

  /// Static const for currentWeatherRefresh interval.
  static const currentWeatherRefreshInterval = Duration(minutes: 60);

  /// Static const for currentWeather MinRefresh interval (prevent frequent manual refreshes).
  static const currentWeatherMinRefreshInterval = Duration(minutes: 10);

  /// Static const for oneCallWeatherRefresh interval.
  static const oneCallWeatherRefreshInterval = Duration(hours: 2);

  /// Static const for oneCallWeather MinRefresh interval (prevent frequent manual refreshes).
  static const oneCallWeatherMinRefreshInterval = Duration(minutes: 10);

  /// Internal WeatherService implementation reference (injected on constructor).
  @internal
  final WeatherService service;

  /// Internal logger
  @internal
  final Logger log;

  /// Search cities matching the argument (name and country)
  Future<List<City>> searchCitiesLike(City city) => service.searchCitiesLike(city);

  /// Get the Location of a City
  Future<Location> getCityLocation(City city) => service.getCityLocation(city);

  /// Get the CurrentWeather for a location
  Future<CurrentWeather> getCurrentWeatherByLocation(Location location) {
    log.fine('fetching currentWeather');
    return service.getCurrentWeatherByLocation(location);
  }

  /// Get the OneCallWeather for a location
  Future<OneCallWeather> getOneCallByLocation(Location location) {
    log.fine('fetching oneCallWeather');
    return service.getOneCallByLocation(location);
  }
}
