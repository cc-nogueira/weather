import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_location_model.freezed.dart';
part 'city_location_model.g.dart';

@freezed
class CityLocationModel with _$CityLocationModel {
  const factory CityLocationModel({
    @Default('') String name,
    @Default(0) double lat,
    @Default(0) double lon,
    @Default('') String state,
    @Default('') String country,
  }) = _CityLocationModel;

  factory CityLocationModel.fromJson(Map<String, dynamic> json) =>
      _$CityLocationModelFromJson(json);
}
