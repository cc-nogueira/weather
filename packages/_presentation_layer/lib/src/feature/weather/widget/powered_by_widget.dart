import 'package:flutter/material.dart';

class PoweredByWidget extends StatelessWidget {
  const PoweredByWidget({super.key});

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: const BoxDecoration(color: Colors.black87),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [PoweredByOpenWeather(), PoweredBySyncFusion()],
        ),
      );
}

class PoweredByOpenWeather extends _PoweredByBase {
  const PoweredByOpenWeather({super.key, super.width, super.height})
      : super(assetName: 'assets/image/open_weather_logo.png', text: 'weather forecast');
}

class PoweredBySyncFusion extends _PoweredByBase {
  const PoweredBySyncFusion({super.key, super.width, super.height})
      : super(assetName: 'assets/image/syncfusion_logo_150dpi.png', text: 'charts engine');
}

class _PoweredByBase extends StatelessWidget {
  const _PoweredByBase({
    super.key,
    required this.assetName,
    required this.text,
    double? width,
    double? height,
    Color? textColor,
  })  : width = width ?? 96.0,
        height = height ?? 32.0,
        textColor = textColor ?? Colors.white70;

  final double width;
  final double height;
  final String assetName;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: width,
            height: height,
            child: Image(
              fit: BoxFit.contain,
              alignment: Alignment.bottomCenter,
              image: AssetImage(assetName, package: '_presentation_layer'),
            ),
          ),
          SizedBox(
            height: 0.4 * height,
            child: FittedBox(
                child: Text(text, textAlign: TextAlign.end, style: TextStyle(color: textColor))),
          ),
        ],
      );
}
