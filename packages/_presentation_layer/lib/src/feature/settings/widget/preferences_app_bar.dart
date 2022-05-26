import 'package:flutter/material.dart';

import 'preferences_button.dart';

class PreferencesAppBar extends StatelessWidget implements PreferredSizeWidget {
  PreferencesAppBar({super.key, required String title, double? height})
      : preferredSize = Size.fromHeight(height ?? kToolbarHeight),
        _title = title;

  @override
  final Size preferredSize;

  final String _title;

  @override
  Widget build(BuildContext context) => AppBar(
        title: title(context),
        actions: actions,
        flexibleSpace: flexibleSpace(context),
      );

  Widget title(BuildContext context) => Text(_title);

  List<Widget> get actions => const [PreferencesButton()];

  Widget? flexibleSpace(BuildContext context) => null;
}
