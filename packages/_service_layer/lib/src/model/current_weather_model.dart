// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_weather_model.freezed.dart';
part 'current_weather_model.g.dart';

@freezed
class CurrentWeatherModel with _$CurrentWeatherModel {
  const factory CurrentWeatherModel({
    @Default(CoordModel()) CoordModel coord,
    @Default([]) List<WeatherModel> weather,
    @Default(MainModel()) MainModel main,
    @Default(WindModel()) WindModel wind,
    @Default(0) int dt,
    @Default(SysModel()) SysModel sys,
    @Default(0) int timezone,
    @Default('') String name,
    @Default(0) int cod,
  }) = _CurrentWeatherModel;

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherModelFromJson(json);
}

@freezed
class CoordModel with _$CoordModel {
  const factory CoordModel({
    @Default(0) double lat,
    @Default(0) double lon,
  }) = _CoordModel;

  factory CoordModel.fromJson(Map<String, dynamic> json) =>
      _$CoordModelFromJson(json);
}

@freezed
class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    @Default(0) int id,
    @Default('') String main,
    @Default('') String description,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}

@freezed
class MainModel with _$MainModel {
  const factory MainModel({
    @Default(0) double temp,
    @Default(0) @JsonKey(name: 'feels_like') double feelsLike,
    @Default(0) @JsonKey(name: 'temp_min') double tempMin,
    @Default(0) @JsonKey(name: 'temp_max') double tempMax,
    @Default(0) int humidity,
  }) = _MainModel;

  factory MainModel.fromJson(Map<String, dynamic> json) =>
      _$MainModelFromJson(json);
}

@freezed
class WindModel with _$WindModel {
  const factory WindModel({
    @Default(0) double speed,
    @Default(0) double gust,
    @Default(0) int deg,
  }) = _WindModel;

  factory WindModel.fromJson(Map<String, dynamic> json) =>
      _$WindModelFromJson(json);
}

@freezed
class SysModel with _$SysModel {
  const factory SysModel({
    @Default(0) int sunrise,
    @Default(0) int sunset,
  }) = _SysModel;

  factory SysModel.fromJson(Map<String, dynamic> json) =>
      _$SysModelFromJson(json);
}
