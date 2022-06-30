import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'animated_border_painter.dart';

/// CutAndFlipWidget is a container widget that animates drawing a border and flipping in a
/// back face, then flipping back the front face.
///
/// This widget simultates the impression of cutting a border around the child widget then flipping
/// this container to reveal a back face. After a rest period it flips back the original content and
/// dissolves the border that was cut around this child.
///
/// The whole animation is configurable with four durations.
///
/// More optional parameters customize flip direction, cut start distance, cut color the intensity
/// of the flip perspective effect and animation curves.
class CutAndFlipWidget extends ConsumerWidget {
  const CutAndFlipWidget({
    super.key,
    required this.face,
    required this.flipProvider,
    required this.delayDuration,
    required this.cutDuration,
    required this.flipDuration,
    required this.waitDuration,
    VerticalDirection? flipDirection,
    double? startDistance,
    Curve? cutCurve,
    Curve? flipCurve,
    double? perspectiveEffect,
    this.cutColor,
    this.onFlipBackFinished,
  })  : flipDirection = flipDirection ?? VerticalDirection.down,
        startDistance = startDistance ?? 0.0,
        cutCurve = cutCurve ?? Curves.linear,
        flipCurve = flipCurve ?? Curves.easeInOut,
        perspectiveEffect = perspectiveEffect ?? 0.002;

  /// Front face of the widget, shown before and after animations.
  final Widget face;

  /// Provider of the back face widget.
  ///
  /// The whole animation only starts when the back face is provided.
  /// Only then the first wait duration starts counting.
  /// Before that the front face is shown without any decoration.
  final StateProvider<Widget?> flipProvider;

  /// Optional callback called when the whole animation finishes and this
  /// widget is already displaying back the front face widget.
  final VoidCallback? onFlipBackFinished;

  /// Delay before cutting and flipping.
  final Duration delayDuration;

  /// Cut duration.
  final Duration cutDuration;

  /// Flip duration.
  final Duration flipDuration;

  /// Wait time showing the back face.
  final Duration waitDuration;

  /// Optional flip direction (defaults to flip down).
  final VerticalDirection flipDirection;

  /// Start cutting point. Defaults to starting the cut from lower-left corner.
  final double startDistance;

  /// Optional cut animation curve (defaults to Curves.linear).
  final Curve cutCurve;

  /// Optional flip animation curve (defaults to Curves.easeInOut).
  final Curve flipCurve;

  /// Optional cut color (defaults to colorScheme.onSurface).
  final Color? cutColor;

  /// Optional flip perspective effect (dafaults to 0.002).
  final double perspectiveEffect;

  /// Watch the flipProvider for this widget back face.
  /// Only then the first wait duration starts counting.
  /// Before that shows the front face without any decoration.
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
      startDistance: startDistance,
      cutColor: cutColor ?? Theme.of(context).colorScheme.onSurface,
      onFlipBackFinished: onFlipBackFinished,
      cutCurve: cutCurve,
      flipCurve: flipCurve,
      perspectiveEffect: perspectiveEffect,
    );
  }
}

/// Internal statefull widget created only when the back face is available.
///
/// Receives all parameters from [CutAndFlipWidget].
/// Animates flipping the back face in then the front face back.
///
/// The animation has the following sequence:
/// 1. Wait delayDuration.
/// 2. Draw the cut border (cutDuration).
/// 3. Flip the back face in. (flipDuration).
/// 4. Display the backface without a cut border. (waitDuration).
/// 5. Flips back the front face with its cut border (flipDuration).
/// 6. Dissolves the cut border (cutDuration).
///
/// If you want the back face to maintain the cut border just provide a flipFace with such border.
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
    required this.startDistance,
    required this.cutCurve,
    required this.flipCurve,
    required this.perspectiveEffect,
    this.onFlipBackFinished,
  });

  /// Front face, shown before and after the whole animation.
  final Widget face;

  /// Back face that will be flipped into view then flipped out through the animation.
  final Widget flipFace;

  /// Flip direction.
  final VerticalDirection flipDirection;

  /// Delay before cut and flip.
  final Duration delayDuration;

  /// Cut animation duration.
  final Duration cutDuration;

  /// Flip animation duration.
  final Duration flipDuration;

  /// Wait time showing the back face.
  final Duration waitDuration;

  /// Cut color
  final Color cutColor;

  /// Start point for the cut drawing animation
  final double startDistance;

  /// Optional callback to be fired after the whole animation finishes and the front face is back in view.
  final VoidCallback? onFlipBackFinished;

  /// Cut animation curve.
  final Curve cutCurve;

  /// Flip animation curve.
  final Curve flipCurve;

  /// Intensity of the flip perspective effect.
  final double perspectiveEffect;

  @override
  CutFlipWidgetState createState() => CutFlipWidgetState();
}

class CutFlipWidgetState extends State<_CutAndFlipWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late CurvedAnimation _cutAnimation;
  late CurvedAnimation _flipAnimation;
  late Duration _totalAnimationDuration;
  bool _isResetingController = false;

  /// Init state creating the animation controller
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener(_statusListener);
    _configAnimations();
  }

  /// Dispose animation controller
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Reconfigure animations with the state object is reused.
  @override
  // ignore: library_private_types_in_public_api
  void didUpdateWidget(covariant _CutAndFlipWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget != widget) {
      _configAnimations();
    }
  }

  /// Internal - controller status listener that watches the completion of the first flip to
  /// schedule the reverse animation.
  /// Then watches for completion of the flip back animation to call the optional onFlipBackFinished
  /// callback.
  void _statusListener(AnimationStatus status) {
    if (mounted) {
      if (status == AnimationStatus.completed) {
        Future.delayed(widget.waitDuration, () {
          if (mounted) {
            _controller.reverse();
          }
        });
      } else if (status == AnimationStatus.dismissed && !_isResetingController) {
        widget.onFlipBackFinished?.call();
      }
    }
  }

  /// Internal - configure animation durations creating the cut and the flip curved animations.
  /// Called by initState and didUpdateWidget methods.
  void _configAnimations() {
    _totalAnimationDuration = widget.flipDuration + widget.cutDuration + widget.delayDuration;
    final totalMillis = _totalAnimationDuration.inMilliseconds;
    final cutStart = widget.delayDuration.inMilliseconds / totalMillis;
    final flipStart = cutStart + widget.cutDuration.inMilliseconds / totalMillis;

    _cutAnimation = CurvedAnimation(
      parent: _controller,
      curve: Interval(cutStart, flipStart, curve: widget.cutCurve),
    );
    _flipAnimation = CurvedAnimation(
      parent: _controller,
      curve: Interval(flipStart, 1.0, curve: widget.flipCurve),
    );

    _restartController();
  }

  /// Internal - restart the animation controller, called by _configAnimations method.
  void _restartController() {
    _isResetingController = true;
    _controller.duration = _totalAnimationDuration;
    _controller.reset();
    _isResetingController = false;
    _controller.forward();
  }

  /// Build a [_AnimatedFlipWidget] with an [_animatedCutBoxWithFace] CustomPaint widget child.
  ///
  /// Here we have two animations in sequence.
  /// First the animated cut box is driven by the cut animation, then the animated flip widget is
  /// driven by the flip animation. Both animations are part of a larger animation that also
  /// includes the initial delayDuration.
  ///
  /// The wait duration is kept out of this larger animation and is used directly by the
  /// [_statusListener].
  @override
  Widget build(BuildContext context) => _AnimatedFlipWidget(
        listenable: _controller,
        face: _animatedCutBoxWithFace(),
        flipFace: widget.flipFace,
        flipDirection: VerticalDirection.down,
        curvedAnimation: _flipAnimation,
        perspectiveEffect: widget.perspectiveEffect,
      );

  /// CustomPaint widget that animates the drawing of a "cut border" around the front face widget.
  /// This animation is driven by the cutAnimation, that is part of the whole animation.
  CustomPaint _animatedCutBoxWithFace() => CustomPaint(
        foregroundPainter: AnimatedBorderPainterWithCachedMetrics(
          animation: Tween(begin: 0.0, end: 1.0).animate(_cutAnimation),
          pathType: PathType.rRect,
          strokeColor: widget.cutColor,
          startDistance: widget.startDistance,
        ),
        child: widget.face,
      );
}

/// AnimatedWidget to render the flip animation.
///
/// It uses a Transform matrix rotation with perspective effect to present a flip effect.
/// It is provided with the front and back faces and is configured with a curvedAnimation, a
/// flipDirection and the intensity of the persperctive effect.
///
/// Animation is actually driven (controlled) by the caller that should start and reverse this
/// animation as desired.
class _AnimatedFlipWidget extends AnimatedWidget {
  /// Constructor.
  _AnimatedFlipWidget({
    required super.listenable,
    required this.face,
    required this.flipFace,
    required this.curvedAnimation,
    required this.flipDirection,
    required double perspectiveEffect,
  })  : _flipTween = Tween(begin: 0.0, end: math.pi),
        _perspectiveTween = TweenSequence([
          TweenSequenceItem(tween: Tween(begin: 0.0, end: perspectiveEffect), weight: 1.0),
          TweenSequenceItem(tween: Tween(begin: perspectiveEffect, end: 0.0), weight: 1.0),
        ]);

  /// Half turn
  static const _piBy2 = math.pi / 2;

  /// Front face.
  final Widget face;

  /// Flip face.
  final Widget flipFace;

  /// Animation direction.
  final VerticalDirection flipDirection;

  /// Animation curve from 0.0 to 1.0
  final Animation<double> curvedAnimation;

  /// Internal - rotation progression from 0.0 to PI (zero to full flip or 180 degrees turn).
  final Tween<double> _flipTween;

  /// Internal - perspective progression from 0.0 to the persepectiveEffect parameter.
  final TweenSequence _perspectiveTween;

  /// Build the panel with the current animation stage, rendenring a matrix rotation transformation.
  ///
  /// If the animation is in the first half display the rotation over the front face widget.
  /// If the animatino is past middle display the rotation over the back face widget.
  /// This way we have the effect of changing faces exactly when the rotation is half way (horizontal).
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
      child: isPastMiddle ? flipFace : face,
    );
  }
}
