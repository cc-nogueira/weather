import 'package:_domain_layer/domain_layer.dart' hide Temperature;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';

import 'unit_dropdown.dart';

class TemperatureUnitDropdown extends UnitDropdown {
  const TemperatureUnitDropdown({Key? key}) : super(key: key);

  @override
  StateProvider<Unit> unitProvider(Reader read) =>
      read(preferencesUsecaseProvider).temperatureUnitProvider;

  @override
  List<Unit> unitOptions(Reader read) =>
      read(preferencesUsecaseProvider).temperatureUnits;

  @override
  void onChanged(Unit selection, Reader read) =>
      read(preferencesUsecaseProvider).temperatureUnit = selection;

  @override
  String unitName(Unit unit) {
    final name = unit.name;
    return name.startsWith('degrees ') ? name.substring(8) : name;
  }
}
