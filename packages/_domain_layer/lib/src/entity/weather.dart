import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qty/qty.dart' as qty;

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
  const Temperature._();
  const factory Temperature({
    @Default(0) double feelsLike,
    @Default(0) double now,
    @Default(0) double min,
    @Default(0) double max,
  }) = _Temperature;

  qty.Quantity<qty.Temperature> get currentTemperature =>
      qty.Quantity(unit: qty.Temperature().celcius, amount: now);
  qty.Quantity<qty.Temperature> get feelsLikeTemperature =>
      qty.Quantity(unit: qty.Temperature().celcius, amount: feelsLike);
  qty.Quantity<qty.Temperature> get minTemperature =>
      qty.Quantity(unit: qty.Temperature().celcius, amount: min);
  qty.Quantity<qty.Temperature> get maxTemperature =>
      qty.Quantity(unit: qty.Temperature().celcius, amount: max);
}

@freezed
class Wind with _$Wind {
  const Wind._();
  const factory Wind({
    @Default(0) double speed,
    @Default(0) double gust,
    @Default(0) int directionFrom,
  }) = _Wind;

  qty.Quantity<qty.Speed> get windSpeed =>
      qty.Quantity(unit: qty.Speed().meterPerSecond, amount: speed);
  qty.Quantity<qty.Speed> get gustSpeed =>
      qty.Quantity(unit: qty.Speed().meterPerSecond, amount: speed);

  int get directionTo => (180 + directionFrom) % 360;
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

  DateTime get utcDateTime => DateTime.fromMillisecondsSinceEpoch(dateTimeMillis, isUtc: true);
  DateTime get localDateTime =>
      DateTime.fromMillisecondsSinceEpoch(dateTimeMillis + timeShiftMillis, isUtc: true);
  DateTime get localSunrise =>
      DateTime.fromMillisecondsSinceEpoch(sunriseMillis + timeShiftMillis, isUtc: true);
  DateTime get localSunset =>
      DateTime.fromMillisecondsSinceEpoch(sunsetMillis + timeShiftMillis, isUtc: true);
}
