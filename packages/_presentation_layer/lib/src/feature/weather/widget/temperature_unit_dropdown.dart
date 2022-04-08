import 'package:_domain_layer/domain_layer.dart' hide Temperature;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';

import 'unit_dropdown.dart';

class TemperatureUnitDropdown extends UnitDropdown<Temperature> {
  const TemperatureUnitDropdown({Key? key}) : super(key: key);

  @override
  StateProvider<Unit<Temperature>> unitProvider(Reader read) =>
      read(preferencesUsecaseProvider).temperatureUnitProvider;

  @override
  List<Unit<Temperature>> unitOptions(Reader read) =>
      read(preferencesUsecaseProvider).temperatureUnits;

  @override
  void onChanged(Unit<Temperature> selection, Reader read) =>
      read(preferencesUsecaseProvider).temperatureUnit = selection;

  @override
  String unitLabel(Unit<Temperature> unit) {
    final name = unit.name;
    return name.startsWith('degrees ') ? name.substring(8) : name;
  }
}
