import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    @Default(0) int code,
    @Default('') String title,
    @Default('') String description,
    @Default(Geo()) Geo geo,
    @Default(0) int humidity,
    @Default(Temperature()) Temperature temperature,
    @Default(Wind()) Wind wind,
  }) = _Weather;
}

@freezed
class Temperature with _$Temperature {
  const factory Temperature({
    @Default(0) double feelsLike,
    @Default(0) double now,
    @Default(0) double min,
    @Default(0) double max,
  }) = _Temperature;
}

@freezed
class Wind with _$Wind {
  const Wind._();
  const factory Wind({
    @Default(0) double speed,
    @Default(0) double gust,
    @Default(0) int directionFrom,
  }) = _Wind;

  int get directionTo => (180 + directionFrom) % 360;
  double get speedInKnots => speed * 1.9438444924574;
  double get gustInKnots => gust * 1.9438444924574;
}

@freezed
class Geo with _$Geo {
  const Geo._();
  const factory Geo({
    @Default(0) double latitude,
    @Default(0) double longitude,
    @Default(0) int dateTimeMillis,
    @Default(0) int timeShiftMillis,
    @Default(0) int sunriseMillis,
    @Default(0) int sunsetMillis,
  }) = _Geo;

  DateTime get utcDateTime =>
      DateTime.fromMillisecondsSinceEpoch(dateTimeMillis, isUtc: true);
  DateTime get localDateTime =>
      DateTime.fromMillisecondsSinceEpoch(dateTimeMillis + timeShiftMillis,
          isUtc: true);
  DateTime get localSunrise =>
      DateTime.fromMillisecondsSinceEpoch(sunriseMillis + timeShiftMillis,
          isUtc: true);
  DateTime get localSunset =>
      DateTime.fromMillisecondsSinceEpoch(sunsetMillis + timeShiftMillis,
          isUtc: true);
}
