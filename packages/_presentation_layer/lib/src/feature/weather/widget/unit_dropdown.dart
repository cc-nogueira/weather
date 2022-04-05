import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';

abstract class UnitDropdown extends ConsumerWidget {
  const UnitDropdown({Key? key}) : super(key: key);

  StateProvider<Unit> unitProvider(Reader read);
  List<Unit> unitOptions(Reader read);
  void onChanged(Unit selection, Reader read);
  String unitName(Unit unit) => unit.name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = unitOptions(ref.read);
    final value = ref.watch(unitProvider(ref.read));
    return DropdownButtonHideUnderline(
      child: DropdownButton<Unit>(
        value: value,
        items: _items(value, options),
        selectedItemBuilder: (context) => _selectedItems(context, options),
        alignment: AlignmentDirectional.centerEnd,
        onChanged: (selection) => _onChanged(selection, ref.read),
      ),
    );
  }

  List<DropdownMenuItem<Unit>> _items(Unit value, List<Unit> options) {
    final list = options.map((unit) {
      final child = unit == value
          ? Row(children: [
              _unitLabel(unit),
              const SizedBox(width: 20),
              const Icon(Icons.check, size: 20),
            ])
          : _unitLabel(unit);
      return DropdownMenuItem(value: unit, child: child);
    }).toList();
    return list;
  }

  List<Widget> _selectedItems(BuildContext context, List<Unit> options) {
    final list = options
        .map(
          (unit) => Row(
            children: [_unitLabel(unit), const SizedBox(width: 10)],
          ),
        )
        .toList();
    return list;
  }

  void _onChanged(Unit? selection, Reader read) {
    if (selection != null) {
      onChanged(selection, read);
    }
  }

  Widget _unitLabel(Unit unit) {
    const style = TextStyle(fontWeight: FontWeight.bold);
    return Text(unitName(unit), style: style, textAlign: TextAlign.right);
  }
}
