import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'add_temperature_switch.dart';

class AddTemperatureToSnowChartSwitch extends AddTemperatureSwitch {
  AddTemperatureToSnowChartSwitch({
    super.key,
    super.padding,
    super.iconSize,
    this.changeCallback,
  }) : super(addTempProvider: addTempToSnowChartProvider);

  final VoidCallback? changeCallback;

  @override
  void onChange(WidgetRef ref, bool option) =>
      ref.read(preferencesUsecaseProvider).addTempToSnowChart = option;
}
