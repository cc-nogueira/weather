import 'package:freezed_annotation/freezed_annotation.dart';

import 'entity.dart';

part 'preference.freezed.dart';

@freezed
class Preference with _$Preference implements Entity {
  const factory Preference({
    @Default(0) int id,
    @Default('') String key,
    @Default('') String value,
  }) = _Preference;
}
