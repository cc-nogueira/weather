import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logging/logging.dart';

import 'ad_unit_ids.dart';

/// AdState helper class.
///
/// This abstract class defines methods to help BannerAd creation.
abstract class AdState {
  /// Logger instance.
  final Logger log = Logger('adState');

  /// Ad initializationStatus
  late final InitializationStatus initializationStatus;

  /// Abstract init method.
  Future<InitializationStatus> init();

  /// Abstract createBannerAd method.
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

  /// Create the BannerAdListener with default values.
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

  /// Default onLoaded callback logs a message.
  void defaultOnLoaded(_) => log.fine('Ad loaded.');

  /// Default onAdFailedToLoad callback logs a message.
  void defaultOnAdFailedToLoad(Ad ad, LoadAdError error) => log.fine('Ad failed to load: $error');

  /// Default OnAdWillDismissScreen callback logs a message.
  void defaultOnAdWillDismissScreen(Ad ad) => log.fine('Ad will dismiss.');

  /// Default onAdImpression callback logs a message.
  void defaultOnAdImpression(Ad ad) => log.fine('Ad impression.');

  /// Default onAdOpened callback logs a message.
  void defaultOnAdOpened(Ad ad) => log.fine('Ad opened.');

  /// Default onAdClosed callback logs a message.
  void defaultOnAdClosed(Ad ad) => log.fine('Ad closed.');
}

/// FakeAdState extends AdState for platforms that do not support AdMob.
///
/// Creates a FakeBannerAd when requested.
class FakeAdState extends AdState {
  @override
  Future<InitializationStatus> init() {
    initializationStatus = InitializationStatus({});
    return SynchronousFuture(initializationStatus);
  }

  /// Creates a FakeBannerAd for platforms that do not support AdMob.
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

/// AdMobState extens AdState for real ads.
///
/// This class is instantiated with the platform specific AdUnitIds and a flag defining whether or
/// not to use a TestAdUnit.
class AdMobState extends AdState {
  /// Constructor.
  ///
  /// - requires the collection of AdUnitIds for the runtime platform.
  /// - requires a flag defining wheather or not to use the TestAdUnit ids in that collection.
  AdMobState({required this.adUnitIds, required this.useTestAdUnit});

  /// Collection of AdUnitIds for the runtime platform.
  final AdUnitIds adUnitIds;

  /// Flag defining the use of TestAdUnit ids
  final bool useTestAdUnit;

  /// Initialize MobileAds
  @override
  Future<InitializationStatus> init() async {
    initializationStatus = await MobileAds.instance.initialize();
    return initializationStatus;
  }

  /// Getter for the BannerAdUnitId considering the useTestAdUnit flag.
  String get bannerAdUnitId => useTestAdUnit ? adUnitIds.bannerTestId : adUnitIds.bannerId;

  /// Create a banner ad with default listener handlers.
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

  /// Redefines default onAdFailedToLoad to dispose the failing Ad.
  @override
  void defaultOnAdFailedToLoad(Ad ad, LoadAdError error) {
    ad.dispose();
    super.defaultOnAdFailedToLoad(ad, error);
  }
}

/// FakeBannerAd implements AdMob BannerAd.
///
/// This provides a Fake no actions implementation that only calls the onLoaded listener callback.
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

  /// Call onAdLoaded listener when load is called
  @override
  Future<void> load() async {
    Future.delayed(const Duration(milliseconds: 300), () => listener.onAdLoaded?.call(this));
  }
}
