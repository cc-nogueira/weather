import 'package:flutter/material.dart';

import 'preferences_button.dart';

class SettingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  SettingsAppBar({super.key, String title = 'Weather', double? height})
      : preferredSize = Size.fromHeight(height ?? kToolbarHeight),
        _title = title;

  @override
  final Size preferredSize;

  final String _title;

  @override
  Widget build(BuildContext context) => AppBar(
        title: title,
        actions: actions,
        flexibleSpace: flexibleSpace(context),
      );

  Widget get title => Text(_title);

  List<Widget> get actions => const [PreferencesButton()];

  Widget? flexibleSpace(BuildContext context) => null;
}
