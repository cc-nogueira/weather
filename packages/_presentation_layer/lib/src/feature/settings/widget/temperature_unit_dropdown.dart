import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';

import 'unit_dropdown.dart';

class TemperatureUnitDropdown extends UnitDropdown<Temperature> {
  const TemperatureUnitDropdown({Key? key, this.changeCallback}) : super(key: key);

  final VoidCallback? changeCallback;

  @override
  StateProvider<Unit<Temperature>> unitProvider(Reader read) =>
      read(preferencesUsecaseProvider).temperatureUnitProvider;

  @override
  List<Unit<Temperature>> unitOptions(Reader read) =>
      read(preferencesUsecaseProvider).temperatureUnits;

  @override
  void onChanged(Unit<Temperature> selection, Reader read) {
    read(preferencesUsecaseProvider).temperatureUnit = selection;
    changeCallback?.call();
  }

  @override
  String unitLabel(Unit<Temperature> unit) {
    final name = unit.name;
    return name.startsWith('degrees ') ? name.substring(8) : name;
  }
}
