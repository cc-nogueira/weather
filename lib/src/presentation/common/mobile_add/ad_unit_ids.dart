import 'package:meta/meta.dart';

/// Class to hold all AdUnit and AdTestUnit ids for a platform.
///
/// User code should subclass both the Android and IOs specializations to provide
/// his valid AdUnit Ids.
abstract class AdUnitIds {
  const AdUnitIds({
    required this.appOpenTestId,
    required this.bannerTestId,
    required this.interstitialTestId,
    required this.interstitialVideoTestId,
    required this.rewardedTestId,
    required this.rewardedInterstitialTestId,
    required this.nativeAdvancedTestId,
    required this.nativeAdvancedVideoTestId,
    String? appOpenId,
    String? bannerId,
    String? interstitialId,
    String? interstitialVideoId,
    String? rewardedId,
    String? rewardedInterstitialId,
    String? nativeAdvancedId,
    String? nativeAdvancedVideoId,
  })  : appOpenId = appOpenId ?? appOpenTestId,
        bannerId = bannerId ?? bannerTestId,
        interstitialId = interstitialId ?? interstitialTestId,
        interstitialVideoId = interstitialVideoId ?? interstitialVideoTestId,
        rewardedId = rewardedId ?? rewardedTestId,
        rewardedInterstitialId = rewardedInterstitialId ?? rewardedInterstitialTestId,
        nativeAdvancedId = nativeAdvancedId ?? nativeAdvancedTestId,
        nativeAdvancedVideoId = nativeAdvancedVideoId ?? nativeAdvancedVideoTestId;

  @nonVirtual
  final String appOpenId;

  @nonVirtual
  final String bannerId;

  @nonVirtual
  final String interstitialId;

  @nonVirtual
  final String interstitialVideoId;

  @nonVirtual
  final String rewardedId;

  @nonVirtual
  final String rewardedInterstitialId;

  @nonVirtual
  final String nativeAdvancedId;

  @nonVirtual
  final String nativeAdvancedVideoId;

  @nonVirtual
  final String appOpenTestId;

  @nonVirtual
  final String bannerTestId;

  @nonVirtual
  final String interstitialTestId;

  @nonVirtual
  final String interstitialVideoTestId;

  @nonVirtual
  final String rewardedTestId;

  @nonVirtual
  final String rewardedInterstitialTestId;

  @nonVirtual
  final String nativeAdvancedTestId;

  @nonVirtual
  final String nativeAdvancedVideoTestId;
}

/// Class to hold all AdUnit and AdTestUnit ids for Android platform.
///
/// User code should subclass this to provide valid Android AdUnit Ids inheriting AdTestUnit ids for
/// Android
class AndroidAdUnitIds extends AdUnitIds {
  const AndroidAdUnitIds({
    super.appOpenId,
    super.bannerId,
    super.interstitialId,
    super.interstitialVideoId,
    super.rewardedId,
    super.rewardedInterstitialId,
    super.nativeAdvancedId,
    super.nativeAdvancedVideoId,
  }) : super(
          appOpenTestId: 'ca-app-pub-3940256099942544/3419835294',
          bannerTestId: 'ca-app-pub-3940256099942544/6300978111',
          interstitialTestId: 'ca-app-pub-3940256099942544/1033173712',
          interstitialVideoTestId: 'ca-app-pub-3940256099942544/8691691433',
          rewardedTestId: 'ca-app-pub-3940256099942544/5224354917',
          rewardedInterstitialTestId: 'ca-app-pub-3940256099942544/5354046379',
          nativeAdvancedTestId: 'ca-app-pub-3940256099942544/2247696110',
          nativeAdvancedVideoTestId: 'ca-app-pub-3940256099942544/1044960115',
        );
}

/// Class to hold all AdUnit and AdTestUnit ids for IOS platform.
///
/// User code should subclass this to provide valid IOS AdUnit Ids inheriting AdTestUnit ids for
/// IOS.
class IosAdUnitIds extends AdUnitIds {
  const IosAdUnitIds({
    super.appOpenId,
    super.bannerId,
    super.interstitialId,
    super.interstitialVideoId,
    super.rewardedId,
    super.rewardedInterstitialId,
    super.nativeAdvancedId,
    super.nativeAdvancedVideoId,
  }) : super(
          appOpenTestId: 'ca-app-pub-3940256099942544/5662855259',
          bannerTestId: 'ca-app-pub-3940256099942544/2934735716',
          interstitialTestId: 'ca-app-pub-3940256099942544/4411468910',
          interstitialVideoTestId: 'ca-app-pub-3940256099942544/5135589807',
          rewardedTestId: 'ca-app-pub-3940256099942544/1712485313',
          rewardedInterstitialTestId: 'ca-app-pub-3940256099942544/6978759866',
          nativeAdvancedTestId: 'ca-app-pub-3940256099942544/3986624511',
          nativeAdvancedVideoTestId: 'ca-app-pub-3940256099942544/2521693316',
        );
}

/// Subclass of AdUnitIds with no IDs defined.
///
/// Used for platforms that do not support AdMob
class NoAdUnitIds extends AdUnitIds {
  NoAdUnitIds()
      : super(
          appOpenTestId: '',
          bannerTestId: '',
          interstitialTestId: '',
          interstitialVideoTestId: '',
          rewardedTestId: '',
          rewardedInterstitialTestId: '',
          nativeAdvancedTestId: '',
          nativeAdvancedVideoTestId: '',
        );
}
