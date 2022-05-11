import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';

import 'unit_dropdown.dart';

class PrecipitationUnitDropdown extends UnitDropdown<Speed> {
  const PrecipitationUnitDropdown({Key? key, this.changeCallback}) : super(key: key);

  final VoidCallback? changeCallback;

  @override
  StateProvider<Unit<Speed>> unitProvider(Reader read) =>
      read(preferencesUsecaseProvider).precipitationUnitProvider;

  @override
  List<Unit<Speed>> unitOptions(Reader read) => read(preferencesUsecaseProvider).precipitationUnits;

  @override
  void onChanged(Unit<Speed> selection, Reader read) {
    read(preferencesUsecaseProvider).precipitationUnit = selection;
    changeCallback?.call();
  }

  @override
  String unitLabel(Unit<Speed> unit) => unit.symbol;
}
