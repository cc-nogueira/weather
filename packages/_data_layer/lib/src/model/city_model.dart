import 'package:objectbox/objectbox.dart';

import 'model.dart';

/// City persistence model.
///
/// Implements Model with default values for all fields.
///
/// This is a flattened model (for Location and nameTranslations) to facilitate persistence.
/// And it is adequate since these are belongs-to relations.
///
/// @see [CityMapper] for conversion to Entity details.
@Entity()
class CityModel implements Model {
  /// Constructor with all default values.
  CityModel({
    this.id = 0,
    this.order = -1,
    this.name = '',
    this.state = '',
    this.country = '',
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.nameTranslations = '{}',
  });

  /// ObjectBox key field.
  @override
  int id;

  /// Custom sort order
  int order;

  /// City name
  String name;

  /// City state
  String state;

  /// City country
  String country;

  /// City location latitude
  double latitude;

  /// City location longitude
  double longitude;

  /// City name translations as a json field
  String nameTranslations;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CityModel &&
          other.id == id &&
          other.order == order &&
          other.name == name &&
          other.state == state &&
          other.country == country &&
          other.latitude == latitude &&
          other.longitude == longitude &&
          other.nameTranslations == nameTranslations;

  @override
  int get hashCode =>
      Object.hash(id, order, name, state, country, latitude, longitude, nameTranslations);

  @override
  String toString() =>
      'CityModel(id: $id, order: $order, "$name, $state / $country", location: ($latitude, $longitude), translations: $nameTranslations)';
}
