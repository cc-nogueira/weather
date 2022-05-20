import 'dart:math';

extension StringUtils on String {
  String cut({required int max}) {
    if (isEmpty || max < 1) return '';
    final cut = min(length, max);
    return substring(0, cut);
  }

  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() =>
      replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}
