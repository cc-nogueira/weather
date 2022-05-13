import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logging/logging.dart';

class AdState {
  AdState();

  late final InitializationStatus initializationStatus;
  final Logger log = Logger('adState');

  Future<InitializationStatus> init() async {
    initializationStatus = await MobileAds.instance.initialize();
    return initializationStatus;
  }

  String get bannerAdUnitId => Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/2934735716';

  BannerAd createBannerAd({
    AdSize? size,
    AdEventCallback? onAdLoaded,
    AdLoadErrorCallback? onAdFailedToLoad,
    AdEventCallback? onAdOpened,
    AdEventCallback? onAdClosed,
    AdEventCallback? onAdWillDismissScreen,
    AdEventCallback? onAdImpression,
    OnPaidEventCallback? onPaidEvent,
    AdEventCallback? onAdClicked,
  }) =>
      BannerAd(
        size: size ?? AdSize.banner,
        adUnitId: bannerAdUnitId,
        listener: listener(
          onAdLoaded: onAdLoaded,
          onAdFailedToLoad: onAdFailedToLoad,
          onAdOpened: onAdOpened,
          onAdClosed: onAdClosed,
          onAdWillDismissScreen: onAdWillDismissScreen,
          onAdImpression: onAdImpression,
          onPaidEvent: onPaidEvent,
          onAdClicked: onAdClicked,
        ),
        request: const AdRequest(),
      );

  BannerAdListener listener({
    AdEventCallback? onAdLoaded,
    AdLoadErrorCallback? onAdFailedToLoad,
    AdEventCallback? onAdOpened,
    AdEventCallback? onAdClosed,
    AdEventCallback? onAdWillDismissScreen,
    AdEventCallback? onAdImpression,
    OnPaidEventCallback? onPaidEvent,
    AdEventCallback? onAdClicked,
  }) =>
      BannerAdListener(
        onAdLoaded: onAdLoaded ?? _defaultOnLoaded,
        onAdFailedToLoad: onAdFailedToLoad ?? _defaultOnAdFailedToLoad,
        onAdOpened: onAdOpened ?? _defaultOnAdOpened,
        onAdClosed: onAdClosed ?? _defaultOnAdClosed,
        onAdWillDismissScreen: onAdWillDismissScreen,
        onAdImpression: onAdImpression ?? _defaultOnAdImpression,
        onPaidEvent: onPaidEvent,
        onAdClicked: onAdClicked,
      );

  void _defaultOnLoaded(_) => log.fine('Ad loaded.');

  void _defaultOnAdFailedToLoad(Ad ad, LoadAdError error) {
    ad.dispose();
    log.fine('Ad failed to load: $error');
  }

  void _defaultOnAdImpression(Ad ad) => log.fine('Ad impression.');

  void _defaultOnAdOpened(Ad ad) => log.fine('Ad opened.');

  void _defaultOnAdClosed(Ad ad) => log.fine('Ad closed.');
}
