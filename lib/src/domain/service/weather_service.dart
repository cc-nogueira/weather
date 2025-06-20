import 'dart:async';

import '../entity/common/location.dart';
import '../entity/weather/city.dart';
import '../entity/weather/current_weather.dart';
import '../entity/weather/one_call_weather.dart';

/// Weather Service interface.
///
/// This is a required dependency for Domain Layer intial configuration when an
/// implementation of this interface should be provisioned.
abstract class WeatherService {
  /// Fetch list of cities that math the given city by name, state and Country.
  ///
  /// Name and Country are required to be filled,
  /// while State is optional to narrow results.
  Future<List<City>> searchCitiesLike(City city, {int limit = 10});

  /// Fetch city location from remote service.
  ///
  /// Returns a Future as it expects an async call to a remote service.
  Future<Location> getCityLocation(City city);

  /// Fetch current weather from a remote service.
  ///
  /// Returns a Future as it expects an async call to a rmeove service.
  Future<CurrentWeather> getCurrentWeatherByLocation(Location location);

  /// Fetch OneCall weather information from a remote service.
  ///
  /// Returns a Future as it expects an async call to a remote service.
  Future<OneCallWeather> getOneCallByLocation(Location location);
}
