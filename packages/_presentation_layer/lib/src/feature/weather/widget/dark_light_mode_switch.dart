import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum ShowIconPosition { before, after }

class DarkLightModeSwitch extends ConsumerWidget {
  const DarkLightModeSwitch({
    Key? key,
    this.showIconPosition,
    this.padding,
    this.keepIconSpaces = false,
    this.iconSize,
  }) : super(key: key);

  final ShowIconPosition? showIconPosition;
  final bool keepIconSpaces;
  final double? iconSize;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(themeModeProvider) == ThemeMode.dark;
    final iconTheme = IconTheme.of(context);
    final resolvedIconSize = iconSize ?? iconTheme.size ?? 24.0;
    final widget = Row(
      children: [
        if (showIconPosition == ShowIconPosition.before)
          Icon(darkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
        if (keepIconSpaces && showIconPosition != ShowIconPosition.before)
          SizedBox(width: resolvedIconSize),
        Switch(value: darkMode, onChanged: (value) => _onThemeChange(ref.read, value)),
        if (showIconPosition == ShowIconPosition.after)
          Icon(darkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
        if (keepIconSpaces && showIconPosition != ShowIconPosition.after)
          SizedBox(width: resolvedIconSize)
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
