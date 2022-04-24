import 'package:_domain_layer/domain_layer.dart';

import '../mapper/time_zone_mapper.dart';
import '../model/time_zone_model.dart';
import 'time_api_client.dart';

/// Time API service provided by TimeAPI.io.
///
/// Access Time API by Location.
class TimeApiService implements TimeZoneService {
  const TimeApiService() : client = const TimeApiClient();

  final TimeApiClient client;
  final _mapper = const TimeZoneMapper();

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
    return _mapper.mapEntity(model);
  }
}
