import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../l10n/translations.dart';

class OrderDropdown extends ConsumerWidget {
  const OrderDropdown({super.key});

  List<MapEntry<String, WeatherOrder>> _orderOptions(Translations translations) => [
        MapEntry(translations.weather_list_sort_by_country_option, WeatherOrder.byCountry),
        MapEntry(translations.weather_list_sort_by_name_option, WeatherOrder.byName),
        MapEntry(translations.weather_list_sort_by_temp_option, WeatherOrder.byTemp),
      ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = Translations.of(context)!;
    final options = _orderOptions(translations);
    final value = ref.watch(weatherOrderProvider);
    return DropdownButtonHideUnderline(
      child: DropdownButton<WeatherOrder>(
        value: value,
        items: _items(value, options),
        selectedItemBuilder: (context) => _selectedItems(context, options),
        alignment: AlignmentDirectional.centerEnd,
        onChanged: (selection) => _onOrderSelected(selection, ref.read),
      ),
    );
  }

  List<DropdownMenuItem<WeatherOrder>> _items(
    WeatherOrder value,
    List<MapEntry<String, WeatherOrder>> options,
  ) {
    return options.map((each) {
      final child = each.value == value
          ? Row(children: [
              Text(each.key),
              const SizedBox(width: 20),
              const Icon(Icons.check, size: 20),
            ])
          : Text(each.key);
      return DropdownMenuItem(value: each.value, child: child);
    }).toList();
  }

  List<Widget> _selectedItems(BuildContext context, List<MapEntry<String, WeatherOrder>> options) {
    return options
        .map((each) => Row(children: [Text(each.key), const SizedBox(width: 10)]))
        .toList();
  }

  void _onOrderSelected(WeatherOrder? selection, Reader read) {
    if (selection == null) return;
    read(preferencesUsecaseProvider).weatherOrder = selection;
  }
}
