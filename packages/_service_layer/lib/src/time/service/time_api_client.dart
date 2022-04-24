import 'dart:convert';

import 'package:_domain_layer/domain_layer.dart';

import 'package:http/http.dart' as http;

/// Time API client.
///
/// Remote invocations to Time API.
class TimeApiClient {
  const TimeApiClient();

  /// Fetches current time zone info JSON from Time API.
  ///
  /// Returns current time zone info JSON for the given location.
  Future<Map<String, dynamic>> getTimeZoneJson(Location location) async {
    final uri = Uri.https('timeapi.io', '/api/TimeZone/coordinate', {
      'latitude': location.latitude.toString(),
      'longitude': location.longitude.toString(),
    });

    return _invoke<Map<String, dynamic>>(uri);
  }

  Future<T> _invoke<T>(Uri uri) async {
    final response = await http.get(uri);
    return json.decode(response.body) as T;
  }
}
