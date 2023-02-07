// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'weather_model.dart';

part 'current_weather_model.freezed.dart';
part 'current_weather_model.g.dart';

/// CurrentWeather Service Model.
///
/// Freezed class with CurrentWeather service info.
/// Provides conversion from service JSON to this service Model.
@freezed
class CurrentWeatherModel with _$CurrentWeatherModel {
  /// Freezed factory constructor.
  const factory CurrentWeatherModel({
    @Default(CoordModel()) CoordModel coord,
    @Default([]) List<WeatherModel> weather,
    @Default(MainModel()) MainModel main,
    @Default(WindModel()) WindModel wind,
    @Default(CloudsModel()) CloudsModel clouds,
    @Default(null) RainModel? rain,
    @Default(null) SnowModel? snow,
    @Default(0) int dt,
    @Default(SysModel()) SysModel sys,
    @Default(0) int timezone,
    @Default('') String name,
    @Default(0) int cod,
  }) = _CurrentWeatherModel;

  /// JSON factory constructor.
  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherModelFromJson(json);
}

/// Coord Service Model.
///
/// Freezed class with Coord service info.
/// Provides conversion from service JSON to this service Model.
@freezed
class CoordModel with _$CoordModel {
  /// Freezed factory constructor.
  const factory CoordModel({
    @Default(0) double lat,
    @Default(0) double lon,
  }) = _CoordModel;

  /// JSON factory constructor.
  factory CoordModel.fromJson(Map<String, dynamic> json) => _$CoordModelFromJson(json);
}

/// Main Service Model.
///
/// Freezed class with Main service info.
/// Provides conversion from service JSON to this service Model.
@freezed
class MainModel with _$MainModel {
  /// Freezed factory constructor.
  const factory MainModel({
    @Default(0) double temp,
    @Default(0) @JsonKey(name: 'feels_like') double feelsLike,
    @Default(0) @JsonKey(name: 'temp_min') double tempMin,
    @Default(0) @JsonKey(name: 'temp_max') double tempMax,
    @Default(0) int humidity,
    @Default(0) int pressure,
  }) = _MainModel;

  /// JSON factory constructor.
  factory MainModel.fromJson(Map<String, dynamic> json) => _$MainModelFromJson(json);
}

/// Wind Service Model.
///
/// Freezed class with Wind service info.
/// Provides conversion from service JSON to this service Model.
@freezed
class WindModel with _$WindModel {
  /// Freezed factory constructor.
  const factory WindModel({
    @Default(0) double speed,
    @Default(null) double? gust,
    @Default(0) int deg,
  }) = _WindModel;

  /// JSON factory constructor.
  factory WindModel.fromJson(Map<String, dynamic> json) => _$WindModelFromJson(json);
}

/// Clouds Service Model.
///
/// Freezed class with Clouds service info.
/// Provides conversion from service JSON to this service Model.
@freezed
class CloudsModel with _$CloudsModel {
  /// Freezed factory constructor.
  const factory CloudsModel({
    @Default(0) int all,
  }) = _CloudsModel;

  /// JSON factory constructor.
  factory CloudsModel.fromJson(Map<String, dynamic> json) => _$CloudsModelFromJson(json);
}

/// Rain Service Model.
///
/// Freezed class with Rain service info.
/// Provides conversion from service JSON to this service Model.
@freezed
class RainModel with _$RainModel {
  /// Freezed factory constructor.
  const factory RainModel({
    @Default(0) @JsonKey(name: '1h') double h1,
  }) = _RainModel;

  /// JSON factory constructor.
  factory RainModel.fromJson(Map<String, dynamic> json) => _$RainModelFromJson(json);
}

/// Snow Service Model.
///
/// Freezed class with Snow service info.
/// Provides conversion from service JSON to this service Model.
@freezed
class SnowModel with _$SnowModel {
  /// Freezed factory constructor.
  const factory SnowModel({
    @Default(0) @JsonKey(name: '1h') double h1,
  }) = _SnowModel;

  /// JSON factory constructor.
  factory SnowModel.fromJson(Map<String, dynamic> json) => _$SnowModelFromJson(json);
}

/// Sys Service Model.
///
/// Freezed class with Sys service info.
/// Provides conversion from service JSON to this service Model.
@freezed
class SysModel with _$SysModel {
  /// Freezed factory constructor.
  const factory SysModel({
    @Default(0) int sunrise,
    @Default(0) int sunset,
  }) = _SysModel;

  /// JSON factory constructor.
  factory SysModel.fromJson(Map<String, dynamic> json) => _$SysModelFromJson(json);
}
