import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LanguageDropdown extends ConsumerWidget {
  const LanguageDropdown({super.key, this.changeCallback});

  final VoidCallback? changeCallback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentOption = ref.watch(languageOptionProvider);
    final options = LanguageOption.languagesForThisSystemCurrentlyUsing(currentOption);
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: currentOption,
        items: _items(options, currentOption),
        selectedItemBuilder: (context) => _selectedItems(options),
        onChanged: (LanguageOption? selection) => _onChanged(selection, ref.read),
      ),
    );
  }

  List<DropdownMenuItem<LanguageOption>> _items(
    List<LanguageOption> options,
    LanguageOption currentValue,
  ) {
    return options.map((each) {
      final child = each == currentValue
          ? Row(children: [
              _optionLabel(each),
              const SizedBox(width: 20),
              const Icon(Icons.check, size: 20),
            ])
          : _optionLabel(each);
      return DropdownMenuItem(value: each, child: child);
    }).toList();
  }

  List<Widget> _selectedItems(List<LanguageOption> options) {
    return options
        .map((each) => Row(children: [_optionLabel(each), const SizedBox(width: 10)]))
        .toList();
  }

  Widget _optionLabel(LanguageOption option) {
    if (option == LanguageOption.none) {
      return const Text('auto', style: TextStyle(fontWeight: FontWeight.bold));
    }
    return Text(option.flag, textAlign: TextAlign.right);
  }

  void _onChanged(LanguageOption? selection, Reader read) {
    if (selection != null) {
      read(preferencesUsecaseProvider).languageOption = selection;
      changeCallback?.call();
    }
  }
}
