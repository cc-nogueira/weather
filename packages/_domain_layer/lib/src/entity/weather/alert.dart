import 'package:freezed_annotation/freezed_annotation.dart';

import 'geo.dart';

part 'alert.freezed.dart';

@freezed
class Alert with _$Alert {
  const Alert._();
  const factory Alert({
    @Default('') String senderName,
    @Default('') String event,
    @Default(0) int startMillis,
    @Default(0) int endMillis,
    @Default(Geo()) Geo geo,
    @Default('') String description,
    @Default([]) List<String> tags,
  }) = _Alert;

  DateTime get utcStart => DateTime.fromMillisecondsSinceEpoch(startMillis, isUtc: true);
  DateTime get utcEnd => DateTime.fromMillisecondsSinceEpoch(endMillis, isUtc: true);

  DateTime get localShiftedStart {
    final shifted =
        DateTime.fromMillisecondsSinceEpoch(startMillis + geo.timeShiftMillis, isUtc: true);
    return DateTime(shifted.year, shifted.month, shifted.day, shifted.hour, shifted.minute,
        shifted.second, shifted.millisecond, shifted.microsecond);
  }

  DateTime get localShiftedEnd {
    final shifted =
        DateTime.fromMillisecondsSinceEpoch(endMillis + geo.timeShiftMillis, isUtc: true);
    return DateTime(shifted.year, shifted.month, shifted.day, shifted.hour, shifted.minute,
        shifted.second, shifted.millisecond, shifted.microsecond);
  }
}
