import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../presentation_layer.dart';

class AdContainer extends StatelessWidget {
  const AdContainer({Key? key, required this.ad, this.height}) : super(key: key);

  final BannerAd ad;
  final double? height;

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: ad.size.width.toDouble(),
              height: height ?? ad.size.height.toDouble(),
              child: AdWidget(ad: ad),
            )
          ],
        ),
      );

  void dispose() => ad.dispose();
}

class FlipAd extends ConsumerWidget {
  FlipAd({
    Key? key,
    required this.child,
    this.adDelay = const Duration(seconds: 5),
    this.adDuration = const Duration(seconds: 30),
  }) : super(key: key);

  final Widget child;
  final Duration adDelay;
  final Duration adDuration;
  late final _faceProvider = StateProvider<Widget>((_) => child);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flipWidget = FlipWidget(
      widgetProvider: _faceProvider,
      flipDirection: VerticalDirection.down,
      decorateWidgetBeforeAnimation: _decorateWidgetForAnimation,
      onFlipFinished: _onflipFinished,
    );
    Future.delayed(adDelay, () => _flipAd(ref.read));
    return flipWidget;
  }

  void _flipAd(Reader read) {
    final faceController = read(_faceProvider.notifier);
    final adState = read(adStateProvider);
    bool handledLoaded = false;
    late final BannerAd ad;
    ad = adState.createBunnerAd(onAdLoaded: () {
      if (!handledLoaded) {
        handledLoaded = true;
        faceController.state = AdContainer(ad: ad, height: 84);
        Future.delayed(adDuration, () => faceController.state = child);
      }
    });
    ad.load();
  }

  Widget? _decorateWidgetForAnimation(Widget widget) {
    if (widget is AdContainer) return null;
    return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.white)), child: widget);
  }

  void _onflipFinished({required Widget prev, required Widget next}) {
    if (prev is AdContainer) {
      prev.dispose();
    }
  }
}

class FlipWidget extends HookConsumerWidget {
  FlipWidget({
    Key? key,
    required this.widgetProvider,
    required this.flipDirection,
    this.onFlipFinished,
    this.decorateWidgetBeforeAnimation,
    this.flipDuration = const Duration(milliseconds: 3000),
    this.flipCurve = Curves.easeInOut,
    this.perspectiveEffect = 0.006,
  }) : super(key: key);

  /// Custom animation Curve for a fast bounce effect (bang! effect).
  static const bounceFastFlip = _BounceFastFlipCurve();

  /// Custom animation animation for a slow bounce effect (slow bang! effect).
  static const bounceSlowFlip = _BounceSlowFlipCurve();

  /// Default animation Curve.
  static const defaultFlip = Curves.easeInOut;

  /// Provider of display widgets
  final StateProvider<Widget> widgetProvider;

  final void Function({required Widget prev, required Widget next})? onFlipFinished;

  final Widget? Function(Widget)? decorateWidgetBeforeAnimation;

  /// Direction of the flip animation.
  final VerticalDirection flipDirection;

  /// Duration of the flip animation.
  final Duration flipDuration;

  /// Curve for the flip animation.
  ///
  /// Defaults to Curves.easeInOut
  final Curve flipCurve;

  /// Perspective effect for the Transform Matrix4.
  ///
  /// Defaults to 0.006
  final double perspectiveEffect;

  final _previousWidgetController = StateController<Widget?>(null);
  final _finishedWidgetController = StateController<Widget?>(null);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController(duration: flipDuration);
    final curvedAnimation = CurvedAnimation(parent: controller, curve: flipCurve);
    final flipAnimation = Tween(begin: 0.0, end: math.pi).animate(curvedAnimation);
    final perspectiveAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: perspectiveEffect), weight: 1.0),
      TweenSequenceItem(tween: Tween(begin: perspectiveEffect, end: 0.0), weight: 1.0),
    ]).animate(curvedAnimation);

    /// watch new faces provider
    final newFace = ref.watch(widgetProvider);

    final previousFace = _finishedWidgetController.state;
    _previousWidgetController.state = previousFace;
    _finishedWidgetController.state = newFace;

    if (previousFace == null) {
      return newFace;
    }

    final decoratedNew = decorateWidgetBeforeAnimation?.call(newFace);
    final decoratedOld = decorateWidgetBeforeAnimation?.call(previousFace);

    if (onFlipFinished != null) {
      controller.removeStatusListener(_statusListener);
      controller.addStatusListener(_statusListener);
    }

    return _FlipWidget(
      controller: controller,
      oldFace: previousFace,
      newFace: newFace,
      decoratedOldFace: decoratedOld,
      decoratedNewFace: decoratedNew,
      flipDirection: VerticalDirection.down,
      flipAnimation: flipAnimation,
      perspectiveAnimation: perspectiveAnimation,
    );
  }

  void _statusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      onFlipFinished?.call(
        prev: _previousWidgetController.state!,
        next: _finishedWidgetController.state!,
      );
    }
  }
}

class _FlipWidget extends AnimatedWidget {
  _FlipWidget({
    required AnimationController controller,
    required this.oldFace,
    required this.newFace,
    this.decoratedOldFace,
    this.decoratedNewFace,
    required this.flipAnimation,
    required this.perspectiveAnimation,
    required this.flipDirection,
  }) : super(listenable: controller) {
    controller.reset();
    controller.forward();
  }

  /// Half turn
  static const _piBy2 = math.pi / 2;

  final Widget oldFace;
  final Widget newFace;
  final Widget? decoratedOldFace;
  final Widget? decoratedNewFace;
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
      child = flipAnimation.isCompleted ? newFace : decoratedNewFace ?? newFace;
    } else {
      child = flipAnimation.isCompleted ? oldFace : decoratedOldFace ?? oldFace;
    }

    return Transform(
      alignment: Alignment.center,
      transform: transform,
      child: child,
    );
  }
}

class _BounceFastFlipCurve extends Curve {
  const _BounceFastFlipCurve();

  static const factor_1 = 121.0 / 49.0;
  static const factor_2 = 121.0 / 16.0;
  static const factor_3 = 121.0 / 4.0;

  @override
  double transformInternal(double t) => _bounce(t);

  double _bounce(double t) {
    if (t < 1.75 / 2.75) {
      return factor_1 * t * t;
    } else if (t < 2.5 / 2.75) {
      t -= 2.125 / 2.75;
      return factor_2 * t * t + 0.859375;
    }
    t -= 2.625 / 2.75;
    return factor_3 * t * t + 0.9375;
  }
}

class _BounceSlowFlipCurve extends Curve {
  const _BounceSlowFlipCurve();

  static const factor_1 = 121.0 / 64.0;
  static const factor_2 = 121.0 / 8.0;
  static const factor_3 = 121.0 / 4.0;

  @override
  double transformInternal(double t) => _bounce(t);

  double _bounce(double t) {
    if (t < 2.0 / 2.75) {
      return factor_1 * t * t;
    } else if (t < 2.5 / 2.75) {
      t -= 2.25 / 2.75;
      return factor_2 * t * t + 0.875;
    }
    t -= 2.625 / 2.75;
    return factor_3 * t * t + 0.9375;
  }
}
