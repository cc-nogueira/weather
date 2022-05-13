import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdInRowContainer extends StatelessWidget {
  const AdInRowContainer({Key? key, required this.ad, this.height}) : super(key: key);

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

  Future<void> load() => ad.load();
}
