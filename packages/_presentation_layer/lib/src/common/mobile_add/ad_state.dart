import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logging/logging.dart';

class FakeBannerAd implements BannerAd {
  FakeBannerAd({
    required this.size,
    required this.listener,
    required this.request,
    this.responseInfo,
  });

  @override
  AdSize size;

  @override
  final BannerAdListener listener;

  @override
  final AdRequest request;

  @override
  ResponseInfo? responseInfo;

  @override
  String get adUnitId => '';

  @override
  Future<void> dispose() async {}

  @override
  Future<AdSize?> getPlatformAdSize() {
    throw UnimplementedError();
  }

  @override
  Future<void> load() async {
    Future.delayed(const Duration(seconds: 1), () => listener.onAdLoaded?.call(this));
  }
}

abstract class AdState {
  final Logger log = Logger('adState');

  late final InitializationStatus initializationStatus;

  Future<InitializationStatus> init() async {
    initializationStatus = InitializationStatus({});
    return initializationStatus;
  }

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
  });

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
        onAdLoaded: onAdLoaded ?? defaultOnLoaded,
        onAdFailedToLoad: onAdFailedToLoad ?? defaultOnAdFailedToLoad,
        onAdOpened: onAdOpened ?? defaultOnAdOpened,
        onAdClosed: onAdClosed ?? defaultOnAdClosed,
        onAdWillDismissScreen: onAdWillDismissScreen ?? defaultOnAdWillDismissScreen,
        onAdImpression: onAdImpression ?? defaultOnAdImpression,
        onPaidEvent: onPaidEvent,
        onAdClicked: onAdClicked,
      );

  void defaultOnLoaded(_) => log.fine('Ad loaded.');

  void defaultOnAdFailedToLoad(Ad ad, LoadAdError error) => log.fine('Ad failed to load: $error');

  void defaultOnAdWillDismissScreen(Ad ad) => log.fine('Ad will dismiss.');

  void defaultOnAdImpression(Ad ad) => log.fine('Ad impression.');

  void defaultOnAdOpened(Ad ad) => log.fine('Ad opened.');

  void defaultOnAdClosed(Ad ad) => log.fine('Ad closed.');
}

class FakeAdState extends AdState {
  @override
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
  }) {
    return FakeBannerAd(
      size: size ?? AdSize.banner,
      listener: listener(onAdLoaded: onAdLoaded),
      request: const AdRequest(),
    );
  }
}

class MobileAdState extends AdState {
  MobileAdState();

  @override
  Future<InitializationStatus> init() async {
    initializationStatus = await MobileAds.instance.initialize();
    return initializationStatus;
  }

  String get bannerAdUnitId => Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/2934735716';

  @override
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

  @override
  void defaultOnAdFailedToLoad(Ad ad, LoadAdError error) {
    ad.dispose();
    super.defaultOnAdFailedToLoad(ad, error);
  }
}
