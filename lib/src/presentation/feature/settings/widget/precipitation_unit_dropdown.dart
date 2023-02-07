import 'package:flutter/material.dart';
import 'package:qty/qty.dart';

import '../../../../domain_layer.dart';
import 'unit_dropdown.dart';

class PrecipitationUnitDropdown extends UnitDropdownWidget {
  const PrecipitationUnitDropdown({super.key, super.changeCallback});

  @override
  Widget unitDropdown(PreferencesUsecase usecase) =>
      _PrecipitationUnitDropdown(changeCallback: changeCallback, usecase: usecase);
}

class _PrecipitationUnitDropdown extends UnitDropdown<Speed> {
  _PrecipitationUnitDropdown({required super.usecase, super.changeCallback})
      : super(unitProvider: precipitationUnitProvider);

  @override
  List<Unit<Speed>> get unitOptions => usecase.precipitationUnits;

  @override
  void onChanged(Unit<Speed> selection) => usecase.precipitationUnit = selection;
}
