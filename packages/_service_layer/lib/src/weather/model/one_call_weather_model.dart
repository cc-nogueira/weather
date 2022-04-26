// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'weather_model.dart';

part 'one_call_weather_model.freezed.dart';
part 'one_call_weather_model.g.dart';

@freezed
class OneCallWeatherModel with _$OneCallWeatherModel {
  const factory OneCallWeatherModel({
    @Default(0) double lat,
    @Default(0) double lon,
    @Default('') String timezone,
    @Default(0) @JsonKey(name: 'timezone_offset') int timezoneOffset,
    @Default(CurrentModel()) CurrentModel current,
    @Default([]) List<HourlyModel> hourly,
    @Default([]) List<DailyModel> daily,
  }) = _OneCallWeatherModel;

  factory OneCallWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$OneCallWeatherModelFromJson(json);
}

@freezed
class CurrentModel with _$CurrentModel {
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

  factory CurrentModel.fromJson(Map<String, dynamic> json) => _$CurrentModelFromJson(json);
}

@freezed
class HourlyModel with _$HourlyModel {
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

  factory HourlyModel.fromJson(Map<String, dynamic> json) => _$HourlyModelFromJson(json);
}

@freezed
class Rain1hModel with _$Rain1hModel {
  const factory Rain1hModel({
    @Default(0) @JsonKey(name: '1h') double h1,
  }) = _Rain1hModel;

  factory Rain1hModel.fromJson(Map<String, dynamic> json) => _$Rain1hModelFromJson(json);
}

@freezed
class Snow1hModel with _$Snow1hModel {
  const factory Snow1hModel({
    @Default(0) @JsonKey(name: '1h') double h1,
  }) = _Snow1hModel;

  factory Snow1hModel.fromJson(Map<String, dynamic> json) => _$Snow1hModelFromJson(json);
}

@freezed
class DailyModel with _$DailyModel {
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

  factory DailyModel.fromJson(Map<String, dynamic> json) => _$DailyModelFromJson(json);
}

@freezed
class DailyTemperature with _$DailyTemperature {
  const factory DailyTemperature({
    @Default(0) double day,
    @Default(0) double min,
    @Default(0) double max,
    @Default(0) double night,
    @Default(0) double eve,
    @Default(0) double morn,
  }) = _DailyTemperature;

  factory DailyTemperature.fromJson(Map<String, dynamic> json) => _$DailyTemperatureFromJson(json);
}

@freezed
class DailyFeelsLike with _$DailyFeelsLike {
  const factory DailyFeelsLike({
    @Default(0) double day,
    @Default(0) double night,
    @Default(0) double eve,
    @Default(0) double morn,
  }) = _DailyFeelsLike;

  factory DailyFeelsLike.fromJson(Map<String, dynamic> json) => _$DailyFeelsLikeFromJson(json);
}
