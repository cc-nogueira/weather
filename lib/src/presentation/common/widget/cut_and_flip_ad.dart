import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';

import '../../provider/presentation_providers.dart';
import '../mobile_add/ad_container.dart';
import 'cut_and_flip_widget.dart';

/// CutAndFlipAd is a container widget that animates drawing a border and flipping in a AdMob Ad.
///
/// This widget simultates the impression of cutting a border around the child widget then flipping
/// this container to reveal a AdMob ad. After a rest period it flips back the original content and
/// dissolves the border that was cut around this child.
///
/// The whole animation is configurable with four durations.
///
/// It relies on the [CutAndFlipWidget] providing the Ad as the flipped widget.
/// After constructing the CutAndFlipWidget it loads the banner ad, on the Ad onLoaded callback it
/// feeds the ad to the be flipped in view.
///
/// It also disposes the loaded ad after the flip finishes.
/// The is created with a [AdInRowContainer], a StatefullWidget that also disposes the Ad. It is does
/// garanteed to dispose this Ad either at the end of the animation or at the disposal of the
/// AdInRowContainer.
class CutAndFlipAd extends ConsumerWidget {
  /// Constructor, most parameters are passed to the CutAndFlipWidget.
  CutAndFlipAd({
    super.key,
    required this.child,
    this.adHeight,
    this.adDelay = const Duration(seconds: 1),
    this.cutDuration = const Duration(seconds: 2),
    this.flipDuration = const Duration(seconds: 2),
    this.adDuration = const Duration(seconds: 5),
    this.startingCutLength,
  });

  /// Logger
  final Logger log = Logger('FlipAd');

  /// Child widget that will displayed before and after the ad.
  final Widget child;

  /// Optional adHeight, passed to the [AdInRowContainer].
  final double? adHeight;

  /// Delay before starting the cut and flip animation.
  final Duration adDelay;

  /// Duration of the cut animation.
  final Duration cutDuration;

  /// Duration of the flip animation.
  final Duration flipDuration;

  /// Duration of ad in place (after flip).
  final Duration adDuration;

  /// Start cutting point. Defaults to starting the cut from lower-left corner.
  final double? startingCutLength;

  /// Internal provider of the banner ad flipped face.
  late final _flipProvider = StateProvider<Widget?>((_) => null);

  /// Creates the AdMob banner and builds the CutAndFlipWidget showing the child widget as its front
  /// face.
  ///
  /// The whole animation will start after the AdMob is fed to this built widget on the onLoaded
  /// callback.
  ///
  /// Also register a onFlipBackFinished callback to dispose the AdMob banner ad.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _loadAd(ref);
    return CutAndFlipWidget(
      face: child,
      flipProvider: _flipProvider,
      delayDuration: adDelay,
      cutDuration: cutDuration,
      flipDuration: flipDuration,
      waitDuration: adDuration,
      startDistance: startingCutLength,
      onFlipBackFinished: () => _onflipFinished(ref),
    );
  }

  /// Internal - Instantiate the banner ad and register the onLoaded callback that will feed this ad
  /// to the CutAndFlipWidget through our widget provider.
  void _loadAd(WidgetRef ref) {
    bool handledLoaded = false;
    late final AdInRowContainer adContainer;
    adContainer = _createBannerAdInRowContainer(
      ref,
      height: adHeight,
      onAdLoaded: (_) {
        if (!handledLoaded) {
          handledLoaded = true;
          ref.read(_flipProvider.notifier).state = adContainer;
        }
      },
    );
    adContainer.ad.load();
  }

  /// Internal - Create the AdInRowContainer with a AdMob banner ad.
  AdInRowContainer _createBannerAdInRowContainer(
    WidgetRef ref, {
    AdEventCallback? onAdLoaded,
    AdSize? size,
    double? height,
  }) {
    final adState = ref.read(adStateProvider);
    return AdInRowContainer(
      ad: adState.createBannerAd(onAdLoaded: onAdLoaded, size: size),
      height: height,
    );
  }

  /// Internal - onFlipFinished callback to dispose the banner ad when the flipback to the original
  /// child widget finishes.
  void _onflipFinished(WidgetRef ref) {
    final flipFace = ref.read(_flipProvider);
    if (flipFace is AdInRowContainer) {
      flipFace.ad.dispose();
    }
  }
}
