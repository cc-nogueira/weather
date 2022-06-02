import 'package:_domain_layer/domain_layer.dart';

import '../../objectbox.g.dart';
import '../mapper/city_mapper.dart';
import '../model/city_model.dart';
import 'objectbox_repository.dart';

/// ObjectBox Cities Repository implementation.
///
/// Implements domain CitiesRepository as an ObjectBoxRepository
class ObjectboxCitiesRepository extends ObjectboxRepository<City, CityModel>
    implements CitiesRepository {
  /// Const construtor receives a Box<CityModel>.
  const ObjectboxCitiesRepository({required super.box}) : super(mapper: const CityMapper());

  /// Id of my model
  @override
  get idProperty => CityModel_.id;
}
