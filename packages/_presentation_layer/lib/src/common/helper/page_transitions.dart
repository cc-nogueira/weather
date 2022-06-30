import 'package:flutter/material.dart';

/// PageRouteBuilder with Fade Transition.
///
/// PageRouteBuilder that animates a FadeTransition with default duration.
class PageRouteBuilderWithFadeTransition extends PageRouteBuilder {
  PageRouteBuilderWithFadeTransition({
    required super.settings,
    required super.pageBuilder,
    Duration transitionDuration = const Duration(milliseconds: 800),
  }) : super(
          transitionDuration: transitionDuration,
          reverseTransitionDuration: transitionDuration,
          transitionsBuilder: (_, anim, __, child) => FadeTransition(opacity: anim, child: child),
        );
}
