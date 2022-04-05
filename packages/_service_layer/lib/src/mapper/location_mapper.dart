import 'package:_domain_layer/domain_layer.dart';

import '../model/city_location_model.dart';

class LocationMapper {
  const LocationMapper();

  Location mapEntity(CityLocationModel model) => Location(
        latitude: model.lat,
        longitude: model.lon,
      );
}
