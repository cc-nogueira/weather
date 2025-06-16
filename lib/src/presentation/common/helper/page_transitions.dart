import 'package:flutter/material.dart';

/// PageRouteBuilder with Fade Transition.
///
/// PageRouteBuilder that animates a FadeTransition with default duration.
class PageRouteBuilderWithFadeTransition extends PageRouteBuilder {
  PageRouteBuilderWithFadeTransition({
    required super.settings,
    required super.pageBuilder,
    super.transitionDuration = const Duration(milliseconds: 800),
  }) : super(
          reverseTransitionDuration: transitionDuration,
         transitionsBuilder: (_, anim, _, child) => FadeTransition(opacity: anim, child: child),
        );
}
