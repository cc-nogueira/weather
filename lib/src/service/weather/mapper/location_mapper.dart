import '../../../domain/entity/common/location.dart';
import '../model/city_location_model.dart';

/// LocationMapper converts [CityLocationModel] to [Location] entity.
///
/// This is a one-way only conversion. Only from Model to Entity.
class LocationMapper {
  /// Const constructor.
  const LocationMapper();

  /// Maps a CityLocation service Model to a [Location] domain Entity.
  Location mapEntity(CityLocationModel model) => Location(latitude: model.lat, longitude: model.lon);
}
