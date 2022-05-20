import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../l10n/translations.dart';

class OrderDropdown extends ConsumerWidget {
  const OrderDropdown({super.key});

  List<MapEntry<String, WeatherOrder>> _orderOptions(Translations translations) => [
        MapEntry(translations.weather_list_sort_by_name_option, WeatherOrder.byName),
        MapEntry(translations.weather_list_sort_by_temp_option, WeatherOrder.byTemp),
      ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = Translations.of(context)!;
    final options = _orderOptions(translations);
    final colors = Theme.of(context).colorScheme;
    final dropBg = colors.brightness == Brightness.light ? colors.primary : colors.surface;
    final value = ref.watch(weatherOrderProvider);
    return DropdownButtonHideUnderline(
      child: DropdownButton<WeatherOrder>(
        iconEnabledColor: Colors.white,
        dropdownColor: dropBg,
        value: value,
        items: _orderItems(value, options),
        selectedItemBuilder: (context) => _selectedOrderItems(context, options),
        onChanged: (selection) => _onOrderSelected(selection, ref.read),
      ),
    );
  }

  List<DropdownMenuItem<WeatherOrder>> _orderItems(
      WeatherOrder value, List<MapEntry<String, WeatherOrder>> options) {
    const style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
    return options.map((e) {
      final text = Text(e.key, style: style);
      final child = e.value == value
          ? Row(children: [
              text,
              const SizedBox(width: 20),
              const Icon(Icons.check, size: 20, color: Colors.white),
            ])
          : text;
      return DropdownMenuItem(value: e.value, child: child);
    }).toList();
  }

  List<Widget> _selectedOrderItems(
      BuildContext context, List<MapEntry<String, WeatherOrder>> options) {
    const style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
    return options
        .map(
          (e) => Center(
            child: Row(
              children: [Text(e.key, style: style), const SizedBox(width: 10)],
            ),
          ),
        )
        .toList();
  }

  void _onOrderSelected(WeatherOrder? selection, Reader read) {
    if (selection == null) return;
    read(preferencesUsecaseProvider).weatherOrder = selection;
  }
}
