// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_location_model.freezed.dart';
part 'city_location_model.g.dart';

/// CityLocation Service Model.
///
/// Freezed class with CityLocation service info.
/// Provides conversion from service JSON to this service Model.
@freezed
class CityLocationModel with _$CityLocationModel {
  /// Freezed factory constructor.
  const factory CityLocationModel({
    @Default('') String name,
    @Default(0) double lat,
    @Default(0) double lon,
    @Default('') String state,
    @Default('') String country,
    @Default(<String, String>{}) @JsonKey(name: 'local_names') Map<String, String> nameTranslations,
  }) = _CityLocationModel;

  /// JSON factory constructor.
  factory CityLocationModel.fromJson(Map<String, dynamic> json) =>
      _$CityLocationModelFromJson(json);
}
