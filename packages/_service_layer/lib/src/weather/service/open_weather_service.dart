import 'package:_domain_layer/domain_layer.dart';

import '../mapper/city_mapper.dart';
import '../mapper/location_mapper.dart';
import '../mapper/one_call_mapper.dart';
import '../mapper/weather_mapper.dart';
import '../model/city_location_model.dart';
import '../model/current_weather_model.dart';
import '../model/one_call_weather_model.dart';
import 'open_weather_client.dart';

/// Wheather service provided by OpenWeather.
///
/// Access CurrentWeather by City or Location.
class OpenWeatherService implements WeatherService {
  OpenWeatherService({
    required String appId,
    required String language,
  }) : client = OpenWeatherClient(appId: appId, language: language);

  final OpenWeatherClient client;
  final _weatherMapper = const WeatherMapper();
  final _oneCallMapper = const OneCallMapper();
  final _cityMapper = const CityMapper();
  final _locationMapper = const LocationMapper();

  /// Fetch list of cities that math the given city by name, state and Country.
  ///
  /// Name and Country are required to be filled,
  /// while State is optional to narrow results.
  @override
  Future<List<City>> searchCitiesLike(city, {int limit = 10}) async {
    final jsonList = await client.getGeoJson(city, limit: limit);
    final stateIncluded = <String>{};
    final cities = <City>[];
    for (var i = 0; i < jsonList.length; ++i) {
      final map = jsonList[i] as Map<String, dynamic>;
      final cityModel = CityLocationModel.fromJson(map);
      if (stateIncluded.contains(cityModel.state)) {
        continue;
      }
      cities.add(_cityMapper.mapEntity(cityModel));
      stateIncluded.add(cityModel.state);
    }

    return cities;
  }

  /// Fetch city location from remote service.
  ///
  /// Returns a Future as it expects an async call to a remote service.
  @override
  Future<Location> getCityLocation(City city) async {
    final jsonList = await client.getGeoJson(city);
    if (jsonList.isEmpty) {
      throw ArgumentError('No location found for "$city"');
    }
    final firstMap = jsonList[0] as Map<String, dynamic>;
    final cityModel = CityLocationModel.fromJson(firstMap);

    return _locationMapper.mapEntity(cityModel);
  }

  /// Fetch weather information from OpenWeather client.
  ///
  /// Returns a Future for this location CurrentWeather.
  ///
  /// Throws ArgumentError if can't find weather info for this location.
  @override
  Future<Weather> getCurrentWeatherByLocation(Location location) async {
    final jsonMap = await client.getCurrentWeatherJson(location);
    if (jsonMap['cod'] != 200) {
      throw ArgumentError('Did not find weather info for location.');
    }
    final model = CurrentWeatherModel.fromJson(jsonMap);
    return _weatherMapper.mapEntity(model);
  }

  /// Fetch oneCall information from OpenWeather client.
  ///
  /// Returns a Future for this location OneCall.
  ///
  /// Throws ArgumentError if can't find weather info for this location.
  @override
  Future<OneCallWeather> getOneCallByLocation(Location location) async {
    final jsonMap = await client.getOneCallJson(location);
    final model = OneCallWeatherModel.fromJson(jsonMap);
    return _oneCallMapper.mapEntity(model);
  }
}
