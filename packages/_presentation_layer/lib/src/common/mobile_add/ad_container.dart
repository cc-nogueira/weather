import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdInRowContainer extends StatelessWidget {
  const AdInRowContainer({Key? key, required this.ad, this.height}) : super(key: key);

  static const messages = ['Bolsoringa', 'Ta OK?', 'Bonossauro'];
  static final rand = Random(DateTime.now().millisecondsSinceEpoch);

  final BannerAd ad;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Platform.isAndroid || Platform.isIOS;
    return Container(
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: ad.size.width.toDouble(),
            height: height ?? ad.size.height.toDouble(),
            child: isMobile
                ? AdWidget(ad: ad)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/image/brazil-grunge-flag.jpg',
                                package: '_presentation_layer'),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: FittedBox(
                            child: Text(
                              messages[rand.nextInt(messages.length)],
                              style: const TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          )
        ],
      ),
    );
  }

  void dispose() => ad.dispose();

  Future<void> load() => ad.load();
}
