import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';

import '../../../presentation_layer.dart';
import '../../provider/presentation_providers.dart';
import '../mobile_add/ad_container.dart';
import 'animated_border_painter.dart';

class FlipAd extends HookConsumerWidget {
  FlipAd({
    Key? key,
    required this.child,
    this.adDelay = const Duration(seconds: 5),
    this.adDuration = const Duration(seconds: 20),
    this.decorationDuration = const Duration(seconds: 2),
    this.flipDuration = const Duration(seconds: 3),
  }) : super(key: key);

  final Logger log = Logger('FlipAd');
  final Widget child;
  final Duration adDelay;
  final Duration adDuration;
  final Duration decorationDuration;
  final Duration flipDuration;
  late final _flipProvider = StateProvider<Widget?>((_) => null);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flipWidget = FlipWidget(
      face: child,
      flipProvider: _flipProvider,
      flipDirection: VerticalDirection.down,
      decorationDuration: decorationDuration,
      flipDuration: flipDuration,
      waitDuration: adDuration,
      decorateWidgetForAnimation: _decorateWidgetForAnimation,
      onFlipBackFinished: () => _onflipFinished(ref.read),
    );
    Future.delayed(adDelay, () => _flipAd(ref));
    return flipWidget;
  }

  void _flipAd(WidgetRef ref) {
    bool handledLoaded = false;
    late final AdInRowContainer adContainer;
    adContainer = createBannerAdInRowContainer(ref.read, onAdLoaded: (_) {
      if (!handledLoaded) {
        handledLoaded = true;
        ref.read(_flipProvider.notifier).state = adContainer;
      }
    });
    ref.watch(adAutoReleaseProvider(adContainer));
    adContainer.load();
  }

  AdInRowContainer createBannerAdInRowContainer(
    Reader read, {
    AdEventCallback? onAdLoaded,
    AdSize? size,
    double? height,
  }) {
    final adState = read(adStateProvider);
    return AdInRowContainer(
      ad: adState.createBannerAd(onAdLoaded: onAdLoaded, size: size),
      height: height,
    );
  }

  Widget? _decorateWidgetForAnimation(
      BuildContext context, Widget widget, Animation<double> animation) {
    if (widget is AdInRowContainer) return null;
    final color = Theme.of(context).colorScheme.onSurface;
    return CustomPaint(
      foregroundPainter: AnimatedBorderPainter(
        animation: animation,
        pathType: PathType.rRect,
        strokeColor: color,
      ),
      child: widget,
    );
  }

  void _onflipFinished(Reader read) {
    final flipFace = read(_flipProvider);
    if (flipFace is AdInRowContainer) {
      flipFace.dispose();
    }
  }
}

class FlipWidget extends HookConsumerWidget {
  FlipWidget({
    Key? key,
    required this.face,
    required this.flipProvider,
    required this.flipDirection,
    required this.decorationDuration,
    required this.flipDuration,
    required this.waitDuration,
    this.onFlipBackFinished,
    this.decorateWidgetForAnimation,
    this.decorationCurve = Curves.easeIn,
    this.flipCurve = Curves.easeInOut,
    this.perspectiveEffect = 0.006,
  }) : super(key: key);

  final Widget face;
  final StateProvider<Widget?> flipProvider;
  final VoidCallback? onFlipBackFinished;
  final Widget? Function(BuildContext, Widget, Animation<double> animation)?
      decorateWidgetForAnimation;
  final VerticalDirection flipDirection;
  final Duration decorationDuration;
  final Duration waitDuration;
  final Duration flipDuration;
  final Curve decorationCurve;
  final Curve flipCurve;
  final double perspectiveEffect;

  final _animationControllerHolder = StateController<AnimationController?>(null);
  final _isMountedHolder = StateController<bool Function()?>(null);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationDuration = flipDuration + decorationDuration;
    final controller = useAnimationController(duration: animationDuration);
    final isMounted = useIsMounted();
    _animationControllerHolder.state = controller;
    _isMountedHolder.state = isMounted;

    /// watch new faces provider
    final flipFace = ref.watch(flipProvider);
    if (flipFace == null) {
      return face;
    }

    final decorationCurvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Interval(
        0.0,
        decorationDuration.inMilliseconds / animationDuration.inMilliseconds,
        curve: decorationCurve,
      ),
    );
    final decorationAnimation = Tween(begin: 0.0, end: 1.0).animate(decorationCurvedAnimation);
    final flipCurvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Interval(
        decorationDuration.inMilliseconds / animationDuration.inMilliseconds,
        1.0,
        curve: flipCurve,
      ),
    );
    final flipAnimation = Tween(begin: 0.0, end: math.pi).animate(flipCurvedAnimation);
    final perspectiveAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: perspectiveEffect), weight: 1.0),
      TweenSequenceItem(tween: Tween(begin: perspectiveEffect, end: 0.0), weight: 1.0),
    ]).animate(flipCurvedAnimation);

    final decoratedFlipFace =
        decorateWidgetForAnimation?.call(context, flipFace, decorationAnimation);
    final decoratedFace = decorateWidgetForAnimation?.call(context, face, decorationAnimation);

    controller.removeStatusListener(_statusListener);
    controller.reset();

    controller.addStatusListener(_statusListener);
    controller.forward();

    return _FlipWidget(
      controller: controller,
      face: face,
      flipFace: flipFace,
      decoratedFace: decoratedFace,
      decoratedFlipFace: decoratedFlipFace,
      flipDirection: VerticalDirection.down,
      flipAnimation: flipAnimation,
      perspectiveAnimation: perspectiveAnimation,
    );
  }

  void _statusListener(AnimationStatus status) {
    final isMounted = _isMountedHolder.state;
    if (status == AnimationStatus.completed) {
      final controller = _animationControllerHolder.state!;
      Future.delayed(waitDuration, () {
        if (isMounted!()) {
          controller.reverse();
        }
      });
    } else if (status == AnimationStatus.dismissed) {
      onFlipBackFinished?.call();
    }
  }
}

class _FlipWidget extends AnimatedWidget {
  const _FlipWidget({
    required AnimationController controller,
    required this.face,
    required this.flipFace,
    this.decoratedFace,
    this.decoratedFlipFace,
    required this.flipAnimation,
    required this.perspectiveAnimation,
    required this.flipDirection,
  }) : super(listenable: controller);

  /// Half turn
  static const _piBy2 = math.pi / 2;

  final Widget face;
  final Widget flipFace;
  final Widget? decoratedFace;
  final Widget? decoratedFlipFace;
  final Animation<double> flipAnimation;
  final Animation<double> perspectiveAnimation;
  final VerticalDirection flipDirection;

  @override
  Widget build(BuildContext context) {
    final isPastMiddle = flipAnimation.value > _piBy2;
    final isUp = flipDirection == VerticalDirection.up;

    final rotation =
        (isUp ? -flipAnimation.value : flipAnimation.value) + (isPastMiddle ? math.pi : 0.0);

    final transform = Matrix4.identity()..setEntry(3, 2, perspectiveAnimation.value);
    transform.rotateX(rotation);

    late Widget child;
    if (isPastMiddle) {
      child = flipAnimation.isCompleted ? flipFace : decoratedFlipFace ?? flipFace;
    } else {
      child = flipAnimation.isDismissed ? face : decoratedFace ?? face;
    }

    return Transform(
      alignment: Alignment.center,
      transform: transform,
      child: child,
    );
  }
}
