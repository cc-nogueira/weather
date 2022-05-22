import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../weather/widget/weather_icons.dart';

class AddTemperatureToRainChartSwitch extends ConsumerWidget {
  const AddTemperatureToRainChartSwitch({
    super.key,
    this.padding,
    this.iconSize,
    this.changeCallback,
  });

  final double? iconSize;
  final EdgeInsets? padding;
  final VoidCallback? changeCallback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final add = ref.watch(addTempToRainChartProvider);
    final widget = Row(
      children: [
        Switch(
          value: add,
          onChanged: (value) => _onChange(ref.read, value),
        ),
        WeatherIcons.instance.thermometer(28, Colors.white),
      ],
    );
    if (padding == null) {
      return widget;
    }
    return Padding(padding: padding!, child: widget);
  }

  void _onChange(Reader read, bool option) =>
      read(preferencesUsecaseProvider).addTempToRainChart = option;
}
