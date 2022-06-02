import 'dart:convert';

import 'package:_domain_layer/domain_layer.dart';

import 'package:http/http.dart' as http;

/// OpenWeather client.
///
/// Remote invocations to OpenWeather API.
class OpenWeatherClient {
  /// Const constructor must receive a valid OpenWeather AppID.
  const OpenWeatherClient({required this.appId});

  /// OpenWeather AppID stored in ServiceLayer (must be redefined with a valid ID).
  final String appId;

  /// Fetches a list with one or zero Geo Locations JSON from OpenWeather API.
  ///
  /// Get Geo Locations for a city name, state and country.
  /// City's name and country are required, city's state is optional for better match.
  ///
  /// Returns a list with one or zero Geo Locations JSON found for that city.
  /// Throws ArgumentError if name or country are blank.
  Future<List> getGeoJson(City city, {int limit = 1}) async {
    final name = city.name.trim();
    final country = city.country.trim();
    if (name.trim().isEmpty) {
      throw ArgumentError('city and country needed for weather info');
    }

    final search = [
      name,
      if (country.isNotEmpty) country,
    ];
    final state = city.state.trim();
    if (state.isNotEmpty) search.insert(1, state);

    final uri = Uri.https('api.openweathermap.org', '/geo/1.0/direct', {
      'q': search.join(','),
      'limit': limit.toString(),
      'appid': appId,
    });

    return _invoke<List>(uri);
  }

  /// Fetches current weather JSON from OpenWeather API.
  ///
  /// Returns currentweather JSON for the given location.
  Future<Map<String, dynamic>> getCurrentWeatherJson(Location location, String languageCode) async {
    final uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
      'units': 'metric',
      'lang': languageCode,
      'appid': appId,
    });

    return _invoke<Map<String, dynamic>>(uri);
  }

  /// Fetches oneCall JSON from OpenWeather API.
  ///
  /// Returns oneCall JSON for the given location.
  Future<Map<String, dynamic>> getOneCallJson(Location location, String languageCode) async {
    final uri = Uri.https('api.openweathermap.org', '/data/2.5/onecall', {
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
      'exclude': 'minutely',
      'units': 'metric',
      'lang': languageCode,
      'appid': appId,
    });

    return _invoke<Map<String, dynamic>>(uri);
  }

  /// Internal - http invocation.
  /// Return decoded JSON.
  Future<T> _invoke<T>(Uri uri) async {
    final response = await http.get(uri);
    return json.decode(response.body) as T;
  }
}
