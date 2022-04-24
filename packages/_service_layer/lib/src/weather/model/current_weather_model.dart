// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'weather_model.dart';

part 'current_weather_model.freezed.dart';
part 'current_weather_model.g.dart';

@freezed
class CurrentWeatherModel with _$CurrentWeatherModel {
  const factory CurrentWeatherModel({
    @Default(CoordModel()) CoordModel coord,
    @Default([]) List<WeatherModel> weather,
    @Default(MainModel()) MainModel main,
    @Default(WindModel()) WindModel wind,
    @Default(CloudsModel()) CloudsModel clouds,
    @Default(RainModel()) RainModel? rain,
    @Default(SnowModel()) SnowModel? snow,
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

  factory CoordModel.fromJson(Map<String, dynamic> json) => _$CoordModelFromJson(json);
}

@freezed
class MainModel with _$MainModel {
  const factory MainModel({
    @Default(0) double temp,
    @Default(0) @JsonKey(name: 'feels_like') double feelsLike,
    @Default(0) @JsonKey(name: 'temp_min') double tempMin,
    @Default(0) @JsonKey(name: 'temp_max') double tempMax,
    @Default(0) int humidity,
    @Default(0) int pressure,
  }) = _MainModel;

  factory MainModel.fromJson(Map<String, dynamic> json) => _$MainModelFromJson(json);
}

@freezed
class WindModel with _$WindModel {
  const factory WindModel({
    @Default(0) double speed,
    @Default(0) double gust,
    @Default(0) int deg,
  }) = _WindModel;

  factory WindModel.fromJson(Map<String, dynamic> json) => _$WindModelFromJson(json);
}

@freezed
class CloudsModel with _$CloudsModel {
  const factory CloudsModel({
    @Default(0) int all,
  }) = _CloudsModel;

  factory CloudsModel.fromJson(Map<String, dynamic> json) => _$CloudsModelFromJson(json);
}

@freezed
class RainModel with _$RainModel {
  const factory RainModel({
    @Default(0) @JsonKey(name: '1h') double h1,
  }) = _RainModel;

  factory RainModel.fromJson(Map<String, dynamic> json) => _$RainModelFromJson(json);
}

@freezed
class SnowModel with _$SnowModel {
  const factory SnowModel({
    @Default(0) @JsonKey(name: '1h') double h1,
  }) = _SnowModel;

  factory SnowModel.fromJson(Map<String, dynamic> json) => _$SnowModelFromJson(json);
}

@freezed
class SysModel with _$SysModel {
  const factory SysModel({
    @Default(0) int sunrise,
    @Default(0) int sunset,
  }) = _SysModel;

  factory SysModel.fromJson(Map<String, dynamic> json) => _$SysModelFromJson(json);
}
