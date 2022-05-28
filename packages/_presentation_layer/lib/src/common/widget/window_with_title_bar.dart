import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class WindowWithTitleBar extends StatelessWidget {
  const WindowWithTitleBar({super.key, this.appBar, required this.child});

  final Widget? appBar;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        WindowTitleBarBox(
            child: Row(
          children: [
            Expanded(child: MoveWindow()),
            MinimizeWindowButton(),
            MaximizeWindowButton(),
            CloseWindowButton(),
          ],
        )),
        if (appBar != null) appBar!,
        Expanded(child: child),
      ],
    );
  }
}
