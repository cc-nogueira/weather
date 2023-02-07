import 'package:freezed_annotation/freezed_annotation.dart';

import 'geo.dart';

part 'alert.freezed.dart';

/// Weather Alert entity.
///
/// Freezed class with Alert info.
/// Provides API to access alert start and end as UTC DateTime or as a DateTime shifted to the
/// alert Geo location local time.
@freezed
class Alert with _$Alert {
  /// Freezed factory constructor.
  const factory Alert({
    @Default('') String senderName,
    @Default('') String event,
    @Default(0) int startMillis,
    @Default(0) int endMillis,
    @Default(Geo()) Geo geo,
    @Default('') String description,
    @Default([]) List<String> tags,
  }) = _Alert;

  /// Private constructor.
  const Alert._();

  /// Alert start DateTime as UTC value
  DateTime get utcStart => DateTime.fromMillisecondsSinceEpoch(startMillis, isUtc: true);

  /// Alert end DateTime as UTC value
  DateTime get utcEnd => DateTime.fromMillisecondsSinceEpoch(endMillis, isUtc: true);

  /// Alert start DateTime shifted to the Geo location local time.
  DateTime get localShiftedStart {
    final shifted = DateTime.fromMillisecondsSinceEpoch(startMillis + geo.timeShiftMillis, isUtc: true);
    return DateTime(shifted.year, shifted.month, shifted.day, shifted.hour, shifted.minute, shifted.second,
        shifted.millisecond, shifted.microsecond);
  }

  /// Alert end DateTime shifted to the Geo location local time.
  DateTime get localShiftedEnd {
    final shifted = DateTime.fromMillisecondsSinceEpoch(endMillis + geo.timeShiftMillis, isUtc: true);
    return DateTime(shifted.year, shifted.month, shifted.day, shifted.hour, shifted.minute, shifted.second,
        shifted.millisecond, shifted.microsecond);
  }
}
