import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qty/qty.dart';

part 'wind.freezed.dart';

/// Wind entity.
///
/// Freezed class with wind info.
/// Provides API to get speed values as Quantity objects.
@freezed
class Wind with _$Wind {
  /// Private constructor.
  const Wind._();

  /// Freezed factory constructor.
  const factory Wind({
    @Default(0) double speed,
    @Default(null) double? gust,
    @Default(0) int directionFrom,
  }) = _Wind;

  /// Wind speed as Quantity object.
  Quantity<Speed> get speedQuantity => Quantity(unit: Speed().meterPerSecond, amount: speed);

  /// Gust speed as Quantity object.
  Quantity<Speed>? get gustQuantity =>
      gust == null ? null : Quantity(unit: Speed().meterPerSecond, amount: gust!);

  /// Get the wind "direction to" from the stored wind "direction from".
  int get directionTo => (180 + directionFrom) % 360;
}
