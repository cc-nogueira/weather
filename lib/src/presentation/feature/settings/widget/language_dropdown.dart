import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain_layer.dart';
import '../../../l10n/translations.dart';

/// Language preference drop down.
///
/// Widget watches the [languageOptionProvider] to show the current preference value and updates its
/// value via [PreferencesUsecase].
///
/// Renders a custom built list of languages and flags that leverages language options, system
/// locales and current selection to find the best combination of languages and flags for this state
/// combination.
class LanguageDropdown extends ConsumerWidget {
  /// Const constructor with all arguments optional.
  const LanguageDropdown({super.key, this.changeCallback});

  /// Optional callback to notify changes (usually to auto-close the settings drawer).
  final VoidCallback? changeCallback;

  /// Build this drop down.
  ///
  /// Watches the [languageOptionProvider] (readonly) to display the current preference value.
  /// Updates to this value are realized through the corresponding use case.
  ///
  /// Renders a custom built list of languages and flags that leverages language options, system
  /// locales and current selection to find the best combination of languages and flags for this state
  /// combination.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentOption = ref.watch(languageOptionProvider);
    final locales = ref.watch(systemLocalesProvider);
    final tr = Translations.of(context)!;
    final options = LanguageOption.languageOptions(locales, currentOption);
    return Align(
      alignment: Alignment.centerRight,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: currentOption,
          items: _items(tr, options, currentOption),
          selectedItemBuilder: (context) => _selectedItems(tr, options),
          alignment: AlignmentDirectional.centerEnd,
          onChanged: (LanguageOption? selection) => _onChanged(selection, ref),
        ),
      ),
    );
  }

  /// Internal - build the list of menu items with labels and flags (except for Windows platform).
  List<DropdownMenuItem<LanguageOption>> _items(
    Translations tr,
    List<LanguageOption> options,
    LanguageOption currentValue,
  ) {
    return options.map((each) {
      final child = each == currentValue
          ? Row(children: [
              _optionLabel(tr, each),
              const SizedBox(width: 20),
              const Icon(Icons.check, size: 20),
            ])
          : _optionLabel(tr, each);
      return DropdownMenuItem(value: each, child: child);
    }).toList();
  }

  /// Internal - build the list of widgets corresponding to menu items.
  List<Widget> _selectedItems(Translations tr, List<LanguageOption> options) {
    return options.map((each) => Row(children: [_optionLabel(tr, each), const SizedBox(width: 10)])).toList();
  }

  /// Internal - construct the display for on entry with label and flag.
  ///
  /// Return a row with label and flag, except for the 'none' option that is rendered with the label
  /// 'auto', without a flag.
  ///
  /// Does not render a flag in Windows platform since it does not support UTF flags rendering.
  Widget _optionLabel(Translations tr, LanguageOption option) {
    if (option.isNone) {
      return Text(tr.word_auto);
    }
    if (Platform.isWindows) {
      return Text(option.languageCode);
    }
    return Row(children: [
      Text(option.country.flag, textAlign: TextAlign.right),
      const SizedBox(width: 10),
      Text(option.languageCode),
    ]);
  }

  void _onChanged(LanguageOption? selection, WidgetRef ref) {
    if (selection != null) {
      ref.read(preferencesUsecaseProvider).languageOption = selection;
      changeCallback?.call();
    }
  }
}
