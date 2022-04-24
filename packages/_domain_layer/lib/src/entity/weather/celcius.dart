import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qty/qty.dart';

part 'celcius.freezed.dart';

@freezed
class Celcius with _$Celcius {
  const Celcius._();
  const factory Celcius(double value) = _Celcius;

  Quantity<Temperature> get quantity => Quantity(unit: Temperature().celcius, amount: value);
}
