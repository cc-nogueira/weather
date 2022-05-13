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

typedef DecorateWidgetForAnimationCallback = Widget? Function(
    BuildContext context, Widget widget, Animation<double> animation);

class FlipAd extends HookConsumerWidget {
  FlipAd({
    Key? key,
    required this.child,
    this.adHeight,
    this.adDelay = const Duration(seconds: 5),
    this.adDuration = const Duration(seconds: 20),
    this.decorationDuration = const Duration(seconds: 2),
    this.flipDuration = const Duration(seconds: 2),
  }) : super(key: key);

  final Logger log = Logger('FlipAd');
  final Widget child;
  final double? adHeight;
  final Duration adDelay;
  final Duration adDuration;
  final Duration decorationDuration;
  final Duration flipDuration;
  late final _flipProvider = StateProvider<Widget?>((_) => null);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _loadAd(ref);
    return CutAndFlipWidget<AdInRowContainer>(
      face: child,
      flipProvider: _flipProvider,
      flipDirection: VerticalDirection.down,
      delayDuration: adDelay,
      decorationDuration: decorationDuration,
      flipDuration: flipDuration,
      waitDuration: adDuration,
      onFlipBackFinished: () => _onflipFinished(ref.read),
      perspectiveEffect: 0.002,
    );
  }

  void _loadAd(WidgetRef ref) {
    bool handledLoaded = false;
    late final AdInRowContainer adContainer;
    adContainer = createBannerAdInRowContainer(
      ref.read,
      height: adHeight,
      onAdLoaded: (_) {
        if (!handledLoaded) {
          handledLoaded = true;
          ref.read(_flipProvider.notifier).state = adContainer;
        }
      },
    );
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

  void _onflipFinished(Reader read) {
    final flipFace = read(_flipProvider);
    if (flipFace is AdInRowContainer) {
      flipFace.dispose();
    }
  }
}

class CutAndFlipWidget<T extends Widget> extends FlipWidget {
  CutAndFlipWidget({
    Key? key,
    required Widget face,
    required StateProvider<Widget?> flipProvider,
    required VerticalDirection flipDirection,
    required Duration delayDuration,
    required Duration decorationDuration,
    required Duration flipDuration,
    required Duration waitDuration,
    VoidCallback? onFlipBackFinished,
    Curve? decorationCurve,
    Curve? flipCurve,
    double? perspectiveEffect,
  }) : super(
          key: key,
          face: face,
          flipProvider: flipProvider,
          flipDirection: flipDirection,
          delayDuration: delayDuration,
          decorationDuration: decorationDuration,
          flipDuration: flipDuration,
          waitDuration: waitDuration,
          onFlipBackFinished: onFlipBackFinished,
          decorationCurve: decorationCurve,
          flipCurve: flipCurve,
          perspectiveEffect: perspectiveEffect,
        );

  @override
  Widget? decorateWidgetForAnimation(
      BuildContext context, Widget widget, Animation<double> animation) {
    if (widget is T) {
      return null;
    }
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
}

class FlipWidget extends HookConsumerWidget {
  FlipWidget({
    Key? key,
    required this.face,
    required this.flipProvider,
    required this.flipDirection,
    required this.delayDuration,
    required this.decorationDuration,
    required this.flipDuration,
    required this.waitDuration,
    this.onFlipBackFinished,
    this.decorateWidgetForAnimationCallback,
    this.decorationCurve,
    this.flipCurve,
    this.perspectiveEffect,
  }) : super(key: key);

  final Widget face;
  final StateProvider<Widget?> flipProvider;
  final VoidCallback? onFlipBackFinished;
  final DecorateWidgetForAnimationCallback? decorateWidgetForAnimationCallback;
  final VerticalDirection flipDirection;
  final Duration delayDuration;
  final Duration decorationDuration;
  final Duration waitDuration;
  final Duration flipDuration;
  final Curve? decorationCurve;
  final Curve? flipCurve;
  final double? perspectiveEffect;

  final _animationControllerHolder = StateController<AnimationController?>(null);
  final _isMountedHolder = StateController<bool Function()?>(null);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationDuration = flipDuration + decorationDuration + delayDuration;
    final controller = useAnimationController(duration: animationDuration);
    _animationControllerHolder.state = controller;

    final isMounted = useIsMounted();
    _isMountedHolder.state = isMounted;

    /// watch new faces provider
    final flipFace = ref.watch(flipProvider);
    if (flipFace == null) {
      return face;
    }

    final decorStart = delayDuration.inMilliseconds / animationDuration.inMilliseconds;
    final flipStart =
        decorStart + decorationDuration.inMilliseconds / animationDuration.inMilliseconds;

    final decorationTimedCurve = CurvedAnimation(
      parent: controller,
      curve: Interval(decorStart, flipStart, curve: decorationCurve ?? Curves.linear),
    );
    final flipTimedCurve = CurvedAnimation(
      parent: controller,
      curve: Interval(flipStart, 1.0, curve: flipCurve ?? Curves.easeInOut),
    );

    final decorAnimation = Tween(begin: 0.0, end: 1.0).animate(decorationTimedCurve);
    final flipAnimation = Tween(begin: 0.0, end: math.pi).animate(flipTimedCurve);
    final perspectiveAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: perspectiveEffect ?? 0.006), weight: 1.0),
      TweenSequenceItem(tween: Tween(begin: perspectiveEffect ?? 0.006, end: 0.0), weight: 1.0),
    ]).animate(flipTimedCurve);

    final decoratedFlipFace = decorateWidgetForAnimation(context, flipFace, decorAnimation);
    final decoratedFace = decorateWidgetForAnimation(context, face, decorAnimation);

    controller.removeStatusListener(_statusListener);
    controller.reset();

    controller.addStatusListener(_statusListener);
    controller.forward();

    return _FlipWidget(
      controller: controller,
      face: face,
      flipFace: decoratedFlipFace ?? flipFace,
      decoratedFace: decoratedFace,
      decoratedFlipFace: null,
      flipDirection: VerticalDirection.down,
      flipAnimation: flipAnimation,
      perspectiveAnimation: perspectiveAnimation,
    );
  }

  Widget? decorateWidgetForAnimation(
          BuildContext context, Widget widget, Animation<double> animation) =>
      decorateWidgetForAnimationCallback?.call(context, widget, animation);

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
