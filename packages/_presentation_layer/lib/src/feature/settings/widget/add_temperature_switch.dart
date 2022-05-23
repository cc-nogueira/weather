import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meta/meta.dart';

import '../../weather/widget/weather_icons.dart';

abstract class AddTemperatureSwitch extends ConsumerWidget {
  const AddTemperatureSwitch({
    super.key,
    required this.addTempProvider,
    this.padding,
    this.iconSize,
  });

  final Provider<bool> addTempProvider;
  final double? iconSize;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final add = ref.watch(addTempProvider);
    final widget = Row(
      children: [
        Switch(
          value: add,
          onChanged: (value) => onChange(ref.read, value),
        ),
        InkWell(
          onTap: () => onChange(ref.read, !add),
          child: WeatherIcons.instance.thermometer(28, Colors.white),
        ),
      ],
    );
    if (padding == null) {
      return widget;
    }
    return Padding(padding: padding!, child: widget);
  }

  @internal
  void onChange(Reader read, bool option);
}
