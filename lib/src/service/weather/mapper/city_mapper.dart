import '../../../domain_layer.dart';
import '../model/city_location_model.dart';
import 'location_mapper.dart';

/// CityMapper converts [CityLocationModel] to [City] entity.
///
/// This is a one-way only conversion. Only from Model to Entity.
class CityMapper {
  /// Const constructor.
  const CityMapper();

  /// Internal locatin helper mapper.
  final _locationMapper = const LocationMapper();

  /// Maps a CityLocation service Model to a [City] domain Entity.
  City mapEntity(CityLocationModel model) => City(
        name: model.name,
        state: model.state,
        country: model.country,
        location: _locationMapper.mapEntity(model),
        nameTranslations: model.nameTranslations,
      );
}
