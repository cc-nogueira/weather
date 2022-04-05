import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';

import 'unit_dropdown.dart';

class WindSpeedUnitDropdown extends UnitDropdown {
  const WindSpeedUnitDropdown({Key? key}) : super(key: key);

  @override
  StateProvider<Unit> unitProvider(Reader read) =>
      read(preferencesUsecaseProvider).windSpeedUnitProvider;

  @override
  List<Unit> unitOptions(Reader read) =>
      read(preferencesUsecaseProvider).windSpeedUnits;

  @override
  void onChanged(Unit selection, Reader read) =>
      read(preferencesUsecaseProvider).windSpeedUnit = selection;

  @override
  String unitName(Unit unit) => unit == Speed.kt ? 'knots' : unit.symbol;
}
