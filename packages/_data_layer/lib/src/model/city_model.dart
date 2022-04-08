import 'package:objectbox/objectbox.dart';

import 'model.dart';

@Entity()
class CityModel implements Model {
  CityModel({
    this.id = 0,
    this.order = 0,
    this.name = '',
    this.state = '',
    this.country = '',
    this.latitude = 0.0,
    this.longitude = 0.0,
  });

  @override
  int id;

  int order;
  String name;
  String state;
  String country;
  double latitude;
  double longitude;

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
          other.longitude == longitude;

  @override
  int get hashCode => Object.hash(id, order, name, state, country, latitude, longitude);

  @override
  String toString() =>
      'CityModel(id: $id, order: $order, "$name, $state / $country", coord: ($latitude, $longitude))';
}
