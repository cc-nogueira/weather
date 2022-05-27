import 'package:flutter/material.dart';

import '../../../l10n/translations.dart';

class OpenEndDrawerButton extends StatelessWidget {
  const OpenEndDrawerButton({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = Translations.of(context)!;
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: IconButton(
        icon: const Icon(Icons.settings),
        tooltip: translations.title_preferences,
        onPressed: () => Scaffold.of(context).openEndDrawer(),
      ),
    );
  }
}
