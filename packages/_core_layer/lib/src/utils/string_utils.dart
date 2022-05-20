import 'dart:math';

extension StringUtils on String {
  String cut({required int max}) {
    if (isEmpty || max < 1) return '';
    final cut = min(length, max);
    return substring(0, cut);
  }

  String get capitalized => length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';

  String get titleCase => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.length > 1 ? str.capitalized : str)
      .join(' ');
}
