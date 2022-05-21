import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';

abstract class UnitDropdown<T extends PhysicalProperty<T>> extends ConsumerWidget {
  const UnitDropdown({super.key});

  StateProvider<Unit<T>> unitProvider(Reader read);
  List<Unit<T>> unitOptions(Reader read);
  void onChanged(Unit<T> selection, Reader read);
  String unitLabel(Unit<T> unit) => unit.name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = unitOptions(ref.read);
    final value = ref.watch(unitProvider(ref.read));
    return DropdownButtonHideUnderline(
      child: DropdownButton<Unit<T>>(
        value: value,
        items: _items(options, value),
        selectedItemBuilder: (context) => _selectedItems(options),
        alignment: AlignmentDirectional.centerEnd,
        onChanged: (selection) => _onChanged(selection, ref.read),
      ),
    );
  }

  List<DropdownMenuItem<Unit<T>>> _items(List<Unit<T>> options, Unit value) {
    return options.map((unit) {
      final child = unit == value
          ? Row(children: [
              _unitLabel(unit),
              const SizedBox(width: 20),
              const Icon(Icons.check, size: 20),
            ])
          : _unitLabel(unit);
      return DropdownMenuItem(value: unit, child: child);
    }).toList();
  }

  List<Widget> _selectedItems(List<Unit<T>> options) {
    return options
        .map((unit) => Row(children: [_unitLabel(unit), const SizedBox(width: 10)]))
        .toList();
  }

  void _onChanged(Unit<T>? selection, Reader read) {
    if (selection != null) {
      onChanged(selection, read);
    }
  }

  Widget _unitLabel(Unit<T> unit) {
    const style = TextStyle(fontWeight: FontWeight.bold);
    return Text(unitLabel(unit), style: style, textAlign: TextAlign.right);
  }
}
