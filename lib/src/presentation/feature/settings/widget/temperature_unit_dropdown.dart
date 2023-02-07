import 'package:flutter/material.dart';
import 'package:qty/qty.dart';

import '../../../../domain/usecase/preferences_usecase.dart';
import 'unit_dropdown.dart';

class TemperatureUnitDropdown extends UnitDropdownWidget {
  const TemperatureUnitDropdown({super.key, super.changeCallback});

  @override
  Widget unitDropdown(PreferencesUsecase usecase) =>
      _TemperatureUnitDropdown(changeCallback: changeCallback, usecase: usecase);
}

class _TemperatureUnitDropdown extends UnitDropdown<Temperature> {
  _TemperatureUnitDropdown({required super.usecase, super.changeCallback})
      : super(unitProvider: temperatureUnitProvider);

  @override
  List<Unit<Temperature>> get unitOptions => usecase.temperatureUnits;

  @override
  void onChanged(Unit<Temperature> selection) => usecase.temperatureUnit = selection;

  @override
  String unitLabel(Unit<Temperature> unit) {
    final name = unit.name.toLowerCase();
    return name.startsWith('degrees ') ? name.substring(8) : name;
  }
}
