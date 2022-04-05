import 'package:_domain_layer/domain_layer.dart';

import '../../objectbox.g.dart';
import '../mapper/city_mapper.dart';
import '../model/city_model.dart';
import 'objectbox_repository.dart';

class ObjectboxCitiesRepository extends ObjectboxRepository<City, CityModel>
    implements CitiesRepository {
  ObjectboxCitiesRepository({required Box<CityModel> box})
      : super(box: box, mapper: const CityMapper());

  /// Id of my model
  @override
  get idProperty => CityModel_.id;
}
