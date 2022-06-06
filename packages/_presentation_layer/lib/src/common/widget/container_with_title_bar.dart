import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class ContainerWithTitleBar extends StatelessWidget {
  const ContainerWithTitleBar({
    super.key,
    required this.title,
    this.actions,
    required this.child,
    this.titleButtonsBackgroundColor,
  });

  final Widget title;
  final List<Widget>? actions;
  final Widget child;
  final Color? titleButtonsBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        _titleBar(context),
        Expanded(child: child),
      ],
    );
  }

  Widget _titleBar(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          _dragTitle(context),
          _trailingControls(context),
        ],
      ),
    );
  }

  Widget _dragTitle(BuildContext context) => Expanded(
        child: GestureDetector(
          onPanStart: (_) => appWindow.startDragging(),
          child: Container(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [title],
            ),
          ),
        ),
      );

  Widget _trailingControls(BuildContext context) {
    final windowButtons = Container(
      color: _buttonsBgColor(context),
      height: appWindow.titleBarHeight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [MinimizeWindowButton(), MaximizeWindowButton(), CloseWindowButton()],
      ),
    );
    if (actions == null) {
      return windowButtons;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        windowButtons,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: actions!,
        ),
      ],
    );
  }

  Color? _buttonsBgColor(BuildContext context) =>
      titleButtonsBackgroundColor ??
      (Theme.of(context).brightness == Brightness.dark ? Colors.black26 : Colors.black12);
}

/// Container with title bar widget is used to present a scaffold title bar in the body of the scaffold.
///
/// This is used to allow custom title bars for Desktop platforms allowing extra flexibilitty not
/// necessary in Mobile platforms.
///
/// With this bitsdojo approach it is possible to create title less applications (like Spotify) that
/// renders minimize, maximize and close window buttons inside the app.
///
/// It will return a Column widget with a internal title bar, followed or embedded with an optional
/// appBar and finally followed by and expanded child widget.
class ContainerWithAppBar extends StatelessWidget {
  const ContainerWithAppBar(
      {super.key, this.appBar, required this.child, this.embeddedAppBar = false});

  final Widget? appBar;
  final Widget child;
  final bool embeddedAppBar;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        WindowTitleBarBox(
          child: Row(
            children: [
              Expanded(child: MoveWindow(child: embeddedAppBar ? appBar : null)),
              MinimizeWindowButton(),
              MaximizeWindowButton(),
              CloseWindowButton(),
            ],
          ),
        ),
        if (!embeddedAppBar && appBar != null) appBar!,
        Expanded(child: child),
      ],
    );
  }
}
