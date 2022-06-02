import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qty/qty.dart';

part 'celcius.freezed.dart';

/// Celcius temperature entity.
///
/// Represents the temperature in celcius.
/// Provides an API to get its value as a temperature Quantity.
@freezed
class Celcius with _$Celcius {
  /// Private constructor.
  const Celcius._();

  /// Freezed factory constructor.
  const factory Celcius(double value) = _Celcius;

  /// Getter for this temperature as a Quantity object.
  Quantity<Temperature> get quantity => Quantity(unit: Temperature().celcius, amount: value);
}
