import 'package:_domain_layer/domain_layer.dart';
import 'package:meta/meta.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../mapper/time_zone_mapper.dart';
import '../model/time_zone_model.dart';
import 'time_api_client.dart';

part 'time_api_service.g.dart';

/// TimeZone service implementaion provider
@Riverpod(keepAlive: true)
TimeApiService timeApiService(TimeApiServiceRef ref) => const TimeApiService();

/// Time API service provided by TimeAPI.io.
///
/// Implements domain's TimeZoneService interface.
///
/// Access Time API by Location.
class TimeApiService implements TimeZoneService {
  /// Const constructor.
  const TimeApiService() : client = const TimeApiClient();

  /// TimeAPI client
  final TimeApiClient client;

  /// Mapper to convert from service Model to domain Entity.
  @internal
  final mapper = const TimeZoneMapper();

  /// Fetch Time Zone information from TimeAPI client.
  ///
  /// Returns a Future for this location TimeZone.
  ///
  /// Throws ArgumentError if can't find TieZone info for this location.
  @override
  Future<TimeZone> getCurrentTimeZoneByLocation(Location location) async {
    final jsonMap = await client.getTimeZoneJson(location);
    if (jsonMap['timeZone'] == null) {
      throw ArgumentError('Did not find time zone info for location.');
    }
    final model = TimeZoneModel.fromJson(jsonMap);
    return mapper.mapEntity(model);
  }
}
