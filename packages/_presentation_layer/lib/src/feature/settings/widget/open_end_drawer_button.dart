import 'package:flutter/material.dart';

class OpenEndDrawerButton extends StatelessWidget {
  const OpenEndDrawerButton({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: 4.0),
        child: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () => Scaffold.of(context).openEndDrawer(),
        ),
      );
}
