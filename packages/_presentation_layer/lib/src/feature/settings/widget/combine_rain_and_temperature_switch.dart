import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CombineRainAndTemperatureSwitch extends ConsumerWidget {
  const CombineRainAndTemperatureSwitch({
    Key? key,
    this.padding,
    this.iconSize,
    this.changeCallback,
  }) : super(key: key);

  final double? iconSize;
  final EdgeInsets? padding;
  final VoidCallback? changeCallback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final combine = ref.watch(combineRainAndTemperatureProvider);
    final spacer = SizedBox(width: iconSize ?? IconTheme.of(context).size ?? 24.0);
    final widget = Row(
      children: [
        Switch(value: combine, onChanged: (value) => _onChange(ref.read, value)),
        spacer,
      ],
    );
    if (padding == null) {
      return widget;
    }
    return Padding(padding: padding!, child: widget);
  }

  void _onChange(Reader read, bool option) {
    read(preferencesUsecaseProvider).combineRainAndTemperature = option;
    changeCallback?.call();
  }
}
