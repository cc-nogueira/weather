import 'package:objectbox/objectbox.dart';

import 'model.dart';

@Entity()
class PreferenceModel implements Model {
  PreferenceModel({
    this.id = 0,
    this.key = '',
    this.value = '',
  });

  @override
  int id;

  String key;
  String value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PreferenceModel &&
          other.id == id &&
          other.key == key &&
          other.value == value;

  @override
  int get hashCode => Object.hash(id, key, value);

  @override
  String toString() => 'PreferenceModel(id: $id, key: "$key", value: "$value")';
}
