import 'package:_domain_layer/domain_layer.dart';

import '../model/city_location_model.dart';
import 'location_mapper.dart';

class CityMapper {
  const CityMapper();

  final _locationMapper = const LocationMapper();

  City mapEntity(CityLocationModel model) => City(
        name: model.name,
        state: model.state,
        country: model.country,
        location: _locationMapper.mapEntity(model),
      );
}
