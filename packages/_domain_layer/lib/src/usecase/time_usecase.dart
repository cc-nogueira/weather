import '../entity/common/location.dart';
import '../entity/time_zone/time_zone.dart';
import '../service/time_zone_service.dart';

class TimeUsecase {
  const TimeUsecase({required this.service});

  final TimeZoneService service;

  Future<TimeZone> getTimeZone(Location location) async {
    return await service.getCurrentTimeZoneByLocation(location);
  }
}
