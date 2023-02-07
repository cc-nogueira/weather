import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../domain/layer/domain_layer.dart';
import '../../../../../domain/usecase/preferences_usecase.dart';
import 'add_temperature_switch.dart';

class AddTemperatureToRainChartSwitch extends AddTemperatureSwitch {
  AddTemperatureToRainChartSwitch({
    super.key,
    super.padding,
    super.iconSize,
    this.changeCallback,
  }) : super(addTempProvider: addTempToRainChartProvider);

  final VoidCallback? changeCallback;

  @override
  void onChange(WidgetRef ref, bool option) => ref.read(preferencesUsecaseProvider).addTempToRainChart = option;
}
