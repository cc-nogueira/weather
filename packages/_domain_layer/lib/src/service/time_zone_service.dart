import 'dart:async';

import '../entity/common/location.dart';
import '../entity/time_zone/time_zone.dart';

/// Time API service provided by TimeAPI.io.
///
/// Access Time API by Location.
abstract class TimeZoneService {
  /// Fetch Time Zone information from TimeAPI client.
  ///
  /// Returns a Future for this location TimeZone.
  ///
  /// Throws ArgumentError if can't find TieZone info for this location.
  Future<TimeZone> getCurrentTimeZoneByLocation(Location location);
}
