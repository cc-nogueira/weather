import 'dart:convert';

import 'package:_domain_layer/domain_layer.dart';

import 'package:http/http.dart' as http;

/// OpenWeather client.
///
/// Remote invocations to OpenWeather API.
class OpenWeatherClient {
  OpenWeatherClient({required this.appId, required this.language});

  final String appId;
  final String language;

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
    if (name.trim().isEmpty || country.trim().isEmpty) {
      throw ArgumentError('city and country needed for weather info');
    }

    final search = [name, country];
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
  Future<Map<String, dynamic>> getCurrentWeatherJson(Location location) async {
    final uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
      'units': 'metric',
      'lang': language,
      'appid': appId,
    });

    return _invoke<Map<String, dynamic>>(uri);
  }

  Future<T> _invoke<T>(Uri uri) async {
    final response = await http.get(uri);
    return json.decode(response.body) as T;
  }
}
