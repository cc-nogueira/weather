import 'package:flutter/material.dart';
import 'package:qty/qty.dart';

import '../../../../domain_layer.dart';
import 'unit_dropdown.dart';

class WindSpeedUnitDropdown extends UnitDropdownWidget {
  const WindSpeedUnitDropdown({super.key, super.changeCallback});

  @override
  Widget unitDropdown(PreferencesUsecase usecase) =>
      _WindSpeedUnitDropdown(changeCallback: changeCallback, usecase: usecase);
}

class _WindSpeedUnitDropdown extends UnitDropdown<Speed> {
  _WindSpeedUnitDropdown({required super.usecase, super.changeCallback}) : super(unitProvider: windSpeedUnitProvider);

  @override
  List<Unit<Speed>> get unitOptions => usecase.windSpeedUnits;

  @override
  void onChanged(Unit<Speed> selection) => usecase.windSpeedUnit = selection;

  @override
  String unitLabel(Unit<Speed> unit) => unit.symbol == 'kt' ? 'knots' : unit.symbol;
}
