import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/entity.dart';
import '../common/location.dart';

part 'city.freezed.dart';

@freezed
class City with _$City implements Entity {
  const City._();
  const factory City({
    @Default(0) int id,
    @Default(-1) int order,
    @Default('') String name,
    @Default('') String state,
    @Default('') String country,
    @Default(<String, String>{}) Map<String, String> nameTranslations,
    Location? location,
  }) = _City;

  String translation(String language) => nameTranslations[language] ?? name;

  String get alphabeticalOrderKey => name + state + country;
  String get alphabeticalOrderByCountryKey => country + name + state;
}
