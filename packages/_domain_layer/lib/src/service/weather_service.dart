import 'dart:async';

import '../entity/city.dart';
import '../entity/location.dart';
import '../entity/weather.dart';

/// Weather Service interface.
///
/// This is a required dependency for Domain Layer intial configuration when an
/// implementation of this interface should be provisioned.
abstract class WeatherService {
  /// Fetch list of cities that math the given city by name, state and Country.
  ///
  /// Name and Country are required to be filled,
  /// while State is optional to narrow results.
  Future<List<City>> searchCitiesLike(city, {int limit = 10});

  /// Fetch city location from remote service.
  ///
  /// Returns a Future as it expects an async call to a remote service.
  Future<Location> getCityLocation(City city);

  /// Fetch current weather from a remote service.
  ///
  /// Returns a Future as it expects an async call to a rmeove service.
  Future<Weather> getCurrentWeatherByLocation(Location location);
}
