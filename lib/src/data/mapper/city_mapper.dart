import 'dart:convert';

import '../../domain/entity/common/location.dart';
import '../../domain/entity/weather/city.dart';
import '../model/city_model.dart';
import 'entity_mapper.dart';

/// CityMapper to convert domain entities to persistence models and vice-versa.
///
/// Mapper class to convert Domain City entity to/from Persistence CityModel objects.
class CityMapper extends EntityMapper<City, CityModel> {
  /// Const constructor.
  const CityMapper();

  /// Map a persistence model to a domain entity.
  @override
  City mapEntity(CityModel model) => City(
        id: model.id,
        order: model.order,
        name: model.name,
        state: model.state,
        country: model.country,
        location: _mapEntityLocation(model),
        nameTranslations: _mapEntityNameTranslations(model),
      );

  /// Map a domain entity to a persistence model.
  @override
  CityModel mapModel(City entity) => CityModel(
        id: entity.id,
        order: entity.order,
        name: entity.name,
        state: entity.state,
        country: entity.country,
        latitude: entity.location?.latitude ?? 0.0,
        longitude: entity.location?.longitude ?? 0.0,
        nameTranslations: _mapModelNameTranslations(entity),
      );

  /// Internal - map model location to domain Location
  Location? _mapEntityLocation(CityModel model) {
    if (model.latitude == 0.0 && model.longitude == 0.0) {
      return null;
    }
    return Location(latitude: model.latitude, longitude: model.longitude);
  }

  /// Internal - map model name translations to entity translations map.
  Map<String, String> _mapEntityNameTranslations(CityModel model) {
    if (model.nameTranslations.isEmpty) return {};
    try {
      final decoded = json.decode(model.nameTranslations);
      if (decoded is Map) {
        return Map<String, String>.from(decoded);
      }
      return {};
    } on FormatException {
      return {};
    }
  }

  /// Map domain translations map to persistence model json.
  String _mapModelNameTranslations(City entity) => json.encode(entity.nameTranslations);
}
