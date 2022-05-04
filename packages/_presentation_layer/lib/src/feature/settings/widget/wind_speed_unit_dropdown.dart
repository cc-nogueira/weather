import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';

import 'unit_dropdown.dart';

class WindSpeedUnitDropdown extends UnitDropdown<Speed> {
  const WindSpeedUnitDropdown({Key? key, this.changeCallback}) : super(key: key);

  final VoidCallback? changeCallback;

  @override
  StateProvider<Unit<Speed>> unitProvider(Reader read) =>
      read(preferencesUsecaseProvider).windSpeedUnitProvider;

  @override
  List<Unit<Speed>> unitOptions(Reader read) => read(preferencesUsecaseProvider).windSpeedUnits;

  @override
  void onChanged(Unit<Speed> selection, Reader read) {
    read(preferencesUsecaseProvider).windSpeedUnit = selection;
    changeCallback?.call();
  }

  @override
  String unitLabel(Unit<Speed> unit) => unit.symbol == 'kt' ? 'knots' : unit.symbol;
}
