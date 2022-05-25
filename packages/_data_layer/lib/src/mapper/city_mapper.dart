import 'dart:convert';

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
        location: _mapEntityLocation(model),
        nameTranslations: _mapEntityNameTranslations(model),
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
        nameTranslations: _mapModelNameTranslations(entity),
      );

  Location? _mapEntityLocation(CityModel model) {
    if (model.latitude == 0.0 && model.longitude == 0.0) {
      return null;
    }
    return Location(latitude: model.latitude, longitude: model.longitude);
  }

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

  String _mapModelNameTranslations(City entity) => json.encode(entity.nameTranslations);
}
