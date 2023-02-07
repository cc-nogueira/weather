import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain_layer.dart';

/// Dark/Light mode preference switch.
///
/// Widget watches the [themeModeProvider] to show the current preference value and updates its
/// value via [PreferencesUsecase].
class DarkLightModeSwitch extends ConsumerWidget {
  /// Const constructor with all arguments optional.
  const DarkLightModeSwitch({super.key, this.padding, this.iconSize, this.changeCallback});

  /// Optional iconSize (defaults to IconTheme.of(context).size or 24.0)
  final double? iconSize;

  /// Optional padding.
  final EdgeInsets? padding;

  /// Optional callback to notify changes (usually to auto-close the settings drawer).
  final VoidCallback? changeCallback;

  /// Build this switch.
  ///
  /// Watches the [themeModeProvider] (readonly) to display the current Dark/Light preference value.
  /// Updates to this value are realized through the corresponding use case.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(themeModeProvider) == ThemeMode.dark;
    final spacer = SizedBox(width: iconSize ?? IconTheme.of(context).size ?? 24.0);
    final before = darkMode ? spacer : const Icon(Icons.light_mode_outlined);
    final after = darkMode ? const Icon(Icons.dark_mode_outlined) : spacer;
    final widget = Row(
      children: [
        before,
        Switch(value: darkMode, onChanged: (value) => _onThemeChange(ref, value)),
        after,
      ],
    );
    if (padding == null) {
      return widget;
    }
    return Padding(padding: padding!, child: widget);
  }

  /// Internal - update the dark/light preference through its use case.
  ///
  /// Will call the optional changeCallback after calling the use case update.
  void _onThemeChange(WidgetRef ref, bool option) {
    ref.read(preferencesUsecaseProvider).theme = option ? ThemeMode.dark : ThemeMode.light;
    changeCallback?.call();
  }
}
