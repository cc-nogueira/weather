// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

/// Weather Service Model.
///
/// Freezed class with Weather service info.
/// Provides conversion from service JSON to this service Model.
@freezed
class WeatherModel with _$WeatherModel {
  /// Freezed factory constructor.
  const factory WeatherModel({
    @Default(0) int id,
    @Default('') String main,
    @Default('') String description,
  }) = _WeatherModel;

  /// JSON factory constructor.
  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);
}
