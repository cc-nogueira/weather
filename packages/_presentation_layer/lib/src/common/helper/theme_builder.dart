import 'package:flutter/material.dart';

import 'lib_color_schemes-clear.g.dart';

class ThemeBuilder {
  const ThemeBuilder({this.useGenerated = true});

  final bool useGenerated;

  ThemeData get darkTheme => _theme(ThemeMode.dark);
  ThemeData get lightTheme => _theme(ThemeMode.light);

  ThemeData _theme(ThemeMode mode) {
    final base = mode == ThemeMode.dark
        ? ThemeData(
            brightness: Brightness.dark,
            useMaterial3: true,
            colorScheme: useGenerated ? darkColorScheme : null)
        : ThemeData(
            brightness: Brightness.light,
            useMaterial3: true,
            colorScheme: useGenerated ? lightColorScheme : null);

    if (useGenerated) {
      return base.copyWith(scaffoldBackgroundColor: base.colorScheme.surface);
    }

    return base.copyWith(
      colorScheme: _colorScheme(mode, base.colorScheme),
      textTheme: _textTheme(mode, base.textTheme),
      appBarTheme: _appBarTheme(mode, base.appBarTheme),
      scaffoldBackgroundColor: _scaffoldBackgroundColor(mode),
    );
  }

  ColorScheme _colorScheme(ThemeMode mode, ColorScheme base) =>
      mode == ThemeMode.dark ? base : base.copyWith(onSurface: Colors.brown[900]);

  TextTheme _textTheme(ThemeMode mode, TextTheme base) =>
      mode == ThemeMode.dark ? base : base.apply(bodyColor: Colors.brown[900]);

  AppBarTheme _appBarTheme(ThemeMode mode, AppBarTheme base) =>
      base.copyWith(backgroundColor: _scaffoldBackgroundColor(mode));

  Color _scaffoldBackgroundColor(ThemeMode mode) =>
      mode == ThemeMode.dark ? Colors.grey[900]! : const Color(0xFFCACAC0);
}
