import 'package:flutter/material.dart';

class PageRouteBuilderWithFadeTransition extends PageRouteBuilder {
  PageRouteBuilderWithFadeTransition({
    required RouteSettings settings,
    required RoutePageBuilder pageBuilder,
    Duration transitionDuration = const Duration(milliseconds: 800),
  }) : super(
          settings: settings,
          pageBuilder: pageBuilder,
          transitionDuration: transitionDuration,
          reverseTransitionDuration: transitionDuration,
          transitionsBuilder: (_, anim, __, child) => FadeTransition(opacity: anim, child: child),
        );
}

class SlidePageTransition extends StatelessWidget {
  SlidePageTransition({Key? key, required Animation<double> animation, required this.child})
      : _positionAnimation = animation.drive(_leftRightTween.chain(_fastOutSlowInTween)),
        super(key: key);

  static final Animatable<double> _fastOutSlowInTween = CurveTween(curve: Curves.fastOutSlowIn);

  static final Tween<Offset> _leftRightTween =
      Tween<Offset>(begin: const Offset(-0.75, 0), end: Offset.zero);

  final Animation<Offset> _positionAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) => SlideTransition(position: _positionAnimation, child: child);
}

class FadeUpwardsPageTransition extends StatelessWidget {
  FadeUpwardsPageTransition({
    Key? key,
    required Animation<double> animation, // The route's linear 0.0 - 1.0 animation.
    required this.child,
  })  : _positionAnimation = animation.drive(_bottomUpTween.chain(_fastOutSlowInTween)),
        _opacityAnimation = animation.drive(_easeInTween),
        super(key: key);

  // Fractional offset from 1/4 screen below the top to fully on screen.
  static final Tween<Offset> _bottomUpTween = Tween<Offset>(
    begin: const Offset(0.0, 0.25),
    end: Offset.zero,
  );
  static final Animatable<double> _fastOutSlowInTween = CurveTween(curve: Curves.fastOutSlowIn);
  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);

  final Animation<Offset> _positionAnimation;
  final Animation<double> _opacityAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) => SlideTransition(
        position: _positionAnimation,
        child: FadeTransition(opacity: _opacityAnimation, child: child),
      );
}
