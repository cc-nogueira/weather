import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

/// AdInRowContainer StatefulWidget.
///
/// Presents a BannerAd inside a Row container.
/// Display a developer message in substitution if the platform does not support AdMob.
///
/// Disposes the BannerAd when this widget state is disposed.
class AdInRowContainer extends StatefulWidget {
  /// Constructor receives the BannerAd to be displayed.
  const AdInRowContainer({super.key, required this.ad, this.height});

  /// Banner ad instance
  final BannerAd ad;

  /// Optional fixed height
  final double? height;

  @override
  State<AdInRowContainer> createState() => _AdInRowContainerState();
}

class _AdInRowContainerState extends State<AdInRowContainer> {
  /// Dispose old widget ad when reusing this object.
  @override
  void didUpdateWidget(covariant AdInRowContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget != widget) {
      oldWidget.ad.dispose();
    }
  }

  /// Dispose widget ad on dispose event.
  @override
  void dispose() {
    widget.ad.dispose();
    super.dispose();
  }

  /// Display the widget ad in a row.
  /// Replaces that ad with a Desktop variation for platforms that do not suport AdMob.
  @override
  Widget build(BuildContext context) {
    final bool isMobile = Platform.isAndroid || Platform.isIOS;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: widget.ad.size.width.toDouble(),
          height: widget.height ?? widget.ad.size.height.toDouble(),
          child: isMobile ? AdWidget(ad: widget.ad) : const _DesktopAdWidget(),
        )
      ],
    );
  }
}

/// DesktopAd widget.
///
/// JDisplay a developer message for platforms that do not support AdMob.
/// Clicking on the Ad launches the system browser with the developers home page url.
class _DesktopAdWidget extends StatelessWidget {
  /// Const constructor.
  const _DesktopAdWidget();

  static final _hashBandDevUrl = Uri.parse('https://hash-bang.dev');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openHashBangUrl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          FittedBox(
            child: Text(
              '#!dev',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 40.0,
                fontFamily: 'Alice',
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 10),
          Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text(
              'software development',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: 'Alice',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openHashBangUrl() async {
    final canLaunch = await canLaunchUrl(_hashBandDevUrl);
    if (canLaunch) {
      await launchUrl(_hashBandDevUrl);
    }
  }
}
