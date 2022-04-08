import 'package:_domain_layer/domain_layer.dart';

import '../model/city_model.dart';
import 'entity_mapper.dart';

class CityMapper extends EntityMapper<City, CityModel> {
  const CityMapper();

  @override
  City mapEntity(CityModel model) => City(
        id: model.id,
        order: model.order,
        name: model.name,
        state: model.state,
        country: model.country,
        location: Location(latitude: model.latitude, longitude: model.longitude),
      );

  @override
  CityModel mapModel(City entity) => CityModel(
        id: entity.id,
        order: entity.order,
        name: entity.name,
        state: entity.state,
        country: entity.country,
        latitude: entity.location?.latitude ?? 0.0,
        longitude: entity.location?.longitude ?? 0.0,
      );
}
