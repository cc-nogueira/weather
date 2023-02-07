import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entity/common/location.dart';
import '../../../domain/entity/weather/city.dart';
import '../../../domain/entity/weather/current_weather.dart';
import '../../../domain/entity/weather/one_call_weather.dart';
import '../../../domain/service/weather_service.dart';
import '../../../domain/usecase/preferences_usecase.dart';
import '../../layer/service_layer.dart';
import '../mapper/city_mapper.dart';
import '../mapper/current_weather_mapper.dart';
import '../mapper/location_mapper.dart';
import '../mapper/one_call_mapper.dart';
import '../model/city_location_model.dart';
import '../model/current_weather_model.dart';
import '../model/one_call_weather_model.dart';
import 'open_weather_client.dart';

part 'open_weather_service.g.dart';

/// Weather service implementation provider.
@Riverpod(keepAlive: true)
OpenWeatherService weatherService(WeatherServiceRef ref) =>
    OpenWeatherService(appId: ServiceLayer.openWeatherAppId, ref: ref);

/// Wheather service provided by OpenWeather.
///
/// Implements domain's WeatherSerice interface.
///
/// Access CurrentWeather by City or Location.
class OpenWeatherService implements WeatherService {
  /// Constructor must receive a valid OpenWeather AppID and a Riverpod Reader.
  OpenWeatherService({
    required String appId,
    required this.ref,
  }) : client = OpenWeatherClient(appId: appId);

  /// OpenWeather client.
  @internal
  final OpenWeatherClient client;

  /// Riverpod Reader to access current selected language option.
  @internal
  final Ref ref;

  @internal
  final weatherMapper = const CurrentWeatherMapper();

  @internal
  final oneCallMapper = const OneCallMapper();

  @internal
  final cityMapper = const CityMapper();

  @internal
  final locationMapper = const LocationMapper();

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
      cities.add(cityMapper.mapEntity(cityModel));
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

    return locationMapper.mapEntity(cityModel);
  }

  /// Fetch weather information from OpenWeather client.
  ///
  /// Returns a Future for this location CurrentWeather.
  ///
  /// Throws ArgumentError if can't find weather info for this location.
  @override
  Future<CurrentWeather> getCurrentWeatherByLocation(Location location) async {
    final jsonMap = await client.getCurrentWeatherJson(location, _language);
    if (jsonMap['cod'] != 200) {
      throw ArgumentError('Did not find weather info for location.');
    }
    final model = CurrentWeatherModel.fromJson(jsonMap);
    return weatherMapper.mapEntity(model);
  }

  /// Fetch oneCall information from OpenWeather client.
  ///
  /// Returns a Future for this location OneCall.
  ///
  /// Throws ArgumentError if can't find weather info for this location.
  @override
  Future<OneCallWeather> getOneCallByLocation(Location location) async {
    final jsonMap = await client.getOneCallJson(location, _language);
    final model = OneCallWeatherModel.fromJson(jsonMap);
    return oneCallMapper.mapEntity(model);
  }

  /// Internal - get selected language option stored in a Riverpod provider or use system locale.
  String get _language => ref.read(languageOptionProvider).locale?.languageCode ?? window.locale.languageCode;
}
