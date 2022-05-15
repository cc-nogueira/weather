import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdInRowContainer extends StatefulWidget {
  const AdInRowContainer({Key? key, required this.ad, this.height}) : super(key: key);

  static const messages = ['Bolsoringa', 'Ta OK?', 'Bonossauro'];
  static final rand = Random(DateTime.now().millisecondsSinceEpoch);

  final BannerAd ad;
  final double? height;

  @override
  State<AdInRowContainer> createState() => _AdInRowContainerState();
}

class _AdInRowContainerState extends State<AdInRowContainer> {
  @override
  void didUpdateWidget(covariant AdInRowContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget != widget) {
      oldWidget.ad.dispose();
    }
  }

  @override
  void dispose() {
    widget.ad.dispose();
    super.dispose();
  }

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
            width: widget.ad.size.width.toDouble(),
            height: widget.height ?? widget.ad.size.height.toDouble(),
            child: isMobile
                ? AdWidget(ad: widget.ad)
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
                              AdInRowContainer.messages[
                                  AdInRowContainer.rand.nextInt(AdInRowContainer.messages.length)],
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
}
