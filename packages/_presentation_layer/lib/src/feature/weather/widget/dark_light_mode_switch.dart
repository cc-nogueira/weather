import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DarkLightModeSwitch extends ConsumerWidget {
  const DarkLightModeSwitch({
    Key? key,
    this.padding,
    this.iconSize,
  }) : super(key: key);

  final double? iconSize;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(themeModeProvider) == ThemeMode.dark;
    final spacer = SizedBox(width: iconSize ?? IconTheme.of(context).size ?? 24.0);
    final before = darkMode ? spacer : const Icon(Icons.light_mode_outlined);
    final after = darkMode ? const Icon(Icons.dark_mode_outlined) : spacer;
    final widget = Row(
      children: [
        before,
        Switch(value: darkMode, onChanged: (value) => _onThemeChange(ref.read, value)),
        after,
      ],
    );
    if (padding == null) {
      return widget;
    }
    return Padding(padding: padding!, child: widget);
  }

  void _onThemeChange(Reader read, bool option) {
    read(preferencesUsecaseProvider).theme = option ? ThemeMode.dark : ThemeMode.light;
  }
}
