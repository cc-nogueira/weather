import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/location.dart';

part 'geo.freezed.dart';

/// Geo location entity.
///
/// Freezed class with geo info for a [Location].
/// Provides getters to access localSunrise and localSunset as DateTime objects.
@freezed
class Geo with _$Geo {
  /// Freezed factory constructor.
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

  /// Private constructor.
  const Geo._();

  /// Local sunrise dateTime.
  DateTime get localSunrise => DateTime.fromMillisecondsSinceEpoch(sunriseMillis + timeShiftMillis, isUtc: true);

  /// Loca sunset dateTime.
  DateTime get localSunset => DateTime.fromMillisecondsSinceEpoch(sunsetMillis + timeShiftMillis, isUtc: true);
}
