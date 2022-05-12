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

  BannerAd createBunnerAd({void Function()? onAdLoaded, AdSize size = AdSize.banner}) => BannerAd(
        size: size,
        adUnitId: bannerAdUnitId,
        listener: listener(onAdLoaded: onAdLoaded),
        request: const AdRequest(),
      );

  String get bannerAdUnitId => Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/2934735716';

  BannerAdListener listener({void Function()? onAdLoaded}) => BannerAdListener(
        onAdLoaded: (Ad ad) {
          log.fine('Ad loaded.');
          onAdLoaded?.call();
        },

        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
          log.fine('Ad failed to load: $error');
        },

        onAdImpression: (Ad ad) => log.fine('Ad impression.'),

        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) => log.fine('Ad opened.'),

        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) => log.fine('Ad closed.'),
      );
}
