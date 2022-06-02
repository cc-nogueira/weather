import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import '../entity/common/location.dart';
import '../entity/weather/city.dart';
import '../entity/weather/current_weather.dart';
import '../entity/weather/one_call_weather.dart';
import '../service/weather_service.dart';

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
