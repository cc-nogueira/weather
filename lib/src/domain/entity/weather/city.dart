import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/entity.dart';
import '../common/location.dart';

part 'city.freezed.dart';

/// City entity.
///
/// Freezed class with city information.
///
/// Stores a map of name translations and provides a method to find the stored translation for a
/// language.
///
/// Provides sorting keys for alphabetical order and alphabetical by country order.
@freezed
abstract class City with _$City implements Entity {
  /// Freezed factory constructor.
  const factory City({
    @Default(0) int id,
    @Default(-1) int order,
    @Default('') String name,
    @Default('') String state,
    @Default('') String country,
    @Default(<String, String>{}) Map<String, String> nameTranslations,
    Location? location,
  }) = _City;

  /// Private constructor.
  const City._();

  /// Get the city name translation for a language.
  ///
  /// Defaults to the original city name if no translation is found for a language.
  String translation(String language) => nameTranslations[language] ?? name;

  /// Key for sorting by city/state/country.
  String get alphabeticalOrderKey => name + state + country;

  /// Key for sorting by country name then city/state name.
  String get alphabeticalOrderByCountryKey => country + name + state;
}
