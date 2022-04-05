import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WeatherOrderDropdown extends ConsumerWidget {
  const WeatherOrderDropdown({Key? key}) : super(key: key);

  final orderOptions = const [
    MapEntry('by name', WeatherOrder.byName),
    MapEntry('by temp', WeatherOrder.byTemp),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final dropBg =
        colors.brightness == Brightness.light ? colors.primary : colors.surface;
    final value = ref.watch(weatherOrderProvider);
    return DropdownButtonHideUnderline(
      child: DropdownButton<WeatherOrder>(
        iconEnabledColor: Colors.white,
        dropdownColor: dropBg,
        value: value,
        items: _orderItems(value),
        selectedItemBuilder: _selectedOrderItems,
        onChanged: (selection) => _onOrderSelected(selection, ref.read),
      ),
    );
  }

  List<DropdownMenuItem<WeatherOrder>> _orderItems(WeatherOrder value) {
    const style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
    return orderOptions.map((e) {
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

  List<Widget> _selectedOrderItems(BuildContext context) {
    const style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
    return orderOptions
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
