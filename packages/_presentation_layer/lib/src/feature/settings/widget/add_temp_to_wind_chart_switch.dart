import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'add_temperature_switch.dart';

class AddTemperatureToWindChartSwitch extends AddTemperatureSwitch {
  AddTemperatureToWindChartSwitch({
    super.key,
    super.padding,
    super.iconSize,
    this.changeCallback,
  }) : super(addTempProvider: addTempToWindChartProvider);

  final VoidCallback? changeCallback;

  @override
  void onChange(Reader read, bool option) =>
      read(preferencesUsecaseProvider).addTempToWindChart = option;
}
