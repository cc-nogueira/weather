import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/location.dart';

part 'geo.freezed.dart';

@freezed
class Geo with _$Geo {
  const Geo._();
  const factory Geo({
    @Default(Location()) Location location,
    @Default('') String timeZone,
    @Default(0) int timeShiftMillis,
    @Default(0) int sunriseMillis,
    @Default(0) int sunsetMillis,
    @Default(null) int? moonriseMillis,
    @Default(null) int? moonsetMillis,
    @Default(null) double? moonPhase,
  }) = _Geo;

  DateTime get localSunrise =>
      DateTime.fromMillisecondsSinceEpoch(sunriseMillis + timeShiftMillis, isUtc: true);
  DateTime get localSunset =>
      DateTime.fromMillisecondsSinceEpoch(sunsetMillis + timeShiftMillis, isUtc: true);
}
