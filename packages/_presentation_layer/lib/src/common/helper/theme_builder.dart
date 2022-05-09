import 'package:flutter/material.dart';

class ThemeBuilder {
  const ThemeBuilder();

  ThemeData get darkTheme => _theme(ThemeMode.dark);
  ThemeData get lightTheme => _theme(ThemeMode.light);

  ThemeData _theme(ThemeMode mode) {
    final base = mode == ThemeMode.dark ? ThemeData.dark() : ThemeData.light();
    return base.copyWith(
      colorScheme: _colorScheme(mode, base.colorScheme),
      textTheme: _textTheme(mode, base.textTheme),
      scaffoldBackgroundColor: _scaffoldBackgroundColor(mode),
    );
  }

  ColorScheme _colorScheme(ThemeMode mode, ColorScheme base) =>
      mode == ThemeMode.dark ? base : base.copyWith(onSurface: Colors.brown[900]);

  TextTheme _textTheme(ThemeMode mode, TextTheme base) =>
      mode == ThemeMode.dark ? base : base.apply(bodyColor: Colors.brown[900]);

  Color _scaffoldBackgroundColor(ThemeMode mode) =>
      mode == ThemeMode.dark ? Colors.grey[900]! : const Color(0xFFEAE4DB);
}
