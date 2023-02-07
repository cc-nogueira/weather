// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'weather_model.dart';

part 'one_call_weather_model.freezed.dart';
part 'one_call_weather_model.g.dart';

/// OneCallWeather Service Model.
///
/// Freezed class with OneCallWeather service info.
/// Provides conversion from service JSON to this service Model.
@freezed
class OneCallWeatherModel with _$OneCallWeatherModel {
  /// Freezed factory constructor.
  const factory OneCallWeatherModel({
    @Default(0) double lat,
    @Default(0) double lon,
    @Default('') String timezone,
    @Default(0) @JsonKey(name: 'timezone_offset') int timezoneOffset,
    @Default(CurrentModel()) CurrentModel current,
    @Default([]) List<HourlyModel> hourly,
    @Default([]) List<DailyModel> daily,
    @Default([]) List<AlertModel> alerts,
  }) = _OneCallWeatherModel;

  /// JSON factory constructor.
  factory OneCallWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$OneCallWeatherModelFromJson(json);
}

/// Current Service Model.
///
/// Freezed class with Current service info.
/// Provides conversion from service JSON to this service Model.
@freezed
class CurrentModel with _$CurrentModel {
  /// Freezed factory constructor.
  const factory CurrentModel({
    @Default(0) int dt,
    @Default(0) int sunrise,
    @Default(0) int sunset,
    @Default(0) double temp,
    @Default(0) @JsonKey(name: 'feels_like') double feelsLike,
    @Default(0) int pressure,
    @Default(0) int humidity,
    @Default(0) int clouds,
    @Default(0) @JsonKey(name: 'wind_speed') double windSpeed,
    @Default(null) @JsonKey(name: 'wind_gust') double? windGust,
    @Default(0) @JsonKey(name: 'wind_deg') int windDegree,
    @Default(null) Rain1hModel? rain,
    @Default(null) Snow1hModel? snow,
    @Default([]) List<WeatherModel> weather,
  }) = _CurrentModel;

  /// JSON factory constructor.
  factory CurrentModel.fromJson(Map<String, dynamic> json) => _$CurrentModelFromJson(json);
}

/// Hourly Service Model.
///
/// Freezed class with Hourly service info.
/// Provides conversion from service JSON to this service Model.
@freezed
class HourlyModel with _$HourlyModel {
  /// Freezed factory constructor.
  const factory HourlyModel({
    @Default(0) int dt,
    @Default(0) double temp,
    @Default(0) @JsonKey(name: 'feels_like') double feelsLike,
    @Default(0) int pressure,
    @Default(0) int humidity,
    @Default(0) int clouds,
    @Default(0) @JsonKey(name: 'wind_speed') double windSpeed,
    @Default(0) @JsonKey(name: 'wind_deg') int windDegree,
    @Default(null) @JsonKey(name: 'wind_gust') double? windGust,
    @Default([]) List<WeatherModel> weather,
    @Default(0) double pop,
    @Default(null) Rain1hModel? rain,
    @Default(null) Snow1hModel? snow,
  }) = _HourlyModel;

  /// JSON factory constructor.
  factory HourlyModel.fromJson(Map<String, dynamic> json) => _$HourlyModelFromJson(json);
}

/// Rain1h Service Model.
///
/// Freezed class with Rain1h service info.
/// Provides conversion from service JSON to this service Model.
@freezed
class Rain1hModel with _$Rain1hModel {
  /// Freezed factory constructor.
  const factory Rain1hModel({
    @Default(0) @JsonKey(name: '1h') double h1,
  }) = _Rain1hModel;

  /// JSON factory constructor.
  factory Rain1hModel.fromJson(Map<String, dynamic> json) => _$Rain1hModelFromJson(json);
}

/// Snow1h Service Model.
///
/// Freezed class with Snow1h service info.
/// Provides conversion from service JSON to this service Model.
@freezed
class Snow1hModel with _$Snow1hModel {
  /// Freezed factory constructor.
  const factory Snow1hModel({
    @Default(0) @JsonKey(name: '1h') double h1,
  }) = _Snow1hModel;

  /// JSON factory constructor.
  factory Snow1hModel.fromJson(Map<String, dynamic> json) => _$Snow1hModelFromJson(json);
}

/// Daily Service Model.
///
/// Freezed class with Daily service info.
/// Provides conversion from service JSON to this service Model.
@freezed
class DailyModel with _$DailyModel {
  /// Freezed factory constructor.
  const factory DailyModel({
    @Default(0) int dt,
    @Default(0) int sunrise,
    @Default(0) int sunset,
    @Default(0) int moonrise,
    @Default(0) int moonset,
    @Default(0) @JsonKey(name: 'moon_phase') double moonPhase,
    @Default(DailyTemperature()) DailyTemperature temp,
    @Default(DailyFeelsLike()) @JsonKey(name: 'feels_like') DailyFeelsLike feelsLike,
    @Default(0) int pressure,
    @Default(0) int humidity,
    @Default(0) @JsonKey(name: 'wind_speed') double windSpeed,
    @Default(0) @JsonKey(name: 'wind_deg') int windDegree,
    @Default(null) @JsonKey(name: 'wind_gust') double? windGust,
    @Default([]) List<WeatherModel> weather,
    @Default(0) int clouds,
    @Default(0) double pop,
    @Default(null) double? rain,
    @Default(null) double? snow,
  }) = _DailyModel;

  /// JSON factory constructor.
  factory DailyModel.fromJson(Map<String, dynamic> json) => _$DailyModelFromJson(json);
}

/// DailyTemperature Service Model.
///
/// Freezed class with DailyTemperature service info.
/// Provides conversion from service JSON to this service Model.
@freezed
class DailyTemperature with _$DailyTemperature {
  /// Freezed factory constructor.
  const factory DailyTemperature({
    @Default(0) double day,
    @Default(0) double min,
    @Default(0) double max,
    @Default(0) double night,
    @Default(0) double eve,
    @Default(0) double morn,
  }) = _DailyTemperature;

  /// JSON factory constructor.
  factory DailyTemperature.fromJson(Map<String, dynamic> json) => _$DailyTemperatureFromJson(json);
}

/// DailyFeelsLike Service Model.
///
/// Freezed class with DailyFeelsLike service info.
/// Provides conversion from service JSON to this service Model.
@freezed
class DailyFeelsLike with _$DailyFeelsLike {
  /// Freezed factory constructor.
  const factory DailyFeelsLike({
    @Default(0) double day,
    @Default(0) double night,
    @Default(0) double eve,
    @Default(0) double morn,
  }) = _DailyFeelsLike;

  /// JSON factory constructor.
  factory DailyFeelsLike.fromJson(Map<String, dynamic> json) => _$DailyFeelsLikeFromJson(json);
}

/// Alert Service Model.
///
/// Freezed class with Alert service info.
/// Provides conversion from service JSON to this service Model.
@freezed
class AlertModel with _$AlertModel {
  /// Freezed factory constructor.
  const factory AlertModel({
    @Default('') @JsonKey(name: 'sender_name') String senderName,
    @Default('') String event,
    @Default(0) int start,
    @Default(0) int end,
    @Default('') String description,
    @Default([]) List<String> tags,
  }) = _AlertModel;

  /// JSON factory constructor.
  factory AlertModel.fromJson(Map<String, dynamic> json) => _$AlertModelFromJson(json);
}
