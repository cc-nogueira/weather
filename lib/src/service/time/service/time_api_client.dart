import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../domain/entity/common/location.dart';

/// Time API client.
///
/// Remote invocations to Time API.
class TimeApiClient {
  /// Const constructor.
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

  /// Internal - invoke http call.
  ///
  /// Return decoded json.
  Future<T> _invoke<T>(Uri uri) async {
    final response = await http.get(uri);
    return json.decode(response.body) as T;
  }
}
