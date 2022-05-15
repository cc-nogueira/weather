import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';

import '../../provider/presentation_providers.dart';
import '../mobile_add/ad_container.dart';
import 'cut_and_flip_widget.dart';

class CutAndFlipAd extends ConsumerWidget {
  CutAndFlipAd({
    super.key,
    required this.child,
    this.adHeight,
    this.adDelay = const Duration(seconds: 2),
    this.adDuration = const Duration(seconds: 5),
    this.cutDuration = const Duration(seconds: 2),
    this.flipDuration = const Duration(seconds: 2),
  });

  final Logger log = Logger('FlipAd');
  final Widget child;
  final double? adHeight;
  final Duration adDelay;
  final Duration adDuration;
  final Duration cutDuration;
  final Duration flipDuration;
  late final _flipProvider = StateProvider<Widget?>((_) => null);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _loadAd(ref);
    return CutAndFlipWidget(
      face: child,
      flipProvider: _flipProvider,
      flipDirection: VerticalDirection.down,
      delayDuration: adDelay,
      cutDuration: cutDuration,
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
    adContainer.ad.load();
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
      flipFace.ad.dispose();
    }
  }
}
