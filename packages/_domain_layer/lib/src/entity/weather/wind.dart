import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qty/qty.dart';

part 'wind.freezed.dart';

@freezed
class Wind with _$Wind {
  const Wind._();
  const factory Wind({
    @Default(0) double speed,
    @Default(null) double? gust,
    @Default(0) int directionFrom,
  }) = _Wind;

  Quantity<Speed> get speedQuantity => Quantity(unit: Speed().meterPerSecond, amount: speed);
  Quantity<Speed>? get gustQuantity =>
      gust == null ? null : Quantity(unit: Speed().meterPerSecond, amount: gust!);

  int get directionTo => (180 + directionFrom) % 360;
}
