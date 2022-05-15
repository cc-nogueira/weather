import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'animated_border_painter.dart';

class CutAndFlipWidget extends ConsumerWidget {
  const CutAndFlipWidget({
    super.key,
    required this.face,
    required this.flipProvider,
    required this.flipDirection,
    required this.delayDuration,
    required this.cutDuration,
    required this.flipDuration,
    required this.waitDuration,
    this.onFlipBackFinished,
    this.cutCurve,
    this.flipCurve,
    this.cutColor,
    this.perspectiveEffect,
  });

  final Widget face;
  final StateProvider<Widget?> flipProvider;
  final VoidCallback? onFlipBackFinished;
  final VerticalDirection flipDirection;
  final Duration delayDuration;
  final Duration cutDuration;
  final Duration flipDuration;
  final Duration waitDuration;
  final Curve? cutCurve;
  final Curve? flipCurve;
  final Color? cutColor;
  final double? perspectiveEffect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flipFace = ref.watch(flipProvider);
    if (flipFace == null) {
      return face;
    }
    return _CutAndFlipWidget(
      face: face,
      flipFace: flipFace,
      flipDirection: flipDirection,
      delayDuration: delayDuration,
      cutDuration: cutDuration,
      flipDuration: flipDuration,
      waitDuration: waitDuration,
      cutColor: cutColor ?? Theme.of(context).colorScheme.onSurface,
      onFlipBackFinished: onFlipBackFinished,
      cutCurve: cutCurve,
      flipCurve: flipCurve,
      perspectiveEffect: perspectiveEffect,
    );
  }
}

class _CutAndFlipWidget extends StatefulWidget {
  const _CutAndFlipWidget({
    required this.face,
    required this.flipFace,
    required this.flipDirection,
    required this.delayDuration,
    required this.cutDuration,
    required this.flipDuration,
    required this.waitDuration,
    required this.cutColor,
    this.onFlipBackFinished,
    this.cutCurve,
    this.flipCurve,
    this.perspectiveEffect,
  });

  final Widget face;
  final Widget flipFace;
  final VerticalDirection flipDirection;
  final Duration delayDuration;
  final Duration cutDuration;
  final Duration flipDuration;
  final Duration waitDuration;
  final Color cutColor;
  final VoidCallback? onFlipBackFinished;
  final Curve? cutCurve;
  final Curve? flipCurve;
  final double? perspectiveEffect;

  @override
  FlipWidgetState createState() => FlipWidgetState();

  Duration get totalAnimationDuration => flipDuration + cutDuration + delayDuration;
}

class FlipWidgetState extends State<_CutAndFlipWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late CurvedAnimation cutAnimation;
  late CurvedAnimation flipAnimation;
  bool isResetingController = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener(_statusListener);
    _configAnimations();
    _restartController();
  }

  void _statusListener(AnimationStatus status) {
    if (mounted) {
      if (status == AnimationStatus.completed) {
        Future.delayed(widget.waitDuration, () {
          if (mounted) {
            _controller.reverse();
          }
        });
      } else if (status == AnimationStatus.dismissed && !isResetingController) {
        widget.onFlipBackFinished?.call();
      }
    }
  }

  @override
  // ignore: library_private_types_in_public_api
  void didUpdateWidget(covariant _CutAndFlipWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget != widget) {
      _configAnimations();
      _restartController();
    }
  }

  void _configAnimations() {
    final total = widget.totalAnimationDuration.inMilliseconds;
    final cutStart = widget.delayDuration.inMilliseconds / total;
    final flipStart = cutStart + widget.cutDuration.inMilliseconds / total;

    cutAnimation = CurvedAnimation(
      parent: _controller,
      curve: Interval(cutStart, flipStart, curve: widget.cutCurve ?? Curves.linear),
    );
    flipAnimation = CurvedAnimation(
      parent: _controller,
      curve: Interval(flipStart, 1.0, curve: widget.flipCurve ?? Curves.easeInOut),
    );
  }

  void _restartController() {
    isResetingController = true;
    _controller.duration = widget.totalAnimationDuration;
    _controller.reset();
    isResetingController = false;
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _AnimatedFlipWidget(
      listenable: _controller,
      face: _animatedCutBoxWithFace(cutAnimation, widget.cutColor, widget.face),
      flipFace: widget.flipFace,
      flipDirection: VerticalDirection.down,
      curvedAnimation: flipAnimation,
      perspectiveEffect: widget.perspectiveEffect,
    );
  }

  CustomPaint _animatedCutBoxWithFace(
          Animation<double> curvedAnimation, Color color, Widget child) =>
      CustomPaint(
        foregroundPainter: AnimatedBorderPainter(
          animation: Tween(begin: 0.0, end: 1.0).animate(curvedAnimation),
          pathType: PathType.rRect,
          strokeColor: color,
        ),
        child: child,
      );
}

class _AnimatedFlipWidget extends AnimatedWidget {
  _AnimatedFlipWidget({
    required super.listenable,
    required this.face,
    required this.flipFace,
    required this.curvedAnimation,
    required this.flipDirection,
    double? perspectiveEffect,
  })  : _flipTween = Tween(begin: 0.0, end: math.pi),
        _perspectiveTween = TweenSequence([
          TweenSequenceItem(tween: Tween(begin: 0.0, end: perspectiveEffect ?? 0.002), weight: 1.0),
          TweenSequenceItem(tween: Tween(begin: perspectiveEffect ?? 0.002, end: 0.0), weight: 1.0),
        ]);

  /// Half turn
  static const _piBy2 = math.pi / 2;

  final Widget face;
  final Widget flipFace;
  final VerticalDirection flipDirection;
  final Animation<double> curvedAnimation;
  final Tween<double> _flipTween;
  final TweenSequence _perspectiveTween;

  @override
  Widget build(BuildContext context) {
    final flipValue = _flipTween.evaluate(curvedAnimation);
    final perspectiveValue = _perspectiveTween.evaluate(curvedAnimation);

    final isUp = flipDirection == VerticalDirection.up;
    final isPastMiddle = flipValue > _piBy2;
    final rotation = (isUp ? -flipValue : flipValue) + (isPastMiddle ? math.pi : 0.0);

    final transform = Matrix4.identity()..setEntry(3, 2, perspectiveValue);
    transform.rotateX(rotation);

    return Transform(
      alignment: Alignment.center,
      transform: transform,
      child: (isPastMiddle) ? flipFace : face,
    );
  }
}
