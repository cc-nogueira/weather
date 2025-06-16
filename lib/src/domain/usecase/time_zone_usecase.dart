import 'package:meta/meta.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entity/common/location.dart';
import '../entity/time_zone/time_zone.dart';
import '../layer/domain_layer.dart';
import '../service/time_zone_service.dart';
import 'state/metronome_state.dart';

part 'time_zone_usecase.g.dart';

@Riverpod(keepAlive: true)
// ignore: deprecated_member_use_from_same_package
TimeZoneUsecase timeZoneUsecase(TimeZoneUsecaseRef ref) =>
    TimeZoneUsecase(service: domainLayer.serviceProvision.timeZoneServiceBuilder());

/// Provider for a location timezone service accessed through the usecase.
@riverpod
// ignore: deprecated_member_use_from_same_package
Future<TimeZone> timeZone(TimeZoneRef ref, Location location) {
  ref.watch(currentWeatherMetronomeProvider);
  return ref.watch(
    timeZoneUsecaseProvider.select((usecase) => usecase.getTimeZone(location)),
  );
}

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
