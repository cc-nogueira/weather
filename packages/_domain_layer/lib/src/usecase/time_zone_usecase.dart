import 'package:meta/meta.dart';

import '../entity/common/location.dart';
import '../entity/time_zone/time_zone.dart';
import '../service/time_zone_service.dart';

/// TimeZoneUsecase is a simple service use case.
///
/// TimeZoneService has a single method in its API.
/// There are no business rules and this use case just forwards the service API.
class TimeZoneUsecase {
  /// Constructor recieves injection of a TimeZoneService implementation.
  const TimeZoneUsecase({required this.service});

  /// Internal TimeZoneService implementation.
  @internal
  final TimeZoneService service;

  /// Get current TimeZone by location.
  Future<TimeZone> getTimeZone(Location location) => service.getCurrentTimeZoneByLocation(location);
}
