import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';

abstract class UnitDropdownWidget extends ConsumerWidget {
  const UnitDropdownWidget({super.key, this.changeCallback});

  final VoidCallback? changeCallback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usecase = ref.watch(preferencesUsecaseProvider);
    return unitDropdown(usecase);
  }

  Widget unitDropdown(PreferencesUsecase usecase);
}

abstract class UnitDropdown<T extends PhysicalProperty<T>> extends ConsumerWidget {
  const UnitDropdown({
    super.key,
    required this.usecase,
    required this.unitProvider,
    this.changeCallback,
  });

  final PreferencesUsecase usecase;
  final VoidCallback? changeCallback;
  final Provider<Unit<T>> unitProvider;

  List<Unit<T>> get unitOptions;
  void onChanged(Unit<T> selection);

  String unitLabel(Unit<T> unit) => unit.symbol;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = unitOptions;
    final value = ref.watch(unitProvider);
    return Align(
      alignment: Alignment.centerRight,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Unit<T>>(
          value: value,
          items: _items(options, value),
          selectedItemBuilder: (context) => _selectedItems(options),
          alignment: AlignmentDirectional.centerEnd,
          onChanged: (selection) => _onChanged(selection, ref),
        ),
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

  void _onChanged(Unit<T>? selection, WidgetRef ref) {
    if (selection != null) {
      onChanged(selection);
      changeCallback?.call();
    }
  }

  Widget _unitLabel(Unit<T> unit) => Text(unitLabel(unit), textAlign: TextAlign.right);
}
