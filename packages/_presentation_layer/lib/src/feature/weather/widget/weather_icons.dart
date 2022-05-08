import 'package:flutter/material.dart';

typedef PathBuilder = Path Function(Size size);
typedef WeatherIconBuilder = CustomPaint Function({required double size, required Color color});

class PathPainter extends CustomPainter {
  const PathPainter({required this.builder, required this.color});

  final Color color;
  final PathBuilder builder;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    canvas.drawPath(builder(size), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class WeatherIcons {
  WeatherIcons._();

  static late WeatherIcons instance = WeatherIcons._();

  static CustomPaint forOpenWeather({
    required int openWeatherCode,
    required double size,
    required bool? isDayTime,
    required Color color,
  }) {
    final idx = isDayTime == null ? 0 : (isDayTime ? 1 : 2);
    final builder = _openWeatherToBuilderMap[openWeatherCode]?.elementAt(idx) ?? instance.na;
    return builder(size: size, color: color);
  }

  static late final Map<int, List<WeatherIconBuilder>> _openWeatherToBuilderMap = {
    200: [instance.thunderstorm, instance.dayThunderstorm, instance.nightThunderstorm],
    201: [instance.thunderstorm, instance.dayThunderstorm, instance.nightThunderstorm],
    202: [instance.thunderstorm, instance.dayThunderstorm, instance.nightThunderstorm],
    210: [instance.lightning, instance.dayLightning, instance.nightLightning],
    211: [instance.lightning, instance.dayLightning, instance.nightLightning],
    212: [instance.lightning, instance.dayLightning, instance.nightLightning],
    221: [instance.lightning, instance.dayLightning, instance.nightLightning],
    230: [instance.thunderstorm, instance.dayThunderstorm, instance.nightThunderstorm],
    231: [instance.thunderstorm, instance.dayThunderstorm, instance.nightThunderstorm],
    232: [instance.thunderstorm, instance.dayThunderstorm, instance.nightThunderstorm],
    300: [instance.sprinkle, instance.daySprinkle, instance.nightSprinkle],
    301: [instance.sprinkle, instance.daySprinkle, instance.nightSprinkle],
    302: [instance.rain, instance.dayRain, instance.nightRain],
    310: [instance.rainMix, instance.dayRainMix, instance.nightRainMix],
    311: [instance.rain, instance.dayRain, instance.nightRain],
    312: [instance.rain, instance.dayRain, instance.nightRain],
    313: [instance.showers, instance.dayRain, instance.nightRain],
    314: [instance.rain, instance.dayRain, instance.nightRain],
    321: [instance.sprinkle, instance.daySprinkle, instance.nightSprinkle],
    500: [instance.sprinkle, instance.daySprinkle, instance.nightSprinkle],
    501: [instance.rain, instance.dayRain, instance.nightRain],
    502: [instance.rain, instance.dayRain, instance.nightRain],
    503: [instance.rain, instance.dayRain, instance.nightRain],
    504: [instance.rain, instance.dayRain, instance.nightRain],
    511: [instance.rainMix, instance.dayRainMix, instance.nightRainMix],
    520: [instance.showers, instance.dayShowers, instance.nightShowers],
    521: [instance.showers, instance.dayShowers, instance.nightShowers],
    522: [instance.showers, instance.dayShowers, instance.nightShowers],
    531: [instance.stormShowers, instance.dayStormShowers, instance.nightStormShowers],
    600: [instance.snow, instance.daySnow, instance.nightSnow],
    601: [instance.sleet, instance.daySleet, instance.nightSleet],
    602: [instance.snow, instance.daySnow, instance.nightSnow],
    611: [instance.rainMix, instance.dayRainMix, instance.nightRainMix],
    612: [instance.rainMix, instance.dayRainMix, instance.nightRainMix],
    615: [instance.rainMix, instance.dayRainMix, instance.nightRainMix],
    616: [instance.rainMix, instance.dayRainMix, instance.nightRainMix],
    620: [instance.rainMix, instance.dayRainMix, instance.nightRainMix],
    621: [instance.snow, instance.daySnow, instance.nightSnow],
    622: [instance.snow, instance.daySnow, instance.nightSnow],
    701: [instance.showers, instance.dayShowers, instance.nightShowers],
    711: [instance.smoke, instance.smoke, instance.smoke],
    721: [instance.dayHaze, instance.dayHaze, instance.dayHaze],
    731: [instance.dust, instance.dust, instance.dust],
    741: [instance.fog, instance.dayFog, instance.nightFog],
    751: [instance.cloudyGusts, instance.dayCloudyGusts, instance.nightCloudyGusts],
    761: [instance.dust, instance.dust, instance.dust],
    762: [instance.dust, instance.dust, instance.dust],
    771: [instance.cloudyGusts, instance.dayCloudyGusts, instance.nightCloudyGusts],
    781: [instance.tornado, instance.tornado, instance.tornado],
    800: [instance.daySunny, instance.daySunny, instance.nightClear],
    801: [instance.cloudyGusts, instance.dayCloudyGusts, instance.nightCloudyGusts],
    802: [instance.cloudyGusts, instance.dayCloudyGusts, instance.nightCloudyGusts],
    803: [instance.cloudyGusts, instance.dayCloudyGusts, instance.nightCloudyGusts],
    804: [instance.cloudy, instance.daySunnyOvercast, instance.nightCloudy],
    900: [instance.tornado, instance.tornado, instance.tornado],
    901: [instance.stormShowers, instance.dayStormShowers, instance.nightStormShowers],
    902: [instance.hurricane, instance.hurricane, instance.hurricane],
    903: [instance.snowflakeCold, instance.snowflakeCold, instance.snowflakeCold],
    904: [instance.hot, instance.hot, instance.hot],
    905: [instance.windy, instance.windy, instance.windy],
    906: [instance.hail, instance.dayHail, instance.nightHail],
    951: [instance.daySunny, instance.daySunny, instance.nightClear],
    952: [instance.cloudyGusts, instance.dayCloudyGusts, instance.nightCloudyGusts],
    953: [instance.cloudyGusts, instance.dayCloudyGusts, instance.nightCloudyGusts],
    954: [instance.cloudyGusts, instance.dayCloudyGusts, instance.nightCloudyGusts],
    955: [instance.cloudyGusts, instance.dayCloudyGusts, instance.nightCloudyGusts],
    956: [instance.cloudyGusts, instance.dayCloudyGusts, instance.nightCloudyGusts],
    957: [instance.strongWind, instance.strongWind, instance.strongWind],
    958: [instance.cloudyGusts, instance.dayCloudyGusts, instance.nightCloudyGusts],
    959: [instance.cloudyGusts, instance.dayCloudyGusts, instance.nightCloudyGusts],
    960: [instance.thunderstorm, instance.dayThunderstorm, instance.nightThunderstorm],
    961: [instance.thunderstorm, instance.dayThunderstorm, instance.nightThunderstorm],
    962: [instance.cloudyGusts, instance.dayCloudyGusts, instance.nightCloudyGusts],
  };

  CustomPaint cloudy({required double size, required Color color}) =>
      _customPaint(_cloudyPath, size, color);

  CustomPaint cloudyGusts({required double size, required Color color}) =>
      _customPaint(_cloudyGustsPath, size, color);

  CustomPaint dayCloudy({required double size, required Color color}) =>
      _customPaint(_dayCloudyPath, size, color);

  CustomPaint dayCloudyGusts({required double size, required Color color}) =>
      _customPaint(_dayCloudyGustsPath, size, color);

  CustomPaint dayFog({required double size, required Color color}) =>
      _customPaint(_dayFogPath, size, color);

  CustomPaint dayHail({required double size, required Color color}) =>
      _customPaint(_dayHailPath, size, color);

  CustomPaint dayHaze({required double size, required Color color}) =>
      _customPaint(_dayHazePath, size, color);

  CustomPaint dayLightning({required double size, required Color color}) =>
      _customPaint(_dayLightningPath, size, color);

  CustomPaint dayRain({required double size, required Color color}) =>
      _customPaint(_dayRainPath, size, color);

  CustomPaint dayRainMix({required double size, required Color color}) =>
      _customPaint(_dayRainMixPath, size, color);

  CustomPaint dayShowers({required double size, required Color color}) =>
      _customPaint(_dayShowersPath, size, color);

  CustomPaint daySleet({required double size, required Color color}) =>
      _customPaint(_daySleetPath, size, color);

  CustomPaint daySnow({required double size, required Color color}) =>
      _customPaint(_daySnowPath, size, color);

  CustomPaint daySprinkle({required double size, required Color color}) =>
      _customPaint(_daySprinklePath, size, color);

  CustomPaint dayStormShowers({required double size, required Color color}) =>
      _customPaint(_dayStormShowersPath, size, color);

  CustomPaint daySunny({required double size, required Color color}) =>
      _customPaint(_daySunnyPath, size, color);

  CustomPaint daySunnyOvercast({required double size, required Color color}) =>
      _customPaint(_daySunnyOvercastPath, size, color);

  CustomPaint dayThunderstorm({required double size, required Color color}) =>
      _customPaint(_dayThunderstormPath, size, color);

  CustomPaint dust({required double size, required Color color}) =>
      _customPaint(_dustPath, size, color);

  CustomPaint fog({required double size, required Color color}) =>
      _customPaint(_fogPath, size, color);

  CustomPaint hail({required double size, required Color color}) =>
      _customPaint(_hailPath, size, color);

  CustomPaint hot({required double size, required Color color}) =>
      _customPaint(_hotPath, size, color);

  CustomPaint hurricane({required double size, required Color color}) =>
      _customPaint(_hurricanePath, size, color);

  CustomPaint lightning({required double size, required Color color}) =>
      _customPaint(_lightningPath, size, color);

  CustomPaint na({required double size, required Color color}) =>
      _customPaint(_naPath, size, color);

  CustomPaint nightCloudy({required double size, required Color color}) =>
      _customPaint(_nightCloudyPath, size, color);

  CustomPaint nightCloudyGusts({required double size, required Color color}) =>
      _customPaint(_nightCloudyGustsPath, size, color);

  CustomPaint nightHail({required double size, required Color color}) =>
      _customPaint(_nightHailPath, size, color);

  CustomPaint nightLightning({required double size, required Color color}) =>
      _customPaint(_nightLightningPath, size, color);

  CustomPaint nightRain({required double size, required Color color}) =>
      _customPaint(_nightRainPath, size, color);

  CustomPaint nightRainMix({required double size, required Color color}) =>
      _customPaint(_nightRainMixPath, size, color);

  CustomPaint nightShowers({required double size, required Color color}) =>
      _customPaint(_nightShowersPath, size, color);

  CustomPaint nightSleet({required double size, required Color color}) =>
      _customPaint(_nightSleetPath, size, color);

  CustomPaint nightSnow({required double size, required Color color}) =>
      _customPaint(_nightSnowPath, size, color);

  CustomPaint nightSprinkle({required double size, required Color color}) =>
      _customPaint(_nightSprinklePath, size, color);

  CustomPaint nightStormShowers({required double size, required Color color}) =>
      _customPaint(_nightStormShowersPath, size, color);

  CustomPaint nightThunderstorm({required double size, required Color color}) =>
      _customPaint(_nightThunderstormPath, size, color);

  CustomPaint nightClear({required double size, required Color color}) =>
      _customPaint(_nightClearPath, size, color);

  CustomPaint nightFog({required double size, required Color color}) =>
      _customPaint(_nightFogPath, size, color);

  CustomPaint rain({required double size, required Color color}) =>
      _customPaint(_rainPath, size, color);

  CustomPaint rainMix({required double size, required Color color}) =>
      _customPaint(_rainMixPath, size, color);

  CustomPaint showers({required double size, required Color color}) =>
      _customPaint(_showersPath, size, color);

  CustomPaint sleet({required double size, required Color color}) =>
      _customPaint(_sleetPath, size, color);

  CustomPaint smoke({required double size, required Color color}) =>
      _customPaint(_smokePath, size, color);

  CustomPaint snow({required double size, required Color color}) =>
      _customPaint(_snowPath, size, color);

  CustomPaint snowflakeCold({required double size, required Color color}) =>
      _customPaint(_snowflakeColdPath, size, color);

  CustomPaint sprinkle({required double size, required Color color}) =>
      _customPaint(_sprinklePath, size, color);

  CustomPaint stormShowers({required double size, required Color color}) =>
      _customPaint(_stormShowersPath, size, color);

  CustomPaint strongWind({required double size, required Color color}) =>
      _customPaint(_strongWindPath, size, color);

  CustomPaint thermometer({required double size, required Color color}) =>
      _customPaint(_thermometerPath, size, color);

  CustomPaint thunderstorm({required double size, required Color color}) =>
      _customPaint(_thunderstormPath, size, color);

  CustomPaint tornado({required double size, required Color color}) =>
      _customPaint(_tornadoPath, size, color);

  CustomPaint windDeg({required double size, required Color color}) =>
      _customPaint(_windDegPath, size, color);

  CustomPaint windy({required double size, required Color color}) =>
      _customPaint(_windyPath, size, color);

// ------------------------

  CustomPaint _customPaint(PathBuilder builder, double size, Color color) =>
      CustomPaint(size: Size(size, size), painter: PathPainter(builder: builder, color: color));

  Path _cloudyPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1296667, size.height * 0.5866667)
      ..cubicTo(size.width * 0.1296667, size.height * 0.5536667, size.width * 0.1400000,
          size.height * 0.5240000, size.width * 0.1606667, size.height * 0.4983333)
      ..cubicTo(size.width * 0.1813333, size.height * 0.4726667, size.width * 0.2076667,
          size.height * 0.4560000, size.width * 0.2400000, size.height * 0.4486667)
      ..cubicTo(size.width * 0.2486667, size.height * 0.4096667, size.width * 0.2683333,
          size.height * 0.3773333, size.width * 0.2993333, size.height * 0.3526667)
      ..cubicTo(size.width * 0.3303333, size.height * 0.3276667, size.width * 0.3660000,
          size.height * 0.3153333, size.width * 0.4066667, size.height * 0.3153333)
      ..cubicTo(size.width * 0.4460000, size.height * 0.3153333, size.width * 0.4813333,
          size.height * 0.3273333, size.width * 0.5120000, size.height * 0.3516667)
      ..cubicTo(size.width * 0.5430000, size.height * 0.3760000, size.width * 0.5630000,
          size.height * 0.4070000, size.width * 0.5720000, size.height * 0.4450000)
      ..lineTo(size.width * 0.5810000, size.height * 0.4450000)
      ..cubicTo(size.width * 0.6203333, size.height * 0.4450000, size.width * 0.6536667,
          size.height * 0.4586667, size.width * 0.6813333, size.height * 0.4863333)
      ..cubicTo(size.width * 0.7090000, size.height * 0.5140000, size.width * 0.7230000,
          size.height * 0.5473333, size.width * 0.7230000, size.height * 0.5863333)
      ..cubicTo(size.width * 0.7230000, size.height * 0.6256667, size.width * 0.7090000,
          size.height * 0.6590000, size.width * 0.6813333, size.height * 0.6866667)
      ..cubicTo(size.width * 0.6536667, size.height * 0.7143333, size.width * 0.6203333,
          size.height * 0.7283333, size.width * 0.5810000, size.height * 0.7283333)
      ..lineTo(size.width * 0.2720000, size.height * 0.7283333)
      ..cubicTo(size.width * 0.2526667, size.height * 0.7283333, size.width * 0.2343333,
          size.height * 0.7246667, size.width * 0.2170000, size.height * 0.7170000)
      ..cubicTo(size.width * 0.1996667, size.height * 0.7093333, size.width * 0.1840000,
          size.height * 0.7000000, size.width * 0.1713333, size.height * 0.6873333)
      ..cubicTo(size.width * 0.1586667, size.height * 0.6746667, size.width * 0.1486667,
          size.height * 0.6593333, size.width * 0.1410000, size.height * 0.6420000)
      ..cubicTo(size.width * 0.1333333, size.height * 0.6246667, size.width * 0.1296667,
          size.height * 0.6056667, size.width * 0.1296667, size.height * 0.5866667)
      ..close()
      ..moveTo(size.width * 0.1780000, size.height * 0.5866667)
      ..cubicTo(size.width * 0.1780000, size.height * 0.6120000, size.width * 0.1873333,
          size.height * 0.6340000, size.width * 0.2053333, size.height * 0.6520000)
      ..cubicTo(size.width * 0.2233333, size.height * 0.6700000, size.width * 0.2456667,
          size.height * 0.6793333, size.width * 0.2716667, size.height * 0.6793333)
      ..lineTo(size.width * 0.5810000, size.height * 0.6793333)
      ..cubicTo(size.width * 0.6066667, size.height * 0.6793333, size.width * 0.6290000,
          size.height * 0.6703333, size.width * 0.6473333, size.height * 0.6520000)
      ..cubicTo(size.width * 0.6656667, size.height * 0.6336667, size.width * 0.6750000,
          size.height * 0.6120000, size.width * 0.6750000, size.height * 0.5866667)
      ..cubicTo(size.width * 0.6750000, size.height * 0.5613333, size.width * 0.6660000,
          size.height * 0.5393333, size.width * 0.6473333, size.height * 0.5213333)
      ..cubicTo(size.width * 0.6290000, size.height * 0.5033333, size.width * 0.6070000,
          size.height * 0.4940000, size.width * 0.5810000, size.height * 0.4940000)
      ..lineTo(size.width * 0.5346667, size.height * 0.4940000)
      ..cubicTo(size.width * 0.5313333, size.height * 0.4940000, size.width * 0.5296667,
          size.height * 0.4923333, size.width * 0.5296667, size.height * 0.4890000)
      ..lineTo(size.width * 0.5273333, size.height * 0.4726667)
      ..cubicTo(size.width * 0.5240000, size.height * 0.4413333, size.width * 0.5106667,
          size.height * 0.4150000, size.width * 0.4876667, size.height * 0.3943333)
      ..cubicTo(size.width * 0.4646667, size.height * 0.3736667, size.width * 0.4373333,
          size.height * 0.3633333, size.width * 0.4060000, size.height * 0.3633333)
      ..cubicTo(size.width * 0.3746667, size.height * 0.3633333, size.width * 0.3473333,
          size.height * 0.3736667, size.width * 0.3240000, size.height * 0.3946667)
      ..cubicTo(size.width * 0.3006667, size.height * 0.4153333, size.width * 0.2876667,
          size.height * 0.4416667, size.width * 0.2846667, size.height * 0.4726667)
      ..lineTo(size.width * 0.2823333, size.height * 0.4866667)
      ..cubicTo(size.width * 0.2823333, size.height * 0.4900000, size.width * 0.2806667,
          size.height * 0.4916667, size.width * 0.2770000, size.height * 0.4916667)
      ..lineTo(size.width * 0.2620000, size.height * 0.4940000)
      ..cubicTo(size.width * 0.2380000, size.height * 0.4960000, size.width * 0.2180000,
          size.height * 0.5060000, size.width * 0.2016667, size.height * 0.5236667)
      ..cubicTo(size.width * 0.1863333, size.height * 0.5413333, size.width * 0.1780000,
          size.height * 0.5623333, size.width * 0.1780000, size.height * 0.5866667)
      ..close()
      ..moveTo(size.width * 0.4730000, size.height * 0.2960000)
      ..cubicTo(size.width * 0.4696667, size.height * 0.2990000, size.width * 0.4703333,
          size.height * 0.3013333, size.width * 0.4753333, size.height * 0.3030000)
      ..cubicTo(size.width * 0.4896667, size.height * 0.3093333, size.width * 0.5016667,
          size.height * 0.3153333, size.width * 0.5113333, size.height * 0.3213333)
      ..cubicTo(size.width * 0.5150000, size.height * 0.3223333, size.width * 0.5176667,
          size.height * 0.3220000, size.width * 0.5186667, size.height * 0.3203333)
      ..cubicTo(size.width * 0.5390000, size.height * 0.3013333, size.width * 0.5623333,
          size.height * 0.2916667, size.width * 0.5893333, size.height * 0.2916667)
      ..cubicTo(size.width * 0.6163333, size.height * 0.2916667, size.width * 0.6393333,
          size.height * 0.3006667, size.width * 0.6593333, size.height * 0.3186667)
      ..cubicTo(size.width * 0.6790000, size.height * 0.3366667, size.width * 0.6900000,
          size.height * 0.3590000, size.width * 0.6923333, size.height * 0.3853333)
      ..lineTo(size.width * 0.6953333, size.height * 0.4066667)
      ..lineTo(size.width * 0.7426667, size.height * 0.4066667)
      ..cubicTo(size.width * 0.7643333, size.height * 0.4066667, size.width * 0.7830000,
          size.height * 0.4143333, size.width * 0.7986667, size.height * 0.4300000)
      ..cubicTo(size.width * 0.8143333, size.height * 0.4456667, size.width * 0.8220000,
          size.height * 0.4640000, size.width * 0.8220000, size.height * 0.4853333)
      ..cubicTo(size.width * 0.8220000, size.height * 0.5053333, size.width * 0.8150000,
          size.height * 0.5226667, size.width * 0.8013333, size.height * 0.5376667)
      ..cubicTo(size.width * 0.7876667, size.height * 0.5526667, size.width * 0.7706667,
          size.height * 0.5610000, size.width * 0.7503333, size.height * 0.5633333)
      ..cubicTo(size.width * 0.7470000, size.height * 0.5633333, size.width * 0.7453333,
          size.height * 0.5650000, size.width * 0.7453333, size.height * 0.5686667)
      ..lineTo(size.width * 0.7453333, size.height * 0.6063333)
      ..cubicTo(size.width * 0.7453333, size.height * 0.6100000, size.width * 0.7470000,
          size.height * 0.6116667, size.width * 0.7503333, size.height * 0.6116667)
      ..cubicTo(size.width * 0.7840000, size.height * 0.6096667, size.width * 0.8123333,
          size.height * 0.5963333, size.width * 0.8353333, size.height * 0.5720000)
      ..cubicTo(size.width * 0.8583333, size.height * 0.5476667, size.width * 0.8700000,
          size.height * 0.5186667, size.width * 0.8700000, size.height * 0.4853333)
      ..cubicTo(size.width * 0.8700000, size.height * 0.4500000, size.width * 0.8576667,
          size.height * 0.4200000, size.width * 0.8326667, size.height * 0.3953333)
      ..cubicTo(size.width * 0.8076667, size.height * 0.3703333, size.width * 0.7776667,
          size.height * 0.3580000, size.width * 0.7426667, size.height * 0.3580000)
      ..lineTo(size.width * 0.7376667, size.height * 0.3580000)
      ..cubicTo(size.width * 0.7290000, size.height * 0.3246667, size.width * 0.7106667,
          size.height * 0.2973333, size.width * 0.6826667, size.height * 0.2756667)
      ..cubicTo(size.width * 0.6550000, size.height * 0.2540000, size.width * 0.6236667,
          size.height * 0.2433333, size.width * 0.5893333, size.height * 0.2433333)
      ..cubicTo(size.width * 0.5426667, size.height * 0.2430000, size.width * 0.5036667,
          size.height * 0.2606667, size.width * 0.4730000, size.height * 0.2960000)
      ..close();
  }

  Path _cloudyGustsPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1206667, size.height * 0.7003333)
      ..cubicTo(size.width * 0.1206667, size.height * 0.6920000, size.width * 0.1233333,
          size.height * 0.6850000, size.width * 0.1290000, size.height * 0.6793333)
      ..cubicTo(size.width * 0.1346667, size.height * 0.6740000, size.width * 0.1413333,
          size.height * 0.6713333, size.width * 0.1490000, size.height * 0.6713333)
      ..lineTo(size.width * 0.3296667, size.height * 0.6713333)
      ..cubicTo(size.width * 0.3543333, size.height * 0.6713333, size.width * 0.3753333,
          size.height * 0.6800000, size.width * 0.3926667, size.height * 0.6976667)
      ..cubicTo(size.width * 0.4100000, size.height * 0.7153333, size.width * 0.4186667,
          size.height * 0.7363333, size.width * 0.4186667, size.height * 0.7610000)
      ..cubicTo(size.width * 0.4186667, size.height * 0.7856667, size.width * 0.4100000,
          size.height * 0.8070000, size.width * 0.3926667, size.height * 0.8243333)
      ..cubicTo(size.width * 0.3753333, size.height * 0.8416667, size.width * 0.3543333,
          size.height * 0.8503333, size.width * 0.3296667, size.height * 0.8503333)
      ..cubicTo(size.width * 0.3050000, size.height * 0.8503333, size.width * 0.2836667,
          size.height * 0.8416667, size.width * 0.2663333, size.height * 0.8240000)
      ..cubicTo(size.width * 0.2610000, size.height * 0.8186667, size.width * 0.2586667,
          size.height * 0.8120000, size.width * 0.2586667, size.height * 0.8040000)
      ..cubicTo(size.width * 0.2586667, size.height * 0.7960000, size.width * 0.2613333,
          size.height * 0.7890000, size.width * 0.2663333, size.height * 0.7840000)
      ..cubicTo(size.width * 0.2713333, size.height * 0.7786667, size.width * 0.2780000,
          size.height * 0.7760000, size.width * 0.2863333, size.height * 0.7760000)
      ..cubicTo(size.width * 0.2940000, size.height * 0.7760000, size.width * 0.3006667,
          size.height * 0.7786667, size.width * 0.3066667, size.height * 0.7840000)
      ..cubicTo(size.width * 0.3133333, size.height * 0.7903333, size.width * 0.3210000,
          size.height * 0.7936667, size.width * 0.3296667, size.height * 0.7936667)
      ..cubicTo(size.width * 0.3383333, size.height * 0.7936667, size.width * 0.3460000,
          size.height * 0.7903333, size.width * 0.3523333, size.height * 0.7840000)
      ..cubicTo(size.width * 0.3586667, size.height * 0.7776667, size.width * 0.3620000,
          size.height * 0.7700000, size.width * 0.3620000, size.height * 0.7606667)
      ..cubicTo(size.width * 0.3620000, size.height * 0.7520000, size.width * 0.3586667,
          size.height * 0.7443333, size.width * 0.3523333, size.height * 0.7380000)
      ..cubicTo(size.width * 0.3460000, size.height * 0.7316667, size.width * 0.3383333,
          size.height * 0.7283333, size.width * 0.3296667, size.height * 0.7283333)
      ..lineTo(size.width * 0.1490000, size.height * 0.7283333)
      ..cubicTo(size.width * 0.1413333, size.height * 0.7283333, size.width * 0.1346667,
          size.height * 0.7256667, size.width * 0.1290000, size.height * 0.7200000)
      ..cubicTo(size.width * 0.1233333, size.height * 0.7143333, size.width * 0.1206667,
          size.height * 0.7083333, size.width * 0.1206667, size.height * 0.7003333)
      ..close()
      ..moveTo(size.width * 0.1206667, size.height * 0.5990000)
      ..cubicTo(size.width * 0.1206667, size.height * 0.5910000, size.width * 0.1233333,
          size.height * 0.5840000, size.width * 0.1290000, size.height * 0.5783333)
      ..cubicTo(size.width * 0.1346667, size.height * 0.5730000, size.width * 0.1413333,
          size.height * 0.5703333, size.width * 0.1490000, size.height * 0.5703333)
      ..lineTo(size.width * 0.5006667, size.height * 0.5703333)
      ..cubicTo(size.width * 0.5093333, size.height * 0.5703333, size.width * 0.5170000,
          size.height * 0.5670000, size.width * 0.5233333, size.height * 0.5606667)
      ..cubicTo(size.width * 0.5296667, size.height * 0.5543333, size.width * 0.5330000,
          size.height * 0.5463333, size.width * 0.5330000, size.height * 0.5376667)
      ..cubicTo(size.width * 0.5330000, size.height * 0.5290000, size.width * 0.5296667,
          size.height * 0.5210000, size.width * 0.5233333, size.height * 0.5146667)
      ..cubicTo(size.width * 0.5170000, size.height * 0.5083333, size.width * 0.5093333,
          size.height * 0.5050000, size.width * 0.5006667, size.height * 0.5050000)
      ..cubicTo(size.width * 0.4913333, size.height * 0.5050000, size.width * 0.4840000,
          size.height * 0.5080000, size.width * 0.4780000, size.height * 0.5143333)
      ..cubicTo(size.width * 0.4720000, size.height * 0.5193333, size.width * 0.4650000,
          size.height * 0.5220000, size.width * 0.4566667, size.height * 0.5220000)
      ..cubicTo(size.width * 0.4486667, size.height * 0.5220000, size.width * 0.4420000,
          size.height * 0.5193333, size.width * 0.4366667, size.height * 0.5143333)
      ..cubicTo(size.width * 0.4316667, size.height * 0.5093333, size.width * 0.4290000,
          size.height * 0.5026667, size.width * 0.4290000, size.height * 0.4943333)
      ..cubicTo(size.width * 0.4290000, size.height * 0.4860000, size.width * 0.4313333,
          size.height * 0.4793333, size.width * 0.4366667, size.height * 0.4740000)
      ..cubicTo(size.width * 0.4536667, size.height * 0.4570000, size.width * 0.4750000,
          size.height * 0.4486667, size.width * 0.5006667, size.height * 0.4486667)
      ..cubicTo(size.width * 0.5253333, size.height * 0.4486667, size.width * 0.5466667,
          size.height * 0.4573333, size.width * 0.5640000, size.height * 0.4746667)
      ..cubicTo(size.width * 0.5813333, size.height * 0.4920000, size.width * 0.5900000,
          size.height * 0.5130000, size.width * 0.5900000, size.height * 0.5373333)
      ..cubicTo(size.width * 0.5900000, size.height * 0.5616667, size.width * 0.5813333,
          size.height * 0.5830000, size.width * 0.5640000, size.height * 0.6003333)
      ..cubicTo(size.width * 0.5466667, size.height * 0.6176667, size.width * 0.5256667,
          size.height * 0.6263333, size.width * 0.5006667, size.height * 0.6263333)
      ..lineTo(size.width * 0.1490000, size.height * 0.6263333)
      ..cubicTo(size.width * 0.1410000, size.height * 0.6263333, size.width * 0.1343333,
          size.height * 0.6236667, size.width * 0.1290000, size.height * 0.6183333)
      ..cubicTo(size.width * 0.1233333, size.height * 0.6133333, size.width * 0.1206667,
          size.height * 0.6066667, size.width * 0.1206667, size.height * 0.5990000)
      ..close()
      ..moveTo(size.width * 0.1923333, size.height * 0.5203333)
      ..cubicTo(size.width * 0.1923333, size.height * 0.5230000, size.width * 0.1940000,
          size.height * 0.5243333, size.width * 0.1976667, size.height * 0.5243333)
      ..lineTo(size.width * 0.2456667, size.height * 0.5243333)
      ..cubicTo(size.width * 0.2483333, size.height * 0.5243333, size.width * 0.2506667,
          size.height * 0.5226667, size.width * 0.2530000, size.height * 0.5193333)
      ..cubicTo(size.width * 0.2603333, size.height * 0.5013333, size.width * 0.2723333,
          size.height * 0.4863333, size.width * 0.2880000, size.height * 0.4743333)
      ..cubicTo(size.width * 0.3040000, size.height * 0.4623333, size.width * 0.3216667,
          size.height * 0.4556667, size.width * 0.3410000, size.height * 0.4543333)
      ..lineTo(size.width * 0.3586667, size.height * 0.4516667)
      ..cubicTo(size.width * 0.3630000, size.height * 0.4516667, size.width * 0.3653333,
          size.height * 0.4496667, size.width * 0.3653333, size.height * 0.4460000)
      ..lineTo(size.width * 0.3676667, size.height * 0.4286667)
      ..cubicTo(size.width * 0.3713333, size.height * 0.3926667, size.width * 0.3863333,
          size.height * 0.3623333, size.width * 0.4133333, size.height * 0.3380000)
      ..cubicTo(size.width * 0.4403333, size.height * 0.3136667, size.width * 0.4720000,
          size.height * 0.3013333, size.width * 0.5086667, size.height * 0.3013333)
      ..cubicTo(size.width * 0.5456667, size.height * 0.3013333, size.width * 0.5776667,
          size.height * 0.3133333, size.width * 0.6046667, size.height * 0.3376667)
      ..cubicTo(size.width * 0.6316667, size.height * 0.3620000, size.width * 0.6470000,
          size.height * 0.3923333, size.width * 0.6510000, size.height * 0.4286667)
      ..lineTo(size.width * 0.6533333, size.height * 0.4483333)
      ..cubicTo(size.width * 0.6533333, size.height * 0.4520000, size.width * 0.6553333,
          size.height * 0.4540000, size.width * 0.6590000, size.height * 0.4540000)
      ..lineTo(size.width * 0.7130000, size.height * 0.4540000)
      ..cubicTo(size.width * 0.7433333, size.height * 0.4540000, size.width * 0.7690000,
          size.height * 0.4646667, size.width * 0.7906667, size.height * 0.4860000)
      ..cubicTo(size.width * 0.8123333, size.height * 0.5073333, size.width * 0.8230000,
          size.height * 0.5326667, size.width * 0.8230000, size.height * 0.5626667)
      ..cubicTo(size.width * 0.8230000, size.height * 0.5923333, size.width * 0.8123333,
          size.height * 0.6180000, size.width * 0.7906667, size.height * 0.6393333)
      ..cubicTo(size.width * 0.7690000, size.height * 0.6606667, size.width * 0.7433333,
          size.height * 0.6713333, size.width * 0.7130000, size.height * 0.6713333)
      ..lineTo(size.width * 0.4826667, size.height * 0.6713333)
      ..cubicTo(size.width * 0.4786667, size.height * 0.6713333, size.width * 0.4763333,
          size.height * 0.6733333, size.width * 0.4763333, size.height * 0.6770000)
      ..lineTo(size.width * 0.4763333, size.height * 0.7233333)
      ..cubicTo(size.width * 0.4763333, size.height * 0.7270000, size.width * 0.4783333,
          size.height * 0.7290000, size.width * 0.4826667, size.height * 0.7290000)
      ..lineTo(size.width * 0.7130000, size.height * 0.7290000)
      ..cubicTo(size.width * 0.7433333, size.height * 0.7290000, size.width * 0.7710000,
          size.height * 0.7216667, size.width * 0.7966667, size.height * 0.7066667)
      ..cubicTo(size.width * 0.8223333, size.height * 0.6920000, size.width * 0.8423333,
          size.height * 0.6716667, size.width * 0.8573333, size.height * 0.6463333)
      ..cubicTo(size.width * 0.8723333, size.height * 0.6206667, size.width * 0.8796667,
          size.height * 0.5930000, size.width * 0.8796667, size.height * 0.5630000)
      ..cubicTo(size.width * 0.8796667, size.height * 0.5326667, size.width * 0.8723333,
          size.height * 0.5050000, size.width * 0.8573333, size.height * 0.4796667)
      ..cubicTo(size.width * 0.8423333, size.height * 0.4543333, size.width * 0.8223333,
          size.height * 0.4340000, size.width * 0.7966667, size.height * 0.4193333)
      ..cubicTo(size.width * 0.7710000, size.height * 0.4046667, size.width * 0.7433333,
          size.height * 0.3970000, size.width * 0.7130000, size.height * 0.3970000)
      ..lineTo(size.width * 0.7026667, size.height * 0.3970000)
      ..cubicTo(size.width * 0.6923333, size.height * 0.3526667, size.width * 0.6690000,
          size.height * 0.3163333, size.width * 0.6326667, size.height * 0.2880000)
      ..cubicTo(size.width * 0.5966667, size.height * 0.2596667, size.width * 0.5550000,
          size.height * 0.2456667, size.width * 0.5083333, size.height * 0.2456667)
      ..cubicTo(size.width * 0.4613333, size.height * 0.2456667, size.width * 0.4196667,
          size.height * 0.2603333, size.width * 0.3833333, size.height * 0.2896667)
      ..cubicTo(size.width * 0.3470000, size.height * 0.3190000, size.width * 0.3240000,
          size.height * 0.3563333, size.width * 0.3143333, size.height * 0.4020000)
      ..cubicTo(size.width * 0.2856667, size.height * 0.4086667, size.width * 0.2603333,
          size.height * 0.4223333, size.width * 0.2383333, size.height * 0.4430000)
      ..cubicTo(size.width * 0.2163333, size.height * 0.4636667, size.width * 0.2010000,
          size.height * 0.4883333, size.width * 0.1923333, size.height * 0.5166667)
      ..lineTo(size.width * 0.1923333, size.height * 0.5180000)
      ..cubicTo(size.width * 0.1923333, size.height * 0.5186667, size.width * 0.1923333,
          size.height * 0.5193333, size.width * 0.1923333, size.height * 0.5203333)
      ..close();
  }

  Path _dayCloudyPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.05200000, size.height * 0.5633333)
      ..cubicTo(size.width * 0.05200000, size.height * 0.5933333, size.width * 0.05933333,
          size.height * 0.6210000, size.width * 0.07400000, size.height * 0.6463333)
      ..cubicTo(size.width * 0.08866667, size.height * 0.6716667, size.width * 0.1086667,
          size.height * 0.6916667, size.width * 0.1340000, size.height * 0.7063333)
      ..cubicTo(size.width * 0.1593333, size.height * 0.7210000, size.width * 0.1866667,
          size.height * 0.7283333, size.width * 0.2163333, size.height * 0.7283333)
      ..lineTo(size.width * 0.5773333, size.height * 0.7283333)
      ..cubicTo(size.width * 0.6070000, size.height * 0.7283333, size.width * 0.6346667,
          size.height * 0.7210000, size.width * 0.6600000, size.height * 0.7063333)
      ..cubicTo(size.width * 0.6853333, size.height * 0.6916667, size.width * 0.7056667,
          size.height * 0.6716667, size.width * 0.7203333, size.height * 0.6463333)
      ..cubicTo(size.width * 0.7350000, size.height * 0.6210000, size.width * 0.7426667,
          size.height * 0.5933333, size.width * 0.7426667, size.height * 0.5633333)
      ..cubicTo(size.width * 0.7426667, size.height * 0.5413333, size.width * 0.7380000,
          size.height * 0.5190000, size.width * 0.7286667, size.height * 0.4966667)
      ..cubicTo(size.width * 0.7540000, size.height * 0.4660000, size.width * 0.7666667,
          size.height * 0.4290000, size.width * 0.7666667, size.height * 0.3866667)
      ..cubicTo(size.width * 0.7666667, size.height * 0.3630000, size.width * 0.7620000,
          size.height * 0.3403333, size.width * 0.7530000, size.height * 0.3186667)
      ..cubicTo(size.width * 0.7440000, size.height * 0.2970000, size.width * 0.7313333,
          size.height * 0.2786667, size.width * 0.7156667, size.height * 0.2630000)
      ..cubicTo(size.width * 0.7000000, size.height * 0.2473333, size.width * 0.6816667,
          size.height * 0.2346667, size.width * 0.6600000, size.height * 0.2256667)
      ..cubicTo(size.width * 0.6383333, size.height * 0.2163333, size.width * 0.6156667,
          size.height * 0.2120000, size.width * 0.5920000, size.height * 0.2120000)
      ..cubicTo(size.width * 0.5426667, size.height * 0.2120000, size.width * 0.4996667,
          size.height * 0.2313333, size.width * 0.4626667, size.height * 0.2700000)
      ..cubicTo(size.width * 0.4370000, size.height * 0.2553333, size.width * 0.4070000,
          size.height * 0.2480000, size.width * 0.3726667, size.height * 0.2480000)
      ..cubicTo(size.width * 0.3256667, size.height * 0.2480000, size.width * 0.2843333,
          size.height * 0.2626667, size.width * 0.2483333, size.height * 0.2916667)
      ..cubicTo(size.width * 0.2123333, size.height * 0.3206667, size.width * 0.1890000,
          size.height * 0.3580000, size.width * 0.1790000, size.height * 0.4033333)
      ..cubicTo(size.width * 0.1416667, size.height * 0.4120000, size.width * 0.1113333,
          size.height * 0.4310000, size.width * 0.08766667, size.height * 0.4610000)
      ..cubicTo(size.width * 0.06400000, size.height * 0.4910000, size.width * 0.05200000,
          size.height * 0.5250000, size.width * 0.05200000, size.height * 0.5633333)
      ..close()
      ..moveTo(size.width * 0.1090000, size.height * 0.5633333)
      ..cubicTo(size.width * 0.1090000, size.height * 0.5353333, size.width * 0.1183333,
          size.height * 0.5113333, size.width * 0.1370000, size.height * 0.4910000)
      ..cubicTo(size.width * 0.1556667, size.height * 0.4706667, size.width * 0.1790000,
          size.height * 0.4590000, size.width * 0.2070000, size.height * 0.4556667)
      ..lineTo(size.width * 0.2236667, size.height * 0.4546667)
      ..cubicTo(size.width * 0.2276667, size.height * 0.4546667, size.width * 0.2300000,
          size.height * 0.4526667, size.width * 0.2300000, size.height * 0.4486667)
      ..lineTo(size.width * 0.2323333, size.height * 0.4306667)
      ..cubicTo(size.width * 0.2370000, size.height * 0.3946667, size.width * 0.2526667,
          size.height * 0.3643333, size.width * 0.2793333, size.height * 0.3403333)
      ..cubicTo(size.width * 0.3060000, size.height * 0.3160000, size.width * 0.3373333,
          size.height * 0.3040000, size.width * 0.3730000, size.height * 0.3040000)
      ..cubicTo(size.width * 0.4096667, size.height * 0.3040000, size.width * 0.4416667,
          size.height * 0.3163333, size.width * 0.4686667, size.height * 0.3406667)
      ..cubicTo(size.width * 0.4960000, size.height * 0.3650000, size.width * 0.5110000,
          size.height * 0.3950000, size.width * 0.5143333, size.height * 0.4310000)
      ..lineTo(size.width * 0.5166667, size.height * 0.4503333)
      ..cubicTo(size.width * 0.5173333, size.height * 0.4540000, size.width * 0.5196667,
          size.height * 0.4560000, size.width * 0.5236667, size.height * 0.4560000)
      ..lineTo(size.width * 0.5773333, size.height * 0.4560000)
      ..cubicTo(size.width * 0.6066667, size.height * 0.4560000, size.width * 0.6320000,
          size.height * 0.4666667, size.width * 0.6533333, size.height * 0.4880000)
      ..cubicTo(size.width * 0.6746667, size.height * 0.5093333, size.width * 0.6853333,
          size.height * 0.5343333, size.width * 0.6853333, size.height * 0.5636667)
      ..cubicTo(size.width * 0.6853333, size.height * 0.5940000, size.width * 0.6746667,
          size.height * 0.6196667, size.width * 0.6536667, size.height * 0.6410000)
      ..cubicTo(size.width * 0.6326667, size.height * 0.6623333, size.width * 0.6070000,
          size.height * 0.6730000, size.width * 0.5776667, size.height * 0.6730000)
      ..lineTo(size.width * 0.2163333, size.height * 0.6730000)
      ..cubicTo(size.width * 0.1870000, size.height * 0.6730000, size.width * 0.1620000,
          size.height * 0.6623333, size.width * 0.1406667, size.height * 0.6406667)
      ..cubicTo(size.width * 0.1196667, size.height * 0.6190000, size.width * 0.1090000,
          size.height * 0.5933333, size.width * 0.1090000, size.height * 0.5633333)
      ..close()
      ..moveTo(size.width * 0.3323333, size.height * 0.1543333)
      ..cubicTo(size.width * 0.3323333, size.height * 0.1623333, size.width * 0.3350000,
          size.height * 0.1693333, size.width * 0.3403333, size.height * 0.1753333)
      ..lineTo(size.width * 0.3623333, size.height * 0.1966667)
      ..cubicTo(size.width * 0.3706667, size.height * 0.2030000, size.width * 0.3776667,
          size.height * 0.2056667, size.width * 0.3836667, size.height * 0.2050000)
      ..cubicTo(size.width * 0.3906667, size.height * 0.2050000, size.width * 0.3966667,
          size.height * 0.2020000, size.width * 0.4020000, size.height * 0.1963333)
      ..cubicTo(size.width * 0.4073333, size.height * 0.1906667, size.width * 0.4100000,
          size.height * 0.1836667, size.width * 0.4100000, size.height * 0.1756667)
      ..cubicTo(size.width * 0.4100000, size.height * 0.1676667, size.width * 0.4070000,
          size.height * 0.1610000, size.width * 0.4013333, size.height * 0.1560000)
      ..lineTo(size.width * 0.3816667, size.height * 0.1340000)
      ..cubicTo(size.width * 0.3756667, size.height * 0.1286667, size.width * 0.3690000,
          size.height * 0.1260000, size.width * 0.3613333, size.height * 0.1260000)
      ..cubicTo(size.width * 0.3533333, size.height * 0.1260000, size.width * 0.3463333,
          size.height * 0.1286667, size.width * 0.3406667, size.height * 0.1343333)
      ..cubicTo(size.width * 0.3350000, size.height * 0.1396667, size.width * 0.3323333,
          size.height * 0.1463333, size.width * 0.3323333, size.height * 0.1543333)
      ..close()
      ..moveTo(size.width * 0.5103333, size.height * 0.3020000)
      ..cubicTo(size.width * 0.5333333, size.height * 0.2796667, size.width * 0.5606667,
          size.height * 0.2686667, size.width * 0.5920000, size.height * 0.2686667)
      ..cubicTo(size.width * 0.6250000, size.height * 0.2686667, size.width * 0.6530000,
          size.height * 0.2800000, size.width * 0.6760000, size.height * 0.3030000)
      ..cubicTo(size.width * 0.6990000, size.height * 0.3260000, size.width * 0.7106667,
          size.height * 0.3536667, size.width * 0.7106667, size.height * 0.3866667)
      ..cubicTo(size.width * 0.7106667, size.height * 0.4073333, size.width * 0.7050000,
          size.height * 0.4280000, size.width * 0.6936667, size.height * 0.4480000)
      ..cubicTo(size.width * 0.6613333, size.height * 0.4160000, size.width * 0.6226667,
          size.height * 0.4000000, size.width * 0.5773333, size.height * 0.4000000)
      ..lineTo(size.width * 0.5666667, size.height * 0.4000000)
      ..cubicTo(size.width * 0.5583333, size.height * 0.3636667, size.width * 0.5396667,
          size.height * 0.3310000, size.width * 0.5103333, size.height * 0.3020000)
      ..close()
      ..moveTo(size.width * 0.5646667, size.height * 0.1260000)
      ..cubicTo(size.width * 0.5646667, size.height * 0.1346667, size.width * 0.5673333,
          size.height * 0.1413333, size.width * 0.5723333, size.height * 0.1466667)
      ..cubicTo(size.width * 0.5773333, size.height * 0.1520000, size.width * 0.5840000,
          size.height * 0.1543333, size.width * 0.5920000, size.height * 0.1543333)
      ..cubicTo(size.width * 0.6006667, size.height * 0.1543333, size.width * 0.6073333,
          size.height * 0.1516667, size.width * 0.6126667, size.height * 0.1466667)
      ..cubicTo(size.width * 0.6180000, size.height * 0.1413333, size.width * 0.6203333,
          size.height * 0.1346667, size.width * 0.6203333, size.height * 0.1260000)
      ..lineTo(size.width * 0.6203333, size.height * 0.05766667)
      ..cubicTo(size.width * 0.6203333, size.height * 0.04966667, size.width * 0.6176667,
          size.height * 0.04333333, size.width * 0.6123333, size.height * 0.03800000)
      ..cubicTo(size.width * 0.6070000, size.height * 0.03266667, size.width * 0.6003333,
          size.height * 0.03033333, size.width * 0.5920000, size.height * 0.03033333)
      ..cubicTo(size.width * 0.5840000, size.height * 0.03033333, size.width * 0.5776667,
          size.height * 0.03300000, size.width * 0.5723333, size.height * 0.03800000)
      ..cubicTo(size.width * 0.5670000, size.height * 0.04300000, size.width * 0.5646667,
          size.height * 0.04966667, size.width * 0.5646667, size.height * 0.05766667)
      ..lineTo(size.width * 0.5646667, size.height * 0.1260000)
      ..close()
      ..moveTo(size.width * 0.7486667, size.height * 0.2023333)
      ..cubicTo(size.width * 0.7486667, size.height * 0.2110000, size.width * 0.7510000,
          size.height * 0.2176667, size.width * 0.7560000, size.height * 0.2230000)
      ..cubicTo(size.width * 0.7630000, size.height * 0.2283333, size.width * 0.7700000,
          size.height * 0.2310000, size.width * 0.7766667, size.height * 0.2310000)
      ..cubicTo(size.width * 0.7826667, size.height * 0.2310000, size.width * 0.7893333,
          size.height * 0.2283333, size.width * 0.7963333, size.height * 0.2230000)
      ..lineTo(size.width * 0.8440000, size.height * 0.1753333)
      ..cubicTo(size.width * 0.8493333, size.height * 0.1693333, size.width * 0.8520000,
          size.height * 0.1623333, size.width * 0.8520000, size.height * 0.1540000)
      ..cubicTo(size.width * 0.8520000, size.height * 0.1460000, size.width * 0.8493333,
          size.height * 0.1393333, size.width * 0.8440000, size.height * 0.1340000)
      ..cubicTo(size.width * 0.8386667, size.height * 0.1286667, size.width * 0.8320000,
          size.height * 0.1260000, size.width * 0.8243333, size.height * 0.1260000)
      ..cubicTo(size.width * 0.8163333, size.height * 0.1260000, size.width * 0.8100000,
          size.height * 0.1286667, size.width * 0.8050000, size.height * 0.1340000)
      ..lineTo(size.width * 0.7560000, size.height * 0.1816667)
      ..cubicTo(size.width * 0.7510000, size.height * 0.1880000, size.width * 0.7486667,
          size.height * 0.1946667, size.width * 0.7486667, size.height * 0.2023333)
      ..close()
      ..moveTo(size.width * 0.7750000, size.height * 0.5970000)
      ..cubicTo(size.width * 0.7750000, size.height * 0.6050000, size.width * 0.7776667,
          size.height * 0.6120000, size.width * 0.7833333, size.height * 0.6180000)
      ..lineTo(size.width * 0.8050000, size.height * 0.6390000)
      ..cubicTo(size.width * 0.8100000, size.height * 0.6443333, size.width * 0.8163333,
          size.height * 0.6470000, size.width * 0.8243333, size.height * 0.6470000)
      ..cubicTo(size.width * 0.8323333, size.height * 0.6470000, size.width * 0.8390000,
          size.height * 0.6443333, size.width * 0.8443333, size.height * 0.6386667)
      ..cubicTo(size.width * 0.8496667, size.height * 0.6330000, size.width * 0.8523333,
          size.height * 0.6263333, size.width * 0.8523333, size.height * 0.6180000)
      ..cubicTo(size.width * 0.8523333, size.height * 0.6106667, size.width * 0.8496667,
          size.height * 0.6040000, size.width * 0.8443333, size.height * 0.5986667)
      ..lineTo(size.width * 0.8226667, size.height * 0.5770000)
      ..cubicTo(size.width * 0.8173333, size.height * 0.5716667, size.width * 0.8110000,
          size.height * 0.5690000, size.width * 0.8036667, size.height * 0.5690000)
      ..cubicTo(size.width * 0.7956667, size.height * 0.5690000, size.width * 0.7890000,
          size.height * 0.5716667, size.width * 0.7836667, size.height * 0.5770000)
      ..cubicTo(size.width * 0.7780000, size.height * 0.5823333, size.width * 0.7750000,
          size.height * 0.5890000, size.width * 0.7750000, size.height * 0.5970000)
      ..close()
      ..moveTo(size.width * 0.8240000, size.height * 0.3866667)
      ..cubicTo(size.width * 0.8240000, size.height * 0.3943333, size.width * 0.8270000,
          size.height * 0.4006667, size.width * 0.8326667, size.height * 0.4060000)
      ..cubicTo(size.width * 0.8380000, size.height * 0.4113333, size.width * 0.8450000,
          size.height * 0.4140000, size.width * 0.8530000, size.height * 0.4140000)
      ..lineTo(size.width * 0.9210000, size.height * 0.4140000)
      ..cubicTo(size.width * 0.9286667, size.height * 0.4140000, size.width * 0.9350000,
          size.height * 0.4113333, size.width * 0.9403333, size.height * 0.4063333)
      ..cubicTo(size.width * 0.9456667, size.height * 0.4013333, size.width * 0.9480000,
          size.height * 0.3946667, size.width * 0.9480000, size.height * 0.3866667)
      ..cubicTo(size.width * 0.9480000, size.height * 0.3786667, size.width * 0.9453333,
          size.height * 0.3720000, size.width * 0.9403333, size.height * 0.3666667)
      ..cubicTo(size.width * 0.9353333, size.height * 0.3613333, size.width * 0.9286667,
          size.height * 0.3583333, size.width * 0.9210000, size.height * 0.3583333)
      ..lineTo(size.width * 0.8530000, size.height * 0.3583333)
      ..cubicTo(size.width * 0.8450000, size.height * 0.3583333, size.width * 0.8383333,
          size.height * 0.3610000, size.width * 0.8326667, size.height * 0.3666667)
      ..cubicTo(size.width * 0.8266667, size.height * 0.3723333, size.width * 0.8240000,
          size.height * 0.3790000, size.width * 0.8240000, size.height * 0.3866667)
      ..close();
  }

  Path _dayCloudyGustsPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.01166667, size.height * 0.7003333)
      ..cubicTo(size.width * 0.01166667, size.height * 0.7083333, size.width * 0.01466667,
          size.height * 0.7150000, size.width * 0.02066667, size.height * 0.7203333)
      ..cubicTo(size.width * 0.02633333, size.height * 0.7260000, size.width * 0.03300000,
          size.height * 0.7286667, size.width * 0.04100000, size.height * 0.7286667)
      ..lineTo(size.width * 0.2370000, size.height * 0.7286667)
      ..cubicTo(size.width * 0.2456667, size.height * 0.7286667, size.width * 0.2530000,
          size.height * 0.7316667, size.width * 0.2596667, size.height * 0.7380000)
      ..cubicTo(size.width * 0.2663333, size.height * 0.7443333, size.width * 0.2696667,
          size.height * 0.7520000, size.width * 0.2696667, size.height * 0.7606667)
      ..cubicTo(size.width * 0.2696667, size.height * 0.7693333, size.width * 0.2663333,
          size.height * 0.7773333, size.width * 0.2596667, size.height * 0.7836667)
      ..cubicTo(size.width * 0.2530000, size.height * 0.7900000, size.width * 0.2456667,
          size.height * 0.7933333, size.width * 0.2370000, size.height * 0.7933333)
      ..cubicTo(size.width * 0.2283333, size.height * 0.7933333, size.width * 0.2210000,
          size.height * 0.7900000, size.width * 0.2143333, size.height * 0.7833333)
      ..cubicTo(size.width * 0.2083333, size.height * 0.7780000, size.width * 0.2016667,
          size.height * 0.7753333, size.width * 0.1940000, size.height * 0.7753333)
      ..cubicTo(size.width * 0.1860000, size.height * 0.7753333, size.width * 0.1793333,
          size.height * 0.7780000, size.width * 0.1740000, size.height * 0.7833333)
      ..cubicTo(size.width * 0.1686667, size.height * 0.7886667, size.width * 0.1660000,
          size.height * 0.7953333, size.width * 0.1660000, size.height * 0.8033333)
      ..cubicTo(size.width * 0.1660000, size.height * 0.8113333, size.width * 0.1686667,
          size.height * 0.8180000, size.width * 0.1740000, size.height * 0.8233333)
      ..cubicTo(size.width * 0.1916667, size.height * 0.8410000, size.width * 0.2126667,
          size.height * 0.8500000, size.width * 0.2370000, size.height * 0.8500000)
      ..cubicTo(size.width * 0.2616667, size.height * 0.8500000, size.width * 0.2826667,
          size.height * 0.8413333, size.width * 0.2996667, size.height * 0.8240000)
      ..cubicTo(size.width * 0.3170000, size.height * 0.8066667, size.width * 0.3256667,
          size.height * 0.7856667, size.width * 0.3256667, size.height * 0.7610000)
      ..cubicTo(size.width * 0.3256667, size.height * 0.7363333, size.width * 0.3170000,
          size.height * 0.7153333, size.width * 0.2996667, size.height * 0.6980000)
      ..cubicTo(size.width * 0.2823333, size.height * 0.6803333, size.width * 0.2613333,
          size.height * 0.6716667, size.width * 0.2370000, size.height * 0.6716667)
      ..lineTo(size.width * 0.04100000, size.height * 0.6716667)
      ..cubicTo(size.width * 0.03300000, size.height * 0.6716667, size.width * 0.02633333,
          size.height * 0.6746667, size.width * 0.02033333, size.height * 0.6803333)
      ..cubicTo(size.width * 0.01433333, size.height * 0.6860000, size.width * 0.01166667,
          size.height * 0.6926667, size.width * 0.01166667, size.height * 0.7003333)
      ..close()
      ..moveTo(size.width * 0.01166667, size.height * 0.6000000)
      ..cubicTo(size.width * 0.01166667, size.height * 0.6073333, size.width * 0.01466667,
          size.height * 0.6136667, size.width * 0.02066667, size.height * 0.6190000)
      ..cubicTo(size.width * 0.02633333, size.height * 0.6246667, size.width * 0.03300000,
          size.height * 0.6273333, size.width * 0.04100000, size.height * 0.6273333)
      ..lineTo(size.width * 0.4066667, size.height * 0.6273333)
      ..cubicTo(size.width * 0.4313333, size.height * 0.6273333, size.width * 0.4523333,
          size.height * 0.6186667, size.width * 0.4696667, size.height * 0.6013333)
      ..cubicTo(size.width * 0.4870000, size.height * 0.5840000, size.width * 0.4956667,
          size.height * 0.5630000, size.width * 0.4956667, size.height * 0.5383333)
      ..cubicTo(size.width * 0.4956667, size.height * 0.5136667, size.width * 0.4870000,
          size.height * 0.4930000, size.width * 0.4696667, size.height * 0.4756667)
      ..cubicTo(size.width * 0.4523333, size.height * 0.4586667, size.width * 0.4313333,
          size.height * 0.4500000, size.width * 0.4066667, size.height * 0.4500000)
      ..cubicTo(size.width * 0.3813333, size.height * 0.4500000, size.width * 0.3606667,
          size.height * 0.4583333, size.width * 0.3440000, size.height * 0.4753333)
      ..cubicTo(size.width * 0.3386667, size.height * 0.4806667, size.width * 0.3363333,
          size.height * 0.4876667, size.width * 0.3363333, size.height * 0.4956667)
      ..cubicTo(size.width * 0.3363333, size.height * 0.5036667, size.width * 0.3390000,
          size.height * 0.5103333, size.width * 0.3440000, size.height * 0.5156667)
      ..cubicTo(size.width * 0.3490000, size.height * 0.5206667, size.width * 0.3556667,
          size.height * 0.5233333, size.width * 0.3640000, size.height * 0.5233333)
      ..cubicTo(size.width * 0.3720000, size.height * 0.5233333, size.width * 0.3786667,
          size.height * 0.5206667, size.width * 0.3846667, size.height * 0.5156667)
      ..cubicTo(size.width * 0.3910000, size.height * 0.5093333, size.width * 0.3983333,
          size.height * 0.5063333, size.width * 0.4070000, size.height * 0.5063333)
      ..cubicTo(size.width * 0.4156667, size.height * 0.5063333, size.width * 0.4233333,
          size.height * 0.5093333, size.width * 0.4296667, size.height * 0.5156667)
      ..cubicTo(size.width * 0.4360000, size.height * 0.5220000, size.width * 0.4393333,
          size.height * 0.5296667, size.width * 0.4393333, size.height * 0.5383333)
      ..cubicTo(size.width * 0.4393333, size.height * 0.5473333, size.width * 0.4360000,
          size.height * 0.5550000, size.width * 0.4296667, size.height * 0.5613333)
      ..cubicTo(size.width * 0.4233333, size.height * 0.5676667, size.width * 0.4156667,
          size.height * 0.5710000, size.width * 0.4070000, size.height * 0.5710000)
      ..lineTo(size.width * 0.04100000, size.height * 0.5710000)
      ..cubicTo(size.width * 0.03300000, size.height * 0.5710000, size.width * 0.02633333,
          size.height * 0.5740000, size.width * 0.02033333, size.height * 0.5796667)
      ..cubicTo(size.width * 0.01433333, size.height * 0.5856667, size.width * 0.01166667,
          size.height * 0.5923333, size.width * 0.01166667, size.height * 0.6000000)
      ..close()
      ..moveTo(size.width * 0.1000000, size.height * 0.5216667)
      ..cubicTo(size.width * 0.1000000, size.height * 0.5243333, size.width * 0.1020000,
          size.height * 0.5256667, size.width * 0.1056667, size.height * 0.5256667)
      ..lineTo(size.width * 0.1533333, size.height * 0.5256667)
      ..cubicTo(size.width * 0.1556667, size.height * 0.5256667, size.width * 0.1576667,
          size.height * 0.5240000, size.width * 0.1600000, size.height * 0.5210000)
      ..cubicTo(size.width * 0.1673333, size.height * 0.5030000, size.width * 0.1790000,
          size.height * 0.4880000, size.width * 0.1950000, size.height * 0.4760000)
      ..cubicTo(size.width * 0.2106667, size.height * 0.4643333, size.width * 0.2283333,
          size.height * 0.4576667, size.width * 0.2483333, size.height * 0.4560000)
      ..lineTo(size.width * 0.2660000, size.height * 0.4536667)
      ..cubicTo(size.width * 0.2700000, size.height * 0.4536667, size.width * 0.2723333,
          size.height * 0.4516667, size.width * 0.2723333, size.height * 0.4480000)
      ..lineTo(size.width * 0.2746667, size.height * 0.4306667)
      ..cubicTo(size.width * 0.2783333, size.height * 0.3946667, size.width * 0.2933333,
          size.height * 0.3646667, size.width * 0.3203333, size.height * 0.3403333)
      ..cubicTo(size.width * 0.3473333, size.height * 0.3160000, size.width * 0.3790000,
          size.height * 0.3040000, size.width * 0.4153333, size.height * 0.3040000)
      ..cubicTo(size.width * 0.4520000, size.height * 0.3040000, size.width * 0.4836667,
          size.height * 0.3160000, size.width * 0.5106667, size.height * 0.3400000)
      ..cubicTo(size.width * 0.5376667, size.height * 0.3640000, size.width * 0.5530000,
          size.height * 0.3943333, size.width * 0.5566667, size.height * 0.4303333)
      ..lineTo(size.width * 0.5590000, size.height * 0.4496667)
      ..cubicTo(size.width * 0.5590000, size.height * 0.4536667, size.width * 0.5610000,
          size.height * 0.4556667, size.width * 0.5650000, size.height * 0.4556667)
      ..lineTo(size.width * 0.6193333, size.height * 0.4556667)
      ..cubicTo(size.width * 0.6493333, size.height * 0.4556667, size.width * 0.6750000,
          size.height * 0.4660000, size.width * 0.6960000, size.height * 0.4870000)
      ..cubicTo(size.width * 0.7170000, size.height * 0.5080000, size.width * 0.7276667,
          size.height * 0.5333333, size.width * 0.7276667, size.height * 0.5626667)
      ..cubicTo(size.width * 0.7276667, size.height * 0.5923333, size.width * 0.7170000,
          size.height * 0.6180000, size.width * 0.6960000, size.height * 0.6390000)
      ..cubicTo(size.width * 0.6750000, size.height * 0.6600000, size.width * 0.6493333,
          size.height * 0.6706667, size.width * 0.6193333, size.height * 0.6706667)
      ..lineTo(size.width * 0.3893333, size.height * 0.6706667)
      ..cubicTo(size.width * 0.3850000, size.height * 0.6706667, size.width * 0.3830000,
          size.height * 0.6726667, size.width * 0.3830000, size.height * 0.6766667)
      ..lineTo(size.width * 0.3830000, size.height * 0.7223333)
      ..cubicTo(size.width * 0.3830000, size.height * 0.7260000, size.width * 0.3850000,
          size.height * 0.7280000, size.width * 0.3893333, size.height * 0.7280000)
      ..lineTo(size.width * 0.6193333, size.height * 0.7280000)
      ..cubicTo(size.width * 0.6490000, size.height * 0.7280000, size.width * 0.6766667,
          size.height * 0.7206667, size.width * 0.7020000, size.height * 0.7056667)
      ..cubicTo(size.width * 0.7273333, size.height * 0.6910000, size.width * 0.7473333,
          size.height * 0.6706667, size.width * 0.7620000, size.height * 0.6453333)
      ..cubicTo(size.width * 0.7766667, size.height * 0.6200000, size.width * 0.7840000,
          size.height * 0.5923333, size.width * 0.7840000, size.height * 0.5626667)
      ..cubicTo(size.width * 0.7840000, size.height * 0.5380000, size.width * 0.7793333,
          size.height * 0.5156667, size.width * 0.7700000, size.height * 0.4950000)
      ..cubicTo(size.width * 0.7953333, size.height * 0.4620000, size.width * 0.8076667,
          size.height * 0.4250000, size.width * 0.8076667, size.height * 0.3846667)
      ..cubicTo(size.width * 0.8076667, size.height * 0.3533333, size.width * 0.7996667,
          size.height * 0.3243333, size.width * 0.7840000, size.height * 0.2973333)
      ..cubicTo(size.width * 0.7683333, size.height * 0.2703333, size.width * 0.7470000,
          size.height * 0.2490000, size.width * 0.7200000, size.height * 0.2333333)
      ..cubicTo(size.width * 0.6930000, size.height * 0.2176667, size.width * 0.6640000,
          size.height * 0.2096667, size.width * 0.6326667, size.height * 0.2096667)
      ..cubicTo(size.width * 0.5813333, size.height * 0.2096667, size.width * 0.5383333,
          size.height * 0.2290000, size.width * 0.5040000, size.height * 0.2673333)
      ..cubicTo(size.width * 0.4773333, size.height * 0.2536667, size.width * 0.4476667,
          size.height * 0.2470000, size.width * 0.4150000, size.height * 0.2470000)
      ..cubicTo(size.width * 0.3680000, size.height * 0.2470000, size.width * 0.3266667,
          size.height * 0.2616667, size.width * 0.2906667, size.height * 0.2906667)
      ..cubicTo(size.width * 0.2546667, size.height * 0.3196667, size.width * 0.2316667,
          size.height * 0.3570000, size.width * 0.2220000, size.height * 0.4020000)
      ..cubicTo(size.width * 0.1936667, size.height * 0.4086667, size.width * 0.1686667,
          size.height * 0.4223333, size.width * 0.1470000, size.height * 0.4430000)
      ..cubicTo(size.width * 0.1253333, size.height * 0.4636667, size.width * 0.1100000,
          size.height * 0.4880000, size.width * 0.1016667, size.height * 0.5160000)
      ..lineTo(size.width * 0.1016667, size.height * 0.5173333)
      ..cubicTo(size.width * 0.1003333, size.height * 0.5196667, size.width * 0.1000000,
          size.height * 0.5206667, size.width * 0.1000000, size.height * 0.5216667)
      ..close()
      ..moveTo(size.width * 0.3726667, size.height * 0.1540000)
      ..cubicTo(size.width * 0.3726667, size.height * 0.1616667, size.width * 0.3756667,
          size.height * 0.1683333, size.width * 0.3816667, size.height * 0.1740000)
      ..lineTo(size.width * 0.4020000, size.height * 0.1956667)
      ..cubicTo(size.width * 0.4073333, size.height * 0.2010000, size.width * 0.4143333,
          size.height * 0.2036667, size.width * 0.4223333, size.height * 0.2036667)
      ..cubicTo(size.width * 0.4306667, size.height * 0.2036667, size.width * 0.4373333,
          size.height * 0.2010000, size.width * 0.4426667, size.height * 0.1960000)
      ..cubicTo(size.width * 0.4480000, size.height * 0.1910000, size.width * 0.4506667,
          size.height * 0.1843333, size.width * 0.4506667, size.height * 0.1760000)
      ..cubicTo(size.width * 0.4506667, size.height * 0.1680000, size.width * 0.4483333,
          size.height * 0.1613333, size.width * 0.4430000, size.height * 0.1560000)
      ..lineTo(size.width * 0.4210000, size.height * 0.1343333)
      ..cubicTo(size.width * 0.4156667, size.height * 0.1286667, size.width * 0.4093333,
          size.height * 0.1256667, size.width * 0.4013333, size.height * 0.1256667)
      ..cubicTo(size.width * 0.3933333, size.height * 0.1256667, size.width * 0.3866667,
          size.height * 0.1283333, size.width * 0.3810000, size.height * 0.1340000)
      ..cubicTo(size.width * 0.3753333, size.height * 0.1396667, size.width * 0.3726667,
          size.height * 0.1463333, size.width * 0.3726667, size.height * 0.1540000)
      ..close()
      ..moveTo(size.width * 0.5500000, size.height * 0.3010000)
      ..cubicTo(size.width * 0.5740000, size.height * 0.2783333, size.width * 0.6013333,
          size.height * 0.2670000, size.width * 0.6326667, size.height * 0.2670000)
      ..cubicTo(size.width * 0.6650000, size.height * 0.2670000, size.width * 0.6926667,
          size.height * 0.2786667, size.width * 0.7163333, size.height * 0.3020000)
      ..cubicTo(size.width * 0.7396667, size.height * 0.3253333, size.width * 0.7513333,
          size.height * 0.3533333, size.width * 0.7513333, size.height * 0.3856667)
      ..cubicTo(size.width * 0.7513333, size.height * 0.4073333, size.width * 0.7456667,
          size.height * 0.4276667, size.width * 0.7340000, size.height * 0.4466667)
      ..cubicTo(size.width * 0.7020000, size.height * 0.4146667, size.width * 0.6636667,
          size.height * 0.3990000, size.width * 0.6186667, size.height * 0.3990000)
      ..lineTo(size.width * 0.6073333, size.height * 0.3990000)
      ..cubicTo(size.width * 0.5996667, size.height * 0.3626667, size.width * 0.5803333,
          size.height * 0.3300000, size.width * 0.5500000, size.height * 0.3010000)
      ..close()
      ..moveTo(size.width * 0.6040000, size.height * 0.1263333)
      ..cubicTo(size.width * 0.6040000, size.height * 0.1340000, size.width * 0.6066667,
          size.height * 0.1406667, size.width * 0.6123333, size.height * 0.1460000)
      ..cubicTo(size.width * 0.6180000, size.height * 0.1513333, size.width * 0.6246667,
          size.height * 0.1540000, size.width * 0.6323333, size.height * 0.1540000)
      ..cubicTo(size.width * 0.6403333, size.height * 0.1540000, size.width * 0.6470000,
          size.height * 0.1513333, size.width * 0.6526667, size.height * 0.1460000)
      ..cubicTo(size.width * 0.6583333, size.height * 0.1406667, size.width * 0.6610000,
          size.height * 0.1343333, size.width * 0.6610000, size.height * 0.1263333)
      ..lineTo(size.width * 0.6610000, size.height * 0.05800000)
      ..cubicTo(size.width * 0.6610000, size.height * 0.05000000, size.width * 0.6583333,
          size.height * 0.04333333, size.width * 0.6526667, size.height * 0.03766667)
      ..cubicTo(size.width * 0.6470000, size.height * 0.03200000, size.width * 0.6403333,
          size.height * 0.02933333, size.width * 0.6323333, size.height * 0.02933333)
      ..cubicTo(size.width * 0.6243333, size.height * 0.02933333, size.width * 0.6176667,
          size.height * 0.03200000, size.width * 0.6123333, size.height * 0.03766667)
      ..cubicTo(size.width * 0.6070000, size.height * 0.04333333, size.width * 0.6040000,
          size.height * 0.05000000, size.width * 0.6040000, size.height * 0.05800000)
      ..lineTo(size.width * 0.6040000, size.height * 0.1263333)
      ..close()
      ..moveTo(size.width * 0.7890000, size.height * 0.2020000)
      ..cubicTo(size.width * 0.7890000, size.height * 0.2100000, size.width * 0.7916667,
          size.height * 0.2166667, size.width * 0.7966667, size.height * 0.2220000)
      ..cubicTo(size.width * 0.8023333, size.height * 0.2276667, size.width * 0.8090000,
          size.height * 0.2303333, size.width * 0.8170000, size.height * 0.2306667)
      ..cubicTo(size.width * 0.8250000, size.height * 0.2310000, size.width * 0.8313333,
          size.height * 0.2280000, size.width * 0.8360000, size.height * 0.2220000)
      ..lineTo(size.width * 0.8846667, size.height * 0.1743333)
      ..cubicTo(size.width * 0.8903333, size.height * 0.1686667, size.width * 0.8930000,
          size.height * 0.1620000, size.width * 0.8930000, size.height * 0.1540000)
      ..cubicTo(size.width * 0.8930000, size.height * 0.1463333, size.width * 0.8903333,
          size.height * 0.1396667, size.width * 0.8846667, size.height * 0.1340000)
      ..cubicTo(size.width * 0.8790000, size.height * 0.1283333, size.width * 0.8723333,
          size.height * 0.1256667, size.width * 0.8643333, size.height * 0.1256667)
      ..cubicTo(size.width * 0.8563333, size.height * 0.1256667, size.width * 0.8496667,
          size.height * 0.1280000, size.width * 0.8443333, size.height * 0.1333333)
      ..lineTo(size.width * 0.7966667, size.height * 0.1823333)
      ..cubicTo(size.width * 0.7916667, size.height * 0.1876667, size.width * 0.7890000,
          size.height * 0.1940000, size.width * 0.7890000, size.height * 0.2020000)
      ..close()
      ..moveTo(size.width * 0.8146667, size.height * 0.5963333)
      ..cubicTo(size.width * 0.8146667, size.height * 0.6040000, size.width * 0.8173333,
          size.height * 0.6106667, size.width * 0.8230000, size.height * 0.6163333)
      ..lineTo(size.width * 0.8443333, size.height * 0.6380000)
      ..cubicTo(size.width * 0.8510000, size.height * 0.6433333, size.width * 0.8580000,
          size.height * 0.6460000, size.width * 0.8650000, size.height * 0.6460000)
      ..cubicTo(size.width * 0.8713333, size.height * 0.6460000, size.width * 0.8780000,
          size.height * 0.6433333, size.width * 0.8846667, size.height * 0.6380000)
      ..cubicTo(size.width * 0.8903333, size.height * 0.6323333, size.width * 0.8930000,
          size.height * 0.6256667, size.width * 0.8930000, size.height * 0.6180000)
      ..cubicTo(size.width * 0.8930000, size.height * 0.6106667, size.width * 0.8903333,
          size.height * 0.6040000, size.width * 0.8846667, size.height * 0.5976667)
      ..lineTo(size.width * 0.8633333, size.height * 0.5760000)
      ..cubicTo(size.width * 0.8580000, size.height * 0.5706667, size.width * 0.8513333,
          size.height * 0.5680000, size.width * 0.8440000, size.height * 0.5680000)
      ..cubicTo(size.width * 0.8356667, size.height * 0.5680000, size.width * 0.8286667,
          size.height * 0.5706667, size.width * 0.8230000, size.height * 0.5763333)
      ..cubicTo(size.width * 0.8173333, size.height * 0.5816667, size.width * 0.8146667,
          size.height * 0.5883333, size.width * 0.8146667, size.height * 0.5963333)
      ..close()
      ..moveTo(size.width * 0.8650000, size.height * 0.3856667)
      ..cubicTo(size.width * 0.8650000, size.height * 0.3936667, size.width * 0.8676667,
          size.height * 0.4000000, size.width * 0.8733333, size.height * 0.4053333)
      ..cubicTo(size.width * 0.8783333, size.height * 0.4113333, size.width * 0.8846667,
          size.height * 0.4140000, size.width * 0.8923333, size.height * 0.4140000)
      ..lineTo(size.width * 0.9596667, size.height * 0.4140000)
      ..cubicTo(size.width * 0.9676667, size.height * 0.4140000, size.width * 0.9743333,
          size.height * 0.4113333, size.width * 0.9800000, size.height * 0.4056667)
      ..cubicTo(size.width * 0.9856667, size.height * 0.4000000, size.width * 0.9883333,
          size.height * 0.3933333, size.width * 0.9883333, size.height * 0.3856667)
      ..cubicTo(size.width * 0.9883333, size.height * 0.3780000, size.width * 0.9853333,
          size.height * 0.3713333, size.width * 0.9796667, size.height * 0.3656667)
      ..cubicTo(size.width * 0.9740000, size.height * 0.3600000, size.width * 0.9673333,
          size.height * 0.3570000, size.width * 0.9596667, size.height * 0.3570000)
      ..lineTo(size.width * 0.8923333, size.height * 0.3570000)
      ..cubicTo(size.width * 0.8843333, size.height * 0.3570000, size.width * 0.8780000,
          size.height * 0.3596667, size.width * 0.8726667, size.height * 0.3653333)
      ..cubicTo(size.width * 0.8676667, size.height * 0.3710000, size.width * 0.8650000,
          size.height * 0.3776667, size.width * 0.8650000, size.height * 0.3856667)
      ..close();
  }

  Path _dayFogPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.01066667, size.height * 0.7020000)
      ..cubicTo(size.width * 0.01066667, size.height * 0.7096667, size.width * 0.01333333,
          size.height * 0.7163333, size.width * 0.01900000, size.height * 0.7216667)
      ..cubicTo(size.width * 0.02466667, size.height * 0.7270000, size.width * 0.03166667,
          size.height * 0.7296667, size.width * 0.04000000, size.height * 0.7296667)
      ..lineTo(size.width * 0.6636667, size.height * 0.7296667)
      ..cubicTo(size.width * 0.6716667, size.height * 0.7296667, size.width * 0.6783333,
          size.height * 0.7270000, size.width * 0.6840000, size.height * 0.7216667)
      ..cubicTo(size.width * 0.6896667, size.height * 0.7163333, size.width * 0.6923333,
          size.height * 0.7100000, size.width * 0.6923333, size.height * 0.7020000)
      ..cubicTo(size.width * 0.6923333, size.height * 0.6940000, size.width * 0.6896667,
          size.height * 0.6873333, size.width * 0.6840000, size.height * 0.6820000)
      ..cubicTo(size.width * 0.6783333, size.height * 0.6763333, size.width * 0.6716667,
          size.height * 0.6736667, size.width * 0.6636667, size.height * 0.6736667)
      ..lineTo(size.width * 0.04000000, size.height * 0.6736667)
      ..cubicTo(size.width * 0.03166667, size.height * 0.6736667, size.width * 0.02466667,
          size.height * 0.6763333, size.width * 0.01900000, size.height * 0.6820000)
      ..cubicTo(size.width * 0.01333333, size.height * 0.6876667, size.width * 0.01066667,
          size.height * 0.6940000, size.width * 0.01066667, size.height * 0.7020000)
      ..close()
      ..moveTo(size.width * 0.09800000, size.height * 0.5973333)
      ..cubicTo(size.width * 0.09800000, size.height * 0.6050000, size.width * 0.1006667,
          size.height * 0.6116667, size.width * 0.1063333, size.height * 0.6166667)
      ..cubicTo(size.width * 0.1120000, size.height * 0.6226667, size.width * 0.1186667,
          size.height * 0.6256667, size.width * 0.1263333, size.height * 0.6256667)
      ..lineTo(size.width * 0.7503333, size.height * 0.6256667)
      ..cubicTo(size.width * 0.7580000, size.height * 0.6256667, size.width * 0.7646667,
          size.height * 0.6230000, size.width * 0.7700000, size.height * 0.6173333)
      ..cubicTo(size.width * 0.7753333, size.height * 0.6116667, size.width * 0.7780000,
          size.height * 0.6050000, size.width * 0.7780000, size.height * 0.5973333)
      ..cubicTo(size.width * 0.7780000, size.height * 0.5896667, size.width * 0.7753333,
          size.height * 0.5830000, size.width * 0.7703333, size.height * 0.5776667)
      ..cubicTo(size.width * 0.7650000, size.height * 0.5723333, size.width * 0.7586667,
          size.height * 0.5696667, size.width * 0.7506667, size.height * 0.5696667)
      ..lineTo(size.width * 0.1266667, size.height * 0.5696667)
      ..cubicTo(size.width * 0.1186667, size.height * 0.5696667, size.width * 0.1120000,
          size.height * 0.5723333, size.width * 0.1066667, size.height * 0.5776667)
      ..cubicTo(size.width * 0.1010000, size.height * 0.5833333, size.width * 0.09800000,
          size.height * 0.5896667, size.width * 0.09800000, size.height * 0.5973333)
      ..close()
      ..moveTo(size.width * 0.1023333, size.height * 0.5173333)
      ..cubicTo(size.width * 0.1023333, size.height * 0.5203333, size.width * 0.1040000,
          size.height * 0.5216667, size.width * 0.1076667, size.height * 0.5216667)
      ..lineTo(size.width * 0.1553333, size.height * 0.5216667)
      ..cubicTo(size.width * 0.1576667, size.height * 0.5216667, size.width * 0.1600000,
          size.height * 0.5200000, size.width * 0.1623333, size.height * 0.5163333)
      ..cubicTo(size.width * 0.1703333, size.height * 0.4990000, size.width * 0.1820000,
          size.height * 0.4850000, size.width * 0.1976667, size.height * 0.4740000)
      ..cubicTo(size.width * 0.2133333, size.height * 0.4630000, size.width * 0.2306667,
          size.height * 0.4566667, size.width * 0.2496667, size.height * 0.4553333)
      ..lineTo(size.width * 0.2676667, size.height * 0.4530000)
      ..cubicTo(size.width * 0.2713333, size.height * 0.4530000, size.width * 0.2733333,
          size.height * 0.4510000, size.width * 0.2733333, size.height * 0.4470000)
      ..lineTo(size.width * 0.2756667, size.height * 0.4300000)
      ..cubicTo(size.width * 0.2793333, size.height * 0.3940000, size.width * 0.2943333,
          size.height * 0.3640000, size.width * 0.3213333, size.height * 0.3396667)
      ..cubicTo(size.width * 0.3483333, size.height * 0.3156667, size.width * 0.3800000,
          size.height * 0.3033333, size.width * 0.4166667, size.height * 0.3033333)
      ..cubicTo(size.width * 0.4526667, size.height * 0.3033333, size.width * 0.4843333,
          size.height * 0.3153333, size.width * 0.5113333, size.height * 0.3393333)
      ..cubicTo(size.width * 0.5383333, size.height * 0.3633333, size.width * 0.5536667,
          size.height * 0.3930000, size.width * 0.5573333, size.height * 0.4286667)
      ..lineTo(size.width * 0.5596667, size.height * 0.4480000)
      ..cubicTo(size.width * 0.5596667, size.height * 0.4516667, size.width * 0.5616667,
          size.height * 0.4536667, size.width * 0.5660000, size.height * 0.4536667)
      ..lineTo(size.width * 0.6196667, size.height * 0.4536667)
      ..cubicTo(size.width * 0.6410000, size.height * 0.4536667, size.width * 0.6606667,
          size.height * 0.4593333, size.width * 0.6783333, size.height * 0.4710000)
      ..cubicTo(size.width * 0.6960000, size.height * 0.4823333, size.width * 0.7090000,
          size.height * 0.4976667, size.width * 0.7176667, size.height * 0.5166667)
      ..cubicTo(size.width * 0.7200000, size.height * 0.5203333, size.width * 0.7220000,
          size.height * 0.5220000, size.width * 0.7243333, size.height * 0.5220000)
      ..lineTo(size.width * 0.7723333, size.height * 0.5220000)
      ..cubicTo(size.width * 0.7766667, size.height * 0.5220000, size.width * 0.7783333,
          size.height * 0.5196667, size.width * 0.7766667, size.height * 0.5143333)
      ..lineTo(size.width * 0.7700000, size.height * 0.4960000)
      ..cubicTo(size.width * 0.7953333, size.height * 0.4646667, size.width * 0.8076667,
          size.height * 0.4280000, size.width * 0.8076667, size.height * 0.3856667)
      ..cubicTo(size.width * 0.8076667, size.height * 0.3620000, size.width * 0.8030000,
          size.height * 0.3396667, size.width * 0.7940000, size.height * 0.3180000)
      ..cubicTo(size.width * 0.7850000, size.height * 0.2963333, size.width * 0.7726667,
          size.height * 0.2780000, size.width * 0.7570000, size.height * 0.2623333)
      ..cubicTo(size.width * 0.7416667, size.height * 0.2466667, size.width * 0.7230000,
          size.height * 0.2343333, size.width * 0.7013333, size.height * 0.2250000)
      ..cubicTo(size.width * 0.6796667, size.height * 0.2156667, size.width * 0.6573333,
          size.height * 0.2116667, size.width * 0.6333333, size.height * 0.2116667)
      ..cubicTo(size.width * 0.5820000, size.height * 0.2116667, size.width * 0.5393333,
          size.height * 0.2303333, size.width * 0.5060000, size.height * 0.2676667)
      ..cubicTo(size.width * 0.4776667, size.height * 0.2536667, size.width * 0.4480000,
          size.height * 0.2466667, size.width * 0.4166667, size.height * 0.2466667)
      ..cubicTo(size.width * 0.3700000, size.height * 0.2466667, size.width * 0.3283333,
          size.height * 0.2613333, size.width * 0.2920000, size.height * 0.2906667)
      ..cubicTo(size.width * 0.2556667, size.height * 0.3200000, size.width * 0.2323333,
          size.height * 0.3573333, size.width * 0.2220000, size.height * 0.4030000)
      ..cubicTo(size.width * 0.1626667, size.height * 0.4186667, size.width * 0.1226667,
          size.height * 0.4556667, size.width * 0.1026667, size.height * 0.5146667)
      ..cubicTo(size.width * 0.1023333, size.height * 0.5150000, size.width * 0.1023333,
          size.height * 0.5160000, size.width * 0.1023333, size.height * 0.5173333)
      ..close()
      ..moveTo(size.width * 0.1563333, size.height * 0.8043333)
      ..cubicTo(size.width * 0.1563333, size.height * 0.8123333, size.width * 0.1593333,
          size.height * 0.8190000, size.width * 0.1653333, size.height * 0.8243333)
      ..cubicTo(size.width * 0.1706667, size.height * 0.8300000, size.width * 0.1770000,
          size.height * 0.8330000, size.width * 0.1850000, size.height * 0.8330000)
      ..lineTo(size.width * 0.8096667, size.height * 0.8330000)
      ..cubicTo(size.width * 0.8173333, size.height * 0.8330000, size.width * 0.8240000,
          size.height * 0.8303333, size.width * 0.8296667, size.height * 0.8246667)
      ..cubicTo(size.width * 0.8353333, size.height * 0.8190000, size.width * 0.8380000,
          size.height * 0.8123333, size.width * 0.8380000, size.height * 0.8043333)
      ..cubicTo(size.width * 0.8380000, size.height * 0.7966667, size.width * 0.8353333,
          size.height * 0.7903333, size.width * 0.8296667, size.height * 0.7850000)
      ..cubicTo(size.width * 0.8240000, size.height * 0.7800000, size.width * 0.8173333,
          size.height * 0.7773333, size.width * 0.8096667, size.height * 0.7773333)
      ..lineTo(size.width * 0.1850000, size.height * 0.7773333)
      ..cubicTo(size.width * 0.1770000, size.height * 0.7773333, size.width * 0.1703333,
          size.height * 0.7800000, size.width * 0.1646667, size.height * 0.7850000)
      ..cubicTo(size.width * 0.1590000, size.height * 0.7903333, size.width * 0.1563333,
          size.height * 0.7966667, size.width * 0.1563333, size.height * 0.8043333)
      ..close()
      ..moveTo(size.width * 0.3753333, size.height * 0.1553333)
      ..cubicTo(size.width * 0.3753333, size.height * 0.1633333, size.width * 0.3780000,
          size.height * 0.1696667, size.width * 0.3830000, size.height * 0.1750000)
      ..lineTo(size.width * 0.4046667, size.height * 0.1963333)
      ..cubicTo(size.width * 0.4103333, size.height * 0.2023333, size.width * 0.4166667,
          size.height * 0.2053333, size.width * 0.4240000, size.height * 0.2053333)
      ..cubicTo(size.width * 0.4313333, size.height * 0.2053333, size.width * 0.4380000,
          size.height * 0.2026667, size.width * 0.4440000, size.height * 0.1970000)
      ..cubicTo(size.width * 0.4496667, size.height * 0.1913333, size.width * 0.4526667,
          size.height * 0.1846667, size.width * 0.4526667, size.height * 0.1766667)
      ..cubicTo(size.width * 0.4526667, size.height * 0.1686667, size.width * 0.4500000,
          size.height * 0.1616667, size.width * 0.4443333, size.height * 0.1556667)
      ..lineTo(size.width * 0.4230000, size.height * 0.1353333)
      ..cubicTo(size.width * 0.4176667, size.height * 0.1296667, size.width * 0.4110000,
          size.height * 0.1266667, size.width * 0.4030000, size.height * 0.1266667)
      ..cubicTo(size.width * 0.3950000, size.height * 0.1266667, size.width * 0.3883333,
          size.height * 0.1293333, size.width * 0.3830000, size.height * 0.1350000)
      ..cubicTo(size.width * 0.3780000, size.height * 0.1403333, size.width * 0.3753333,
          size.height * 0.1473333, size.width * 0.3753333, size.height * 0.1553333)
      ..close()
      ..moveTo(size.width * 0.5526667, size.height * 0.3013333)
      ..cubicTo(size.width * 0.5750000, size.height * 0.2786667, size.width * 0.6020000,
          size.height * 0.2676667, size.width * 0.6336667, size.height * 0.2676667)
      ..cubicTo(size.width * 0.6663333, size.height * 0.2676667, size.width * 0.6943333,
          size.height * 0.2793333, size.width * 0.7173333, size.height * 0.3023333)
      ..cubicTo(size.width * 0.7403333, size.height * 0.3253333, size.width * 0.7520000,
          size.height * 0.3533333, size.width * 0.7520000, size.height * 0.3856667)
      ..cubicTo(size.width * 0.7520000, size.height * 0.4073333, size.width * 0.7466667,
          size.height * 0.4273333, size.width * 0.7356667, size.height * 0.4456667)
      ..cubicTo(size.width * 0.7040000, size.height * 0.4140000, size.width * 0.6653333,
          size.height * 0.3983333, size.width * 0.6200000, size.height * 0.3983333)
      ..lineTo(size.width * 0.6086667, size.height * 0.3983333)
      ..cubicTo(size.width * 0.5990000, size.height * 0.3590000, size.width * 0.5803333,
          size.height * 0.3266667, size.width * 0.5526667, size.height * 0.3013333)
      ..close()
      ..moveTo(size.width * 0.6060000, size.height * 0.1270000)
      ..cubicTo(size.width * 0.6060000, size.height * 0.1346667, size.width * 0.6086667,
          size.height * 0.1413333, size.width * 0.6140000, size.height * 0.1466667)
      ..cubicTo(size.width * 0.6193333, size.height * 0.1520000, size.width * 0.6256667,
          size.height * 0.1546667, size.width * 0.6336667, size.height * 0.1546667)
      ..cubicTo(size.width * 0.6420000, size.height * 0.1546667, size.width * 0.6490000,
          size.height * 0.1520000, size.width * 0.6546667, size.height * 0.1466667)
      ..cubicTo(size.width * 0.6603333, size.height * 0.1413333, size.width * 0.6630000,
          size.height * 0.1350000, size.width * 0.6630000, size.height * 0.1270000)
      ..lineTo(size.width * 0.6630000, size.height * 0.05866667)
      ..cubicTo(size.width * 0.6630000, size.height * 0.05100000, size.width * 0.6600000,
          size.height * 0.04433333, size.width * 0.6543333, size.height * 0.03866667)
      ..cubicTo(size.width * 0.6483333, size.height * 0.03300000, size.width * 0.6413333,
          size.height * 0.03033333, size.width * 0.6333333, size.height * 0.03033333)
      ..cubicTo(size.width * 0.6256667, size.height * 0.03033333, size.width * 0.6190000,
          size.height * 0.03300000, size.width * 0.6136667, size.height * 0.03866667)
      ..cubicTo(size.width * 0.6083333, size.height * 0.04433333, size.width * 0.6056667,
          size.height * 0.05100000, size.width * 0.6056667, size.height * 0.05866667)
      ..lineTo(size.width * 0.6056667, size.height * 0.1270000)
      ..close()
      ..moveTo(size.width * 0.7890000, size.height * 0.2026667)
      ..cubicTo(size.width * 0.7890000, size.height * 0.2100000, size.width * 0.7916667,
          size.height * 0.2170000, size.width * 0.7970000, size.height * 0.2226667)
      ..cubicTo(size.width * 0.8093333, size.height * 0.2346667, size.width * 0.8230000,
          size.height * 0.2346667, size.width * 0.8380000, size.height * 0.2226667)
      ..lineTo(size.width * 0.8856667, size.height * 0.1750000)
      ..cubicTo(size.width * 0.8910000, size.height * 0.1690000, size.width * 0.8936667,
          size.height * 0.1620000, size.width * 0.8936667, size.height * 0.1536667)
      ..cubicTo(size.width * 0.8936667, size.height * 0.1460000, size.width * 0.8910000,
          size.height * 0.1393333, size.width * 0.8856667, size.height * 0.1340000)
      ..cubicTo(size.width * 0.8803333, size.height * 0.1286667, size.width * 0.8736667,
          size.height * 0.1260000, size.width * 0.8660000, size.height * 0.1260000)
      ..cubicTo(size.width * 0.8580000, size.height * 0.1260000, size.width * 0.8513333,
          size.height * 0.1286667, size.width * 0.8460000, size.height * 0.1340000)
      ..lineTo(size.width * 0.7973333, size.height * 0.1830000)
      ..cubicTo(size.width * 0.7916667, size.height * 0.1890000, size.width * 0.7890000,
          size.height * 0.1956667, size.width * 0.7890000, size.height * 0.2026667)
      ..close()
      ..moveTo(size.width * 0.8160000, size.height * 0.5960000)
      ..cubicTo(size.width * 0.8160000, size.height * 0.6040000, size.width * 0.8190000,
          size.height * 0.6106667, size.width * 0.8246667, size.height * 0.6160000)
      ..lineTo(size.width * 0.8460000, size.height * 0.6376667)
      ..cubicTo(size.width * 0.8513333, size.height * 0.6430000, size.width * 0.8580000,
          size.height * 0.6456667, size.width * 0.8653333, size.height * 0.6456667)
      ..cubicTo(size.width * 0.8723333, size.height * 0.6456667, size.width * 0.8790000,
          size.height * 0.6430000, size.width * 0.8856667, size.height * 0.6376667)
      ..cubicTo(size.width * 0.8910000, size.height * 0.6320000, size.width * 0.8936667,
          size.height * 0.6246667, size.width * 0.8936667, size.height * 0.6163333)
      ..cubicTo(size.width * 0.8936667, size.height * 0.6090000, size.width * 0.8910000,
          size.height * 0.6026667, size.width * 0.8856667, size.height * 0.5976667)
      ..lineTo(size.width * 0.8640000, size.height * 0.5756667)
      ..cubicTo(size.width * 0.8580000, size.height * 0.5703333, size.width * 0.8513333,
          size.height * 0.5676667, size.width * 0.8440000, size.height * 0.5676667)
      ..cubicTo(size.width * 0.8360000, size.height * 0.5676667, size.width * 0.8293333,
          size.height * 0.5703333, size.width * 0.8240000, size.height * 0.5760000)
      ..cubicTo(size.width * 0.8186667, size.height * 0.5813333, size.width * 0.8160000,
          size.height * 0.5880000, size.width * 0.8160000, size.height * 0.5960000)
      ..close()
      ..moveTo(size.width * 0.8653333, size.height * 0.3856667)
      ..cubicTo(size.width * 0.8653333, size.height * 0.3936667, size.width * 0.8683333,
          size.height * 0.4003333, size.width * 0.8740000, size.height * 0.4056667)
      ..cubicTo(size.width * 0.8790000, size.height * 0.4113333, size.width * 0.8856667,
          size.height * 0.4140000, size.width * 0.8936667, size.height * 0.4140000)
      ..lineTo(size.width * 0.9620000, size.height * 0.4140000)
      ..cubicTo(size.width * 0.9696667, size.height * 0.4140000, size.width * 0.9763333,
          size.height * 0.4113333, size.width * 0.9816667, size.height * 0.4056667)
      ..cubicTo(size.width * 0.9870000, size.height * 0.4000000, size.width * 0.9896667,
          size.height * 0.3933333, size.width * 0.9896667, size.height * 0.3856667)
      ..cubicTo(size.width * 0.9896667, size.height * 0.3776667, size.width * 0.9870000,
          size.height * 0.3710000, size.width * 0.9816667, size.height * 0.3656667)
      ..cubicTo(size.width * 0.9763333, size.height * 0.3603333, size.width * 0.9700000,
          size.height * 0.3576667, size.width * 0.9620000, size.height * 0.3576667)
      ..lineTo(size.width * 0.8936667, size.height * 0.3576667)
      ..cubicTo(size.width * 0.8856667, size.height * 0.3576667, size.width * 0.8790000,
          size.height * 0.3603333, size.width * 0.8736667, size.height * 0.3660000)
      ..cubicTo(size.width * 0.8680000, size.height * 0.3713333, size.width * 0.8653333,
          size.height * 0.3780000, size.width * 0.8653333, size.height * 0.3856667)
      ..close();
  }

  Path _dayHailPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.04933333, size.height * 0.5626667)
      ..cubicTo(size.width * 0.04933333, size.height * 0.6073333, size.width * 0.06500000,
          size.height * 0.6456667, size.width * 0.09600000, size.height * 0.6776667)
      ..cubicTo(size.width * 0.1270000, size.height * 0.7096667, size.width * 0.1650000,
          size.height * 0.7266667, size.width * 0.2093333, size.height * 0.7286667)
      ..cubicTo(size.width * 0.2133333, size.height * 0.7286667, size.width * 0.2153333,
          size.height * 0.7266667, size.width * 0.2153333, size.height * 0.7230000)
      ..lineTo(size.width * 0.2153333, size.height * 0.6783333)
      ..cubicTo(size.width * 0.2153333, size.height * 0.6743333, size.width * 0.2133333,
          size.height * 0.6723333, size.width * 0.2093333, size.height * 0.6723333)
      ..cubicTo(size.width * 0.1806667, size.height * 0.6710000, size.width * 0.1563333,
          size.height * 0.6593333, size.width * 0.1363333, size.height * 0.6380000)
      ..cubicTo(size.width * 0.1163333, size.height * 0.6166667, size.width * 0.1063333,
          size.height * 0.5913333, size.width * 0.1063333, size.height * 0.5626667)
      ..cubicTo(size.width * 0.1063333, size.height * 0.5350000, size.width * 0.1156667,
          size.height * 0.5110000, size.width * 0.1346667, size.height * 0.4903333)
      ..cubicTo(size.width * 0.1536667, size.height * 0.4696667, size.width * 0.1770000,
          size.height * 0.4580000, size.width * 0.2046667, size.height * 0.4546667)
      ..lineTo(size.width * 0.2223333, size.height * 0.4533333)
      ..cubicTo(size.width * 0.2266667, size.height * 0.4533333, size.width * 0.2290000,
          size.height * 0.4513333, size.width * 0.2290000, size.height * 0.4473333)
      ..lineTo(size.width * 0.2313333, size.height * 0.4290000)
      ..cubicTo(size.width * 0.2350000, size.height * 0.3930000, size.width * 0.2500000,
          size.height * 0.3626667, size.width * 0.2770000, size.height * 0.3386667)
      ..cubicTo(size.width * 0.3040000, size.height * 0.3143333, size.width * 0.3356667,
          size.height * 0.3023333, size.width * 0.3723333, size.height * 0.3023333)
      ..cubicTo(size.width * 0.4086667, size.height * 0.3023333, size.width * 0.4403333,
          size.height * 0.3143333, size.width * 0.4676667, size.height * 0.3386667)
      ..cubicTo(size.width * 0.4950000, size.height * 0.3630000, size.width * 0.5106667,
          size.height * 0.3930000, size.width * 0.5143333, size.height * 0.4290000)
      ..lineTo(size.width * 0.5166667, size.height * 0.4483333)
      ..cubicTo(size.width * 0.5166667, size.height * 0.4523333, size.width * 0.5186667,
          size.height * 0.4546667, size.width * 0.5223333, size.height * 0.4546667)
      ..lineTo(size.width * 0.5763333, size.height * 0.4546667)
      ..cubicTo(size.width * 0.6060000, size.height * 0.4546667, size.width * 0.6320000,
          size.height * 0.4653333, size.width * 0.6536667, size.height * 0.4866667)
      ..cubicTo(size.width * 0.6753333, size.height * 0.5080000, size.width * 0.6863333,
          size.height * 0.5333333, size.width * 0.6863333, size.height * 0.5623333)
      ..cubicTo(size.width * 0.6863333, size.height * 0.5913333, size.width * 0.6763333,
          size.height * 0.6163333, size.width * 0.6560000, size.height * 0.6376667)
      ..cubicTo(size.width * 0.6356667, size.height * 0.6590000, size.width * 0.6113333,
          size.height * 0.6703333, size.width * 0.5830000, size.height * 0.6720000)
      ..cubicTo(size.width * 0.5786667, size.height * 0.6720000, size.width * 0.5763333,
          size.height * 0.6740000, size.width * 0.5763333, size.height * 0.6780000)
      ..lineTo(size.width * 0.5763333, size.height * 0.7226667)
      ..cubicTo(size.width * 0.5763333, size.height * 0.7263333, size.width * 0.5786667,
          size.height * 0.7283333, size.width * 0.5830000, size.height * 0.7283333)
      ..cubicTo(size.width * 0.6276667, size.height * 0.7270000, size.width * 0.6653333,
          size.height * 0.7100000, size.width * 0.6960000, size.height * 0.6780000)
      ..cubicTo(size.width * 0.7270000, size.height * 0.6456667, size.width * 0.7423333,
          size.height * 0.6073333, size.width * 0.7423333, size.height * 0.5626667)
      ..cubicTo(size.width * 0.7423333, size.height * 0.5380000, size.width * 0.7376667,
          size.height * 0.5156667, size.width * 0.7286667, size.height * 0.4956667)
      ..cubicTo(size.width * 0.7550000, size.height * 0.4636667, size.width * 0.7680000,
          size.height * 0.4266667, size.width * 0.7680000, size.height * 0.3846667)
      ..cubicTo(size.width * 0.7680000, size.height * 0.3533333, size.width * 0.7600000,
          size.height * 0.3240000, size.width * 0.7443333, size.height * 0.2970000)
      ..cubicTo(size.width * 0.7283333, size.height * 0.2700000, size.width * 0.7070000,
          size.height * 0.2486667, size.width * 0.6800000, size.height * 0.2326667)
      ..cubicTo(size.width * 0.6530000, size.height * 0.2170000, size.width * 0.6236667,
          size.height * 0.2090000, size.width * 0.5923333, size.height * 0.2090000)
      ..cubicTo(size.width * 0.5403333, size.height * 0.2090000, size.width * 0.4970000,
          size.height * 0.2283333, size.width * 0.4623333, size.height * 0.2673333)
      ..cubicTo(size.width * 0.4356667, size.height * 0.2526667, size.width * 0.4056667,
          size.height * 0.2453333, size.width * 0.3720000, size.height * 0.2453333)
      ..cubicTo(size.width * 0.3250000, size.height * 0.2453333, size.width * 0.2830000,
          size.height * 0.2600000, size.width * 0.2466667, size.height * 0.2890000)
      ..cubicTo(size.width * 0.2103333, size.height * 0.3180000, size.width * 0.1866667,
          size.height * 0.3556667, size.width * 0.1763333, size.height * 0.4013333)
      ..cubicTo(size.width * 0.1393333, size.height * 0.4100000, size.width * 0.1090000,
          size.height * 0.4293333, size.width * 0.08500000, size.height * 0.4593333)
      ..cubicTo(size.width * 0.06133333, size.height * 0.4900000, size.width * 0.04933333,
          size.height * 0.5243333, size.width * 0.04933333, size.height * 0.5626667)
      ..close()
      ..moveTo(size.width * 0.2273333, size.height * 0.7980000)
      ..cubicTo(size.width * 0.2306667, size.height * 0.8053333, size.width * 0.2356667,
          size.height * 0.8103333, size.width * 0.2426667, size.height * 0.8130000)
      ..cubicTo(size.width * 0.2493333, size.height * 0.8163333, size.width * 0.2563333,
          size.height * 0.8166667, size.width * 0.2636667, size.height * 0.8136667)
      ..cubicTo(size.width * 0.2710000, size.height * 0.8110000, size.width * 0.2760000,
          size.height * 0.8060000, size.width * 0.2786667, size.height * 0.7986667)
      ..cubicTo(size.width * 0.2820000, size.height * 0.7913333, size.width * 0.2823333,
          size.height * 0.7843333, size.width * 0.2793333, size.height * 0.7770000)
      ..cubicTo(size.width * 0.2766667, size.height * 0.7700000, size.width * 0.2716667,
          size.height * 0.7650000, size.width * 0.2643333, size.height * 0.7623333)
      ..cubicTo(size.width * 0.2576667, size.height * 0.7586667, size.width * 0.2506667,
          size.height * 0.7583333, size.width * 0.2436667, size.height * 0.7613333)
      ..cubicTo(size.width * 0.2363333, size.height * 0.7643333, size.width * 0.2313333,
          size.height * 0.7693333, size.width * 0.2280000, size.height * 0.7770000)
      ..cubicTo(size.width * 0.2246667, size.height * 0.7830000, size.width * 0.2243333,
          size.height * 0.7900000, size.width * 0.2273333, size.height * 0.7980000)
      ..close()
      ..moveTo(size.width * 0.2486667, size.height * 0.7033333)
      ..cubicTo(size.width * 0.2486667, size.height * 0.7080000, size.width * 0.2496667,
          size.height * 0.7123333, size.width * 0.2516667, size.height * 0.7160000)
      ..cubicTo(size.width * 0.2580000, size.height * 0.7263333, size.width * 0.2680000,
          size.height * 0.7313333, size.width * 0.2813333, size.height * 0.7313333)
      ..cubicTo(size.width * 0.2920000, size.height * 0.7313333, size.width * 0.2996667,
          size.height * 0.7240000, size.width * 0.3043333, size.height * 0.7096667)
      ..lineTo(size.width * 0.3390000, size.height * 0.6023333)
      ..cubicTo(size.width * 0.3416667, size.height * 0.5943333, size.width * 0.3410000,
          size.height * 0.5866667, size.width * 0.3366667, size.height * 0.5800000)
      ..cubicTo(size.width * 0.3323333, size.height * 0.5733333, size.width * 0.3263333,
          size.height * 0.5690000, size.width * 0.3183333, size.height * 0.5676667)
      ..cubicTo(size.width * 0.3113333, size.height * 0.5660000, size.width * 0.3043333,
          size.height * 0.5666667, size.width * 0.2976667, size.height * 0.5700000)
      ..cubicTo(size.width * 0.2910000, size.height * 0.5736667, size.width * 0.2863333,
          size.height * 0.5793333, size.width * 0.2840000, size.height * 0.5866667)
      ..lineTo(size.width * 0.2496667, size.height * 0.6940000)
      ..cubicTo(size.width * 0.2490000, size.height * 0.6973333, size.width * 0.2486667,
          size.height * 0.7006667, size.width * 0.2486667, size.height * 0.7033333)
      ..close()
      ..moveTo(size.width * 0.3110000, size.height * 0.8906667)
      ..cubicTo(size.width * 0.3110000, size.height * 0.8950000, size.width * 0.3116667,
          size.height * 0.8983333, size.width * 0.3126667, size.height * 0.9003333)
      ..cubicTo(size.width * 0.3156667, size.height * 0.9076667, size.width * 0.3206667,
          size.height * 0.9126667, size.width * 0.3276667, size.height * 0.9153333)
      ..cubicTo(size.width * 0.3306667, size.height * 0.9170000, size.width * 0.3346667,
          size.height * 0.9176667, size.width * 0.3393333, size.height * 0.9176667)
      ..cubicTo(size.width * 0.3413333, size.height * 0.9176667, size.width * 0.3446667,
          size.height * 0.9170000, size.width * 0.3493333, size.height * 0.9156667)
      ..cubicTo(size.width * 0.3566667, size.height * 0.9130000, size.width * 0.3620000,
          size.height * 0.9080000, size.width * 0.3650000, size.height * 0.9006667)
      ..cubicTo(size.width * 0.3680000, size.height * 0.8933333, size.width * 0.3683333,
          size.height * 0.8860000, size.width * 0.3650000, size.height * 0.8786667)
      ..cubicTo(size.width * 0.3616667, size.height * 0.8713333, size.width * 0.3566667,
          size.height * 0.8663333, size.width * 0.3500000, size.height * 0.8636667)
      ..cubicTo(size.width * 0.3433333, size.height * 0.8610000, size.width * 0.3363333,
          size.height * 0.8610000, size.width * 0.3293333, size.height * 0.8636667)
      ..cubicTo(size.width * 0.3230000, size.height * 0.8660000, size.width * 0.3183333,
          size.height * 0.8700000, size.width * 0.3153333, size.height * 0.8753333)
      ..cubicTo(size.width * 0.3123333, size.height * 0.8806667, size.width * 0.3110000,
          size.height * 0.8860000, size.width * 0.3110000, size.height * 0.8906667)
      ..close()
      ..moveTo(size.width * 0.3313333, size.height * 0.1523333)
      ..cubicTo(size.width * 0.3313333, size.height * 0.1606667, size.width * 0.3340000,
          size.height * 0.1673333, size.width * 0.3393333, size.height * 0.1723333)
      ..lineTo(size.width * 0.3610000, size.height * 0.1940000)
      ..cubicTo(size.width * 0.3663333, size.height * 0.1993333, size.width * 0.3723333,
          size.height * 0.2023333, size.width * 0.3790000, size.height * 0.2030000)
      ..cubicTo(size.width * 0.3860000, size.height * 0.2040000, size.width * 0.3926667,
          size.height * 0.2013333, size.width * 0.3993333, size.height * 0.1953333)
      ..cubicTo(size.width * 0.4060000, size.height * 0.1893333, size.width * 0.4093333,
          size.height * 0.1820000, size.width * 0.4093333, size.height * 0.1740000)
      ..cubicTo(size.width * 0.4093333, size.height * 0.1660000, size.width * 0.4066667,
          size.height * 0.1593333, size.width * 0.4013333, size.height * 0.1540000)
      ..lineTo(size.width * 0.3800000, size.height * 0.1326667)
      ..cubicTo(size.width * 0.3736667, size.height * 0.1270000, size.width * 0.3670000,
          size.height * 0.1243333, size.width * 0.3593333, size.height * 0.1243333)
      ..cubicTo(size.width * 0.3513333, size.height * 0.1243333, size.width * 0.3443333,
          size.height * 0.1270000, size.width * 0.3390000, size.height * 0.1323333)
      ..cubicTo(size.width * 0.3340000, size.height * 0.1380000, size.width * 0.3313333,
          size.height * 0.1446667, size.width * 0.3313333, size.height * 0.1523333)
      ..close()
      ..moveTo(size.width * 0.3353333, size.height * 0.8010000)
      ..cubicTo(size.width * 0.3353333, size.height * 0.8063333, size.width * 0.3370000,
          size.height * 0.8116667, size.width * 0.3406667, size.height * 0.8170000)
      ..cubicTo(size.width * 0.3443333, size.height * 0.8223333, size.width * 0.3496667,
          size.height * 0.8260000, size.width * 0.3566667, size.height * 0.8280000)
      ..cubicTo(size.width * 0.3603333, size.height * 0.8286667, size.width * 0.3630000,
          size.height * 0.8293333, size.width * 0.3646667, size.height * 0.8293333)
      ..cubicTo(size.width * 0.3696667, size.height * 0.8293333, size.width * 0.3740000,
          size.height * 0.8283333, size.width * 0.3773333, size.height * 0.8266667)
      ..cubicTo(size.width * 0.3840000, size.height * 0.8240000, size.width * 0.3886667,
          size.height * 0.8176667, size.width * 0.3916667, size.height * 0.8076667)
      ..lineTo(size.width * 0.4516667, size.height * 0.6030000)
      ..cubicTo(size.width * 0.4540000, size.height * 0.5950000, size.width * 0.4533333,
          size.height * 0.5880000, size.width * 0.4496667, size.height * 0.5813333)
      ..cubicTo(size.width * 0.4460000, size.height * 0.5746667, size.width * 0.4406667,
          size.height * 0.5703333, size.width * 0.4330000, size.height * 0.5683333)
      ..cubicTo(size.width * 0.4250000, size.height * 0.5660000, size.width * 0.4176667,
          size.height * 0.5666667, size.width * 0.4110000, size.height * 0.5703333)
      ..cubicTo(size.width * 0.4043333, size.height * 0.5740000, size.width * 0.3996667,
          size.height * 0.5793333, size.width * 0.3973333, size.height * 0.5873333)
      ..lineTo(size.width * 0.3360000, size.height * 0.7936667)
      ..cubicTo(size.width * 0.3356667, size.height * 0.7973333, size.width * 0.3353333,
          size.height * 0.8000000, size.width * 0.3353333, size.height * 0.8010000)
      ..close()
      ..moveTo(size.width * 0.4503333, size.height * 0.7880000)
      ..cubicTo(size.width * 0.4503333, size.height * 0.7923333, size.width * 0.4510000,
          size.height * 0.7956667, size.width * 0.4526667, size.height * 0.7983333)
      ..cubicTo(size.width * 0.4556667, size.height * 0.8053333, size.width * 0.4606667,
          size.height * 0.8100000, size.width * 0.4676667, size.height * 0.8130000)
      ..cubicTo(size.width * 0.4713333, size.height * 0.8146667, size.width * 0.4750000,
          size.height * 0.8156667, size.width * 0.4793333, size.height * 0.8156667)
      ..cubicTo(size.width * 0.4813333, size.height * 0.8156667, size.width * 0.4846667,
          size.height * 0.8150000, size.width * 0.4893333, size.height * 0.8136667)
      ..cubicTo(size.width * 0.4970000, size.height * 0.8106667, size.width * 0.5020000,
          size.height * 0.8060000, size.width * 0.5046667, size.height * 0.7990000)
      ..cubicTo(size.width * 0.5073333, size.height * 0.7916667, size.width * 0.5073333,
          size.height * 0.7846667, size.width * 0.5046667, size.height * 0.7780000)
      ..cubicTo(size.width * 0.5020000, size.height * 0.7713333, size.width * 0.4973333,
          size.height * 0.7663333, size.width * 0.4906667, size.height * 0.7630000)
      ..cubicTo(size.width * 0.4830000, size.height * 0.7593333, size.width * 0.4760000,
          size.height * 0.7590000, size.width * 0.4686667, size.height * 0.7620000)
      ..cubicTo(size.width * 0.4616667, size.height * 0.7650000, size.width * 0.4563333,
          size.height * 0.7700000, size.width * 0.4526667, size.height * 0.7776667)
      ..cubicTo(size.width * 0.4510000, size.height * 0.7803333, size.width * 0.4503333,
          size.height * 0.7836667, size.width * 0.4503333, size.height * 0.7880000)
      ..close()
      ..moveTo(size.width * 0.4743333, size.height * 0.7026667)
      ..cubicTo(size.width * 0.4743333, size.height * 0.7080000, size.width * 0.4760000,
          size.height * 0.7130000, size.width * 0.4793333, size.height * 0.7176667)
      ..cubicTo(size.width * 0.4826667, size.height * 0.7226667, size.width * 0.4880000,
          size.height * 0.7260000, size.width * 0.4946667, size.height * 0.7280000)
      ..cubicTo(size.width * 0.4976667, size.height * 0.7286667, size.width * 0.5003333,
          size.height * 0.7290000, size.width * 0.5030000, size.height * 0.7290000)
      ..cubicTo(size.width * 0.5160000, size.height * 0.7290000, size.width * 0.5246667,
          size.height * 0.7223333, size.width * 0.5293333, size.height * 0.7086667)
      ..lineTo(size.width * 0.5636667, size.height * 0.6026667)
      ..cubicTo(size.width * 0.5663333, size.height * 0.5950000, size.width * 0.5653333,
          size.height * 0.5876667, size.width * 0.5613333, size.height * 0.5810000)
      ..cubicTo(size.width * 0.5573333, size.height * 0.5743333, size.width * 0.5516667,
          size.height * 0.5700000, size.width * 0.5440000, size.height * 0.5680000)
      ..cubicTo(size.width * 0.5360000, size.height * 0.5656667, size.width * 0.5290000,
          size.height * 0.5663333, size.width * 0.5226667, size.height * 0.5700000)
      ..cubicTo(size.width * 0.5163333, size.height * 0.5736667, size.width * 0.5120000,
          size.height * 0.5790000, size.width * 0.5093333, size.height * 0.5870000)
      ..lineTo(size.width * 0.4753333, size.height * 0.6936667)
      ..cubicTo(size.width * 0.4750000, size.height * 0.6980000, size.width * 0.4743333,
          size.height * 0.7010000, size.width * 0.4743333, size.height * 0.7026667)
      ..close()
      ..moveTo(size.width * 0.5100000, size.height * 0.3000000)
      ..cubicTo(size.width * 0.5323333, size.height * 0.2786667, size.width * 0.5600000,
          size.height * 0.2676667, size.width * 0.5926667, size.height * 0.2676667)
      ..cubicTo(size.width * 0.6253333, size.height * 0.2676667, size.width * 0.6530000,
          size.height * 0.2790000, size.width * 0.6760000, size.height * 0.3020000)
      ..cubicTo(size.width * 0.6990000, size.height * 0.3246667, size.width * 0.7106667,
          size.height * 0.3523333, size.width * 0.7106667, size.height * 0.3850000)
      ..cubicTo(size.width * 0.7106667, size.height * 0.4056667, size.width * 0.7050000,
          size.height * 0.4263333, size.width * 0.6933333, size.height * 0.4466667)
      ..cubicTo(size.width * 0.6613333, size.height * 0.4146667, size.width * 0.6226667,
          size.height * 0.3986667, size.width * 0.5763333, size.height * 0.3986667)
      ..lineTo(size.width * 0.5666667, size.height * 0.3986667)
      ..cubicTo(size.width * 0.5566667, size.height * 0.3600000, size.width * 0.5380000,
          size.height * 0.3270000, size.width * 0.5100000, size.height * 0.3000000)
      ..close()
      ..moveTo(size.width * 0.5640000, size.height * 0.1243333)
      ..cubicTo(size.width * 0.5640000, size.height * 0.1323333, size.width * 0.5666667,
          size.height * 0.1390000, size.width * 0.5723333, size.height * 0.1446667)
      ..cubicTo(size.width * 0.5780000, size.height * 0.1503333, size.width * 0.5846667,
          size.height * 0.1530000, size.width * 0.5926667, size.height * 0.1530000)
      ..cubicTo(size.width * 0.6003333, size.height * 0.1530000, size.width * 0.6070000,
          size.height * 0.1503333, size.width * 0.6123333, size.height * 0.1446667)
      ..cubicTo(size.width * 0.6176667, size.height * 0.1390000, size.width * 0.6203333,
          size.height * 0.1323333, size.width * 0.6203333, size.height * 0.1243333)
      ..lineTo(size.width * 0.6203333, size.height * 0.05566667)
      ..cubicTo(size.width * 0.6203333, size.height * 0.04766667, size.width * 0.6176667,
          size.height * 0.04100000, size.width * 0.6123333, size.height * 0.03533333)
      ..cubicTo(size.width * 0.6070000, size.height * 0.02966667, size.width * 0.6006667,
          size.height * 0.02700000, size.width * 0.5926667, size.height * 0.02700000)
      ..cubicTo(size.width * 0.5846667, size.height * 0.02700000, size.width * 0.5780000,
          size.height * 0.02966667, size.width * 0.5723333, size.height * 0.03533333)
      ..cubicTo(size.width * 0.5666667, size.height * 0.04100000, size.width * 0.5640000,
          size.height * 0.04766667, size.width * 0.5640000, size.height * 0.05566667)
      ..lineTo(size.width * 0.5640000, size.height * 0.1243333)
      ..close()
      ..moveTo(size.width * 0.7490000, size.height * 0.2006667)
      ..cubicTo(size.width * 0.7490000, size.height * 0.2086667, size.width * 0.7516667,
          size.height * 0.2153333, size.width * 0.7573333, size.height * 0.2206667)
      ..cubicTo(size.width * 0.7623333, size.height * 0.2263333, size.width * 0.7686667,
          size.height * 0.2293333, size.width * 0.7766667, size.height * 0.2293333)
      ..cubicTo(size.width * 0.7843333, size.height * 0.2293333, size.width * 0.7913333,
          size.height * 0.2263333, size.width * 0.7966667, size.height * 0.2206667)
      ..lineTo(size.width * 0.8446667, size.height * 0.1726667)
      ..cubicTo(size.width * 0.8506667, size.height * 0.1676667, size.width * 0.8536667,
          size.height * 0.1610000, size.width * 0.8536667, size.height * 0.1526667)
      ..cubicTo(size.width * 0.8536667, size.height * 0.1446667, size.width * 0.8506667,
          size.height * 0.1380000, size.width * 0.8450000, size.height * 0.1323333)
      ..cubicTo(size.width * 0.8393333, size.height * 0.1266667, size.width * 0.8323333,
          size.height * 0.1240000, size.width * 0.8246667, size.height * 0.1240000)
      ..cubicTo(size.width * 0.8173333, size.height * 0.1240000, size.width * 0.8110000,
          size.height * 0.1270000, size.width * 0.8056667, size.height * 0.1330000)
      ..lineTo(size.width * 0.7573333, size.height * 0.1806667)
      ..cubicTo(size.width * 0.7520000, size.height * 0.1856667, size.width * 0.7490000,
          size.height * 0.1926667, size.width * 0.7490000, size.height * 0.2006667)
      ..close()
      ..moveTo(size.width * 0.7760000, size.height * 0.5973333)
      ..cubicTo(size.width * 0.7760000, size.height * 0.6050000, size.width * 0.7786667,
          size.height * 0.6116667, size.width * 0.7840000, size.height * 0.6173333)
      ..lineTo(size.width * 0.8060000, size.height * 0.6383333)
      ..cubicTo(size.width * 0.8106667, size.height * 0.6443333, size.width * 0.8173333,
          size.height * 0.6473333, size.width * 0.8260000, size.height * 0.6473333)
      ..cubicTo(size.width * 0.8340000, size.height * 0.6473333, size.width * 0.8403333,
          size.height * 0.6443333, size.width * 0.8450000, size.height * 0.6383333)
      ..cubicTo(size.width * 0.8510000, size.height * 0.6330000, size.width * 0.8540000,
          size.height * 0.6263333, size.width * 0.8540000, size.height * 0.6183333)
      ..cubicTo(size.width * 0.8540000, size.height * 0.6103333, size.width * 0.8510000,
          size.height * 0.6036667, size.width * 0.8450000, size.height * 0.5980000)
      ..lineTo(size.width * 0.8233333, size.height * 0.5773333)
      ..cubicTo(size.width * 0.8180000, size.height * 0.5713333, size.width * 0.8116667,
          size.height * 0.5686667, size.width * 0.8040000, size.height * 0.5686667)
      ..cubicTo(size.width * 0.7963333, size.height * 0.5686667, size.width * 0.7896667,
          size.height * 0.5713333, size.width * 0.7840000, size.height * 0.5770000)
      ..cubicTo(size.width * 0.7786667, size.height * 0.5826667, size.width * 0.7760000,
          size.height * 0.5896667, size.width * 0.7760000, size.height * 0.5973333)
      ..close()
      ..moveTo(size.width * 0.8246667, size.height * 0.3850000)
      ..cubicTo(size.width * 0.8246667, size.height * 0.3930000, size.width * 0.8276667,
          size.height * 0.3996667, size.width * 0.8333333, size.height * 0.4050000)
      ..cubicTo(size.width * 0.8393333, size.height * 0.4110000, size.width * 0.8460000,
          size.height * 0.4136667, size.width * 0.8540000, size.height * 0.4136667)
      ..lineTo(size.width * 0.9216667, size.height * 0.4136667)
      ..cubicTo(size.width * 0.9296667, size.height * 0.4136667, size.width * 0.9363333,
          size.height * 0.4110000, size.width * 0.9420000, size.height * 0.4053333)
      ..cubicTo(size.width * 0.9476667, size.height * 0.3996667, size.width * 0.9506667,
          size.height * 0.3930000, size.width * 0.9506667, size.height * 0.3850000)
      ..cubicTo(size.width * 0.9506667, size.height * 0.3773333, size.width * 0.9480000,
          size.height * 0.3706667, size.width * 0.9423333, size.height * 0.3653333)
      ..cubicTo(size.width * 0.9366667, size.height * 0.3600000, size.width * 0.9296667,
          size.height * 0.3573333, size.width * 0.9216667, size.height * 0.3573333)
      ..lineTo(size.width * 0.8540000, size.height * 0.3573333)
      ..cubicTo(size.width * 0.8456667, size.height * 0.3573333, size.width * 0.8386667,
          size.height * 0.3600000, size.width * 0.8330000, size.height * 0.3653333)
      ..cubicTo(size.width * 0.8276667, size.height * 0.3706667, size.width * 0.8246667,
          size.height * 0.3773333, size.width * 0.8246667, size.height * 0.3850000)
      ..close();
  }

  Path _dayHazePath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1456667, size.height * 0.5206667)
      ..cubicTo(size.width * 0.1456667, size.height * 0.5126667, size.width * 0.1483333,
          size.height * 0.5060000, size.width * 0.1540000, size.height * 0.5003333)
      ..cubicTo(size.width * 0.1600000, size.height * 0.4946667, size.width * 0.1666667,
          size.height * 0.4920000, size.width * 0.1740000, size.height * 0.4920000)
      ..lineTo(size.width * 0.2420000, size.height * 0.4920000)
      ..cubicTo(size.width * 0.2496667, size.height * 0.4920000, size.width * 0.2560000,
          size.height * 0.4946667, size.width * 0.2613333, size.height * 0.5003333)
      ..cubicTo(size.width * 0.2663333, size.height * 0.5060000, size.width * 0.2690000,
          size.height * 0.5126667, size.width * 0.2690000, size.height * 0.5206667)
      ..cubicTo(size.width * 0.2690000, size.height * 0.5286667, size.width * 0.2663333,
          size.height * 0.5353333, size.width * 0.2613333, size.height * 0.5406667)
      ..cubicTo(size.width * 0.2563333, size.height * 0.5463333, size.width * 0.2496667,
          size.height * 0.5490000, size.width * 0.2420000, size.height * 0.5490000)
      ..lineTo(size.width * 0.1743333, size.height * 0.5490000)
      ..cubicTo(size.width * 0.1666667, size.height * 0.5490000, size.width * 0.1600000,
          size.height * 0.5463333, size.width * 0.1543333, size.height * 0.5406667)
      ..cubicTo(size.width * 0.1486667, size.height * 0.5350000, size.width * 0.1456667,
          size.height * 0.5283333, size.width * 0.1456667, size.height * 0.5206667)
      ..close()
      ..moveTo(size.width * 0.2410000, size.height * 0.2903333)
      ..cubicTo(size.width * 0.2410000, size.height * 0.2826667, size.width * 0.2436667,
          size.height * 0.2760000, size.width * 0.2486667, size.height * 0.2700000)
      ..cubicTo(size.width * 0.2553333, size.height * 0.2643333, size.width * 0.2623333,
          size.height * 0.2616667, size.width * 0.2700000, size.height * 0.2616667)
      ..cubicTo(size.width * 0.2770000, size.height * 0.2616667, size.width * 0.2836667,
          size.height * 0.2643333, size.width * 0.2896667, size.height * 0.2700000)
      ..lineTo(size.width * 0.3373333, size.height * 0.3186667)
      ..cubicTo(size.width * 0.3426667, size.height * 0.3236667, size.width * 0.3453333,
          size.height * 0.3303333, size.width * 0.3453333, size.height * 0.3383333)
      ..cubicTo(size.width * 0.3453333, size.height * 0.3463333, size.width * 0.3426667,
          size.height * 0.3530000, size.width * 0.3373333, size.height * 0.3583333)
      ..cubicTo(size.width * 0.3320000, size.height * 0.3636667, size.width * 0.3253333,
          size.height * 0.3663333, size.width * 0.3173333, size.height * 0.3663333)
      ..cubicTo(size.width * 0.3093333, size.height * 0.3663333, size.width * 0.3026667,
          size.height * 0.3636667, size.width * 0.2976667, size.height * 0.3583333)
      ..lineTo(size.width * 0.2490000, size.height * 0.3106667)
      ..cubicTo(size.width * 0.2436667, size.height * 0.3050000, size.width * 0.2410000,
          size.height * 0.2983333, size.width * 0.2410000, size.height * 0.2903333)
      ..close()
      ..moveTo(size.width * 0.2463333, size.height * 0.6006667)
      ..cubicTo(size.width * 0.2463333, size.height * 0.5933333, size.width * 0.2490000,
          size.height * 0.5870000, size.width * 0.2540000, size.height * 0.5823333)
      ..cubicTo(size.width * 0.2593333, size.height * 0.5776667, size.width * 0.2663333,
          size.height * 0.5750000, size.width * 0.2753333, size.height * 0.5750000)
      ..lineTo(size.width * 0.4656667, size.height * 0.5750000)
      ..cubicTo(size.width * 0.4746667, size.height * 0.5750000, size.width * 0.4816667,
          size.height * 0.5773333, size.width * 0.4870000, size.height * 0.5823333)
      ..cubicTo(size.width * 0.4923333, size.height * 0.5870000, size.width * 0.4950000,
          size.height * 0.5933333, size.width * 0.4950000, size.height * 0.6006667)
      ..cubicTo(size.width * 0.4950000, size.height * 0.6096667, size.width * 0.4923333,
          size.height * 0.6166667, size.width * 0.4873333, size.height * 0.6220000)
      ..cubicTo(size.width * 0.4820000, size.height * 0.6273333, size.width * 0.4750000,
          size.height * 0.6300000, size.width * 0.4656667, size.height * 0.6300000)
      ..lineTo(size.width * 0.2753333, size.height * 0.6300000)
      ..cubicTo(size.width * 0.2663333, size.height * 0.6300000, size.width * 0.2593333,
          size.height * 0.6273333, size.width * 0.2540000, size.height * 0.6223333)
      ..cubicTo(size.width * 0.2486667, size.height * 0.6173333, size.width * 0.2463333,
          size.height * 0.6096667, size.width * 0.2463333, size.height * 0.6006667)
      ..close()
      ..moveTo(size.width * 0.2793333, size.height * 0.6990000)
      ..cubicTo(size.width * 0.2793333, size.height * 0.6916667, size.width * 0.2823333,
          size.height * 0.6850000, size.width * 0.2886667, size.height * 0.6790000)
      ..cubicTo(size.width * 0.2946667, size.height * 0.6730000, size.width * 0.3016667,
          size.height * 0.6700000, size.width * 0.3086667, size.height * 0.6700000)
      ..cubicTo(size.width * 0.3173333, size.height * 0.6700000, size.width * 0.3243333,
          size.height * 0.6730000, size.width * 0.3296667, size.height * 0.6786667)
      ..cubicTo(size.width * 0.3350000, size.height * 0.6846667, size.width * 0.3376667,
          size.height * 0.6913333, size.width * 0.3376667, size.height * 0.6990000)
      ..cubicTo(size.width * 0.3376667, size.height * 0.7083333, size.width * 0.3350000,
          size.height * 0.7153333, size.width * 0.3300000, size.height * 0.7206667)
      ..cubicTo(size.width * 0.3250000, size.height * 0.7260000, size.width * 0.3176667,
          size.height * 0.7283333, size.width * 0.3086667, size.height * 0.7283333)
      ..cubicTo(size.width * 0.3010000, size.height * 0.7283333, size.width * 0.2940000,
          size.height * 0.7256667, size.width * 0.2883333, size.height * 0.7203333)
      ..cubicTo(size.width * 0.2823333, size.height * 0.7150000, size.width * 0.2793333,
          size.height * 0.7076667, size.width * 0.2793333, size.height * 0.6990000)
      ..close()
      ..moveTo(size.width * 0.3263333, size.height * 0.5303333)
      ..lineTo(size.width * 0.3263333, size.height * 0.5280000)
      ..cubicTo(size.width * 0.3273333, size.height * 0.4860000, size.width * 0.3420000,
          size.height * 0.4496667, size.width * 0.3700000, size.height * 0.4186667)
      ..cubicTo(size.width * 0.3980000, size.height * 0.3876667, size.width * 0.4323333,
          size.height * 0.3690000, size.width * 0.4733333, size.height * 0.3623333)
      ..lineTo(size.width * 0.4750000, size.height * 0.3623333)
      ..cubicTo(size.width * 0.4813333, size.height * 0.3610000, size.width * 0.4900000,
          size.height * 0.3603333, size.width * 0.5003333, size.height * 0.3603333)
      ..cubicTo(size.width * 0.5106667, size.height * 0.3603333, size.width * 0.5193333,
          size.height * 0.3610000, size.width * 0.5256667, size.height * 0.3623333)
      ..lineTo(size.width * 0.5270000, size.height * 0.3623333)
      ..cubicTo(size.width * 0.5676667, size.height * 0.3686667, size.width * 0.6023333,
          size.height * 0.3876667, size.width * 0.6303333, size.height * 0.4186667)
      ..cubicTo(size.width * 0.6583333, size.height * 0.4496667, size.width * 0.6730000,
          size.height * 0.4860000, size.width * 0.6740000, size.height * 0.5280000)
      ..lineTo(size.width * 0.6740000, size.height * 0.5303333)
      ..cubicTo(size.width * 0.6740000, size.height * 0.5356667, size.width * 0.6713333,
          size.height * 0.5383333, size.width * 0.6663333, size.height * 0.5383333)
      ..lineTo(size.width * 0.6286667, size.height * 0.5383333)
      ..cubicTo(size.width * 0.6246667, size.height * 0.5383333, size.width * 0.6220000,
          size.height * 0.5373333, size.width * 0.6203333, size.height * 0.5353333)
      ..cubicTo(size.width * 0.6186667, size.height * 0.5333333, size.width * 0.6180000,
          size.height * 0.5313333, size.width * 0.6180000, size.height * 0.5293333)
      ..cubicTo(size.width * 0.6166667, size.height * 0.4983333, size.width * 0.6046667,
          size.height * 0.4720000, size.width * 0.5820000, size.height * 0.4503333)
      ..cubicTo(size.width * 0.5593333, size.height * 0.4286667, size.width * 0.5323333,
          size.height * 0.4180000, size.width * 0.5006667, size.height * 0.4180000)
      ..cubicTo(size.width * 0.4690000, size.height * 0.4180000, size.width * 0.4420000,
          size.height * 0.4286667, size.width * 0.4193333, size.height * 0.4503333)
      ..cubicTo(size.width * 0.3966667, size.height * 0.4720000, size.width * 0.3846667,
          size.height * 0.4983333, size.width * 0.3833333, size.height * 0.5293333)
      ..cubicTo(size.width * 0.3833333, size.height * 0.5313333, size.width * 0.3823333,
          size.height * 0.5333333, size.width * 0.3806667, size.height * 0.5353333)
      ..cubicTo(size.width * 0.3790000, size.height * 0.5373333, size.width * 0.3760000,
          size.height * 0.5383333, size.width * 0.3720000, size.height * 0.5383333)
      ..lineTo(size.width * 0.3343333, size.height * 0.5383333)
      ..cubicTo(size.width * 0.3290000, size.height * 0.5383333, size.width * 0.3263333,
          size.height * 0.5356667, size.width * 0.3263333, size.height * 0.5303333)
      ..close()
      ..moveTo(size.width * 0.3600000, size.height * 0.6990000)
      ..cubicTo(size.width * 0.3600000, size.height * 0.6913333, size.width * 0.3626667,
          size.height * 0.6846667, size.width * 0.3680000, size.height * 0.6786667)
      ..cubicTo(size.width * 0.3733333, size.height * 0.6730000, size.width * 0.3803333,
          size.height * 0.6700000, size.width * 0.3890000, size.height * 0.6700000)
      ..lineTo(size.width * 0.5166667, size.height * 0.6700000)
      ..cubicTo(size.width * 0.5240000, size.height * 0.6700000, size.width * 0.5306667,
          size.height * 0.6730000, size.width * 0.5366667, size.height * 0.6790000)
      ..cubicTo(size.width * 0.5426667, size.height * 0.6850000, size.width * 0.5460000,
          size.height * 0.6916667, size.width * 0.5460000, size.height * 0.6990000)
      ..cubicTo(size.width * 0.5460000, size.height * 0.7076667, size.width * 0.5430000,
          size.height * 0.7150000, size.width * 0.5370000, size.height * 0.7203333)
      ..cubicTo(size.width * 0.5310000, size.height * 0.7256667, size.width * 0.5243333,
          size.height * 0.7283333, size.width * 0.5166667, size.height * 0.7283333)
      ..lineTo(size.width * 0.3890000, size.height * 0.7283333)
      ..cubicTo(size.width * 0.3800000, size.height * 0.7283333, size.width * 0.3730000,
          size.height * 0.7256667, size.width * 0.3676667, size.height * 0.7206667)
      ..cubicTo(size.width * 0.3623333, size.height * 0.7153333, size.width * 0.3600000,
          size.height * 0.7083333, size.width * 0.3600000, size.height * 0.6990000)
      ..close()
      ..moveTo(size.width * 0.4713333, size.height * 0.2630000)
      ..lineTo(size.width * 0.4713333, size.height * 0.1953333)
      ..cubicTo(size.width * 0.4713333, size.height * 0.1873333, size.width * 0.4740000,
          size.height * 0.1806667, size.width * 0.4796667, size.height * 0.1750000)
      ..cubicTo(size.width * 0.4853333, size.height * 0.1693333, size.width * 0.4920000,
          size.height * 0.1666667, size.width * 0.5000000, size.height * 0.1666667)
      ..cubicTo(size.width * 0.5080000, size.height * 0.1666667, size.width * 0.5143333,
          size.height * 0.1693333, size.width * 0.5200000, size.height * 0.1750000)
      ..cubicTo(size.width * 0.5256667, size.height * 0.1806667, size.width * 0.5283333,
          size.height * 0.1873333, size.width * 0.5283333, size.height * 0.1953333)
      ..lineTo(size.width * 0.5283333, size.height * 0.2630000)
      ..cubicTo(size.width * 0.5283333, size.height * 0.2706667, size.width * 0.5256667,
          size.height * 0.2773333, size.width * 0.5200000, size.height * 0.2823333)
      ..cubicTo(size.width * 0.5143333, size.height * 0.2873333, size.width * 0.5076667,
          size.height * 0.2903333, size.width * 0.5000000, size.height * 0.2903333)
      ..cubicTo(size.width * 0.4923333, size.height * 0.2903333, size.width * 0.4853333,
          size.height * 0.2876667, size.width * 0.4800000, size.height * 0.2826667)
      ..cubicTo(size.width * 0.4746667, size.height * 0.2776667, size.width * 0.4713333,
          size.height * 0.2706667, size.width * 0.4713333, size.height * 0.2630000)
      ..close()
      ..moveTo(size.width * 0.5166667, size.height * 0.6006667)
      ..cubicTo(size.width * 0.5166667, size.height * 0.5936667, size.width * 0.5196667,
          size.height * 0.5876667, size.width * 0.5256667, size.height * 0.5826667)
      ..cubicTo(size.width * 0.5316667, size.height * 0.5776667, size.width * 0.5383333,
          size.height * 0.5750000, size.width * 0.5460000, size.height * 0.5750000)
      ..cubicTo(size.width * 0.5536667, size.height * 0.5750000, size.width * 0.5603333,
          size.height * 0.5776667, size.width * 0.5663333, size.height * 0.5826667)
      ..cubicTo(size.width * 0.5723333, size.height * 0.5876667, size.width * 0.5753333,
          size.height * 0.5936667, size.width * 0.5753333, size.height * 0.6006667)
      ..cubicTo(size.width * 0.5753333, size.height * 0.6093333, size.width * 0.5723333,
          size.height * 0.6166667, size.width * 0.5663333, size.height * 0.6220000)
      ..cubicTo(size.width * 0.5603333, size.height * 0.6273333, size.width * 0.5536667,
          size.height * 0.6300000, size.width * 0.5460000, size.height * 0.6300000)
      ..cubicTo(size.width * 0.5383333, size.height * 0.6300000, size.width * 0.5313333,
          size.height * 0.6273333, size.width * 0.5256667, size.height * 0.6220000)
      ..cubicTo(size.width * 0.5196667, size.height * 0.6163333, size.width * 0.5166667,
          size.height * 0.6093333, size.width * 0.5166667, size.height * 0.6006667)
      ..close()
      ..moveTo(size.width * 0.5680000, size.height * 0.6990000)
      ..cubicTo(size.width * 0.5680000, size.height * 0.6913333, size.width * 0.5706667,
          size.height * 0.6846667, size.width * 0.5760000, size.height * 0.6786667)
      ..cubicTo(size.width * 0.5813333, size.height * 0.6730000, size.width * 0.5886667,
          size.height * 0.6700000, size.width * 0.5973333, size.height * 0.6700000)
      ..lineTo(size.width * 0.6593333, size.height * 0.6700000)
      ..cubicTo(size.width * 0.6680000, size.height * 0.6700000, size.width * 0.6750000,
          size.height * 0.6730000, size.width * 0.6803333, size.height * 0.6786667)
      ..cubicTo(size.width * 0.6856667, size.height * 0.6846667, size.width * 0.6883333,
          size.height * 0.6913333, size.width * 0.6883333, size.height * 0.6990000)
      ..cubicTo(size.width * 0.6883333, size.height * 0.7083333, size.width * 0.6856667,
          size.height * 0.7153333, size.width * 0.6806667, size.height * 0.7206667)
      ..cubicTo(size.width * 0.6756667, size.height * 0.7260000, size.width * 0.6683333,
          size.height * 0.7283333, size.width * 0.6593333, size.height * 0.7283333)
      ..lineTo(size.width * 0.5973333, size.height * 0.7283333)
      ..cubicTo(size.width * 0.5883333, size.height * 0.7283333, size.width * 0.5813333,
          size.height * 0.7256667, size.width * 0.5760000, size.height * 0.7206667)
      ..cubicTo(size.width * 0.5706667, size.height * 0.7153333, size.width * 0.5680000,
          size.height * 0.7083333, size.width * 0.5680000, size.height * 0.6990000)
      ..close()
      ..moveTo(size.width * 0.5973333, size.height * 0.6006667)
      ..cubicTo(size.width * 0.5973333, size.height * 0.5936667, size.width * 0.6003333,
          size.height * 0.5876667, size.width * 0.6063333, size.height * 0.5826667)
      ..cubicTo(size.width * 0.6123333, size.height * 0.5776667, size.width * 0.6190000,
          size.height * 0.5750000, size.width * 0.6263333, size.height * 0.5750000)
      ..lineTo(size.width * 0.7286667, size.height * 0.5750000)
      ..cubicTo(size.width * 0.7360000, size.height * 0.5750000, size.width * 0.7420000,
          size.height * 0.5773333, size.width * 0.7466667, size.height * 0.5823333)
      ..cubicTo(size.width * 0.7513333, size.height * 0.5873333, size.width * 0.7540000,
          size.height * 0.5933333, size.width * 0.7540000, size.height * 0.6006667)
      ..cubicTo(size.width * 0.7540000, size.height * 0.6096667, size.width * 0.7516667,
          size.height * 0.6166667, size.width * 0.7470000, size.height * 0.6220000)
      ..cubicTo(size.width * 0.7423333, size.height * 0.6273333, size.width * 0.7363333,
          size.height * 0.6300000, size.width * 0.7286667, size.height * 0.6300000)
      ..lineTo(size.width * 0.6263333, size.height * 0.6300000)
      ..cubicTo(size.width * 0.6186667, size.height * 0.6300000, size.width * 0.6120000,
          size.height * 0.6273333, size.width * 0.6060000, size.height * 0.6220000)
      ..cubicTo(size.width * 0.6003333, size.height * 0.6163333, size.width * 0.5973333,
          size.height * 0.6093333, size.width * 0.5973333, size.height * 0.6006667)
      ..close()
      ..moveTo(size.width * 0.6553333, size.height * 0.3383333)
      ..cubicTo(size.width * 0.6553333, size.height * 0.3300000, size.width * 0.6580000,
          size.height * 0.3233333, size.width * 0.6630000, size.height * 0.3186667)
      ..lineTo(size.width * 0.7103333, size.height * 0.2700000)
      ..cubicTo(size.width * 0.7163333, size.height * 0.2643333, size.width * 0.7230000,
          size.height * 0.2616667, size.width * 0.7300000, size.height * 0.2616667)
      ..cubicTo(size.width * 0.7376667, size.height * 0.2616667, size.width * 0.7443333,
          size.height * 0.2643333, size.width * 0.7500000, size.height * 0.2700000)
      ..cubicTo(size.width * 0.7556667, size.height * 0.2756667, size.width * 0.7583333,
          size.height * 0.2823333, size.width * 0.7583333, size.height * 0.2903333)
      ..cubicTo(size.width * 0.7583333, size.height * 0.2983333, size.width * 0.7556667,
          size.height * 0.3053333, size.width * 0.7503333, size.height * 0.3106667)
      ..lineTo(size.width * 0.7016667, size.height * 0.3580000)
      ..cubicTo(size.width * 0.6956667, size.height * 0.3633333, size.width * 0.6890000,
          size.height * 0.3660000, size.width * 0.6816667, size.height * 0.3660000)
      ..cubicTo(size.width * 0.6740000, size.height * 0.3660000, size.width * 0.6680000,
          size.height * 0.3633333, size.width * 0.6630000, size.height * 0.3580000)
      ..cubicTo(size.width * 0.6580000, size.height * 0.3530000, size.width * 0.6553333,
          size.height * 0.3463333, size.width * 0.6553333, size.height * 0.3383333)
      ..close()
      ..moveTo(size.width * 0.7306667, size.height * 0.5206667)
      ..cubicTo(size.width * 0.7306667, size.height * 0.5130000, size.width * 0.7333333,
          size.height * 0.5063333, size.width * 0.7386667, size.height * 0.5003333)
      ..cubicTo(size.width * 0.7443333, size.height * 0.4946667, size.width * 0.7506667,
          size.height * 0.4920000, size.width * 0.7576667, size.height * 0.4920000)
      ..lineTo(size.width * 0.8250000, size.height * 0.4920000)
      ..cubicTo(size.width * 0.8326667, size.height * 0.4920000, size.width * 0.8393333,
          size.height * 0.4950000, size.width * 0.8450000, size.height * 0.5006667)
      ..cubicTo(size.width * 0.8506667, size.height * 0.5063333, size.width * 0.8536667,
          size.height * 0.5130000, size.width * 0.8536667, size.height * 0.5206667)
      ..cubicTo(size.width * 0.8536667, size.height * 0.5283333, size.width * 0.8506667,
          size.height * 0.5350000, size.width * 0.8450000, size.height * 0.5406667)
      ..cubicTo(size.width * 0.8393333, size.height * 0.5463333, size.width * 0.8326667,
          size.height * 0.5490000, size.width * 0.8250000, size.height * 0.5490000)
      ..lineTo(size.width * 0.7576667, size.height * 0.5490000)
      ..cubicTo(size.width * 0.7500000, size.height * 0.5490000, size.width * 0.7433333,
          size.height * 0.5463333, size.width * 0.7383333, size.height * 0.5406667)
      ..cubicTo(size.width * 0.7333333, size.height * 0.5350000, size.width * 0.7306667,
          size.height * 0.5286667, size.width * 0.7306667, size.height * 0.5206667)
      ..close();
  }

  Path _dayLightningPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.05200000, size.height * 0.5633333)
      ..cubicTo(size.width * 0.05200000, size.height * 0.6076667, size.width * 0.06733333,
          size.height * 0.6456667, size.width * 0.09833333, size.height * 0.6776667)
      ..cubicTo(size.width * 0.1293333, size.height * 0.7096667, size.width * 0.1670000,
          size.height * 0.7266667, size.width * 0.2116667, size.height * 0.7286667)
      ..cubicTo(size.width * 0.2153333, size.height * 0.7286667, size.width * 0.2173333,
          size.height * 0.7266667, size.width * 0.2173333, size.height * 0.7230000)
      ..lineTo(size.width * 0.2173333, size.height * 0.6773333)
      ..cubicTo(size.width * 0.2173333, size.height * 0.6733333, size.width * 0.2153333,
          size.height * 0.6713333, size.width * 0.2116667, size.height * 0.6713333)
      ..cubicTo(size.width * 0.1826667, size.height * 0.6690000, size.width * 0.1583333,
          size.height * 0.6576667, size.width * 0.1386667, size.height * 0.6366667)
      ..cubicTo(size.width * 0.1190000, size.height * 0.6160000, size.width * 0.1090000,
          size.height * 0.5913333, size.width * 0.1090000, size.height * 0.5630000)
      ..cubicTo(size.width * 0.1090000, size.height * 0.5350000, size.width * 0.1183333,
          size.height * 0.5106667, size.width * 0.1373333, size.height * 0.4900000)
      ..cubicTo(size.width * 0.1563333, size.height * 0.4693333, size.width * 0.1793333,
          size.height * 0.4576667, size.width * 0.2073333, size.height * 0.4553333)
      ..lineTo(size.width * 0.2246667, size.height * 0.4526667)
      ..cubicTo(size.width * 0.2290000, size.height * 0.4526667, size.width * 0.2313333,
          size.height * 0.4506667, size.width * 0.2313333, size.height * 0.4470000)
      ..lineTo(size.width * 0.2333333, size.height * 0.4300000)
      ..cubicTo(size.width * 0.2370000, size.height * 0.3940000, size.width * 0.2520000,
          size.height * 0.3636667, size.width * 0.2790000, size.height * 0.3396667)
      ..cubicTo(size.width * 0.3060000, size.height * 0.3153333, size.width * 0.3376667,
          size.height * 0.3033333, size.width * 0.3743333, size.height * 0.3033333)
      ..cubicTo(size.width * 0.4106667, size.height * 0.3033333, size.width * 0.4423333,
          size.height * 0.3153333, size.width * 0.4693333, size.height * 0.3396667)
      ..cubicTo(size.width * 0.4963333, size.height * 0.3636667, size.width * 0.5116667,
          size.height * 0.3940000, size.width * 0.5156667, size.height * 0.4303333)
      ..lineTo(size.width * 0.5180000, size.height * 0.4496667)
      ..cubicTo(size.width * 0.5180000, size.height * 0.4533333, size.width * 0.5200000,
          size.height * 0.4553333, size.width * 0.5243333, size.height * 0.4553333)
      ..lineTo(size.width * 0.5776667, size.height * 0.4553333)
      ..cubicTo(size.width * 0.6080000, size.height * 0.4553333, size.width * 0.6336667,
          size.height * 0.4660000, size.width * 0.6550000, size.height * 0.4870000)
      ..cubicTo(size.width * 0.6763333, size.height * 0.5080000, size.width * 0.6870000,
          size.height * 0.5333333, size.width * 0.6870000, size.height * 0.5630000)
      ..cubicTo(size.width * 0.6870000, size.height * 0.5913333, size.width * 0.6770000,
          size.height * 0.6160000, size.width * 0.6573333, size.height * 0.6366667)
      ..cubicTo(size.width * 0.6376667, size.height * 0.6573333, size.width * 0.6133333,
          size.height * 0.6690000, size.width * 0.5843333, size.height * 0.6713333)
      ..cubicTo(size.width * 0.5800000, size.height * 0.6713333, size.width * 0.5776667,
          size.height * 0.6733333, size.width * 0.5776667, size.height * 0.6773333)
      ..lineTo(size.width * 0.5776667, size.height * 0.7230000)
      ..cubicTo(size.width * 0.5776667, size.height * 0.7266667, size.width * 0.5800000,
          size.height * 0.7286667, size.width * 0.5843333, size.height * 0.7286667)
      ..cubicTo(size.width * 0.6286667, size.height * 0.7273333, size.width * 0.6663333,
          size.height * 0.7103333, size.width * 0.6970000, size.height * 0.6783333)
      ..cubicTo(size.width * 0.7276667, size.height * 0.6463333, size.width * 0.7430000,
          size.height * 0.6080000, size.width * 0.7430000, size.height * 0.5633333)
      ..cubicTo(size.width * 0.7430000, size.height * 0.5406667, size.width * 0.7376667,
          size.height * 0.5176667, size.width * 0.7273333, size.height * 0.4943333)
      ..cubicTo(size.width * 0.7533333, size.height * 0.4630000, size.width * 0.7666667,
          size.height * 0.4266667, size.width * 0.7666667, size.height * 0.3853333)
      ..cubicTo(size.width * 0.7666667, size.height * 0.3616667, size.width * 0.7620000,
          size.height * 0.3390000, size.width * 0.7526667, size.height * 0.3173333)
      ..cubicTo(size.width * 0.7433333, size.height * 0.2956667, size.width * 0.7310000,
          size.height * 0.2773333, size.width * 0.7153333, size.height * 0.2616667)
      ..cubicTo(size.width * 0.6996667, size.height * 0.2460000, size.width * 0.6810000,
          size.height * 0.2336667, size.width * 0.6596667, size.height * 0.2243333)
      ..cubicTo(size.width * 0.6380000, size.height * 0.2153333, size.width * 0.6156667,
          size.height * 0.2106667, size.width * 0.5920000, size.height * 0.2106667)
      ..cubicTo(size.width * 0.5406667, size.height * 0.2106667, size.width * 0.4973333,
          size.height * 0.2300000, size.width * 0.4626667, size.height * 0.2683333)
      ..cubicTo(size.width * 0.4340000, size.height * 0.2546667, size.width * 0.4046667,
          size.height * 0.2476667, size.width * 0.3743333, size.height * 0.2476667)
      ..cubicTo(size.width * 0.3270000, size.height * 0.2476667, size.width * 0.2853333,
          size.height * 0.2620000, size.width * 0.2490000, size.height * 0.2910000)
      ..cubicTo(size.width * 0.2126667, size.height * 0.3200000, size.width * 0.1893333,
          size.height * 0.3573333, size.width * 0.1790000, size.height * 0.4033333)
      ..cubicTo(size.width * 0.1423333, size.height * 0.4120000, size.width * 0.1120000,
          size.height * 0.4310000, size.width * 0.08800000, size.height * 0.4610000)
      ..cubicTo(size.width * 0.06400000, size.height * 0.4910000, size.width * 0.05200000,
          size.height * 0.5250000, size.width * 0.05200000, size.height * 0.5633333)
      ..close()
      ..moveTo(size.width * 0.3020000, size.height * 0.9390000)
      ..lineTo(size.width * 0.3120000, size.height * 0.9390000)
      ..lineTo(size.width * 0.4893333, size.height * 0.6773333)
      ..cubicTo(size.width * 0.4906667, size.height * 0.6760000, size.width * 0.4910000,
          size.height * 0.6743333, size.width * 0.4900000, size.height * 0.6726667)
      ..cubicTo(size.width * 0.4890000, size.height * 0.6710000, size.width * 0.4876667,
          size.height * 0.6703333, size.width * 0.4853333, size.height * 0.6703333)
      ..lineTo(size.width * 0.4126667, size.height * 0.6703333)
      ..lineTo(size.width * 0.4893333, size.height * 0.5300000)
      ..cubicTo(size.width * 0.4916667, size.height * 0.5253333, size.width * 0.4903333,
          size.height * 0.5226667, size.width * 0.4846667, size.height * 0.5226667)
      ..lineTo(size.width * 0.3866667, size.height * 0.5226667)
      ..cubicTo(size.width * 0.3840000, size.height * 0.5226667, size.width * 0.3816667,
          size.height * 0.5243333, size.width * 0.3793333, size.height * 0.5273333)
      ..lineTo(size.width * 0.3073333, size.height * 0.7180000)
      ..cubicTo(size.width * 0.3066667, size.height * 0.7226667, size.width * 0.3080000,
          size.height * 0.7250000, size.width * 0.3120000, size.height * 0.7250000)
      ..lineTo(size.width * 0.3843333, size.height * 0.7250000)
      ..lineTo(size.width * 0.3020000, size.height * 0.9390000)
      ..close()
      ..moveTo(size.width * 0.3313333, size.height * 0.1530000)
      ..cubicTo(size.width * 0.3313333, size.height * 0.1613333, size.width * 0.3340000,
          size.height * 0.1683333, size.width * 0.3393333, size.height * 0.1736667)
      ..lineTo(size.width * 0.3613333, size.height * 0.1953333)
      ..cubicTo(size.width * 0.3753333, size.height * 0.2060000, size.width * 0.3886667,
          size.height * 0.2060000, size.width * 0.4016667, size.height * 0.1953333)
      ..cubicTo(size.width * 0.4070000, size.height * 0.1893333, size.width * 0.4096667,
          size.height * 0.1823333, size.width * 0.4096667, size.height * 0.1740000)
      ..cubicTo(size.width * 0.4096667, size.height * 0.1663333, size.width * 0.4070000,
          size.height * 0.1596667, size.width * 0.4016667, size.height * 0.1543333)
      ..lineTo(size.width * 0.3803333, size.height * 0.1326667)
      ..cubicTo(size.width * 0.3740000, size.height * 0.1270000, size.width * 0.3673333,
          size.height * 0.1243333, size.width * 0.3596667, size.height * 0.1243333)
      ..cubicTo(size.width * 0.3520000, size.height * 0.1243333, size.width * 0.3453333,
          size.height * 0.1270000, size.width * 0.3396667, size.height * 0.1326667)
      ..cubicTo(size.width * 0.3340000, size.height * 0.1383333, size.width * 0.3313333,
          size.height * 0.1453333, size.width * 0.3313333, size.height * 0.1530000)
      ..close()
      ..moveTo(size.width * 0.5093333, size.height * 0.3006667)
      ..cubicTo(size.width * 0.5320000, size.height * 0.2780000, size.width * 0.5596667,
          size.height * 0.2666667, size.width * 0.5920000, size.height * 0.2666667)
      ..cubicTo(size.width * 0.6246667, size.height * 0.2666667, size.width * 0.6523333,
          size.height * 0.2783333, size.width * 0.6750000, size.height * 0.3013333)
      ..cubicTo(size.width * 0.6980000, size.height * 0.3243333, size.width * 0.7093333,
          size.height * 0.3523333, size.width * 0.7093333, size.height * 0.3853333)
      ..cubicTo(size.width * 0.7093333, size.height * 0.4056667, size.width * 0.7036667,
          size.height * 0.4256667, size.width * 0.6923333, size.height * 0.4456667)
      ..cubicTo(size.width * 0.6596667, size.height * 0.4143333, size.width * 0.6213333,
          size.height * 0.3986667, size.width * 0.5770000, size.height * 0.3986667)
      ..lineTo(size.width * 0.5666667, size.height * 0.3986667)
      ..cubicTo(size.width * 0.5580000, size.height * 0.3606667, size.width * 0.5386667,
          size.height * 0.3280000, size.width * 0.5093333, size.height * 0.3006667)
      ..close()
      ..moveTo(size.width * 0.5633333, size.height * 0.1243333)
      ..cubicTo(size.width * 0.5633333, size.height * 0.1326667, size.width * 0.5660000,
          size.height * 0.1396667, size.width * 0.5713333, size.height * 0.1450000)
      ..cubicTo(size.width * 0.5766667, size.height * 0.1503333, size.width * 0.5833333,
          size.height * 0.1530000, size.width * 0.5916667, size.height * 0.1530000)
      ..cubicTo(size.width * 0.5996667, size.height * 0.1530000, size.width * 0.6060000,
          size.height * 0.1503333, size.width * 0.6113333, size.height * 0.1450000)
      ..cubicTo(size.width * 0.6166667, size.height * 0.1396667, size.width * 0.6190000,
          size.height * 0.1326667, size.width * 0.6190000, size.height * 0.1243333)
      ..lineTo(size.width * 0.6190000, size.height * 0.05633333)
      ..cubicTo(size.width * 0.6190000, size.height * 0.04833333, size.width * 0.6163333,
          size.height * 0.04200000, size.width * 0.6113333, size.height * 0.03666667)
      ..cubicTo(size.width * 0.6060000, size.height * 0.03133333, size.width * 0.5996667,
          size.height * 0.02900000, size.width * 0.5916667, size.height * 0.02900000)
      ..cubicTo(size.width * 0.5836667, size.height * 0.02900000, size.width * 0.5770000,
          size.height * 0.03166667, size.width * 0.5716667, size.height * 0.03666667)
      ..cubicTo(size.width * 0.5663333, size.height * 0.04166667, size.width * 0.5633333,
          size.height * 0.04833333, size.width * 0.5633333, size.height * 0.05633333)
      ..lineTo(size.width * 0.5633333, size.height * 0.1243333)
      ..close()
      ..moveTo(size.width * 0.7473333, size.height * 0.2016667)
      ..cubicTo(size.width * 0.7473333, size.height * 0.2093333, size.width * 0.7503333,
          size.height * 0.2160000, size.width * 0.7563333, size.height * 0.2216667)
      ..cubicTo(size.width * 0.7623333, size.height * 0.2273333, size.width * 0.7686667,
          size.height * 0.2300000, size.width * 0.7746667, size.height * 0.2300000)
      ..cubicTo(size.width * 0.7800000, size.height * 0.2300000, size.width * 0.7870000,
          size.height * 0.2273333, size.width * 0.7953333, size.height * 0.2216667)
      ..lineTo(size.width * 0.8433333, size.height * 0.1740000)
      ..cubicTo(size.width * 0.8490000, size.height * 0.1680000, size.width * 0.8516667,
          size.height * 0.1610000, size.width * 0.8516667, size.height * 0.1530000)
      ..cubicTo(size.width * 0.8516667, size.height * 0.1450000, size.width * 0.8490000,
          size.height * 0.1380000, size.width * 0.8433333, size.height * 0.1326667)
      ..cubicTo(size.width * 0.8376667, size.height * 0.1273333, size.width * 0.8310000,
          size.height * 0.1246667, size.width * 0.8233333, size.height * 0.1246667)
      ..cubicTo(size.width * 0.8160000, size.height * 0.1246667, size.width * 0.8096667,
          size.height * 0.1273333, size.width * 0.8040000, size.height * 0.1330000)
      ..lineTo(size.width * 0.7563333, size.height * 0.1806667)
      ..cubicTo(size.width * 0.7503333, size.height * 0.1870000, size.width * 0.7473333,
          size.height * 0.1940000, size.width * 0.7473333, size.height * 0.2016667)
      ..close()
      ..moveTo(size.width * 0.7743333, size.height * 0.5956667)
      ..cubicTo(size.width * 0.7743333, size.height * 0.6033333, size.width * 0.7770000,
          size.height * 0.6100000, size.width * 0.7823333, size.height * 0.6160000)
      ..lineTo(size.width * 0.8040000, size.height * 0.6380000)
      ..cubicTo(size.width * 0.8093333, size.height * 0.6433333, size.width * 0.8160000,
          size.height * 0.6460000, size.width * 0.8233333, size.height * 0.6460000)
      ..cubicTo(size.width * 0.8313333, size.height * 0.6460000, size.width * 0.8380000,
          size.height * 0.6433333, size.width * 0.8433333, size.height * 0.6376667)
      ..cubicTo(size.width * 0.8490000, size.height * 0.6320000, size.width * 0.8516667,
          size.height * 0.6250000, size.width * 0.8516667, size.height * 0.6166667)
      ..cubicTo(size.width * 0.8516667, size.height * 0.6090000, size.width * 0.8490000,
          size.height * 0.6026667, size.width * 0.8433333, size.height * 0.5976667)
      ..lineTo(size.width * 0.8226667, size.height * 0.5756667)
      ..cubicTo(size.width * 0.8163333, size.height * 0.5703333, size.width * 0.8096667,
          size.height * 0.5680000, size.width * 0.8020000, size.height * 0.5680000)
      ..cubicTo(size.width * 0.7943333, size.height * 0.5680000, size.width * 0.7876667,
          size.height * 0.5706667, size.width * 0.7823333, size.height * 0.5760000)
      ..cubicTo(size.width * 0.7770000, size.height * 0.5813333, size.width * 0.7743333,
          size.height * 0.5880000, size.width * 0.7743333, size.height * 0.5956667)
      ..close()
      ..moveTo(size.width * 0.8226667, size.height * 0.3853333)
      ..cubicTo(size.width * 0.8226667, size.height * 0.3926667, size.width * 0.8256667,
          size.height * 0.3990000, size.width * 0.8313333, size.height * 0.4043333)
      ..cubicTo(size.width * 0.8370000, size.height * 0.4100000, size.width * 0.8436667,
          size.height * 0.4126667, size.width * 0.8513333, size.height * 0.4126667)
      ..lineTo(size.width * 0.9193333, size.height * 0.4126667)
      ..cubicTo(size.width * 0.9273333, size.height * 0.4126667, size.width * 0.9340000,
          size.height * 0.4100000, size.width * 0.9396667, size.height * 0.4046667)
      ..cubicTo(size.width * 0.9453333, size.height * 0.3993333, size.width * 0.9480000,
          size.height * 0.3930000, size.width * 0.9480000, size.height * 0.3850000)
      ..cubicTo(size.width * 0.9480000, size.height * 0.3770000, size.width * 0.9450000,
          size.height * 0.3703333, size.width * 0.9393333, size.height * 0.3646667)
      ..cubicTo(size.width * 0.9336667, size.height * 0.3590000, size.width * 0.9270000,
          size.height * 0.3563333, size.width * 0.9193333, size.height * 0.3563333)
      ..lineTo(size.width * 0.8513333, size.height * 0.3563333)
      ..cubicTo(size.width * 0.8436667, size.height * 0.3563333, size.width * 0.8370000,
          size.height * 0.3590000, size.width * 0.8313333, size.height * 0.3646667)
      ..cubicTo(size.width * 0.8256667, size.height * 0.3706667, size.width * 0.8226667,
          size.height * 0.3773333, size.width * 0.8226667, size.height * 0.3853333)
      ..close();
  }

  Path _dayRainPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.05033333, size.height * 0.5630000)
      ..cubicTo(size.width * 0.05033333, size.height * 0.6073333, size.width * 0.06566667,
          size.height * 0.6456667, size.width * 0.09666667, size.height * 0.6776667)
      ..cubicTo(size.width * 0.1276667, size.height * 0.7096667, size.width * 0.1653333,
          size.height * 0.7266667, size.width * 0.2103333, size.height * 0.7286667)
      ..cubicTo(size.width * 0.2140000, size.height * 0.7286667, size.width * 0.2160000,
          size.height * 0.7266667, size.width * 0.2160000, size.height * 0.7230000)
      ..lineTo(size.width * 0.2160000, size.height * 0.6783333)
      ..cubicTo(size.width * 0.2160000, size.height * 0.6746667, size.width * 0.2140000,
          size.height * 0.6726667, size.width * 0.2103333, size.height * 0.6726667)
      ..cubicTo(size.width * 0.1816667, size.height * 0.6713333, size.width * 0.1573333,
          size.height * 0.6596667, size.width * 0.1373333, size.height * 0.6383333)
      ..cubicTo(size.width * 0.1173333, size.height * 0.6170000, size.width * 0.1073333,
          size.height * 0.5916667, size.width * 0.1073333, size.height * 0.5630000)
      ..cubicTo(size.width * 0.1073333, size.height * 0.5356667, size.width * 0.1166667,
          size.height * 0.5116667, size.width * 0.1356667, size.height * 0.4910000)
      ..cubicTo(size.width * 0.1546667, size.height * 0.4703333, size.width * 0.1780000,
          size.height * 0.4586667, size.width * 0.2056667, size.height * 0.4553333)
      ..lineTo(size.width * 0.2233333, size.height * 0.4536667)
      ..cubicTo(size.width * 0.2276667, size.height * 0.4536667, size.width * 0.2300000,
          size.height * 0.4516667, size.width * 0.2300000, size.height * 0.4480000)
      ..lineTo(size.width * 0.2323333, size.height * 0.4300000)
      ..cubicTo(size.width * 0.2360000, size.height * 0.3940000, size.width * 0.2510000,
          size.height * 0.3636667, size.width * 0.2780000, size.height * 0.3393333)
      ..cubicTo(size.width * 0.3050000, size.height * 0.3150000, size.width * 0.3366667,
          size.height * 0.3026667, size.width * 0.3730000, size.height * 0.3026667)
      ..cubicTo(size.width * 0.4093333, size.height * 0.3026667, size.width * 0.4410000,
          size.height * 0.3150000, size.width * 0.4683333, size.height * 0.3393333)
      ..cubicTo(size.width * 0.4956667, size.height * 0.3636667, size.width * 0.5110000,
          size.height * 0.3940000, size.width * 0.5150000, size.height * 0.4300000)
      ..lineTo(size.width * 0.5173333, size.height * 0.4490000)
      ..cubicTo(size.width * 0.5173333, size.height * 0.4530000, size.width * 0.5193333,
          size.height * 0.4553333, size.width * 0.5230000, size.height * 0.4553333)
      ..lineTo(size.width * 0.5770000, size.height * 0.4553333)
      ..cubicTo(size.width * 0.6066667, size.height * 0.4553333, size.width * 0.6320000,
          size.height * 0.4660000, size.width * 0.6536667, size.height * 0.4873333)
      ..cubicTo(size.width * 0.6753333, size.height * 0.5086667, size.width * 0.6860000,
          size.height * 0.5336667, size.width * 0.6860000, size.height * 0.5630000)
      ..cubicTo(size.width * 0.6860000, size.height * 0.5920000, size.width * 0.6760000,
          size.height * 0.6170000, size.width * 0.6560000, size.height * 0.6383333)
      ..cubicTo(size.width * 0.6360000, size.height * 0.6596667, size.width * 0.6116667,
          size.height * 0.6710000, size.width * 0.5833333, size.height * 0.6726667)
      ..cubicTo(size.width * 0.5793333, size.height * 0.6726667, size.width * 0.5770000,
          size.height * 0.6746667, size.width * 0.5770000, size.height * 0.6783333)
      ..lineTo(size.width * 0.5770000, size.height * 0.7230000)
      ..cubicTo(size.width * 0.5770000, size.height * 0.7266667, size.width * 0.5790000,
          size.height * 0.7286667, size.width * 0.5833333, size.height * 0.7286667)
      ..cubicTo(size.width * 0.6276667, size.height * 0.7273333, size.width * 0.6653333,
          size.height * 0.7103333, size.width * 0.6963333, size.height * 0.6783333)
      ..cubicTo(size.width * 0.7273333, size.height * 0.6460000, size.width * 0.7426667,
          size.height * 0.6076667, size.width * 0.7426667, size.height * 0.5633333)
      ..cubicTo(size.width * 0.7426667, size.height * 0.5393333, size.width * 0.7380000,
          size.height * 0.5170000, size.width * 0.7286667, size.height * 0.4963333)
      ..cubicTo(size.width * 0.7546667, size.height * 0.4640000, size.width * 0.7676667,
          size.height * 0.4273333, size.width * 0.7676667, size.height * 0.3860000)
      ..cubicTo(size.width * 0.7676667, size.height * 0.3543333, size.width * 0.7596667,
          size.height * 0.3250000, size.width * 0.7440000, size.height * 0.2980000)
      ..cubicTo(size.width * 0.7283333, size.height * 0.2710000, size.width * 0.7070000,
          size.height * 0.2496667, size.width * 0.6800000, size.height * 0.2340000)
      ..cubicTo(size.width * 0.6530000, size.height * 0.2183333, size.width * 0.6240000,
          size.height * 0.2106667, size.width * 0.5926667, size.height * 0.2106667)
      ..cubicTo(size.width * 0.5406667, size.height * 0.2106667, size.width * 0.4976667,
          size.height * 0.2300000, size.width * 0.4633333, size.height * 0.2686667)
      ..cubicTo(size.width * 0.4360000, size.height * 0.2540000, size.width * 0.4060000,
          size.height * 0.2466667, size.width * 0.3730000, size.height * 0.2466667)
      ..cubicTo(size.width * 0.3260000, size.height * 0.2466667, size.width * 0.2840000,
          size.height * 0.2613333, size.width * 0.2476667, size.height * 0.2906667)
      ..cubicTo(size.width * 0.2113333, size.height * 0.3200000, size.width * 0.1880000,
          size.height * 0.3573333, size.width * 0.1776667, size.height * 0.4026667)
      ..cubicTo(size.width * 0.1406667, size.height * 0.4113333, size.width * 0.1103333,
          size.height * 0.4306667, size.width * 0.08633333, size.height * 0.4606667)
      ..cubicTo(size.width * 0.06233333, size.height * 0.4906667, size.width * 0.05033333,
          size.height * 0.5246667, size.width * 0.05033333, size.height * 0.5630000)
      ..close()
      ..moveTo(size.width * 0.2303333, size.height * 0.7916667)
      ..cubicTo(size.width * 0.2303333, size.height * 0.7973333, size.width * 0.2320000,
          size.height * 0.8026667, size.width * 0.2356667, size.height * 0.8080000)
      ..cubicTo(size.width * 0.2393333, size.height * 0.8133333, size.width * 0.2446667,
          size.height * 0.8170000, size.width * 0.2520000, size.height * 0.8190000)
      ..cubicTo(size.width * 0.2556667, size.height * 0.8196667, size.width * 0.2586667,
          size.height * 0.8203333, size.width * 0.2610000, size.height * 0.8203333)
      ..cubicTo(size.width * 0.2740000, size.height * 0.8203333, size.width * 0.2826667,
          size.height * 0.8133333, size.width * 0.2866667, size.height * 0.7990000)
      ..lineTo(size.width * 0.3393333, size.height * 0.6030000)
      ..cubicTo(size.width * 0.3416667, size.height * 0.5950000, size.width * 0.3406667,
          size.height * 0.5876667, size.width * 0.3366667, size.height * 0.5806667)
      ..cubicTo(size.width * 0.3326667, size.height * 0.5736667, size.width * 0.3266667,
          size.height * 0.5696667, size.width * 0.3190000, size.height * 0.5680000)
      ..cubicTo(size.width * 0.3116667, size.height * 0.5656667, size.width * 0.3046667,
          size.height * 0.5663333, size.width * 0.2980000, size.height * 0.5703333)
      ..cubicTo(size.width * 0.2913333, size.height * 0.5740000, size.width * 0.2866667,
          size.height * 0.5796667, size.width * 0.2843333, size.height * 0.5873333)
      ..lineTo(size.width * 0.2316667, size.height * 0.7843333)
      ..cubicTo(size.width * 0.2310000, size.height * 0.7886667, size.width * 0.2303333,
          size.height * 0.7910000, size.width * 0.2303333, size.height * 0.7916667)
      ..close()
      ..moveTo(size.width * 0.3173333, size.height * 0.8943333)
      ..cubicTo(size.width * 0.3173333, size.height * 0.9006667, size.width * 0.3190000,
          size.height * 0.9063333, size.width * 0.3223333, size.height * 0.9116667)
      ..cubicTo(size.width * 0.3256667, size.height * 0.9170000, size.width * 0.3313333,
          size.height * 0.9203333, size.width * 0.3396667, size.height * 0.9216667)
      ..cubicTo(size.width * 0.3433333, size.height * 0.9223333, size.width * 0.3463333,
          size.height * 0.9230000, size.width * 0.3483333, size.height * 0.9230000)
      ..cubicTo(size.width * 0.3536667, size.height * 0.9230000, size.width * 0.3586667,
          size.height * 0.9210000, size.width * 0.3633333, size.height * 0.9173333)
      ..cubicTo(size.width * 0.3680000, size.height * 0.9133333, size.width * 0.3710000,
          size.height * 0.9080000, size.width * 0.3723333, size.height * 0.9013333)
      ..lineTo(size.width * 0.4523333, size.height * 0.6036667)
      ..cubicTo(size.width * 0.4543333, size.height * 0.5960000, size.width * 0.4536667,
          size.height * 0.5886667, size.width * 0.4500000, size.height * 0.5823333)
      ..cubicTo(size.width * 0.4463333, size.height * 0.5760000, size.width * 0.4406667,
          size.height * 0.5713333, size.width * 0.4333333, size.height * 0.5690000)
      ..cubicTo(size.width * 0.4256667, size.height * 0.5666667, size.width * 0.4183333,
          size.height * 0.5673333, size.width * 0.4116667, size.height * 0.5713333)
      ..cubicTo(size.width * 0.4050000, size.height * 0.5750000, size.width * 0.4003333,
          size.height * 0.5806667, size.width * 0.3983333, size.height * 0.5883333)
      ..lineTo(size.width * 0.3183333, size.height * 0.8860000)
      ..cubicTo(size.width * 0.3176667, size.height * 0.8910000, size.width * 0.3173333,
          size.height * 0.8940000, size.width * 0.3173333, size.height * 0.8943333)
      ..close()
      ..moveTo(size.width * 0.3313333, size.height * 0.1533333)
      ..cubicTo(size.width * 0.3313333, size.height * 0.1613333, size.width * 0.3340000,
          size.height * 0.1680000, size.width * 0.3396667, size.height * 0.1736667)
      ..lineTo(size.width * 0.3613333, size.height * 0.1956667)
      ..cubicTo(size.width * 0.3676667, size.height * 0.2006667, size.width * 0.3746667,
          size.height * 0.2030000, size.width * 0.3820000, size.height * 0.2030000)
      ..cubicTo(size.width * 0.3890000, size.height * 0.2030000, size.width * 0.3956667,
          size.height * 0.2003333, size.width * 0.4013333, size.height * 0.1953333)
      ..cubicTo(size.width * 0.4070000, size.height * 0.1900000, size.width * 0.4100000,
          size.height * 0.1836667, size.width * 0.4100000, size.height * 0.1756667)
      ..cubicTo(size.width * 0.4100000, size.height * 0.1676667, size.width * 0.4073333,
          size.height * 0.1603333, size.width * 0.4020000, size.height * 0.1543333)
      ..lineTo(size.width * 0.3806667, size.height * 0.1326667)
      ..cubicTo(size.width * 0.3746667, size.height * 0.1270000, size.width * 0.3680000,
          size.height * 0.1243333, size.width * 0.3606667, size.height * 0.1243333)
      ..cubicTo(size.width * 0.3526667, size.height * 0.1243333, size.width * 0.3456667,
          size.height * 0.1273333, size.width * 0.3400000, size.height * 0.1330000)
      ..cubicTo(size.width * 0.3343333, size.height * 0.1386667, size.width * 0.3313333,
          size.height * 0.1456667, size.width * 0.3313333, size.height * 0.1533333)
      ..close()
      ..moveTo(size.width * 0.4556667, size.height * 0.7923333)
      ..cubicTo(size.width * 0.4556667, size.height * 0.7976667, size.width * 0.4573333,
          size.height * 0.8030000, size.width * 0.4606667, size.height * 0.8080000)
      ..cubicTo(size.width * 0.4640000, size.height * 0.8130000, size.width * 0.4693333,
          size.height * 0.8166667, size.width * 0.4760000, size.height * 0.8186667)
      ..cubicTo(size.width * 0.4796667, size.height * 0.8193333, size.width * 0.4826667,
          size.height * 0.8200000, size.width * 0.4843333, size.height * 0.8200000)
      ..cubicTo(size.width * 0.4900000, size.height * 0.8200000, size.width * 0.4956667,
          size.height * 0.8183333, size.width * 0.5006667, size.height * 0.8150000)
      ..cubicTo(size.width * 0.5056667, size.height * 0.8116667, size.width * 0.5090000,
          size.height * 0.8063333, size.width * 0.5106667, size.height * 0.7986667)
      ..lineTo(size.width * 0.5633333, size.height * 0.6026667)
      ..cubicTo(size.width * 0.5653333, size.height * 0.5950000, size.width * 0.5646667,
          size.height * 0.5876667, size.width * 0.5610000, size.height * 0.5813333)
      ..cubicTo(size.width * 0.5573333, size.height * 0.5746667, size.width * 0.5516667,
          size.height * 0.5703333, size.width * 0.5443333, size.height * 0.5680000)
      ..cubicTo(size.width * 0.5363333, size.height * 0.5656667, size.width * 0.5293333,
          size.height * 0.5663333, size.width * 0.5226667, size.height * 0.5703333)
      ..cubicTo(size.width * 0.5160000, size.height * 0.5740000, size.width * 0.5116667,
          size.height * 0.5796667, size.width * 0.5096667, size.height * 0.5873333)
      ..lineTo(size.width * 0.4570000, size.height * 0.7843333)
      ..cubicTo(size.width * 0.4563333, size.height * 0.7893333, size.width * 0.4556667,
          size.height * 0.7920000, size.width * 0.4556667, size.height * 0.7923333)
      ..close()
      ..moveTo(size.width * 0.5100000, size.height * 0.3010000)
      ..cubicTo(size.width * 0.5336667, size.height * 0.2786667, size.width * 0.5610000,
          size.height * 0.2676667, size.width * 0.5926667, size.height * 0.2676667)
      ..cubicTo(size.width * 0.6253333, size.height * 0.2676667, size.width * 0.6533333,
          size.height * 0.2793333, size.width * 0.6760000, size.height * 0.3023333)
      ..cubicTo(size.width * 0.6990000, size.height * 0.3253333, size.width * 0.7103333,
          size.height * 0.3533333, size.width * 0.7103333, size.height * 0.3863333)
      ..cubicTo(size.width * 0.7103333, size.height * 0.4070000, size.width * 0.7046667,
          size.height * 0.4276667, size.width * 0.6930000, size.height * 0.4480000)
      ..cubicTo(size.width * 0.6606667, size.height * 0.4156667, size.width * 0.6220000,
          size.height * 0.3996667, size.width * 0.5766667, size.height * 0.3996667)
      ..lineTo(size.width * 0.5656667, size.height * 0.3996667)
      ..cubicTo(size.width * 0.5566667, size.height * 0.3603333, size.width * 0.5380000,
          size.height * 0.3276667, size.width * 0.5100000, size.height * 0.3010000)
      ..close()
      ..moveTo(size.width * 0.5640000, size.height * 0.1260000)
      ..cubicTo(size.width * 0.5640000, size.height * 0.1336667, size.width * 0.5666667,
          size.height * 0.1403333, size.width * 0.5723333, size.height * 0.1456667)
      ..cubicTo(size.width * 0.5780000, size.height * 0.1510000, size.width * 0.5846667,
          size.height * 0.1536667, size.width * 0.5926667, size.height * 0.1536667)
      ..cubicTo(size.width * 0.6003333, size.height * 0.1536667, size.width * 0.6070000,
          size.height * 0.1510000, size.width * 0.6123333, size.height * 0.1460000)
      ..cubicTo(size.width * 0.6176667, size.height * 0.1406667, size.width * 0.6203333,
          size.height * 0.1343333, size.width * 0.6203333, size.height * 0.1263333)
      ..lineTo(size.width * 0.6203333, size.height * 0.05766667)
      ..cubicTo(size.width * 0.6203333, size.height * 0.04900000, size.width * 0.6176667,
          size.height * 0.04200000, size.width * 0.6126667, size.height * 0.03666667)
      ..cubicTo(size.width * 0.6073333, size.height * 0.03133333, size.width * 0.6010000,
          size.height * 0.02866667, size.width * 0.5930000, size.height * 0.02866667)
      ..cubicTo(size.width * 0.5846667, size.height * 0.02866667, size.width * 0.5776667,
          size.height * 0.03133333, size.width * 0.5723333, size.height * 0.03700000)
      ..cubicTo(size.width * 0.5670000, size.height * 0.04266667, size.width * 0.5643333,
          size.height * 0.04933333, size.width * 0.5643333, size.height * 0.05766667)
      ..lineTo(size.width * 0.5643333, size.height * 0.1260000)
      ..close()
      ..moveTo(size.width * 0.7483333, size.height * 0.2020000)
      ..cubicTo(size.width * 0.7483333, size.height * 0.2100000, size.width * 0.7513333,
          size.height * 0.2166667, size.width * 0.7573333, size.height * 0.2216667)
      ..cubicTo(size.width * 0.7620000, size.height * 0.2270000, size.width * 0.7680000,
          size.height * 0.2296667, size.width * 0.7756667, size.height * 0.2303333)
      ..cubicTo(size.width * 0.7833333, size.height * 0.2310000, size.width * 0.7903333,
          size.height * 0.2280000, size.width * 0.7963333, size.height * 0.2216667)
      ..lineTo(size.width * 0.8443333, size.height * 0.1740000)
      ..cubicTo(size.width * 0.8503333, size.height * 0.1683333, size.width * 0.8530000,
          size.height * 0.1613333, size.width * 0.8530000, size.height * 0.1530000)
      ..cubicTo(size.width * 0.8530000, size.height * 0.1450000, size.width * 0.8503333,
          size.height * 0.1380000, size.width * 0.8446667, size.height * 0.1326667)
      ..cubicTo(size.width * 0.8390000, size.height * 0.1273333, size.width * 0.8323333,
          size.height * 0.1246667, size.width * 0.8243333, size.height * 0.1246667)
      ..cubicTo(size.width * 0.8173333, size.height * 0.1246667, size.width * 0.8110000,
          size.height * 0.1273333, size.width * 0.8050000, size.height * 0.1330000)
      ..lineTo(size.width * 0.7573333, size.height * 0.1810000)
      ..cubicTo(size.width * 0.7513333, size.height * 0.1866667, size.width * 0.7483333,
          size.height * 0.1936667, size.width * 0.7483333, size.height * 0.2020000)
      ..close()
      ..moveTo(size.width * 0.7753333, size.height * 0.5970000)
      ..cubicTo(size.width * 0.7753333, size.height * 0.6050000, size.width * 0.7780000,
          size.height * 0.6120000, size.width * 0.7833333, size.height * 0.6180000)
      ..lineTo(size.width * 0.8050000, size.height * 0.6390000)
      ..cubicTo(size.width * 0.8110000, size.height * 0.6436667, size.width * 0.8176667,
          size.height * 0.6460000, size.width * 0.8250000, size.height * 0.6460000)
      ..lineTo(size.width * 0.8256667, size.height * 0.6466667)
      ..cubicTo(size.width * 0.8333333, size.height * 0.6466667, size.width * 0.8396667,
          size.height * 0.6440000, size.width * 0.8450000, size.height * 0.6386667)
      ..cubicTo(size.width * 0.8503333, size.height * 0.6333333, size.width * 0.8530000,
          size.height * 0.6263333, size.width * 0.8530000, size.height * 0.6183333)
      ..cubicTo(size.width * 0.8530000, size.height * 0.6103333, size.width * 0.8500000,
          size.height * 0.6040000, size.width * 0.8443333, size.height * 0.5990000)
      ..lineTo(size.width * 0.8236667, size.height * 0.5770000)
      ..cubicTo(size.width * 0.8176667, size.height * 0.5716667, size.width * 0.8106667,
          size.height * 0.5690000, size.width * 0.8030000, size.height * 0.5690000)
      ..cubicTo(size.width * 0.7953333, size.height * 0.5690000, size.width * 0.7886667,
          size.height * 0.5716667, size.width * 0.7833333, size.height * 0.5773333)
      ..cubicTo(size.width * 0.7780000, size.height * 0.5830000, size.width * 0.7753333,
          size.height * 0.5890000, size.width * 0.7753333, size.height * 0.5970000)
      ..close()
      ..moveTo(size.width * 0.8240000, size.height * 0.3860000)
      ..cubicTo(size.width * 0.8240000, size.height * 0.3940000, size.width * 0.8270000,
          size.height * 0.4003333, size.width * 0.8326667, size.height * 0.4056667)
      ..cubicTo(size.width * 0.8386667, size.height * 0.4116667, size.width * 0.8453333,
          size.height * 0.4143333, size.width * 0.8533333, size.height * 0.4143333)
      ..lineTo(size.width * 0.9210000, size.height * 0.4143333)
      ..cubicTo(size.width * 0.9290000, size.height * 0.4143333, size.width * 0.9356667,
          size.height * 0.4116667, size.width * 0.9413333, size.height * 0.4060000)
      ..cubicTo(size.width * 0.9470000, size.height * 0.4003333, size.width * 0.9496667,
          size.height * 0.3936667, size.width * 0.9496667, size.height * 0.3860000)
      ..cubicTo(size.width * 0.9496667, size.height * 0.3780000, size.width * 0.9470000,
          size.height * 0.3713333, size.width * 0.9413333, size.height * 0.3656667)
      ..cubicTo(size.width * 0.9356667, size.height * 0.3600000, size.width * 0.9290000,
          size.height * 0.3570000, size.width * 0.9210000, size.height * 0.3570000)
      ..lineTo(size.width * 0.8533333, size.height * 0.3570000)
      ..cubicTo(size.width * 0.8453333, size.height * 0.3570000, size.width * 0.8386667,
          size.height * 0.3600000, size.width * 0.8326667, size.height * 0.3656667)
      ..cubicTo(size.width * 0.8266667, size.height * 0.3713333, size.width * 0.8240000,
          size.height * 0.3780000, size.width * 0.8240000, size.height * 0.3860000)
      ..close();
  }

  Path _dayRainMixPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.04933333, size.height * 0.5650000)
      ..cubicTo(size.width * 0.04933333, size.height * 0.6090000, size.width * 0.06466667,
          size.height * 0.6470000, size.width * 0.09500000, size.height * 0.6783333)
      ..cubicTo(size.width * 0.1253333, size.height * 0.7096667, size.width * 0.1630000,
          size.height * 0.7266667, size.width * 0.2076667, size.height * 0.7286667)
      ..cubicTo(size.width * 0.2116667, size.height * 0.7286667, size.width * 0.2136667,
          size.height * 0.7266667, size.width * 0.2136667, size.height * 0.7230000)
      ..lineTo(size.width * 0.2136667, size.height * 0.6786667)
      ..cubicTo(size.width * 0.2136667, size.height * 0.6746667, size.width * 0.2116667,
          size.height * 0.6726667, size.width * 0.2076667, size.height * 0.6726667)
      ..cubicTo(size.width * 0.1790000, size.height * 0.6713333, size.width * 0.1550000,
          size.height * 0.6600000, size.width * 0.1353333, size.height * 0.6393333)
      ..cubicTo(size.width * 0.1156667, size.height * 0.6186667, size.width * 0.1060000,
          size.height * 0.5936667, size.width * 0.1060000, size.height * 0.5646667)
      ..cubicTo(size.width * 0.1060000, size.height * 0.5366667, size.width * 0.1153333,
          size.height * 0.5120000, size.width * 0.1340000, size.height * 0.4916667)
      ..cubicTo(size.width * 0.1526667, size.height * 0.4710000, size.width * 0.1760000,
          size.height * 0.4596667, size.width * 0.2040000, size.height * 0.4573333)
      ..lineTo(size.width * 0.2216667, size.height * 0.4546667)
      ..cubicTo(size.width * 0.2253333, size.height * 0.4546667, size.width * 0.2270000,
          size.height * 0.4530000, size.width * 0.2270000, size.height * 0.4500000)
      ..lineTo(size.width * 0.2296667, size.height * 0.4316667)
      ..cubicTo(size.width * 0.2336667, size.height * 0.3953333, size.width * 0.2493333,
          size.height * 0.3650000, size.width * 0.2756667, size.height * 0.3410000)
      ..cubicTo(size.width * 0.3020000, size.height * 0.3170000, size.width * 0.3333333,
          size.height * 0.3053333, size.width * 0.3700000, size.height * 0.3053333)
      ..cubicTo(size.width * 0.4066667, size.height * 0.3053333, size.width * 0.4383333,
          size.height * 0.3173333, size.width * 0.4653333, size.height * 0.3413333)
      ..cubicTo(size.width * 0.4926667, size.height * 0.3653333, size.width * 0.5080000,
          size.height * 0.3953333, size.width * 0.5113333, size.height * 0.4310000)
      ..lineTo(size.width * 0.5136667, size.height * 0.4503333)
      ..cubicTo(size.width * 0.5143333, size.height * 0.4540000, size.width * 0.5170000,
          size.height * 0.4560000, size.width * 0.5210000, size.height * 0.4560000)
      ..lineTo(size.width * 0.5743333, size.height * 0.4560000)
      ..cubicTo(size.width * 0.6040000, size.height * 0.4560000, size.width * 0.6293333,
          size.height * 0.4666667, size.width * 0.6506667, size.height * 0.4880000)
      ..cubicTo(size.width * 0.6720000, size.height * 0.5093333, size.width * 0.6826667,
          size.height * 0.5350000, size.width * 0.6826667, size.height * 0.5650000)
      ..cubicTo(size.width * 0.6826667, size.height * 0.5940000, size.width * 0.6730000,
          size.height * 0.6186667, size.width * 0.6533333, size.height * 0.6396667)
      ..cubicTo(size.width * 0.6336667, size.height * 0.6606667, size.width * 0.6096667,
          size.height * 0.6713333, size.width * 0.5810000, size.height * 0.6730000)
      ..cubicTo(size.width * 0.5766667, size.height * 0.6730000, size.width * 0.5743333,
          size.height * 0.6750000, size.width * 0.5743333, size.height * 0.6790000)
      ..lineTo(size.width * 0.5743333, size.height * 0.7233333)
      ..cubicTo(size.width * 0.5743333, size.height * 0.7270000, size.width * 0.5766667,
          size.height * 0.7290000, size.width * 0.5810000, size.height * 0.7290000)
      ..cubicTo(size.width * 0.6253333, size.height * 0.7276667, size.width * 0.6626667,
          size.height * 0.7110000, size.width * 0.6933333, size.height * 0.6793333)
      ..cubicTo(size.width * 0.7236667, size.height * 0.6476667, size.width * 0.7390000,
          size.height * 0.6096667, size.width * 0.7390000, size.height * 0.5653333)
      ..cubicTo(size.width * 0.7390000, size.height * 0.5426667, size.width * 0.7346667,
          size.height * 0.5206667, size.width * 0.7263333, size.height * 0.4983333)
      ..cubicTo(size.width * 0.7523333, size.height * 0.4663333, size.width * 0.7650000,
          size.height * 0.4290000, size.width * 0.7650000, size.height * 0.3866667)
      ..cubicTo(size.width * 0.7650000, size.height * 0.3630000, size.width * 0.7603333,
          size.height * 0.3406667, size.width * 0.7513333, size.height * 0.3190000)
      ..cubicTo(size.width * 0.7423333, size.height * 0.2973333, size.width * 0.7296667,
          size.height * 0.2790000, size.width * 0.7140000, size.height * 0.2633333)
      ..cubicTo(size.width * 0.6983333, size.height * 0.2476667, size.width * 0.6796667,
          size.height * 0.2353333, size.width * 0.6583333, size.height * 0.2260000)
      ..cubicTo(size.width * 0.6370000, size.height * 0.2166667, size.width * 0.6140000,
          size.height * 0.2120000, size.width * 0.5903333, size.height * 0.2120000)
      ..cubicTo(size.width * 0.5390000, size.height * 0.2120000, size.width * 0.4960000,
          size.height * 0.2313333, size.width * 0.4616667, size.height * 0.2700000)
      ..cubicTo(size.width * 0.4320000, size.height * 0.2553333, size.width * 0.4013333,
          size.height * 0.2480000, size.width * 0.3703333, size.height * 0.2480000)
      ..cubicTo(size.width * 0.3233333, size.height * 0.2480000, size.width * 0.2816667,
          size.height * 0.2626667, size.width * 0.2456667, size.height * 0.2916667)
      ..cubicTo(size.width * 0.2096667, size.height * 0.3206667, size.width * 0.1866667,
          size.height * 0.3583333, size.width * 0.1763333, size.height * 0.4043333)
      ..cubicTo(size.width * 0.1390000, size.height * 0.4130000, size.width * 0.1083333,
          size.height * 0.4320000, size.width * 0.08466667, size.height * 0.4620000)
      ..cubicTo(size.width * 0.06100000, size.height * 0.4920000, size.width * 0.04933333,
          size.height * 0.5263333, size.width * 0.04933333, size.height * 0.5650000)
      ..close()
      ..moveTo(size.width * 0.2276667, size.height * 0.7993333)
      ..cubicTo(size.width * 0.2276667, size.height * 0.8050000, size.width * 0.2293333,
          size.height * 0.8106667, size.width * 0.2330000, size.height * 0.8163333)
      ..cubicTo(size.width * 0.2366667, size.height * 0.8220000, size.width * 0.2420000,
          size.height * 0.8256667, size.width * 0.2486667, size.height * 0.8280000)
      ..cubicTo(size.width * 0.2563333, size.height * 0.8303333, size.width * 0.2636667,
          size.height * 0.8300000, size.width * 0.2700000, size.height * 0.8266667)
      ..cubicTo(size.width * 0.2766667, size.height * 0.8236667, size.width * 0.2810000,
          size.height * 0.8173333, size.width * 0.2833333, size.height * 0.8080000)
      ..lineTo(size.width * 0.2880000, size.height * 0.7876667)
      ..cubicTo(size.width * 0.2896667, size.height * 0.7800000, size.width * 0.2886667,
          size.height * 0.7730000, size.width * 0.2846667, size.height * 0.7666667)
      ..cubicTo(size.width * 0.2806667, size.height * 0.7600000, size.width * 0.2750000,
          size.height * 0.7556667, size.width * 0.2673333, size.height * 0.7533333)
      ..cubicTo(size.width * 0.2596667, size.height * 0.7510000, size.width * 0.2526667,
          size.height * 0.7520000, size.width * 0.2460000, size.height * 0.7560000)
      ..cubicTo(size.width * 0.2393333, size.height * 0.7600000, size.width * 0.2353333,
          size.height * 0.7656667, size.width * 0.2333333, size.height * 0.7733333)
      ..lineTo(size.width * 0.2286667, size.height * 0.7930000)
      ..cubicTo(size.width * 0.2280000, size.height * 0.7950000, size.width * 0.2276667,
          size.height * 0.7970000, size.width * 0.2276667, size.height * 0.7993333)
      ..close()
      ..moveTo(size.width * 0.2533333, size.height * 0.7026667)
      ..cubicTo(size.width * 0.2533333, size.height * 0.7100000, size.width * 0.2560000,
          size.height * 0.7163333, size.width * 0.2613333, size.height * 0.7216667)
      ..cubicTo(size.width * 0.2666667, size.height * 0.7276667, size.width * 0.2730000,
          size.height * 0.7303333, size.width * 0.2800000, size.height * 0.7303333)
      ..cubicTo(size.width * 0.2880000, size.height * 0.7303333, size.width * 0.2946667,
          size.height * 0.7276667, size.width * 0.3000000, size.height * 0.7223333)
      ..cubicTo(size.width * 0.3056667, size.height * 0.7170000, size.width * 0.3083333,
          size.height * 0.7106667, size.width * 0.3083333, size.height * 0.7026667)
      ..cubicTo(size.width * 0.3083333, size.height * 0.6950000, size.width * 0.3056667,
          size.height * 0.6883333, size.width * 0.3000000, size.height * 0.6830000)
      ..cubicTo(size.width * 0.2943333, size.height * 0.6776667, size.width * 0.2876667,
          size.height * 0.6750000, size.width * 0.2800000, size.height * 0.6750000)
      ..cubicTo(size.width * 0.2723333, size.height * 0.6750000, size.width * 0.2660000,
          size.height * 0.6776667, size.width * 0.2606667, size.height * 0.6826667)
      ..cubicTo(size.width * 0.2553333, size.height * 0.6876667, size.width * 0.2533333,
          size.height * 0.6950000, size.width * 0.2533333, size.height * 0.7026667)
      ..close()
      ..moveTo(size.width * 0.2736667, size.height * 0.6270000)
      ..cubicTo(size.width * 0.2733333, size.height * 0.6323333, size.width * 0.2746667,
          size.height * 0.6373333, size.width * 0.2780000, size.height * 0.6420000)
      ..cubicTo(size.width * 0.2813333, size.height * 0.6470000, size.width * 0.2866667,
          size.height * 0.6503333, size.width * 0.2940000, size.height * 0.6526667)
      ..cubicTo(size.width * 0.3010000, size.height * 0.6546667, size.width * 0.3076667,
          size.height * 0.6540000, size.width * 0.3146667, size.height * 0.6503333)
      ..cubicTo(size.width * 0.3216667, size.height * 0.6466667, size.width * 0.3263333,
          size.height * 0.6410000, size.width * 0.3286667, size.height * 0.6333333)
      ..lineTo(size.width * 0.3376667, size.height * 0.6033333)
      ..cubicTo(size.width * 0.3400000, size.height * 0.5953333, size.width * 0.3393333,
          size.height * 0.5880000, size.width * 0.3353333, size.height * 0.5816667)
      ..cubicTo(size.width * 0.3313333, size.height * 0.5753333, size.width * 0.3253333,
          size.height * 0.5710000, size.width * 0.3173333, size.height * 0.5686667)
      ..cubicTo(size.width * 0.3100000, size.height * 0.5663333, size.width * 0.3030000,
          size.height * 0.5670000, size.width * 0.2963333, size.height * 0.5710000)
      ..cubicTo(size.width * 0.2896667, size.height * 0.5746667, size.width * 0.2850000,
          size.height * 0.5803333, size.width * 0.2826667, size.height * 0.5876667)
      ..lineTo(size.width * 0.2746667, size.height * 0.6183333)
      ..cubicTo(size.width * 0.2740000, size.height * 0.6236667, size.width * 0.2736667,
          size.height * 0.6266667, size.width * 0.2736667, size.height * 0.6270000)
      ..close()
      ..moveTo(size.width * 0.3120000, size.height * 0.9033333)
      ..cubicTo(size.width * 0.3120000, size.height * 0.9090000, size.width * 0.3136667,
          size.height * 0.9143333, size.width * 0.3173333, size.height * 0.9196667)
      ..cubicTo(size.width * 0.3210000, size.height * 0.9250000, size.width * 0.3263333,
          size.height * 0.9286667, size.width * 0.3336667, size.height * 0.9306667)
      ..cubicTo(size.width * 0.3366667, size.height * 0.9313333, size.width * 0.3393333,
          size.height * 0.9316667, size.width * 0.3416667, size.height * 0.9316667)
      ..cubicTo(size.width * 0.3560000, size.height * 0.9316667, size.width * 0.3650000,
          size.height * 0.9250000, size.width * 0.3683333, size.height * 0.9113333)
      ..lineTo(size.width * 0.3726667, size.height * 0.8916667)
      ..cubicTo(size.width * 0.3746667, size.height * 0.8830000, size.width * 0.3736667,
          size.height * 0.8756667, size.width * 0.3700000, size.height * 0.8690000)
      ..cubicTo(size.width * 0.3663333, size.height * 0.8623333, size.width * 0.3603333,
          size.height * 0.8583333, size.width * 0.3526667, size.height * 0.8566667)
      ..cubicTo(size.width * 0.3456667, size.height * 0.8543333, size.width * 0.3386667,
          size.height * 0.8550000, size.width * 0.3316667, size.height * 0.8590000)
      ..cubicTo(size.width * 0.3246667, size.height * 0.8630000, size.width * 0.3203333,
          size.height * 0.8686667, size.width * 0.3180000, size.height * 0.8760000)
      ..lineTo(size.width * 0.3133333, size.height * 0.8960000)
      ..cubicTo(size.width * 0.3123333, size.height * 0.8996667, size.width * 0.3120000,
          size.height * 0.9023333, size.width * 0.3120000, size.height * 0.9033333)
      ..close()
      ..moveTo(size.width * 0.3306667, size.height * 0.1553333)
      ..cubicTo(size.width * 0.3306667, size.height * 0.1633333, size.width * 0.3333333,
          size.height * 0.1700000, size.width * 0.3386667, size.height * 0.1753333)
      ..lineTo(size.width * 0.3606667, size.height * 0.1966667)
      ..cubicTo(size.width * 0.3653333, size.height * 0.2020000, size.width * 0.3713333,
          size.height * 0.2046667, size.width * 0.3786667, size.height * 0.2053333)
      ..cubicTo(size.width * 0.3860000, size.height * 0.2060000, size.width * 0.3930000,
          size.height * 0.2030000, size.width * 0.3993333, size.height * 0.1966667)
      ..cubicTo(size.width * 0.4046667, size.height * 0.1913333, size.width * 0.4073333,
          size.height * 0.1846667, size.width * 0.4073333, size.height * 0.1770000)
      ..cubicTo(size.width * 0.4073333, size.height * 0.1690000, size.width * 0.4046667,
          size.height * 0.1623333, size.width * 0.3993333, size.height * 0.1570000)
      ..lineTo(size.width * 0.3783333, size.height * 0.1353333)
      ..cubicTo(size.width * 0.3733333, size.height * 0.1300000, size.width * 0.3666667,
          size.height * 0.1273333, size.width * 0.3590000, size.height * 0.1266667)
      ..cubicTo(size.width * 0.3513333, size.height * 0.1266667, size.width * 0.3446667,
          size.height * 0.1293333, size.width * 0.3390000, size.height * 0.1350000)
      ..cubicTo(size.width * 0.3336667, size.height * 0.1406667, size.width * 0.3306667,
          size.height * 0.1473333, size.width * 0.3306667, size.height * 0.1553333)
      ..close()
      ..moveTo(size.width * 0.3383333, size.height * 0.8066667)
      ..cubicTo(size.width * 0.3383333, size.height * 0.8143333, size.width * 0.3410000,
          size.height * 0.8206667, size.width * 0.3463333, size.height * 0.8260000)
      ..cubicTo(size.width * 0.3516667, size.height * 0.8313333, size.width * 0.3583333,
          size.height * 0.8340000, size.width * 0.3656667, size.height * 0.8340000)
      ..cubicTo(size.width * 0.3736667, size.height * 0.8340000, size.width * 0.3800000,
          size.height * 0.8313333, size.width * 0.3853333, size.height * 0.8263333)
      ..cubicTo(size.width * 0.3906667, size.height * 0.8210000, size.width * 0.3930000,
          size.height * 0.8146667, size.width * 0.3930000, size.height * 0.8066667)
      ..cubicTo(size.width * 0.3930000, size.height * 0.7990000, size.width * 0.3903333,
          size.height * 0.7926667, size.width * 0.3853333, size.height * 0.7873333)
      ..cubicTo(size.width * 0.3800000, size.height * 0.7820000, size.width * 0.3736667,
          size.height * 0.7796667, size.width * 0.3656667, size.height * 0.7796667)
      ..cubicTo(size.width * 0.3576667, size.height * 0.7796667, size.width * 0.3513333,
          size.height * 0.7823333, size.width * 0.3460000, size.height * 0.7873333)
      ..cubicTo(size.width * 0.3406667, size.height * 0.7923333, size.width * 0.3383333,
          size.height * 0.7990000, size.width * 0.3383333, size.height * 0.8066667)
      ..close()
      ..moveTo(size.width * 0.3590000, size.height * 0.7310000)
      ..cubicTo(size.width * 0.3586667, size.height * 0.7360000, size.width * 0.3600000,
          size.height * 0.7413333, size.width * 0.3636667, size.height * 0.7466667)
      ..cubicTo(size.width * 0.3670000, size.height * 0.7520000, size.width * 0.3720000,
          size.height * 0.7553333, size.width * 0.3786667, size.height * 0.7566667)
      ..cubicTo(size.width * 0.3863333, size.height * 0.7586667, size.width * 0.3933333,
          size.height * 0.7580000, size.width * 0.4000000, size.height * 0.7546667)
      ..cubicTo(size.width * 0.4066667, size.height * 0.7513333, size.width * 0.4110000,
          size.height * 0.7450000, size.width * 0.4136667, size.height * 0.7360000)
      ..lineTo(size.width * 0.4223333, size.height * 0.7060000)
      ..cubicTo(size.width * 0.4246667, size.height * 0.6986667, size.width * 0.4240000,
          size.height * 0.6916667, size.width * 0.4200000, size.height * 0.6850000)
      ..cubicTo(size.width * 0.4160000, size.height * 0.6783333, size.width * 0.4103333,
          size.height * 0.6740000, size.width * 0.4023333, size.height * 0.6716667)
      ..cubicTo(size.width * 0.3950000, size.height * 0.6693333, size.width * 0.3880000,
          size.height * 0.6703333, size.width * 0.3810000, size.height * 0.6743333)
      ..cubicTo(size.width * 0.3740000, size.height * 0.6783333, size.width * 0.3696667,
          size.height * 0.6843333, size.width * 0.3673333, size.height * 0.6920000)
      ..lineTo(size.width * 0.3600000, size.height * 0.7220000)
      ..cubicTo(size.width * 0.3593333, size.height * 0.7246667, size.width * 0.3590000,
          size.height * 0.7276667, size.width * 0.3590000, size.height * 0.7310000)
      ..close()
      ..moveTo(size.width * 0.4510000, size.height * 0.8026667)
      ..cubicTo(size.width * 0.4510000, size.height * 0.8083333, size.width * 0.4526667,
          size.height * 0.8136667, size.width * 0.4560000, size.height * 0.8186667)
      ..cubicTo(size.width * 0.4593333, size.height * 0.8236667, size.width * 0.4643333,
          size.height * 0.8273333, size.width * 0.4713333, size.height * 0.8293333)
      ..cubicTo(size.width * 0.4723333, size.height * 0.8293333, size.width * 0.4740000,
          size.height * 0.8296667, size.width * 0.4760000, size.height * 0.8300000)
      ..cubicTo(size.width * 0.4780000, size.height * 0.8303333, size.width * 0.4796667,
          size.height * 0.8306667, size.width * 0.4806667, size.height * 0.8306667)
      ..cubicTo(size.width * 0.4943333, size.height * 0.8306667, size.width * 0.5026667,
          size.height * 0.8233333, size.width * 0.5060000, size.height * 0.8086667)
      ..lineTo(size.width * 0.5106667, size.height * 0.7886667)
      ..cubicTo(size.width * 0.5130000, size.height * 0.7816667, size.width * 0.5123333,
          size.height * 0.7746667, size.width * 0.5083333, size.height * 0.7676667)
      ..cubicTo(size.width * 0.5043333, size.height * 0.7606667, size.width * 0.4986667,
          size.height * 0.7563333, size.width * 0.4913333, size.height * 0.7540000)
      ..cubicTo(size.width * 0.4830000, size.height * 0.7520000, size.width * 0.4753333,
          size.height * 0.7526667, size.width * 0.4686667, size.height * 0.7566667)
      ..cubicTo(size.width * 0.4620000, size.height * 0.7606667, size.width * 0.4573333,
          size.height * 0.7663333, size.width * 0.4550000, size.height * 0.7743333)
      ..lineTo(size.width * 0.4520000, size.height * 0.7940000)
      ..cubicTo(size.width * 0.4520000, size.height * 0.7943333, size.width * 0.4520000,
          size.height * 0.7956667, size.width * 0.4516667, size.height * 0.7976667)
      ..cubicTo(size.width * 0.4513333, size.height * 0.8000000, size.width * 0.4510000,
          size.height * 0.8013333, size.width * 0.4510000, size.height * 0.8026667)
      ..close()
      ..moveTo(size.width * 0.4756667, size.height * 0.7040000)
      ..cubicTo(size.width * 0.4756667, size.height * 0.7116667, size.width * 0.4783333,
          size.height * 0.7180000, size.width * 0.4836667, size.height * 0.7230000)
      ..cubicTo(size.width * 0.4886667, size.height * 0.7283333, size.width * 0.4950000,
          size.height * 0.7310000, size.width * 0.5030000, size.height * 0.7310000)
      ..cubicTo(size.width * 0.5110000, size.height * 0.7310000, size.width * 0.5173333,
          size.height * 0.7283333, size.width * 0.5226667, size.height * 0.7233333)
      ..cubicTo(size.width * 0.5280000, size.height * 0.7180000, size.width * 0.5303333,
          size.height * 0.7116667, size.width * 0.5303333, size.height * 0.7040000)
      ..cubicTo(size.width * 0.5303333, size.height * 0.6960000, size.width * 0.5276667,
          size.height * 0.6896667, size.width * 0.5226667, size.height * 0.6843333)
      ..cubicTo(size.width * 0.5173333, size.height * 0.6790000, size.width * 0.5110000,
          size.height * 0.6766667, size.width * 0.5030000, size.height * 0.6766667)
      ..cubicTo(size.width * 0.4950000, size.height * 0.6766667, size.width * 0.4886667,
          size.height * 0.6793333, size.width * 0.4833333, size.height * 0.6843333)
      ..cubicTo(size.width * 0.4780000, size.height * 0.6893333, size.width * 0.4756667,
          size.height * 0.6960000, size.width * 0.4756667, size.height * 0.7040000)
      ..close()
      ..moveTo(size.width * 0.4960000, size.height * 0.6270000)
      ..cubicTo(size.width * 0.4960000, size.height * 0.6326667, size.width * 0.4976667,
          size.height * 0.6380000, size.width * 0.5013333, size.height * 0.6430000)
      ..cubicTo(size.width * 0.5050000, size.height * 0.6480000, size.width * 0.5103333,
          size.height * 0.6516667, size.width * 0.5176667, size.height * 0.6536667)
      ..cubicTo(size.width * 0.5183333, size.height * 0.6536667, size.width * 0.5196667,
          size.height * 0.6540000, size.width * 0.5216667, size.height * 0.6543333)
      ..cubicTo(size.width * 0.5236667, size.height * 0.6546667, size.width * 0.5253333,
          size.height * 0.6550000, size.width * 0.5263333, size.height * 0.6550000)
      ..cubicTo(size.width * 0.5300000, size.height * 0.6550000, size.width * 0.5340000,
          size.height * 0.6540000, size.width * 0.5386667, size.height * 0.6520000)
      ..cubicTo(size.width * 0.5456667, size.height * 0.6483333, size.width * 0.5500000,
          size.height * 0.6426667, size.width * 0.5520000, size.height * 0.6346667)
      ..lineTo(size.width * 0.5600000, size.height * 0.6046667)
      ..cubicTo(size.width * 0.5620000, size.height * 0.5970000, size.width * 0.5613333,
          size.height * 0.5900000, size.width * 0.5576667, size.height * 0.5836667)
      ..cubicTo(size.width * 0.5540000, size.height * 0.5773333, size.width * 0.5483333,
          size.height * 0.5726667, size.width * 0.5410000, size.height * 0.5703333)
      ..cubicTo(size.width * 0.5333333, size.height * 0.5680000, size.width * 0.5260000,
          size.height * 0.5686667, size.width * 0.5196667, size.height * 0.5723333)
      ..cubicTo(size.width * 0.5130000, size.height * 0.5760000, size.width * 0.5086667,
          size.height * 0.5813333, size.width * 0.5063333, size.height * 0.5893333)
      ..lineTo(size.width * 0.4970000, size.height * 0.6196667)
      ..cubicTo(size.width * 0.4970000, size.height * 0.6203333, size.width * 0.4970000,
          size.height * 0.6213333, size.width * 0.4966667, size.height * 0.6233333)
      ..cubicTo(size.width * 0.4963333, size.height * 0.6243333, size.width * 0.4960000,
          size.height * 0.6256667, size.width * 0.4960000, size.height * 0.6270000)
      ..close()
      ..moveTo(size.width * 0.5076667, size.height * 0.3030000)
      ..cubicTo(size.width * 0.5296667, size.height * 0.2810000, size.width * 0.5570000,
          size.height * 0.2700000, size.width * 0.5900000, size.height * 0.2700000)
      ..cubicTo(size.width * 0.6230000, size.height * 0.2700000, size.width * 0.6510000,
          size.height * 0.2813333, size.width * 0.6740000, size.height * 0.3040000)
      ..cubicTo(size.width * 0.6970000, size.height * 0.3266667, size.width * 0.7086667,
          size.height * 0.3540000, size.width * 0.7086667, size.height * 0.3866667)
      ..cubicTo(size.width * 0.7086667, size.height * 0.4086667, size.width * 0.7026667,
          size.height * 0.4296667, size.width * 0.6910000, size.height * 0.4493333)
      ..cubicTo(size.width * 0.6583333, size.height * 0.4166667, size.width * 0.6193333,
          size.height * 0.4003333, size.width * 0.5743333, size.height * 0.4003333)
      ..lineTo(size.width * 0.5640000, size.height * 0.4003333)
      ..cubicTo(size.width * 0.5546667, size.height * 0.3636667, size.width * 0.5356667,
          size.height * 0.3313333, size.width * 0.5076667, size.height * 0.3030000)
      ..close()
      ..moveTo(size.width * 0.5626667, size.height * 0.1276667)
      ..cubicTo(size.width * 0.5626667, size.height * 0.1353333, size.width * 0.5653333,
          size.height * 0.1416667, size.width * 0.5703333, size.height * 0.1470000)
      ..cubicTo(size.width * 0.5753333, size.height * 0.1520000, size.width * 0.5820000,
          size.height * 0.1546667, size.width * 0.5900000, size.height * 0.1546667)
      ..cubicTo(size.width * 0.5980000, size.height * 0.1546667, size.width * 0.6050000,
          size.height * 0.1520000, size.width * 0.6106667, size.height * 0.1470000)
      ..cubicTo(size.width * 0.6163333, size.height * 0.1420000, size.width * 0.6190000,
          size.height * 0.1353333, size.width * 0.6190000, size.height * 0.1276667)
      ..lineTo(size.width * 0.6190000, size.height * 0.05866667)
      ..cubicTo(size.width * 0.6190000, size.height * 0.05100000, size.width * 0.6160000,
          size.height * 0.04433333, size.width * 0.6103333, size.height * 0.03866667)
      ..cubicTo(size.width * 0.6046667, size.height * 0.03300000, size.width * 0.5976667,
          size.height * 0.03033333, size.width * 0.5900000, size.height * 0.03033333)
      ..cubicTo(size.width * 0.5823333, size.height * 0.03033333, size.width * 0.5756667,
          size.height * 0.03300000, size.width * 0.5706667, size.height * 0.03866667)
      ..cubicTo(size.width * 0.5653333, size.height * 0.04433333, size.width * 0.5630000,
          size.height * 0.05100000, size.width * 0.5630000, size.height * 0.05866667)
      ..lineTo(size.width * 0.5630000, size.height * 0.1276667)
      ..close()
      ..moveTo(size.width * 0.7466667, size.height * 0.2030000)
      ..cubicTo(size.width * 0.7466667, size.height * 0.2113333, size.width * 0.7493333,
          size.height * 0.2180000, size.width * 0.7543333, size.height * 0.2230000)
      ..cubicTo(size.width * 0.7663333, size.height * 0.2350000, size.width * 0.7796667,
          size.height * 0.2350000, size.width * 0.7946667, size.height * 0.2230000)
      ..lineTo(size.width * 0.8423333, size.height * 0.1753333)
      ..cubicTo(size.width * 0.8480000, size.height * 0.1696667, size.width * 0.8506667,
          size.height * 0.1626667, size.width * 0.8506667, size.height * 0.1543333)
      ..cubicTo(size.width * 0.8506667, size.height * 0.1463333, size.width * 0.8480000,
          size.height * 0.1396667, size.width * 0.8423333, size.height * 0.1343333)
      ..cubicTo(size.width * 0.8366667, size.height * 0.1286667, size.width * 0.8300000,
          size.height * 0.1260000, size.width * 0.8223333, size.height * 0.1260000)
      ..cubicTo(size.width * 0.8146667, size.height * 0.1260000, size.width * 0.8080000,
          size.height * 0.1286667, size.width * 0.8020000, size.height * 0.1340000)
      ..lineTo(size.width * 0.7543333, size.height * 0.1833333)
      ..cubicTo(size.width * 0.7493333, size.height * 0.1883333, size.width * 0.7466667,
          size.height * 0.1946667, size.width * 0.7466667, size.height * 0.2030000)
      ..close()
      ..moveTo(size.width * 0.7726667, size.height * 0.5980000)
      ..cubicTo(size.width * 0.7726667, size.height * 0.6056667, size.width * 0.7756667,
          size.height * 0.6123333, size.width * 0.7816667, size.height * 0.6176667)
      ..lineTo(size.width * 0.8020000, size.height * 0.6386667)
      ..cubicTo(size.width * 0.8086667, size.height * 0.6440000, size.width * 0.8153333,
          size.height * 0.6466667, size.width * 0.8223333, size.height * 0.6466667)
      ..cubicTo(size.width * 0.8290000, size.height * 0.6466667, size.width * 0.8356667,
          size.height * 0.6440000, size.width * 0.8423333, size.height * 0.6386667)
      ..cubicTo(size.width * 0.8480000, size.height * 0.6333333, size.width * 0.8506667,
          size.height * 0.6270000, size.width * 0.8506667, size.height * 0.6190000)
      ..cubicTo(size.width * 0.8506667, size.height * 0.6113333, size.width * 0.8480000,
          size.height * 0.6046667, size.width * 0.8423333, size.height * 0.5983333)
      ..lineTo(size.width * 0.8206667, size.height * 0.5780000)
      ..cubicTo(size.width * 0.8156667, size.height * 0.5723333, size.width * 0.8093333,
          size.height * 0.5696667, size.width * 0.8016667, size.height * 0.5696667)
      ..cubicTo(size.width * 0.7940000, size.height * 0.5696667, size.width * 0.7873333,
          size.height * 0.5723333, size.width * 0.7816667, size.height * 0.5780000)
      ..cubicTo(size.width * 0.7756667, size.height * 0.5836667, size.width * 0.7726667,
          size.height * 0.5903333, size.width * 0.7726667, size.height * 0.5980000)
      ..close()
      ..moveTo(size.width * 0.8220000, size.height * 0.3866667)
      ..cubicTo(size.width * 0.8220000, size.height * 0.3946667, size.width * 0.8250000,
          size.height * 0.4010000, size.width * 0.8306667, size.height * 0.4063333)
      ..cubicTo(size.width * 0.8366667, size.height * 0.4123333, size.width * 0.8436667,
          size.height * 0.4153333, size.width * 0.8513333, size.height * 0.4153333)
      ..lineTo(size.width * 0.9190000, size.height * 0.4153333)
      ..cubicTo(size.width * 0.9266667, size.height * 0.4153333, size.width * 0.9333333,
          size.height * 0.4126667, size.width * 0.9386667, size.height * 0.4070000)
      ..cubicTo(size.width * 0.9440000, size.height * 0.4013333, size.width * 0.9466667,
          size.height * 0.3946667, size.width * 0.9466667, size.height * 0.3866667)
      ..cubicTo(size.width * 0.9466667, size.height * 0.3786667, size.width * 0.9440000,
          size.height * 0.3720000, size.width * 0.9386667, size.height * 0.3666667)
      ..cubicTo(size.width * 0.9333333, size.height * 0.3610000, size.width * 0.9270000,
          size.height * 0.3583333, size.width * 0.9190000, size.height * 0.3583333)
      ..lineTo(size.width * 0.8513333, size.height * 0.3583333)
      ..cubicTo(size.width * 0.8433333, size.height * 0.3583333, size.width * 0.8366667,
          size.height * 0.3610000, size.width * 0.8306667, size.height * 0.3666667)
      ..cubicTo(size.width * 0.8246667, size.height * 0.3723333, size.width * 0.8220000,
          size.height * 0.3790000, size.width * 0.8220000, size.height * 0.3866667)
      ..close();
  }

  Path _dayShowersPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.05200000, size.height * 0.5626667)
      ..cubicTo(size.width * 0.05200000, size.height * 0.6070000, size.width * 0.06733333,
          size.height * 0.6450000, size.width * 0.09833333, size.height * 0.6770000)
      ..cubicTo(size.width * 0.1293333, size.height * 0.7090000, size.width * 0.1670000,
          size.height * 0.7256667, size.width * 0.2116667, size.height * 0.7280000)
      ..cubicTo(size.width * 0.2153333, size.height * 0.7280000, size.width * 0.2173333,
          size.height * 0.7260000, size.width * 0.2173333, size.height * 0.7223333)
      ..lineTo(size.width * 0.2173333, size.height * 0.6776667)
      ..cubicTo(size.width * 0.2173333, size.height * 0.6736667, size.width * 0.2153333,
          size.height * 0.6716667, size.width * 0.2116667, size.height * 0.6716667)
      ..cubicTo(size.width * 0.1833333, size.height * 0.6703333, size.width * 0.1593333,
          size.height * 0.6590000, size.width * 0.1393333, size.height * 0.6376667)
      ..cubicTo(size.width * 0.1193333, size.height * 0.6163333, size.width * 0.1096667,
          size.height * 0.5913333, size.width * 0.1096667, size.height * 0.5626667)
      ..cubicTo(size.width * 0.1096667, size.height * 0.5346667, size.width * 0.1190000,
          size.height * 0.5106667, size.width * 0.1376667, size.height * 0.4903333)
      ..cubicTo(size.width * 0.1563333, size.height * 0.4700000, size.width * 0.1796667,
          size.height * 0.4583333, size.width * 0.2076667, size.height * 0.4550000)
      ..lineTo(size.width * 0.2243333, size.height * 0.4536667)
      ..cubicTo(size.width * 0.2286667, size.height * 0.4536667, size.width * 0.2310000,
          size.height * 0.4516667, size.width * 0.2310000, size.height * 0.4476667)
      ..lineTo(size.width * 0.2330000, size.height * 0.4300000)
      ..cubicTo(size.width * 0.2366667, size.height * 0.3940000, size.width * 0.2516667,
          size.height * 0.3636667, size.width * 0.2786667, size.height * 0.3396667)
      ..cubicTo(size.width * 0.3056667, size.height * 0.3153333, size.width * 0.3373333,
          size.height * 0.3033333, size.width * 0.3740000, size.height * 0.3033333)
      ..cubicTo(size.width * 0.4103333, size.height * 0.3033333, size.width * 0.4423333,
          size.height * 0.3153333, size.width * 0.4693333, size.height * 0.3396667)
      ..cubicTo(size.width * 0.4963333, size.height * 0.3640000, size.width * 0.5116667,
          size.height * 0.3940000, size.width * 0.5150000, size.height * 0.4300000)
      ..lineTo(size.width * 0.5173333, size.height * 0.4490000)
      ..cubicTo(size.width * 0.5173333, size.height * 0.4530000, size.width * 0.5193333,
          size.height * 0.4550000, size.width * 0.5233333, size.height * 0.4550000)
      ..lineTo(size.width * 0.5790000, size.height * 0.4550000)
      ..cubicTo(size.width * 0.6083333, size.height * 0.4550000, size.width * 0.6333333,
          size.height * 0.4656667, size.width * 0.6546667, size.height * 0.4870000)
      ..cubicTo(size.width * 0.6760000, size.height * 0.5083333, size.width * 0.6866667,
          size.height * 0.5333333, size.width * 0.6866667, size.height * 0.5626667)
      ..cubicTo(size.width * 0.6866667, size.height * 0.5910000, size.width * 0.6766667,
          size.height * 0.6156667, size.width * 0.6566667, size.height * 0.6366667)
      ..cubicTo(size.width * 0.6366667, size.height * 0.6576667, size.width * 0.6126667,
          size.height * 0.6693333, size.width * 0.5846667, size.height * 0.6716667)
      ..cubicTo(size.width * 0.5810000, size.height * 0.6716667, size.width * 0.5790000,
          size.height * 0.6736667, size.width * 0.5790000, size.height * 0.6776667)
      ..lineTo(size.width * 0.5790000, size.height * 0.7223333)
      ..cubicTo(size.width * 0.5790000, size.height * 0.7260000, size.width * 0.5810000,
          size.height * 0.7280000, size.width * 0.5846667, size.height * 0.7280000)
      ..cubicTo(size.width * 0.6140000, size.height * 0.7273333, size.width * 0.6403333,
          size.height * 0.7193333, size.width * 0.6646667, size.height * 0.7040000)
      ..cubicTo(size.width * 0.6890000, size.height * 0.6886667, size.width * 0.7080000,
          size.height * 0.6690000, size.width * 0.7216667, size.height * 0.6440000)
      ..cubicTo(size.width * 0.7356667, size.height * 0.6190000, size.width * 0.7423333,
          size.height * 0.5920000, size.width * 0.7423333, size.height * 0.5626667)
      ..cubicTo(size.width * 0.7423333, size.height * 0.5390000, size.width * 0.7376667,
          size.height * 0.5170000, size.width * 0.7286667, size.height * 0.4973333)
      ..cubicTo(size.width * 0.7540000, size.height * 0.4660000, size.width * 0.7663333,
          size.height * 0.4296667, size.width * 0.7663333, size.height * 0.3880000)
      ..cubicTo(size.width * 0.7663333, size.height * 0.3643333, size.width * 0.7616667,
          size.height * 0.3416667, size.width * 0.7526667, size.height * 0.3200000)
      ..cubicTo(size.width * 0.7436667, size.height * 0.2983333, size.width * 0.7310000,
          size.height * 0.2800000, size.width * 0.7153333, size.height * 0.2643333)
      ..cubicTo(size.width * 0.7000000, size.height * 0.2486667, size.width * 0.6813333,
          size.height * 0.2363333, size.width * 0.6600000, size.height * 0.2273333)
      ..cubicTo(size.width * 0.6383333, size.height * 0.2180000, size.width * 0.6156667,
          size.height * 0.2136667, size.width * 0.5920000, size.height * 0.2136667)
      ..cubicTo(size.width * 0.5416667, size.height * 0.2136667, size.width * 0.4993333,
          size.height * 0.2320000, size.width * 0.4650000, size.height * 0.2690000)
      ..cubicTo(size.width * 0.4386667, size.height * 0.2546667, size.width * 0.4083333,
          size.height * 0.2476667, size.width * 0.3740000, size.height * 0.2476667)
      ..cubicTo(size.width * 0.3270000, size.height * 0.2476667, size.width * 0.2853333,
          size.height * 0.2623333, size.width * 0.2490000, size.height * 0.2913333)
      ..cubicTo(size.width * 0.2126667, size.height * 0.3203333, size.width * 0.1900000,
          size.height * 0.3576667, size.width * 0.1800000, size.height * 0.4030000)
      ..cubicTo(size.width * 0.1426667, size.height * 0.4116667, size.width * 0.1116667,
          size.height * 0.4306667, size.width * 0.08766667, size.height * 0.4603333)
      ..cubicTo(size.width * 0.06400000, size.height * 0.4900000, size.width * 0.05200000,
          size.height * 0.5243333, size.width * 0.05200000, size.height * 0.5626667)
      ..close()
      ..moveTo(size.width * 0.2323333, size.height * 0.7860000)
      ..cubicTo(size.width * 0.2323333, size.height * 0.7920000, size.width * 0.2340000,
          size.height * 0.7980000, size.width * 0.2376667, size.height * 0.8036667)
      ..cubicTo(size.width * 0.2413333, size.height * 0.8096667, size.width * 0.2463333,
          size.height * 0.8133333, size.width * 0.2526667, size.height * 0.8156667)
      ..cubicTo(size.width * 0.2590000, size.height * 0.8180000, size.width * 0.2660000,
          size.height * 0.8173333, size.width * 0.2730000, size.height * 0.8136667)
      ..cubicTo(size.width * 0.2803333, size.height * 0.8100000, size.width * 0.2850000,
          size.height * 0.8040000, size.width * 0.2876667, size.height * 0.7953333)
      ..lineTo(size.width * 0.2960000, size.height * 0.7603333)
      ..cubicTo(size.width * 0.2983333, size.height * 0.7533333, size.width * 0.2976667,
          size.height * 0.7466667, size.width * 0.2936667, size.height * 0.7396667)
      ..cubicTo(size.width * 0.2896667, size.height * 0.7326667, size.width * 0.2840000,
          size.height * 0.7280000, size.width * 0.2766667, size.height * 0.7256667)
      ..cubicTo(size.width * 0.2683333, size.height * 0.7236667, size.width * 0.2610000,
          size.height * 0.7246667, size.width * 0.2543333, size.height * 0.7283333)
      ..cubicTo(size.width * 0.2476667, size.height * 0.7320000, size.width * 0.2436667,
          size.height * 0.7383333, size.width * 0.2420000, size.height * 0.7460000)
      ..lineTo(size.width * 0.2326667, size.height * 0.7790000)
      ..cubicTo(size.width * 0.2326667, size.height * 0.7806667, size.width * 0.2323333,
          size.height * 0.7830000, size.width * 0.2323333, size.height * 0.7860000)
      ..close()
      ..moveTo(size.width * 0.2760000, size.height * 0.6286667)
      ..cubicTo(size.width * 0.2760000, size.height * 0.6413333, size.width * 0.2830000,
          size.height * 0.6500000, size.width * 0.2973333, size.height * 0.6550000)
      ..cubicTo(size.width * 0.3046667, size.height * 0.6576667, size.width * 0.3116667,
          size.height * 0.6570000, size.width * 0.3186667, size.height * 0.6533333)
      ..cubicTo(size.width * 0.3256667, size.height * 0.6496667, size.width * 0.3300000,
          size.height * 0.6436667, size.width * 0.3323333, size.height * 0.6356667)
      ..lineTo(size.width * 0.3403333, size.height * 0.6013333)
      ..cubicTo(size.width * 0.3426667, size.height * 0.5943333, size.width * 0.3420000,
          size.height * 0.5876667, size.width * 0.3380000, size.height * 0.5806667)
      ..cubicTo(size.width * 0.3343333, size.height * 0.5736667, size.width * 0.3286667,
          size.height * 0.5690000, size.width * 0.3210000, size.height * 0.5666667)
      ..cubicTo(size.width * 0.3130000, size.height * 0.5646667, size.width * 0.3053333,
          size.height * 0.5653333, size.width * 0.2986667, size.height * 0.5693333)
      ..cubicTo(size.width * 0.2920000, size.height * 0.5733333, size.width * 0.2880000,
          size.height * 0.5790000, size.width * 0.2863333, size.height * 0.5866667)
      ..lineTo(size.width * 0.2763333, size.height * 0.6206667)
      ..cubicTo(size.width * 0.2763333, size.height * 0.6233333, size.width * 0.2760000,
          size.height * 0.6260000, size.width * 0.2760000, size.height * 0.6286667)
      ..close()
      ..moveTo(size.width * 0.3166667, size.height * 0.8916667)
      ..cubicTo(size.width * 0.3166667, size.height * 0.8970000, size.width * 0.3186667,
          size.height * 0.9026667, size.width * 0.3223333, size.height * 0.9083333)
      ..cubicTo(size.width * 0.3260000, size.height * 0.9140000, size.width * 0.3316667,
          size.height * 0.9180000, size.width * 0.3386667, size.height * 0.9203333)
      ..cubicTo(size.width * 0.3390000, size.height * 0.9203333, size.width * 0.3400000,
          size.height * 0.9203333, size.width * 0.3420000, size.height * 0.9206667)
      ..cubicTo(size.width * 0.3440000, size.height * 0.9210000, size.width * 0.3456667,
          size.height * 0.9210000, size.width * 0.3470000, size.height * 0.9210000)
      ..cubicTo(size.width * 0.3516667, size.height * 0.9210000, size.width * 0.3556667,
          size.height * 0.9203333, size.width * 0.3593333, size.height * 0.9186667)
      ..cubicTo(size.width * 0.3656667, size.height * 0.9160000, size.width * 0.3703333,
          size.height * 0.9096667, size.width * 0.3730000, size.height * 0.8993333)
      ..lineTo(size.width * 0.3820000, size.height * 0.8663333)
      ..cubicTo(size.width * 0.3843333, size.height * 0.8586667, size.width * 0.3836667,
          size.height * 0.8513333, size.width * 0.3796667, size.height * 0.8446667)
      ..cubicTo(size.width * 0.3756667, size.height * 0.8380000, size.width * 0.3700000,
          size.height * 0.8333333, size.width * 0.3626667, size.height * 0.8313333)
      ..cubicTo(size.width * 0.3550000, size.height * 0.8290000, size.width * 0.3476667,
          size.height * 0.8296667, size.width * 0.3410000, size.height * 0.8336667)
      ..cubicTo(size.width * 0.3343333, size.height * 0.8376667, size.width * 0.3296667,
          size.height * 0.8433333, size.width * 0.3276667, size.height * 0.8506667)
      ..lineTo(size.width * 0.3183333, size.height * 0.8846667)
      ..cubicTo(size.width * 0.3170000, size.height * 0.8876667, size.width * 0.3166667,
          size.height * 0.8900000, size.width * 0.3166667, size.height * 0.8916667)
      ..close()
      ..moveTo(size.width * 0.3320000, size.height * 0.1560000)
      ..cubicTo(size.width * 0.3320000, size.height * 0.1643333, size.width * 0.3346667,
          size.height * 0.1713333, size.width * 0.3403333, size.height * 0.1766667)
      ..lineTo(size.width * 0.3623333, size.height * 0.1983333)
      ..cubicTo(size.width * 0.3736667, size.height * 0.2096667, size.width * 0.3866667,
          size.height * 0.2096667, size.width * 0.4013333, size.height * 0.1983333)
      ..cubicTo(size.width * 0.4066667, size.height * 0.1926667, size.width * 0.4093333,
          size.height * 0.1856667, size.width * 0.4093333, size.height * 0.1780000)
      ..cubicTo(size.width * 0.4093333, size.height * 0.1703333, size.width * 0.4066667,
          size.height * 0.1636667, size.width * 0.4013333, size.height * 0.1576667)
      ..lineTo(size.width * 0.3803333, size.height * 0.1356667)
      ..cubicTo(size.width * 0.3750000, size.height * 0.1303333, size.width * 0.3683333,
          size.height * 0.1276667, size.width * 0.3603333, size.height * 0.1276667)
      ..cubicTo(size.width * 0.3526667, size.height * 0.1276667, size.width * 0.3460000,
          size.height * 0.1303333, size.width * 0.3403333, size.height * 0.1360000)
      ..cubicTo(size.width * 0.3346667, size.height * 0.1413333, size.width * 0.3320000,
          size.height * 0.1480000, size.width * 0.3320000, size.height * 0.1560000)
      ..close()
      ..moveTo(size.width * 0.3616667, size.height * 0.7320000)
      ..cubicTo(size.width * 0.3616667, size.height * 0.7376667, size.width * 0.3633333,
          size.height * 0.7433333, size.width * 0.3670000, size.height * 0.7490000)
      ..cubicTo(size.width * 0.3706667, size.height * 0.7546667, size.width * 0.3756667,
          size.height * 0.7583333, size.width * 0.3826667, size.height * 0.7606667)
      ..cubicTo(size.width * 0.3903333, size.height * 0.7630000, size.width * 0.3973333,
          size.height * 0.7623333, size.width * 0.4040000, size.height * 0.7590000)
      ..cubicTo(size.width * 0.4103333, size.height * 0.7556667, size.width * 0.4150000,
          size.height * 0.7493333, size.width * 0.4173333, size.height * 0.7403333)
      ..lineTo(size.width * 0.4253333, size.height * 0.7066667)
      ..cubicTo(size.width * 0.4276667, size.height * 0.6990000, size.width * 0.4270000,
          size.height * 0.6916667, size.width * 0.4233333, size.height * 0.6850000)
      ..cubicTo(size.width * 0.4196667, size.height * 0.6783333, size.width * 0.4140000,
          size.height * 0.6736667, size.width * 0.4066667, size.height * 0.6713333)
      ..cubicTo(size.width * 0.3983333, size.height * 0.6690000, size.width * 0.3906667,
          size.height * 0.6700000, size.width * 0.3840000, size.height * 0.6740000)
      ..cubicTo(size.width * 0.3773333, size.height * 0.6780000, size.width * 0.3730000,
          size.height * 0.6840000, size.width * 0.3716667, size.height * 0.6916667)
      ..lineTo(size.width * 0.3623333, size.height * 0.7260000)
      ..cubicTo(size.width * 0.3616667, size.height * 0.7270000, size.width * 0.3616667,
          size.height * 0.7290000, size.width * 0.3616667, size.height * 0.7320000)
      ..close()
      ..moveTo(size.width * 0.4543333, size.height * 0.7893333)
      ..cubicTo(size.width * 0.4550000, size.height * 0.8020000, size.width * 0.4620000,
          size.height * 0.8110000, size.width * 0.4753333, size.height * 0.8170000)
      ..lineTo(size.width * 0.4836667, size.height * 0.8183333)
      ..cubicTo(size.width * 0.4890000, size.height * 0.8183333, size.width * 0.4943333,
          size.height * 0.8166667, size.width * 0.4993333, size.height * 0.8130000)
      ..cubicTo(size.width * 0.5043333, size.height * 0.8093333, size.width * 0.5080000,
          size.height * 0.8040000, size.width * 0.5100000, size.height * 0.7963333)
      ..lineTo(size.width * 0.5196667, size.height * 0.7626667)
      ..cubicTo(size.width * 0.5216667, size.height * 0.7546667, size.width * 0.5206667,
          size.height * 0.7473333, size.width * 0.5166667, size.height * 0.7406667)
      ..cubicTo(size.width * 0.5126667, size.height * 0.7340000, size.width * 0.5066667,
          size.height * 0.7296667, size.width * 0.4990000, size.height * 0.7283333)
      ..cubicTo(size.width * 0.4920000, size.height * 0.7260000, size.width * 0.4853333,
          size.height * 0.7266667, size.width * 0.4783333, size.height * 0.7306667)
      ..cubicTo(size.width * 0.4713333, size.height * 0.7346667, size.width * 0.4670000,
          size.height * 0.7403333, size.width * 0.4646667, size.height * 0.7476667)
      ..lineTo(size.width * 0.4556667, size.height * 0.7816667)
      ..cubicTo(size.width * 0.4553333, size.height * 0.7823333, size.width * 0.4553333,
          size.height * 0.7833333, size.width * 0.4550000, size.height * 0.7843333)
      ..cubicTo(size.width * 0.4546667, size.height * 0.7853333, size.width * 0.4546667,
          size.height * 0.7863333, size.width * 0.4543333, size.height * 0.7870000)
      ..cubicTo(size.width * 0.4540000, size.height * 0.7876667, size.width * 0.4543333,
          size.height * 0.7886667, size.width * 0.4543333, size.height * 0.7893333)
      ..close()
      ..moveTo(size.width * 0.5010000, size.height * 0.6306667)
      ..cubicTo(size.width * 0.5010000, size.height * 0.6360000, size.width * 0.5026667,
          size.height * 0.6413333, size.width * 0.5060000, size.height * 0.6466667)
      ..cubicTo(size.width * 0.5093333, size.height * 0.6520000, size.width * 0.5143333,
          size.height * 0.6556667, size.width * 0.5210000, size.height * 0.6573333)
      ..lineTo(size.width * 0.5293333, size.height * 0.6583333)
      ..cubicTo(size.width * 0.5356667, size.height * 0.6583333, size.width * 0.5416667,
          size.height * 0.6563333, size.width * 0.5466667, size.height * 0.6523333)
      ..cubicTo(size.width * 0.5516667, size.height * 0.6483333, size.width * 0.5546667,
          size.height * 0.6430000, size.width * 0.5560000, size.height * 0.6366667)
      ..lineTo(size.width * 0.5650000, size.height * 0.6036667)
      ..cubicTo(size.width * 0.5673333, size.height * 0.5956667, size.width * 0.5666667,
          size.height * 0.5886667, size.width * 0.5626667, size.height * 0.5820000)
      ..cubicTo(size.width * 0.5590000, size.height * 0.5753333, size.width * 0.5533333,
          size.height * 0.5710000, size.width * 0.5456667, size.height * 0.5690000)
      ..cubicTo(size.width * 0.5380000, size.height * 0.5666667, size.width * 0.5306667,
          size.height * 0.5673333, size.width * 0.5243333, size.height * 0.5710000)
      ..cubicTo(size.width * 0.5176667, size.height * 0.5746667, size.width * 0.5133333,
          size.height * 0.5803333, size.width * 0.5113333, size.height * 0.5876667)
      ..lineTo(size.width * 0.5013333, size.height * 0.6230000)
      ..cubicTo(size.width * 0.5013333, size.height * 0.6256667, size.width * 0.5010000,
          size.height * 0.6283333, size.width * 0.5010000, size.height * 0.6306667)
      ..close()
      ..moveTo(size.width * 0.5120000, size.height * 0.3020000)
      ..cubicTo(size.width * 0.5340000, size.height * 0.2806667, size.width * 0.5606667,
          size.height * 0.2700000, size.width * 0.5920000, size.height * 0.2700000)
      ..cubicTo(size.width * 0.6246667, size.height * 0.2700000, size.width * 0.6526667,
          size.height * 0.2816667, size.width * 0.6756667, size.height * 0.3046667)
      ..cubicTo(size.width * 0.6986667, size.height * 0.3276667, size.width * 0.7103333,
          size.height * 0.3556667, size.width * 0.7103333, size.height * 0.3883333)
      ..cubicTo(size.width * 0.7103333, size.height * 0.4070000, size.width * 0.7050000,
          size.height * 0.4266667, size.width * 0.6946667, size.height * 0.4470000)
      ..cubicTo(size.width * 0.6626667, size.height * 0.4150000, size.width * 0.6243333,
          size.height * 0.3993333, size.width * 0.5790000, size.height * 0.3993333)
      ..lineTo(size.width * 0.5676667, size.height * 0.3993333)
      ..cubicTo(size.width * 0.5590000, size.height * 0.3613333, size.width * 0.5403333,
          size.height * 0.3290000, size.width * 0.5120000, size.height * 0.3020000)
      ..close()
      ..moveTo(size.width * 0.5633333, size.height * 0.1276667)
      ..cubicTo(size.width * 0.5633333, size.height * 0.1360000, size.width * 0.5660000,
          size.height * 0.1426667, size.width * 0.5713333, size.height * 0.1480000)
      ..cubicTo(size.width * 0.5766667, size.height * 0.1533333, size.width * 0.5833333,
          size.height * 0.1560000, size.width * 0.5916667, size.height * 0.1560000)
      ..cubicTo(size.width * 0.6000000, size.height * 0.1560000, size.width * 0.6066667,
          size.height * 0.1533333, size.width * 0.6120000, size.height * 0.1480000)
      ..cubicTo(size.width * 0.6173333, size.height * 0.1426667, size.width * 0.6200000,
          size.height * 0.1360000, size.width * 0.6200000, size.height * 0.1276667)
      ..lineTo(size.width * 0.6200000, size.height * 0.06033333)
      ..cubicTo(size.width * 0.6200000, size.height * 0.05200000, size.width * 0.6173333,
          size.height * 0.04500000, size.width * 0.6120000, size.height * 0.03966667)
      ..cubicTo(size.width * 0.6066667, size.height * 0.03433333, size.width * 0.6000000,
          size.height * 0.03166667, size.width * 0.5916667, size.height * 0.03166667)
      ..cubicTo(size.width * 0.5833333, size.height * 0.03166667, size.width * 0.5766667,
          size.height * 0.03433333, size.width * 0.5713333, size.height * 0.03966667)
      ..cubicTo(size.width * 0.5660000, size.height * 0.04500000, size.width * 0.5633333,
          size.height * 0.05200000, size.width * 0.5633333, size.height * 0.06033333)
      ..lineTo(size.width * 0.5633333, size.height * 0.1276667)
      ..close()
      ..moveTo(size.width * 0.7483333, size.height * 0.2040000)
      ..cubicTo(size.width * 0.7483333, size.height * 0.2123333, size.width * 0.7510000,
          size.height * 0.2190000, size.width * 0.7560000, size.height * 0.2243333)
      ..cubicTo(size.width * 0.7630000, size.height * 0.2300000, size.width * 0.7696667,
          size.height * 0.2326667, size.width * 0.7766667, size.height * 0.2326667)
      ..cubicTo(size.width * 0.7830000, size.height * 0.2326667, size.width * 0.7893333,
          size.height * 0.2300000, size.width * 0.7963333, size.height * 0.2243333)
      ..lineTo(size.width * 0.8440000, size.height * 0.1766667)
      ..cubicTo(size.width * 0.8493333, size.height * 0.1706667, size.width * 0.8520000,
          size.height * 0.1636667, size.width * 0.8520000, size.height * 0.1556667)
      ..cubicTo(size.width * 0.8520000, size.height * 0.1476667, size.width * 0.8493333,
          size.height * 0.1410000, size.width * 0.8440000, size.height * 0.1356667)
      ..cubicTo(size.width * 0.8386667, size.height * 0.1303333, size.width * 0.8320000,
          size.height * 0.1276667, size.width * 0.8243333, size.height * 0.1276667)
      ..cubicTo(size.width * 0.8166667, size.height * 0.1276667, size.width * 0.8100000,
          size.height * 0.1303333, size.width * 0.8040000, size.height * 0.1356667)
      ..lineTo(size.width * 0.7560000, size.height * 0.1833333)
      ..cubicTo(size.width * 0.7510000, size.height * 0.1893333, size.width * 0.7483333,
          size.height * 0.1960000, size.width * 0.7483333, size.height * 0.2040000)
      ..close()
      ..moveTo(size.width * 0.7746667, size.height * 0.5983333)
      ..cubicTo(size.width * 0.7746667, size.height * 0.6060000, size.width * 0.7776667,
          size.height * 0.6130000, size.width * 0.7833333, size.height * 0.6193333)
      ..lineTo(size.width * 0.8040000, size.height * 0.6406667)
      ..cubicTo(size.width * 0.8110000, size.height * 0.6476667, size.width * 0.8176667,
          size.height * 0.6510000, size.width * 0.8246667, size.height * 0.6510000)
      ..cubicTo(size.width * 0.8310000, size.height * 0.6510000, size.width * 0.8376667,
          size.height * 0.6476667, size.width * 0.8440000, size.height * 0.6406667)
      ..cubicTo(size.width * 0.8500000, size.height * 0.6346667, size.width * 0.8530000,
          size.height * 0.6276667, size.width * 0.8526667, size.height * 0.6203333)
      ..cubicTo(size.width * 0.8523333, size.height * 0.6126667, size.width * 0.8496667,
          size.height * 0.6060000, size.width * 0.8440000, size.height * 0.6003333)
      ..lineTo(size.width * 0.8223333, size.height * 0.5783333)
      ..cubicTo(size.width * 0.8170000, size.height * 0.5730000, size.width * 0.8106667,
          size.height * 0.5703333, size.width * 0.8033333, size.height * 0.5703333)
      ..cubicTo(size.width * 0.7953333, size.height * 0.5703333, size.width * 0.7886667,
          size.height * 0.5730000, size.width * 0.7830000, size.height * 0.5786667)
      ..cubicTo(size.width * 0.7776667, size.height * 0.5840000, size.width * 0.7746667,
          size.height * 0.5906667, size.width * 0.7746667, size.height * 0.5983333)
      ..close()
      ..moveTo(size.width * 0.8236667, size.height * 0.3880000)
      ..cubicTo(size.width * 0.8236667, size.height * 0.3953333, size.width * 0.8263333,
          size.height * 0.4020000, size.width * 0.8316667, size.height * 0.4073333)
      ..cubicTo(size.width * 0.8370000, size.height * 0.4126667, size.width * 0.8436667,
          size.height * 0.4153333, size.width * 0.8510000, size.height * 0.4153333)
      ..lineTo(size.width * 0.9190000, size.height * 0.4153333)
      ..cubicTo(size.width * 0.9276667, size.height * 0.4153333, size.width * 0.9346667,
          size.height * 0.4126667, size.width * 0.9400000, size.height * 0.4076667)
      ..cubicTo(size.width * 0.9453333, size.height * 0.4023333, size.width * 0.9480000,
          size.height * 0.3960000, size.width * 0.9480000, size.height * 0.3880000)
      ..cubicTo(size.width * 0.9480000, size.height * 0.3796667, size.width * 0.9453333,
          size.height * 0.3726667, size.width * 0.9396667, size.height * 0.3673333)
      ..cubicTo(size.width * 0.9340000, size.height * 0.3620000, size.width * 0.9273333,
          size.height * 0.3593333, size.width * 0.9190000, size.height * 0.3593333)
      ..lineTo(size.width * 0.8510000, size.height * 0.3593333)
      ..cubicTo(size.width * 0.8433333, size.height * 0.3593333, size.width * 0.8366667,
          size.height * 0.3620000, size.width * 0.8313333, size.height * 0.3676667)
      ..cubicTo(size.width * 0.8263333, size.height * 0.3733333, size.width * 0.8236667,
          size.height * 0.3803333, size.width * 0.8236667, size.height * 0.3880000)
      ..close();
  }

  Path _daySleetPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.04966667, size.height * 0.5640000)
      ..lineTo(size.width * 0.04966667, size.height * 0.5640000)
      ..cubicTo(size.width * 0.04966667, size.height * 0.5250000, size.width * 0.06166667,
          size.height * 0.4910000, size.width * 0.08566667, size.height * 0.4610000)
      ..cubicTo(size.width * 0.1096667, size.height * 0.4310000, size.width * 0.1403333,
          size.height * 0.4116667, size.width * 0.1770000, size.height * 0.4030000)
      ..cubicTo(size.width * 0.1873333, size.height * 0.3573333, size.width * 0.2106667,
          size.height * 0.3200000, size.width * 0.2470000, size.height * 0.2903333)
      ..cubicTo(size.width * 0.2836667, size.height * 0.2610000, size.width * 0.3253333,
          size.height * 0.2463333, size.width * 0.3726667, size.height * 0.2463333)
      ..cubicTo(size.width * 0.4056667, size.height * 0.2463333, size.width * 0.4360000,
          size.height * 0.2536667, size.width * 0.4633333, size.height * 0.2683333)
      ..cubicTo(size.width * 0.4800000, size.height * 0.2506667, size.width * 0.4996667,
          size.height * 0.2366667, size.width * 0.5220000, size.height * 0.2266667)
      ..cubicTo(size.width * 0.5443333, size.height * 0.2166667, size.width * 0.5676667,
          size.height * 0.2116667, size.width * 0.5916667, size.height * 0.2116667)
      ..cubicTo(size.width * 0.6233333, size.height * 0.2116667, size.width * 0.6526667,
          size.height * 0.2196667, size.width * 0.6796667, size.height * 0.2353333)
      ..cubicTo(size.width * 0.7066667, size.height * 0.2510000, size.width * 0.7280000,
          size.height * 0.2723333, size.width * 0.7436667, size.height * 0.2993333)
      ..cubicTo(size.width * 0.7593333, size.height * 0.3263333, size.width * 0.7673333,
          size.height * 0.3556667, size.width * 0.7673333, size.height * 0.3873333)
      ..cubicTo(size.width * 0.7673333, size.height * 0.4283333, size.width * 0.7546667,
          size.height * 0.4650000, size.width * 0.7293333, size.height * 0.4970000)
      ..cubicTo(size.width * 0.7390000, size.height * 0.5173333, size.width * 0.7436667,
          size.height * 0.5396667, size.width * 0.7436667, size.height * 0.5643333)
      ..cubicTo(size.width * 0.7436667, size.height * 0.5936667, size.width * 0.7366667,
          size.height * 0.6210000, size.width * 0.7223333, size.height * 0.6460000)
      ..cubicTo(size.width * 0.7083333, size.height * 0.6710000, size.width * 0.6890000,
          size.height * 0.6913333, size.width * 0.6643333, size.height * 0.7063333)
      ..cubicTo(size.width * 0.6400000, size.height * 0.7216667, size.width * 0.6130000,
          size.height * 0.7296667, size.width * 0.5836667, size.height * 0.7303333)
      ..cubicTo(size.width * 0.5793333, size.height * 0.7303333, size.width * 0.5770000,
          size.height * 0.7283333, size.width * 0.5770000, size.height * 0.7243333)
      ..lineTo(size.width * 0.5770000, size.height * 0.6796667)
      ..cubicTo(size.width * 0.5770000, size.height * 0.6756667, size.width * 0.5793333,
          size.height * 0.6736667, size.width * 0.5836667, size.height * 0.6736667)
      ..cubicTo(size.width * 0.6123333, size.height * 0.6723333, size.width * 0.6363333,
          size.height * 0.6606667, size.width * 0.6563333, size.height * 0.6393333)
      ..cubicTo(size.width * 0.6763333, size.height * 0.6180000, size.width * 0.6863333,
          size.height * 0.5926667, size.width * 0.6863333, size.height * 0.5640000)
      ..cubicTo(size.width * 0.6863333, size.height * 0.5343333, size.width * 0.6756667,
          size.height * 0.5090000, size.width * 0.6540000, size.height * 0.4876667)
      ..cubicTo(size.width * 0.6323333, size.height * 0.4663333, size.width * 0.6070000,
          size.height * 0.4556667, size.width * 0.5770000, size.height * 0.4556667)
      ..lineTo(size.width * 0.5233333, size.height * 0.4556667)
      ..cubicTo(size.width * 0.5193333, size.height * 0.4556667, size.width * 0.5173333,
          size.height * 0.4536667, size.width * 0.5173333, size.height * 0.4500000)
      ..lineTo(size.width * 0.5146667, size.height * 0.4303333)
      ..cubicTo(size.width * 0.5110000, size.height * 0.3943333, size.width * 0.4953333,
          size.height * 0.3640000, size.width * 0.4680000, size.height * 0.3396667)
      ..cubicTo(size.width * 0.4406667, size.height * 0.3153333, size.width * 0.4086667,
          size.height * 0.3030000, size.width * 0.3726667, size.height * 0.3030000)
      ..cubicTo(size.width * 0.3360000, size.height * 0.3030000, size.width * 0.3043333,
          size.height * 0.3153333, size.width * 0.2773333, size.height * 0.3396667)
      ..cubicTo(size.width * 0.2503333, size.height * 0.3640000, size.width * 0.2350000,
          size.height * 0.3943333, size.width * 0.2316667, size.height * 0.4303333)
      ..lineTo(size.width * 0.2293333, size.height * 0.4500000)
      ..cubicTo(size.width * 0.2283333, size.height * 0.4530000, size.width * 0.2256667,
          size.height * 0.4543333, size.width * 0.2220000, size.height * 0.4543333)
      ..lineTo(size.width * 0.2050000, size.height * 0.4556667)
      ..cubicTo(size.width * 0.1770000, size.height * 0.4590000, size.width * 0.1533333,
          size.height * 0.4706667, size.width * 0.1346667, size.height * 0.4910000)
      ..cubicTo(size.width * 0.1160000, size.height * 0.5113333, size.width * 0.1066667,
          size.height * 0.5356667, size.width * 0.1066667, size.height * 0.5636667)
      ..lineTo(size.width * 0.1066667, size.height * 0.5653333)
      ..lineTo(size.width * 0.1076667, size.height * 0.5653333)
      ..cubicTo(size.width * 0.1080000, size.height * 0.5980000, size.width * 0.1203333,
          size.height * 0.6246667, size.width * 0.1446667, size.height * 0.6463333)
      ..cubicTo(size.width * 0.1520000, size.height * 0.6526667, size.width * 0.1603333,
          size.height * 0.6583333, size.width * 0.1693333, size.height * 0.6626667)
      ..lineTo(size.width * 0.1693333, size.height * 0.6633333)
      ..cubicTo(size.width * 0.1830000, size.height * 0.6696667, size.width * 0.1966667,
          size.height * 0.6730000, size.width * 0.2096667, size.height * 0.6736667)
      ..cubicTo(size.width * 0.2133333, size.height * 0.6736667, size.width * 0.2153333,
          size.height * 0.6756667, size.width * 0.2153333, size.height * 0.6793333)
      ..lineTo(size.width * 0.2153333, size.height * 0.7240000)
      ..cubicTo(size.width * 0.2153333, size.height * 0.7276667, size.width * 0.2133333,
          size.height * 0.7296667, size.width * 0.2096667, size.height * 0.7296667)
      ..cubicTo(size.width * 0.1923333, size.height * 0.7286667, size.width * 0.1760000,
          size.height * 0.7253333, size.width * 0.1603333, size.height * 0.7196667)
      ..lineTo(size.width * 0.1603333, size.height * 0.7203333)
      ..cubicTo(size.width * 0.1326667, size.height * 0.7106667, size.width * 0.1090000,
          size.height * 0.6946667, size.width * 0.09000000, size.height * 0.6726667)
      ..cubicTo(size.width * 0.07100000, size.height * 0.6506667, size.width * 0.05833333,
          size.height * 0.6246667, size.width * 0.05300000, size.height * 0.5956667)
      ..lineTo(size.width * 0.05300000, size.height * 0.5943333)
      ..cubicTo(size.width * 0.05266667, size.height * 0.5940000, size.width * 0.05266667,
          size.height * 0.5936667, size.width * 0.05266667, size.height * 0.5933333)
      ..cubicTo(size.width * 0.05033333, size.height * 0.5846667, size.width * 0.04966667,
          size.height * 0.5750000, size.width * 0.04966667, size.height * 0.5640000)
      ..close()
      ..moveTo(size.width * 0.2330000, size.height * 0.8030000)
      ..cubicTo(size.width * 0.2330000, size.height * 0.8020000, size.width * 0.2333333,
          size.height * 0.8006667, size.width * 0.2336667, size.height * 0.7986667)
      ..cubicTo(size.width * 0.2340000, size.height * 0.7970000, size.width * 0.2343333,
          size.height * 0.7956667, size.width * 0.2343333, size.height * 0.7946667)
      ..lineTo(size.width * 0.2373333, size.height * 0.7750000)
      ..cubicTo(size.width * 0.2396667, size.height * 0.7670000, size.width * 0.2440000,
          size.height * 0.7613333, size.width * 0.2510000, size.height * 0.7573333)
      ..cubicTo(size.width * 0.2576667, size.height * 0.7533333, size.width * 0.2653333,
          size.height * 0.7526667, size.width * 0.2736667, size.height * 0.7546667)
      ..cubicTo(size.width * 0.2813333, size.height * 0.7570000, size.width * 0.2866667,
          size.height * 0.7613333, size.width * 0.2906667, size.height * 0.7683333)
      ..cubicTo(size.width * 0.2943333, size.height * 0.7750000, size.width * 0.2950000,
          size.height * 0.7820000, size.width * 0.2930000, size.height * 0.7890000)
      ..lineTo(size.width * 0.2883333, size.height * 0.8090000)
      ..cubicTo(size.width * 0.2850000, size.height * 0.8236667, size.width * 0.2766667,
          size.height * 0.8310000, size.width * 0.2630000, size.height * 0.8310000)
      ..cubicTo(size.width * 0.2620000, size.height * 0.8310000, size.width * 0.2603333,
          size.height * 0.8310000, size.width * 0.2580000, size.height * 0.8306667)
      ..cubicTo(size.width * 0.2556667, size.height * 0.8303333, size.width * 0.2543333,
          size.height * 0.8303333, size.width * 0.2536667, size.height * 0.8303333)
      ..cubicTo(size.width * 0.2466667, size.height * 0.8283333, size.width * 0.2416667,
          size.height * 0.8246667, size.width * 0.2383333, size.height * 0.8193333)
      ..cubicTo(size.width * 0.2346667, size.height * 0.8143333, size.width * 0.2330000,
          size.height * 0.8086667, size.width * 0.2330000, size.height * 0.8030000)
      ..close()
      ..moveTo(size.width * 0.2576667, size.height * 0.7050000)
      ..cubicTo(size.width * 0.2576667, size.height * 0.6970000, size.width * 0.2603333,
          size.height * 0.6906667, size.width * 0.2653333, size.height * 0.6853333)
      ..cubicTo(size.width * 0.2706667, size.height * 0.6800000, size.width * 0.2770000,
          size.height * 0.6776667, size.width * 0.2850000, size.height * 0.6776667)
      ..cubicTo(size.width * 0.2930000, size.height * 0.6776667, size.width * 0.2993333,
          size.height * 0.6803333, size.width * 0.3046667, size.height * 0.6853333)
      ..cubicTo(size.width * 0.3100000, size.height * 0.6906667, size.width * 0.3123333,
          size.height * 0.6970000, size.width * 0.3123333, size.height * 0.7050000)
      ..cubicTo(size.width * 0.3123333, size.height * 0.7126667, size.width * 0.3096667,
          size.height * 0.7190000, size.width * 0.3046667, size.height * 0.7243333)
      ..cubicTo(size.width * 0.2996667, size.height * 0.7296667, size.width * 0.2930000,
          size.height * 0.7320000, size.width * 0.2850000, size.height * 0.7320000)
      ..cubicTo(size.width * 0.2773333, size.height * 0.7320000, size.width * 0.2710000,
          size.height * 0.7293333, size.width * 0.2660000, size.height * 0.7240000)
      ..cubicTo(size.width * 0.2603333, size.height * 0.7186667, size.width * 0.2576667,
          size.height * 0.7123333, size.width * 0.2576667, size.height * 0.7050000)
      ..close()
      ..moveTo(size.width * 0.3123333, size.height * 0.9043333)
      ..cubicTo(size.width * 0.3123333, size.height * 0.9030000, size.width * 0.3126667,
          size.height * 0.9006667, size.width * 0.3136667, size.height * 0.8966667)
      ..lineTo(size.width * 0.3180000, size.height * 0.8773333)
      ..cubicTo(size.width * 0.3203333, size.height * 0.8696667, size.width * 0.3250000,
          size.height * 0.8640000, size.width * 0.3316667, size.height * 0.8603333)
      ..cubicTo(size.width * 0.3386667, size.height * 0.8563333, size.width * 0.3456667,
          size.height * 0.8556667, size.width * 0.3526667, size.height * 0.8580000)
      ..cubicTo(size.width * 0.3603333, size.height * 0.8593333, size.width * 0.3663333,
          size.height * 0.8636667, size.width * 0.3703333, size.height * 0.8703333)
      ..cubicTo(size.width * 0.3743333, size.height * 0.8770000, size.width * 0.3753333,
          size.height * 0.8846667, size.width * 0.3730000, size.height * 0.8930000)
      ..lineTo(size.width * 0.3686667, size.height * 0.9126667)
      ..cubicTo(size.width * 0.3653333, size.height * 0.9263333, size.width * 0.3563333,
          size.height * 0.9330000, size.width * 0.3420000, size.height * 0.9330000)
      ..cubicTo(size.width * 0.3403333, size.height * 0.9330000, size.width * 0.3376667,
          size.height * 0.9326667, size.width * 0.3340000, size.height * 0.9316667)
      ..cubicTo(size.width * 0.3266667, size.height * 0.9296667, size.width * 0.3213333,
          size.height * 0.9260000, size.width * 0.3176667, size.height * 0.9206667)
      ..cubicTo(size.width * 0.3140000, size.height * 0.9153333, size.width * 0.3123333,
          size.height * 0.9100000, size.width * 0.3123333, size.height * 0.9043333)
      ..close()
      ..moveTo(size.width * 0.3300000, size.height * 0.1540000)
      ..cubicTo(size.width * 0.3300000, size.height * 0.1460000, size.width * 0.3326667,
          size.height * 0.1393333, size.width * 0.3383333, size.height * 0.1340000)
      ..cubicTo(size.width * 0.3440000, size.height * 0.1286667, size.width * 0.3510000,
          size.height * 0.1260000, size.width * 0.3593333, size.height * 0.1260000)
      ..cubicTo(size.width * 0.3673333, size.height * 0.1260000, size.width * 0.3740000,
          size.height * 0.1286667, size.width * 0.3793333, size.height * 0.1340000)
      ..lineTo(size.width * 0.4003333, size.height * 0.1560000)
      ..cubicTo(size.width * 0.4060000, size.height * 0.1616667, size.width * 0.4086667,
          size.height * 0.1683333, size.width * 0.4086667, size.height * 0.1760000)
      ..cubicTo(size.width * 0.4086667, size.height * 0.1840000, size.width * 0.4053333,
          size.height * 0.1913333, size.width * 0.3986667, size.height * 0.1973333)
      ..cubicTo(size.width * 0.3920000, size.height * 0.2033333, size.width * 0.3853333,
          size.height * 0.2060000, size.width * 0.3783333, size.height * 0.2050000)
      ..cubicTo(size.width * 0.3713333, size.height * 0.2043333, size.width * 0.3653333,
          size.height * 0.2013333, size.width * 0.3600000, size.height * 0.1960000)
      ..lineTo(size.width * 0.3383333, size.height * 0.1740000)
      ..cubicTo(size.width * 0.3330000, size.height * 0.1683333, size.width * 0.3300000,
          size.height * 0.1616667, size.width * 0.3300000, size.height * 0.1540000)
      ..close()
      ..moveTo(size.width * 0.3386667, size.height * 0.8076667)
      ..cubicTo(size.width * 0.3386667, size.height * 0.8000000, size.width * 0.3413333,
          size.height * 0.7933333, size.width * 0.3463333, size.height * 0.7883333)
      ..cubicTo(size.width * 0.3516667, size.height * 0.7830000, size.width * 0.3580000,
          size.height * 0.7806667, size.width * 0.3660000, size.height * 0.7806667)
      ..cubicTo(size.width * 0.3740000, size.height * 0.7806667, size.width * 0.3803333,
          size.height * 0.7833333, size.width * 0.3856667, size.height * 0.7883333)
      ..cubicTo(size.width * 0.3910000, size.height * 0.7936667, size.width * 0.3933333,
          size.height * 0.8000000, size.width * 0.3933333, size.height * 0.8076667)
      ..cubicTo(size.width * 0.3933333, size.height * 0.8156667, size.width * 0.3906667,
          size.height * 0.8220000, size.width * 0.3856667, size.height * 0.8273333)
      ..cubicTo(size.width * 0.3803333, size.height * 0.8326667, size.width * 0.3740000,
          size.height * 0.8350000, size.width * 0.3660000, size.height * 0.8350000)
      ..cubicTo(size.width * 0.3586667, size.height * 0.8350000, size.width * 0.3523333,
          size.height * 0.8323333, size.width * 0.3466667, size.height * 0.8266667)
      ..cubicTo(size.width * 0.3413333, size.height * 0.8213333, size.width * 0.3386667,
          size.height * 0.8150000, size.width * 0.3386667, size.height * 0.8076667)
      ..close()
      ..moveTo(size.width * 0.3593333, size.height * 0.7320000)
      ..cubicTo(size.width * 0.3593333, size.height * 0.7290000, size.width * 0.3596667,
          size.height * 0.7260000, size.width * 0.3603333, size.height * 0.7233333)
      ..lineTo(size.width * 0.3680000, size.height * 0.6933333)
      ..cubicTo(size.width * 0.3703333, size.height * 0.6856667, size.width * 0.3750000,
          size.height * 0.6796667, size.width * 0.3816667, size.height * 0.6756667)
      ..cubicTo(size.width * 0.3886667, size.height * 0.6716667, size.width * 0.3956667,
          size.height * 0.6706667, size.width * 0.4030000, size.height * 0.6730000)
      ..cubicTo(size.width * 0.4110000, size.height * 0.6753333, size.width * 0.4166667,
          size.height * 0.6796667, size.width * 0.4206667, size.height * 0.6863333)
      ..cubicTo(size.width * 0.4246667, size.height * 0.6930000, size.width * 0.4253333,
          size.height * 0.6996667, size.width * 0.4230000, size.height * 0.7070000)
      ..lineTo(size.width * 0.4143333, size.height * 0.7370000)
      ..cubicTo(size.width * 0.4116667, size.height * 0.7460000, size.width * 0.4070000,
          size.height * 0.7523333, size.width * 0.4006667, size.height * 0.7560000)
      ..cubicTo(size.width * 0.3943333, size.height * 0.7596667, size.width * 0.3870000,
          size.height * 0.7600000, size.width * 0.3793333, size.height * 0.7580000)
      ..cubicTo(size.width * 0.3726667, size.height * 0.7566667, size.width * 0.3676667,
          size.height * 0.7533333, size.width * 0.3643333, size.height * 0.7480000)
      ..cubicTo(size.width * 0.3603333, size.height * 0.7420000, size.width * 0.3586667,
          size.height * 0.7370000, size.width * 0.3593333, size.height * 0.7320000)
      ..close()
      ..moveTo(size.width * 0.4513333, size.height * 0.8033333)
      ..cubicTo(size.width * 0.4513333, size.height * 0.8023333, size.width * 0.4513333,
          size.height * 0.8010000, size.width * 0.4516667, size.height * 0.7990000)
      ..cubicTo(size.width * 0.4520000, size.height * 0.7970000, size.width * 0.4520000,
          size.height * 0.7960000, size.width * 0.4520000, size.height * 0.7953333)
      ..lineTo(size.width * 0.4550000, size.height * 0.7756667)
      ..cubicTo(size.width * 0.4573333, size.height * 0.7676667, size.width * 0.4616667,
          size.height * 0.7620000, size.width * 0.4686667, size.height * 0.7580000)
      ..cubicTo(size.width * 0.4753333, size.height * 0.7540000, size.width * 0.4830000,
          size.height * 0.7533333, size.width * 0.4913333, size.height * 0.7553333)
      ..cubicTo(size.width * 0.4990000, size.height * 0.7576667, size.width * 0.5046667,
          size.height * 0.7623333, size.width * 0.5083333, size.height * 0.7690000)
      ..cubicTo(size.width * 0.5123333, size.height * 0.7760000, size.width * 0.5130000,
          size.height * 0.7830000, size.width * 0.5106667, size.height * 0.7900000)
      ..lineTo(size.width * 0.5060000, size.height * 0.8100000)
      ..cubicTo(size.width * 0.5026667, size.height * 0.8243333, size.width * 0.4943333,
          size.height * 0.8316667, size.width * 0.4806667, size.height * 0.8316667)
      ..cubicTo(size.width * 0.4796667, size.height * 0.8316667, size.width * 0.4780000,
          size.height * 0.8316667, size.width * 0.4756667, size.height * 0.8313333)
      ..cubicTo(size.width * 0.4733333, size.height * 0.8310000, size.width * 0.4720000,
          size.height * 0.8310000, size.width * 0.4713333, size.height * 0.8310000)
      ..cubicTo(size.width * 0.4646667, size.height * 0.8290000, size.width * 0.4596667,
          size.height * 0.8253333, size.width * 0.4563333, size.height * 0.8200000)
      ..cubicTo(size.width * 0.4530000, size.height * 0.8143333, size.width * 0.4513333,
          size.height * 0.8090000, size.width * 0.4513333, size.height * 0.8033333)
      ..close()
      ..moveTo(size.width * 0.4760000, size.height * 0.7053333)
      ..cubicTo(size.width * 0.4760000, size.height * 0.6973333, size.width * 0.4786667,
          size.height * 0.6910000, size.width * 0.4836667, size.height * 0.6856667)
      ..cubicTo(size.width * 0.4890000, size.height * 0.6803333, size.width * 0.4953333,
          size.height * 0.6780000, size.width * 0.5033333, size.height * 0.6780000)
      ..cubicTo(size.width * 0.5113333, size.height * 0.6780000, size.width * 0.5176667,
          size.height * 0.6806667, size.width * 0.5230000, size.height * 0.6856667)
      ..cubicTo(size.width * 0.5283333, size.height * 0.6910000, size.width * 0.5306667,
          size.height * 0.6973333, size.width * 0.5306667, size.height * 0.7053333)
      ..cubicTo(size.width * 0.5306667, size.height * 0.7130000, size.width * 0.5280000,
          size.height * 0.7196667, size.width * 0.5230000, size.height * 0.7246667)
      ..cubicTo(size.width * 0.5176667, size.height * 0.7300000, size.width * 0.5113333,
          size.height * 0.7323333, size.width * 0.5033333, size.height * 0.7323333)
      ..cubicTo(size.width * 0.4956667, size.height * 0.7323333, size.width * 0.4890000,
          size.height * 0.7296667, size.width * 0.4840000, size.height * 0.7240000)
      ..cubicTo(size.width * 0.4786667, size.height * 0.7190000, size.width * 0.4760000,
          size.height * 0.7126667, size.width * 0.4760000, size.height * 0.7053333)
      ..close()
      ..moveTo(size.width * 0.5103333, size.height * 0.3016667)
      ..cubicTo(size.width * 0.5383333, size.height * 0.3270000, size.width * 0.5570000,
          size.height * 0.3596667, size.width * 0.5670000, size.height * 0.3993333)
      ..lineTo(size.width * 0.5773333, size.height * 0.3993333)
      ..cubicTo(size.width * 0.6233333, size.height * 0.3993333, size.width * 0.6623333,
          size.height * 0.4153333, size.width * 0.6946667, size.height * 0.4476667)
      ..cubicTo(size.width * 0.7050000, size.height * 0.4293333, size.width * 0.7103333,
          size.height * 0.4090000, size.width * 0.7103333, size.height * 0.3870000)
      ..cubicTo(size.width * 0.7103333, size.height * 0.3543333, size.width * 0.6986667,
          size.height * 0.3266667, size.width * 0.6756667, size.height * 0.3036667)
      ..cubicTo(size.width * 0.6526667, size.height * 0.2810000, size.width * 0.6246667,
          size.height * 0.2693333, size.width * 0.5920000, size.height * 0.2693333)
      ..cubicTo(size.width * 0.5600000, size.height * 0.2693333, size.width * 0.5326667,
          size.height * 0.2800000, size.width * 0.5103333, size.height * 0.3016667)
      ..close()
      ..moveTo(size.width * 0.5636667, size.height * 0.1260000)
      ..lineTo(size.width * 0.5636667, size.height * 0.05766667)
      ..cubicTo(size.width * 0.5636667, size.height * 0.04966667, size.width * 0.5663333,
          size.height * 0.04300000, size.width * 0.5720000, size.height * 0.03733333)
      ..cubicTo(size.width * 0.5776667, size.height * 0.03166667, size.width * 0.5843333,
          size.height * 0.02866667, size.width * 0.5920000, size.height * 0.02866667)
      ..cubicTo(size.width * 0.6000000, size.height * 0.02866667, size.width * 0.6066667,
          size.height * 0.03133333, size.width * 0.6120000, size.height * 0.03700000)
      ..cubicTo(size.width * 0.6173333, size.height * 0.04266667, size.width * 0.6200000,
          size.height * 0.04966667, size.width * 0.6200000, size.height * 0.05766667)
      ..lineTo(size.width * 0.6200000, size.height * 0.1260000)
      ..cubicTo(size.width * 0.6200000, size.height * 0.1340000, size.width * 0.6173333,
          size.height * 0.1410000, size.width * 0.6120000, size.height * 0.1466667)
      ..cubicTo(size.width * 0.6066667, size.height * 0.1523333, size.width * 0.6000000,
          size.height * 0.1550000, size.width * 0.5920000, size.height * 0.1550000)
      ..cubicTo(size.width * 0.5843333, size.height * 0.1550000, size.width * 0.5776667,
          size.height * 0.1520000, size.width * 0.5720000, size.height * 0.1463333)
      ..cubicTo(size.width * 0.5663333, size.height * 0.1406667, size.width * 0.5636667,
          size.height * 0.1340000, size.width * 0.5636667, size.height * 0.1260000)
      ..close()
      ..moveTo(size.width * 0.7496667, size.height * 0.2023333)
      ..cubicTo(size.width * 0.7496667, size.height * 0.1943333, size.width * 0.7523333,
          size.height * 0.1876667, size.width * 0.7573333, size.height * 0.1823333)
      ..lineTo(size.width * 0.8053333, size.height * 0.1340000)
      ..cubicTo(size.width * 0.8103333, size.height * 0.1283333, size.width * 0.8166667,
          size.height * 0.1256667, size.width * 0.8246667, size.height * 0.1256667)
      ..cubicTo(size.width * 0.8326667, size.height * 0.1256667, size.width * 0.8393333,
          size.height * 0.1283333, size.width * 0.8446667, size.height * 0.1340000)
      ..cubicTo(size.width * 0.8506667, size.height * 0.1393333, size.width * 0.8533333,
          size.height * 0.1460000, size.width * 0.8533333, size.height * 0.1540000)
      ..cubicTo(size.width * 0.8533333, size.height * 0.1620000, size.width * 0.8503333,
          size.height * 0.1686667, size.width * 0.8446667, size.height * 0.1740000)
      ..lineTo(size.width * 0.7966667, size.height * 0.2226667)
      ..cubicTo(size.width * 0.7903333, size.height * 0.2290000, size.width * 0.7833333,
          size.height * 0.2316667, size.width * 0.7756667, size.height * 0.2313333)
      ..cubicTo(size.width * 0.7680000, size.height * 0.2306667, size.width * 0.7620000,
          size.height * 0.2280000, size.width * 0.7573333, size.height * 0.2226667)
      ..cubicTo(size.width * 0.7520000, size.height * 0.2173333, size.width * 0.7496667,
          size.height * 0.2106667, size.width * 0.7496667, size.height * 0.2023333)
      ..close()
      ..moveTo(size.width * 0.7753333, size.height * 0.5993333)
      ..cubicTo(size.width * 0.7753333, size.height * 0.5913333, size.width * 0.7780000,
          size.height * 0.5846667, size.width * 0.7836667, size.height * 0.5790000)
      ..cubicTo(size.width * 0.7893333, size.height * 0.5733333, size.width * 0.7960000,
          size.height * 0.5706667, size.width * 0.8036667, size.height * 0.5706667)
      ..cubicTo(size.width * 0.8113333, size.height * 0.5706667, size.width * 0.8180000,
          size.height * 0.5736667, size.width * 0.8240000, size.height * 0.5793333)
      ..lineTo(size.width * 0.8446667, size.height * 0.6003333)
      ..cubicTo(size.width * 0.8506667, size.height * 0.6060000, size.width * 0.8533333,
          size.height * 0.6130000, size.width * 0.8533333, size.height * 0.6206667)
      ..cubicTo(size.width * 0.8533333, size.height * 0.6286667, size.width * 0.8503333,
          size.height * 0.6353333, size.width * 0.8446667, size.height * 0.6406667)
      ..cubicTo(size.width * 0.8400000, size.height * 0.6463333, size.width * 0.8340000,
          size.height * 0.6493333, size.width * 0.8266667, size.height * 0.6493333)
      ..lineTo(size.width * 0.8260000, size.height * 0.6486667)
      ..cubicTo(size.width * 0.8180000, size.height * 0.6486667, size.width * 0.8113333,
          size.height * 0.6460000, size.width * 0.8053333, size.height * 0.6406667)
      ..lineTo(size.width * 0.7836667, size.height * 0.6193333)
      ..cubicTo(size.width * 0.7783333, size.height * 0.6136667, size.width * 0.7753333,
          size.height * 0.6070000, size.width * 0.7753333, size.height * 0.5993333)
      ..close()
      ..moveTo(size.width * 0.8243333, size.height * 0.3870000)
      ..cubicTo(size.width * 0.8243333, size.height * 0.3790000, size.width * 0.8270000,
          size.height * 0.3723333, size.width * 0.8326667, size.height * 0.3670000)
      ..cubicTo(size.width * 0.8383333, size.height * 0.3616667, size.width * 0.8450000,
          size.height * 0.3590000, size.width * 0.8530000, size.height * 0.3590000)
      ..lineTo(size.width * 0.9216667, size.height * 0.3590000)
      ..cubicTo(size.width * 0.9296667, size.height * 0.3590000, size.width * 0.9366667,
          size.height * 0.3616667, size.width * 0.9420000, size.height * 0.3670000)
      ..cubicTo(size.width * 0.9473333, size.height * 0.3723333, size.width * 0.9503333,
          size.height * 0.3790000, size.width * 0.9503333, size.height * 0.3870000)
      ..cubicTo(size.width * 0.9503333, size.height * 0.3950000, size.width * 0.9476667,
          size.height * 0.4016667, size.width * 0.9420000, size.height * 0.4073333)
      ..cubicTo(size.width * 0.9363333, size.height * 0.4130000, size.width * 0.9296667,
          size.height * 0.4156667, size.width * 0.9216667, size.height * 0.4156667)
      ..lineTo(size.width * 0.8530000, size.height * 0.4156667)
      ..cubicTo(size.width * 0.8450000, size.height * 0.4156667, size.width * 0.8383333,
          size.height * 0.4126667, size.width * 0.8330000, size.height * 0.4066667)
      ..cubicTo(size.width * 0.8270000, size.height * 0.4016667, size.width * 0.8243333,
          size.height * 0.3950000, size.width * 0.8243333, size.height * 0.3870000)
      ..close();
  }

  Path _daySnowPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.05266667, size.height * 0.5643333)
      ..cubicTo(size.width * 0.05266667, size.height * 0.5930000, size.width * 0.05966667,
          size.height * 0.6200000, size.width * 0.07400000, size.height * 0.6446667)
      ..cubicTo(size.width * 0.08800000, size.height * 0.6693333, size.width * 0.1073333,
          size.height * 0.6893333, size.width * 0.1320000, size.height * 0.7043333)
      ..cubicTo(size.width * 0.1563333, size.height * 0.7193333, size.width * 0.1833333,
          size.height * 0.7273333, size.width * 0.2120000, size.height * 0.7280000)
      ..cubicTo(size.width * 0.2156667, size.height * 0.7280000, size.width * 0.2176667,
          size.height * 0.7260000, size.width * 0.2176667, size.height * 0.7223333)
      ..lineTo(size.width * 0.2176667, size.height * 0.6780000)
      ..cubicTo(size.width * 0.2176667, size.height * 0.6740000, size.width * 0.2156667,
          size.height * 0.6716667, size.width * 0.2120000, size.height * 0.6716667)
      ..cubicTo(size.width * 0.1836667, size.height * 0.6703333, size.width * 0.1593333,
          size.height * 0.6590000, size.width * 0.1393333, size.height * 0.6376667)
      ..cubicTo(size.width * 0.1193333, size.height * 0.6163333, size.width * 0.1093333,
          size.height * 0.5920000, size.width * 0.1093333, size.height * 0.5640000)
      ..cubicTo(size.width * 0.1093333, size.height * 0.5366667, size.width * 0.1186667,
          size.height * 0.5126667, size.width * 0.1376667, size.height * 0.4920000)
      ..cubicTo(size.width * 0.1566667, size.height * 0.4716667, size.width * 0.1796667,
          size.height * 0.4596667, size.width * 0.2076667, size.height * 0.4563333)
      ..lineTo(size.width * 0.2253333, size.height * 0.4543333)
      ..cubicTo(size.width * 0.2293333, size.height * 0.4543333, size.width * 0.2313333,
          size.height * 0.4523333, size.width * 0.2313333, size.height * 0.4480000)
      ..lineTo(size.width * 0.2340000, size.height * 0.4310000)
      ..cubicTo(size.width * 0.2376667, size.height * 0.3946667, size.width * 0.2526667,
          size.height * 0.3643333, size.width * 0.2793333, size.height * 0.3400000)
      ..cubicTo(size.width * 0.3060000, size.height * 0.3156667, size.width * 0.3376667,
          size.height * 0.3036667, size.width * 0.3743333, size.height * 0.3036667)
      ..cubicTo(size.width * 0.4106667, size.height * 0.3036667, size.width * 0.4423333,
          size.height * 0.3156667, size.width * 0.4693333, size.height * 0.3400000)
      ..cubicTo(size.width * 0.4966667, size.height * 0.3643333, size.width * 0.5120000,
          size.height * 0.3943333, size.width * 0.5153333, size.height * 0.4300000)
      ..lineTo(size.width * 0.5176667, size.height * 0.4493333)
      ..cubicTo(size.width * 0.5176667, size.height * 0.4530000, size.width * 0.5196667,
          size.height * 0.4550000, size.width * 0.5233333, size.height * 0.4550000)
      ..lineTo(size.width * 0.5770000, size.height * 0.4550000)
      ..cubicTo(size.width * 0.6070000, size.height * 0.4550000, size.width * 0.6326667,
          size.height * 0.4656667, size.width * 0.6540000, size.height * 0.4870000)
      ..cubicTo(size.width * 0.6753333, size.height * 0.5083333, size.width * 0.6860000,
          size.height * 0.5336667, size.width * 0.6860000, size.height * 0.5633333)
      ..cubicTo(size.width * 0.6860000, size.height * 0.5913333, size.width * 0.6760000,
          size.height * 0.6156667, size.width * 0.6560000, size.height * 0.6370000)
      ..cubicTo(size.width * 0.6360000, size.height * 0.6580000, size.width * 0.6116667,
          size.height * 0.6693333, size.width * 0.5836667, size.height * 0.6710000)
      ..cubicTo(size.width * 0.5796667, size.height * 0.6710000, size.width * 0.5773333,
          size.height * 0.6730000, size.width * 0.5773333, size.height * 0.6773333)
      ..lineTo(size.width * 0.5773333, size.height * 0.7216667)
      ..cubicTo(size.width * 0.5773333, size.height * 0.7253333, size.width * 0.5793333,
          size.height * 0.7273333, size.width * 0.5836667, size.height * 0.7273333)
      ..cubicTo(size.width * 0.6280000, size.height * 0.7260000, size.width * 0.6653333,
          size.height * 0.7093333, size.width * 0.6963333, size.height * 0.6773333)
      ..cubicTo(size.width * 0.7273333, size.height * 0.6453333, size.width * 0.7426667,
          size.height * 0.6076667, size.width * 0.7426667, size.height * 0.5636667)
      ..cubicTo(size.width * 0.7426667, size.height * 0.5383333, size.width * 0.7380000,
          size.height * 0.5160000, size.width * 0.7283333, size.height * 0.4960000)
      ..cubicTo(size.width * 0.7533333, size.height * 0.4650000, size.width * 0.7666667,
          size.height * 0.4283333, size.width * 0.7666667, size.height * 0.3866667)
      ..cubicTo(size.width * 0.7666667, size.height * 0.3553333, size.width * 0.7590000,
          size.height * 0.3263333, size.width * 0.7433333, size.height * 0.2996667)
      ..cubicTo(size.width * 0.7276667, size.height * 0.2730000, size.width * 0.7063333,
          size.height * 0.2516667, size.width * 0.6796667, size.height * 0.2360000)
      ..cubicTo(size.width * 0.6530000, size.height * 0.2203333, size.width * 0.6236667,
          size.height * 0.2126667, size.width * 0.5923333, size.height * 0.2126667)
      ..cubicTo(size.width * 0.5410000, size.height * 0.2126667, size.width * 0.4980000,
          size.height * 0.2320000, size.width * 0.4633333, size.height * 0.2703333)
      ..cubicTo(size.width * 0.4363333, size.height * 0.2556667, size.width * 0.4063333,
          size.height * 0.2483333, size.width * 0.3736667, size.height * 0.2483333)
      ..cubicTo(size.width * 0.3266667, size.height * 0.2483333, size.width * 0.2853333,
          size.height * 0.2630000, size.width * 0.2490000, size.height * 0.2920000)
      ..cubicTo(size.width * 0.2126667, size.height * 0.3210000, size.width * 0.1896667,
          size.height * 0.3583333, size.width * 0.1793333, size.height * 0.4033333)
      ..cubicTo(size.width * 0.1420000, size.height * 0.4126667, size.width * 0.1116667,
          size.height * 0.4320000, size.width * 0.08800000, size.height * 0.4616667)
      ..cubicTo(size.width * 0.06433333, size.height * 0.4916667, size.width * 0.05266667,
          size.height * 0.5256667, size.width * 0.05266667, size.height * 0.5643333)
      ..close()
      ..moveTo(size.width * 0.2640000, size.height * 0.6993333)
      ..cubicTo(size.width * 0.2640000, size.height * 0.7073333, size.width * 0.2666667,
          size.height * 0.7140000, size.width * 0.2720000, size.height * 0.7196667)
      ..cubicTo(size.width * 0.2773333, size.height * 0.7253333, size.width * 0.2836667,
          size.height * 0.7280000, size.width * 0.2916667, size.height * 0.7280000)
      ..cubicTo(size.width * 0.2993333, size.height * 0.7280000, size.width * 0.3060000,
          size.height * 0.7253333, size.width * 0.3113333, size.height * 0.7196667)
      ..cubicTo(size.width * 0.3166667, size.height * 0.7140000, size.width * 0.3193333,
          size.height * 0.7073333, size.width * 0.3193333, size.height * 0.6993333)
      ..cubicTo(size.width * 0.3193333, size.height * 0.6916667, size.width * 0.3166667,
          size.height * 0.6853333, size.width * 0.3113333, size.height * 0.6800000)
      ..cubicTo(size.width * 0.3060000, size.height * 0.6746667, size.width * 0.2996667,
          size.height * 0.6720000, size.width * 0.2916667, size.height * 0.6720000)
      ..cubicTo(size.width * 0.2840000, size.height * 0.6720000, size.width * 0.2773333,
          size.height * 0.6746667, size.width * 0.2720000, size.height * 0.6800000)
      ..cubicTo(size.width * 0.2666667, size.height * 0.6853333, size.width * 0.2640000,
          size.height * 0.6920000, size.width * 0.2640000, size.height * 0.6993333)
      ..close()
      ..moveTo(size.width * 0.2640000, size.height * 0.8203333)
      ..cubicTo(size.width * 0.2640000, size.height * 0.8273333, size.width * 0.2666667,
          size.height * 0.8336667, size.width * 0.2720000, size.height * 0.8393333)
      ..cubicTo(size.width * 0.2780000, size.height * 0.8446667, size.width * 0.2843333,
          size.height * 0.8473333, size.width * 0.2913333, size.height * 0.8473333)
      ..cubicTo(size.width * 0.2993333, size.height * 0.8473333, size.width * 0.3056667,
          size.height * 0.8446667, size.width * 0.3110000, size.height * 0.8396667)
      ..cubicTo(size.width * 0.3163333, size.height * 0.8343333, size.width * 0.3186667,
          size.height * 0.8280000, size.width * 0.3186667, size.height * 0.8203333)
      ..cubicTo(size.width * 0.3186667, size.height * 0.8123333, size.width * 0.3160000,
          size.height * 0.8060000, size.width * 0.3106667, size.height * 0.8006667)
      ..cubicTo(size.width * 0.3053333, size.height * 0.7953333, size.width * 0.2990000,
          size.height * 0.7930000, size.width * 0.2910000, size.height * 0.7930000)
      ..cubicTo(size.width * 0.2833333, size.height * 0.7930000, size.width * 0.2766667,
          size.height * 0.7956667, size.width * 0.2713333, size.height * 0.8006667)
      ..cubicTo(size.width * 0.2666667, size.height * 0.8056667, size.width * 0.2640000,
          size.height * 0.8123333, size.width * 0.2640000, size.height * 0.8203333)
      ..close()
      ..moveTo(size.width * 0.3323333, size.height * 0.1560000)
      ..cubicTo(size.width * 0.3323333, size.height * 0.1640000, size.width * 0.3350000,
          size.height * 0.1706667, size.width * 0.3403333, size.height * 0.1756667)
      ..lineTo(size.width * 0.3623333, size.height * 0.1976667)
      ..cubicTo(size.width * 0.3676667, size.height * 0.2030000, size.width * 0.3736667,
          size.height * 0.2060000, size.width * 0.3800000, size.height * 0.2060000)
      ..cubicTo(size.width * 0.3870000, size.height * 0.2070000, size.width * 0.3936667,
          size.height * 0.2046667, size.width * 0.4003333, size.height * 0.1986667)
      ..cubicTo(size.width * 0.4070000, size.height * 0.1926667, size.width * 0.4103333,
          size.height * 0.1856667, size.width * 0.4103333, size.height * 0.1776667)
      ..cubicTo(size.width * 0.4103333, size.height * 0.1696667, size.width * 0.4076667,
          size.height * 0.1623333, size.width * 0.4023333, size.height * 0.1563333)
      ..lineTo(size.width * 0.3810000, size.height * 0.1360000)
      ..cubicTo(size.width * 0.3760000, size.height * 0.1303333, size.width * 0.3696667,
          size.height * 0.1276667, size.width * 0.3616667, size.height * 0.1276667)
      ..cubicTo(size.width * 0.3533333, size.height * 0.1276667, size.width * 0.3463333,
          size.height * 0.1303333, size.width * 0.3406667, size.height * 0.1360000)
      ..cubicTo(size.width * 0.3350000, size.height * 0.1413333, size.width * 0.3323333,
          size.height * 0.1480000, size.width * 0.3323333, size.height * 0.1560000)
      ..close()
      ..moveTo(size.width * 0.3700000, size.height * 0.7633333)
      ..cubicTo(size.width * 0.3700000, size.height * 0.7706667, size.width * 0.3726667,
          size.height * 0.7773333, size.width * 0.3780000, size.height * 0.7833333)
      ..cubicTo(size.width * 0.3833333, size.height * 0.7886667, size.width * 0.3900000,
          size.height * 0.7913333, size.width * 0.3973333, size.height * 0.7913333)
      ..cubicTo(size.width * 0.4053333, size.height * 0.7913333, size.width * 0.4120000,
          size.height * 0.7886667, size.width * 0.4173333, size.height * 0.7833333)
      ..cubicTo(size.width * 0.4226667, size.height * 0.7780000, size.width * 0.4256667,
          size.height * 0.7713333, size.width * 0.4256667, size.height * 0.7633333)
      ..cubicTo(size.width * 0.4256667, size.height * 0.7556667, size.width * 0.4230000,
          size.height * 0.7490000, size.width * 0.4173333, size.height * 0.7433333)
      ..cubicTo(size.width * 0.4116667, size.height * 0.7376667, size.width * 0.4050000,
          size.height * 0.7350000, size.width * 0.3973333, size.height * 0.7350000)
      ..cubicTo(size.width * 0.3896667, size.height * 0.7350000, size.width * 0.3833333,
          size.height * 0.7376667, size.width * 0.3780000, size.height * 0.7433333)
      ..cubicTo(size.width * 0.3726667, size.height * 0.7490000, size.width * 0.3700000,
          size.height * 0.7556667, size.width * 0.3700000, size.height * 0.7633333)
      ..close()
      ..moveTo(size.width * 0.3700000, size.height * 0.6433333)
      ..cubicTo(size.width * 0.3700000, size.height * 0.6510000, size.width * 0.3726667,
          size.height * 0.6573333, size.width * 0.3780000, size.height * 0.6626667)
      ..cubicTo(size.width * 0.3833333, size.height * 0.6680000, size.width * 0.3900000,
          size.height * 0.6706667, size.width * 0.3973333, size.height * 0.6706667)
      ..cubicTo(size.width * 0.4053333, size.height * 0.6706667, size.width * 0.4120000,
          size.height * 0.6680000, size.width * 0.4173333, size.height * 0.6626667)
      ..cubicTo(size.width * 0.4230000, size.height * 0.6573333, size.width * 0.4256667,
          size.height * 0.6510000, size.width * 0.4256667, size.height * 0.6430000)
      ..cubicTo(size.width * 0.4256667, size.height * 0.6353333, size.width * 0.4230000,
          size.height * 0.6286667, size.width * 0.4173333, size.height * 0.6233333)
      ..cubicTo(size.width * 0.4116667, size.height * 0.6180000, size.width * 0.4050000,
          size.height * 0.6153333, size.width * 0.3973333, size.height * 0.6153333)
      ..cubicTo(size.width * 0.3896667, size.height * 0.6153333, size.width * 0.3833333,
          size.height * 0.6180000, size.width * 0.3780000, size.height * 0.6233333)
      ..cubicTo(size.width * 0.3726667, size.height * 0.6286667, size.width * 0.3700000,
          size.height * 0.6356667, size.width * 0.3700000, size.height * 0.6433333)
      ..close()
      ..moveTo(size.width * 0.3700000, size.height * 0.8853333)
      ..cubicTo(size.width * 0.3700000, size.height * 0.8926667, size.width * 0.3726667,
          size.height * 0.8990000, size.width * 0.3780000, size.height * 0.9043333)
      ..cubicTo(size.width * 0.3836667, size.height * 0.9100000, size.width * 0.3900000,
          size.height * 0.9126667, size.width * 0.3973333, size.height * 0.9126667)
      ..cubicTo(size.width * 0.4053333, size.height * 0.9126667, size.width * 0.4120000,
          size.height * 0.9100000, size.width * 0.4173333, size.height * 0.9050000)
      ..cubicTo(size.width * 0.4230000, size.height * 0.8996667, size.width * 0.4256667,
          size.height * 0.8933333, size.width * 0.4256667, size.height * 0.8853333)
      ..cubicTo(size.width * 0.4256667, size.height * 0.8773333, size.width * 0.4230000,
          size.height * 0.8706667, size.width * 0.4173333, size.height * 0.8653333)
      ..cubicTo(size.width * 0.4116667, size.height * 0.8596667, size.width * 0.4050000,
          size.height * 0.8570000, size.width * 0.3973333, size.height * 0.8570000)
      ..cubicTo(size.width * 0.3900000, size.height * 0.8570000, size.width * 0.3836667,
          size.height * 0.8596667, size.width * 0.3780000, size.height * 0.8653333)
      ..cubicTo(size.width * 0.3726667, size.height * 0.8710000, size.width * 0.3700000,
          size.height * 0.8776667, size.width * 0.3700000, size.height * 0.8853333)
      ..close()
      ..moveTo(size.width * 0.4773333, size.height * 0.6993333)
      ..cubicTo(size.width * 0.4773333, size.height * 0.7073333, size.width * 0.4800000,
          size.height * 0.7140000, size.width * 0.4853333, size.height * 0.7196667)
      ..cubicTo(size.width * 0.4906667, size.height * 0.7253333, size.width * 0.4973333,
          size.height * 0.7280000, size.width * 0.5050000, size.height * 0.7280000)
      ..cubicTo(size.width * 0.5126667, size.height * 0.7280000, size.width * 0.5193333,
          size.height * 0.7253333, size.width * 0.5246667, size.height * 0.7196667)
      ..cubicTo(size.width * 0.5300000, size.height * 0.7140000, size.width * 0.5326667,
          size.height * 0.7073333, size.width * 0.5326667, size.height * 0.6993333)
      ..cubicTo(size.width * 0.5326667, size.height * 0.6916667, size.width * 0.5300000,
          size.height * 0.6853333, size.width * 0.5246667, size.height * 0.6800000)
      ..cubicTo(size.width * 0.5193333, size.height * 0.6746667, size.width * 0.5130000,
          size.height * 0.6720000, size.width * 0.5050000, size.height * 0.6720000)
      ..cubicTo(size.width * 0.4970000, size.height * 0.6720000, size.width * 0.4906667,
          size.height * 0.6746667, size.width * 0.4853333, size.height * 0.6800000)
      ..cubicTo(size.width * 0.4800000, size.height * 0.6853333, size.width * 0.4773333,
          size.height * 0.6920000, size.width * 0.4773333, size.height * 0.6993333)
      ..close()
      ..moveTo(size.width * 0.4773333, size.height * 0.8203333)
      ..cubicTo(size.width * 0.4773333, size.height * 0.8273333, size.width * 0.4800000,
          size.height * 0.8336667, size.width * 0.4850000, size.height * 0.8393333)
      ..cubicTo(size.width * 0.4910000, size.height * 0.8446667, size.width * 0.4976667,
          size.height * 0.8473333, size.width * 0.5050000, size.height * 0.8473333)
      ..cubicTo(size.width * 0.5130000, size.height * 0.8473333, size.width * 0.5193333,
          size.height * 0.8446667, size.width * 0.5246667, size.height * 0.8396667)
      ..cubicTo(size.width * 0.5300000, size.height * 0.8343333, size.width * 0.5323333,
          size.height * 0.8280000, size.width * 0.5323333, size.height * 0.8203333)
      ..cubicTo(size.width * 0.5323333, size.height * 0.8123333, size.width * 0.5296667,
          size.height * 0.8060000, size.width * 0.5243333, size.height * 0.8006667)
      ..cubicTo(size.width * 0.5190000, size.height * 0.7953333, size.width * 0.5126667,
          size.height * 0.7930000, size.width * 0.5046667, size.height * 0.7930000)
      ..cubicTo(size.width * 0.4966667, size.height * 0.7930000, size.width * 0.4900000,
          size.height * 0.7956667, size.width * 0.4846667, size.height * 0.8010000)
      ..cubicTo(size.width * 0.4800000, size.height * 0.8060000, size.width * 0.4773333,
          size.height * 0.8126667, size.width * 0.4773333, size.height * 0.8203333)
      ..close()
      ..moveTo(size.width * 0.5100000, size.height * 0.3020000)
      ..cubicTo(size.width * 0.5330000, size.height * 0.2800000, size.width * 0.5603333,
          size.height * 0.2690000, size.width * 0.5923333, size.height * 0.2690000)
      ..cubicTo(size.width * 0.6246667, size.height * 0.2690000, size.width * 0.6523333,
          size.height * 0.2806667, size.width * 0.6750000, size.height * 0.3036667)
      ..cubicTo(size.width * 0.6980000, size.height * 0.3266667, size.width * 0.7093333,
          size.height * 0.3546667, size.width * 0.7093333, size.height * 0.3866667)
      ..cubicTo(size.width * 0.7093333, size.height * 0.4073333, size.width * 0.7036667,
          size.height * 0.4280000, size.width * 0.6923333, size.height * 0.4480000)
      ..cubicTo(size.width * 0.6606667, size.height * 0.4160000, size.width * 0.6220000,
          size.height * 0.4000000, size.width * 0.5766667, size.height * 0.4000000)
      ..lineTo(size.width * 0.5660000, size.height * 0.4000000)
      ..cubicTo(size.width * 0.5560000, size.height * 0.3610000, size.width * 0.5373333,
          size.height * 0.3283333, size.width * 0.5100000, size.height * 0.3020000)
      ..close()
      ..moveTo(size.width * 0.5633333, size.height * 0.1280000)
      ..cubicTo(size.width * 0.5633333, size.height * 0.1356667, size.width * 0.5660000,
          size.height * 0.1423333, size.width * 0.5716667, size.height * 0.1473333)
      ..cubicTo(size.width * 0.5773333, size.height * 0.1523333, size.width * 0.5840000,
          size.height * 0.1550000, size.width * 0.5920000, size.height * 0.1550000)
      ..cubicTo(size.width * 0.6000000, size.height * 0.1550000, size.width * 0.6063333,
          size.height * 0.1523333, size.width * 0.6116667, size.height * 0.1473333)
      ..cubicTo(size.width * 0.6170000, size.height * 0.1420000, size.width * 0.6193333,
          size.height * 0.1356667, size.width * 0.6193333, size.height * 0.1280000)
      ..lineTo(size.width * 0.6193333, size.height * 0.06000000)
      ..cubicTo(size.width * 0.6193333, size.height * 0.05200000, size.width * 0.6166667,
          size.height * 0.04533333, size.width * 0.6113333, size.height * 0.03966667)
      ..cubicTo(size.width * 0.6060000, size.height * 0.03400000, size.width * 0.6000000,
          size.height * 0.03133333, size.width * 0.5923333, size.height * 0.03133333)
      ..cubicTo(size.width * 0.5846667, size.height * 0.03133333, size.width * 0.5780000,
          size.height * 0.03433333, size.width * 0.5723333, size.height * 0.04000000)
      ..cubicTo(size.width * 0.5666667, size.height * 0.04566667, size.width * 0.5636667,
          size.height * 0.05233333, size.width * 0.5636667, size.height * 0.06000000)
      ..lineTo(size.width * 0.5636667, size.height * 0.1280000)
      ..close()
      ..moveTo(size.width * 0.7473333, size.height * 0.2036667)
      ..cubicTo(size.width * 0.7473333, size.height * 0.2113333, size.width * 0.7500000,
          size.height * 0.2180000, size.width * 0.7556667, size.height * 0.2233333)
      ..cubicTo(size.width * 0.7606667, size.height * 0.2286667, size.width * 0.7670000,
          size.height * 0.2313333, size.width * 0.7743333, size.height * 0.2320000)
      ..cubicTo(size.width * 0.7816667, size.height * 0.2326667, size.width * 0.7886667,
          size.height * 0.2296667, size.width * 0.7950000, size.height * 0.2233333)
      ..lineTo(size.width * 0.8426667, size.height * 0.1756667)
      ..cubicTo(size.width * 0.8486667, size.height * 0.1696667, size.width * 0.8513333,
          size.height * 0.1630000, size.width * 0.8513333, size.height * 0.1553333)
      ..cubicTo(size.width * 0.8513333, size.height * 0.1473333, size.width * 0.8483333,
          size.height * 0.1406667, size.width * 0.8426667, size.height * 0.1350000)
      ..cubicTo(size.width * 0.8370000, size.height * 0.1293333, size.width * 0.8303333,
          size.height * 0.1266667, size.width * 0.8226667, size.height * 0.1266667)
      ..cubicTo(size.width * 0.8153333, size.height * 0.1266667, size.width * 0.8090000,
          size.height * 0.1293333, size.width * 0.8033333, size.height * 0.1350000)
      ..lineTo(size.width * 0.7556667, size.height * 0.1836667)
      ..cubicTo(size.width * 0.7500000, size.height * 0.1890000, size.width * 0.7473333,
          size.height * 0.1956667, size.width * 0.7473333, size.height * 0.2036667)
      ..close()
      ..moveTo(size.width * 0.7740000, size.height * 0.5970000)
      ..cubicTo(size.width * 0.7740000, size.height * 0.6053333, size.width * 0.7766667,
          size.height * 0.6123333, size.width * 0.7820000, size.height * 0.6176667)
      ..lineTo(size.width * 0.8033333, size.height * 0.6386667)
      ..cubicTo(size.width * 0.8113333, size.height * 0.6440000, size.width * 0.8186667,
          size.height * 0.6466667, size.width * 0.8246667, size.height * 0.6466667)
      ..cubicTo(size.width * 0.8316667, size.height * 0.6466667, size.width * 0.8376667,
          size.height * 0.6436667, size.width * 0.8433333, size.height * 0.6380000)
      ..cubicTo(size.width * 0.8490000, size.height * 0.6323333, size.width * 0.8516667,
          size.height * 0.6253333, size.width * 0.8516667, size.height * 0.6176667)
      ..cubicTo(size.width * 0.8516667, size.height * 0.6100000, size.width * 0.8486667,
          size.height * 0.6036667, size.width * 0.8430000, size.height * 0.5983333)
      ..lineTo(size.width * 0.8223333, size.height * 0.5766667)
      ..cubicTo(size.width * 0.8163333, size.height * 0.5713333, size.width * 0.8096667,
          size.height * 0.5686667, size.width * 0.8020000, size.height * 0.5686667)
      ..cubicTo(size.width * 0.7943333, size.height * 0.5686667, size.width * 0.7876667,
          size.height * 0.5713333, size.width * 0.7823333, size.height * 0.5770000)
      ..cubicTo(size.width * 0.7766667, size.height * 0.5823333, size.width * 0.7740000,
          size.height * 0.5890000, size.width * 0.7740000, size.height * 0.5970000)
      ..close()
      ..moveTo(size.width * 0.8223333, size.height * 0.3866667)
      ..cubicTo(size.width * 0.8223333, size.height * 0.3946667, size.width * 0.8253333,
          size.height * 0.4010000, size.width * 0.8310000, size.height * 0.4063333)
      ..cubicTo(size.width * 0.8366667, size.height * 0.4123333, size.width * 0.8436667,
          size.height * 0.4153333, size.width * 0.8516667, size.height * 0.4153333)
      ..lineTo(size.width * 0.9190000, size.height * 0.4153333)
      ..cubicTo(size.width * 0.9266667, size.height * 0.4153333, size.width * 0.9333333,
          size.height * 0.4126667, size.width * 0.9390000, size.height * 0.4070000)
      ..cubicTo(size.width * 0.9446667, size.height * 0.4013333, size.width * 0.9473333,
          size.height * 0.3946667, size.width * 0.9473333, size.height * 0.3866667)
      ..cubicTo(size.width * 0.9473333, size.height * 0.3786667, size.width * 0.9446667,
          size.height * 0.3720000, size.width * 0.9390000, size.height * 0.3666667)
      ..cubicTo(size.width * 0.9333333, size.height * 0.3613333, size.width * 0.9266667,
          size.height * 0.3583333, size.width * 0.9190000, size.height * 0.3583333)
      ..lineTo(size.width * 0.8516667, size.height * 0.3583333)
      ..cubicTo(size.width * 0.8436667, size.height * 0.3583333, size.width * 0.8370000,
          size.height * 0.3610000, size.width * 0.8310000, size.height * 0.3666667)
      ..cubicTo(size.width * 0.8250000, size.height * 0.3723333, size.width * 0.8223333,
          size.height * 0.3790000, size.width * 0.8223333, size.height * 0.3866667)
      ..close();
  }

  Path _daySprinklePath(Size size) {
    return Path()
      ..moveTo(size.width * 0.05266667, size.height * 0.5630000)
      ..cubicTo(size.width * 0.05266667, size.height * 0.5920000, size.width * 0.05966667,
          size.height * 0.6190000, size.width * 0.07400000, size.height * 0.6436667)
      ..cubicTo(size.width * 0.08800000, size.height * 0.6686667, size.width * 0.1073333,
          size.height * 0.6886667, size.width * 0.1316667, size.height * 0.7036667)
      ..cubicTo(size.width * 0.1560000, size.height * 0.7186667, size.width * 0.1826667,
          size.height * 0.7266667, size.width * 0.2116667, size.height * 0.7280000)
      ..cubicTo(size.width * 0.2156667, size.height * 0.7280000, size.width * 0.2176667,
          size.height * 0.7260000, size.width * 0.2176667, size.height * 0.7223333)
      ..lineTo(size.width * 0.2176667, size.height * 0.6780000)
      ..cubicTo(size.width * 0.2176667, size.height * 0.6740000, size.width * 0.2156667,
          size.height * 0.6716667, size.width * 0.2116667, size.height * 0.6716667)
      ..cubicTo(size.width * 0.1833333, size.height * 0.6703333, size.width * 0.1590000,
          size.height * 0.6590000, size.width * 0.1390000, size.height * 0.6376667)
      ..cubicTo(size.width * 0.1190000, size.height * 0.6163333, size.width * 0.1090000,
          size.height * 0.5916667, size.width * 0.1090000, size.height * 0.5626667)
      ..cubicTo(size.width * 0.1090000, size.height * 0.5353333, size.width * 0.1183333,
          size.height * 0.5113333, size.width * 0.1370000, size.height * 0.4910000)
      ..cubicTo(size.width * 0.1556667, size.height * 0.4706667, size.width * 0.1790000,
          size.height * 0.4590000, size.width * 0.2066667, size.height * 0.4556667)
      ..lineTo(size.width * 0.2240000, size.height * 0.4546667)
      ..cubicTo(size.width * 0.2280000, size.height * 0.4546667, size.width * 0.2303333,
          size.height * 0.4526667, size.width * 0.2303333, size.height * 0.4486667)
      ..lineTo(size.width * 0.2330000, size.height * 0.4306667)
      ..cubicTo(size.width * 0.2366667, size.height * 0.3946667, size.width * 0.2516667,
          size.height * 0.3646667, size.width * 0.2783333, size.height * 0.3403333)
      ..cubicTo(size.width * 0.3050000, size.height * 0.3160000, size.width * 0.3366667,
          size.height * 0.3040000, size.width * 0.3733333, size.height * 0.3040000)
      ..cubicTo(size.width * 0.4090000, size.height * 0.3040000, size.width * 0.4406667,
          size.height * 0.3160000, size.width * 0.4680000, size.height * 0.3403333)
      ..cubicTo(size.width * 0.4953333, size.height * 0.3646667, size.width * 0.5106667,
          size.height * 0.3946667, size.width * 0.5146667, size.height * 0.4303333)
      ..lineTo(size.width * 0.5170000, size.height * 0.4496667)
      ..cubicTo(size.width * 0.5170000, size.height * 0.4533333, size.width * 0.5190000,
          size.height * 0.4553333, size.width * 0.5226667, size.height * 0.4553333)
      ..lineTo(size.width * 0.5766667, size.height * 0.4553333)
      ..cubicTo(size.width * 0.6060000, size.height * 0.4553333, size.width * 0.6316667,
          size.height * 0.4660000, size.width * 0.6530000, size.height * 0.4873333)
      ..cubicTo(size.width * 0.6746667, size.height * 0.5086667, size.width * 0.6853333,
          size.height * 0.5336667, size.width * 0.6853333, size.height * 0.5626667)
      ..cubicTo(size.width * 0.6853333, size.height * 0.5913333, size.width * 0.6753333,
          size.height * 0.6163333, size.width * 0.6553333, size.height * 0.6376667)
      ..cubicTo(size.width * 0.6353333, size.height * 0.6586667, size.width * 0.6110000,
          size.height * 0.6700000, size.width * 0.5826667, size.height * 0.6716667)
      ..cubicTo(size.width * 0.5786667, size.height * 0.6716667, size.width * 0.5766667,
          size.height * 0.6736667, size.width * 0.5766667, size.height * 0.6780000)
      ..lineTo(size.width * 0.5766667, size.height * 0.7223333)
      ..cubicTo(size.width * 0.5766667, size.height * 0.7260000, size.width * 0.5786667,
          size.height * 0.7280000, size.width * 0.5826667, size.height * 0.7280000)
      ..cubicTo(size.width * 0.6116667, size.height * 0.7273333, size.width * 0.6383333,
          size.height * 0.7193333, size.width * 0.6626667, size.height * 0.7040000)
      ..cubicTo(size.width * 0.6870000, size.height * 0.6886667, size.width * 0.7063333,
          size.height * 0.6690000, size.width * 0.7203333, size.height * 0.6440000)
      ..cubicTo(size.width * 0.7343333, size.height * 0.6190000, size.width * 0.7413333,
          size.height * 0.5920000, size.width * 0.7413333, size.height * 0.5630000)
      ..cubicTo(size.width * 0.7413333, size.height * 0.5383333, size.width * 0.7366667,
          size.height * 0.5163333, size.width * 0.7276667, size.height * 0.4963333)
      ..cubicTo(size.width * 0.7536667, size.height * 0.4646667, size.width * 0.7663333,
          size.height * 0.4280000, size.width * 0.7663333, size.height * 0.3863333)
      ..cubicTo(size.width * 0.7663333, size.height * 0.3550000, size.width * 0.7586667,
          size.height * 0.3256667, size.width * 0.7430000, size.height * 0.2990000)
      ..cubicTo(size.width * 0.7273333, size.height * 0.2723333, size.width * 0.7063333,
          size.height * 0.2510000, size.width * 0.6796667, size.height * 0.2356667)
      ..cubicTo(size.width * 0.6530000, size.height * 0.2200000, size.width * 0.6240000,
          size.height * 0.2123333, size.width * 0.5926667, size.height * 0.2123333)
      ..cubicTo(size.width * 0.5410000, size.height * 0.2123333, size.width * 0.4980000,
          size.height * 0.2316667, size.width * 0.4636667, size.height * 0.2700000)
      ..cubicTo(size.width * 0.4363333, size.height * 0.2553333, size.width * 0.4063333,
          size.height * 0.2480000, size.width * 0.3740000, size.height * 0.2480000)
      ..cubicTo(size.width * 0.3270000, size.height * 0.2480000, size.width * 0.2856667,
          size.height * 0.2626667, size.width * 0.2493333, size.height * 0.2916667)
      ..cubicTo(size.width * 0.2130000, size.height * 0.3206667, size.width * 0.1900000,
          size.height * 0.3580000, size.width * 0.1796667, size.height * 0.4030000)
      ..cubicTo(size.width * 0.1430000, size.height * 0.4116667, size.width * 0.1126667,
          size.height * 0.4310000, size.width * 0.08900000, size.height * 0.4606667)
      ..cubicTo(size.width * 0.06433333, size.height * 0.4910000, size.width * 0.05266667,
          size.height * 0.5250000, size.width * 0.05266667, size.height * 0.5630000)
      ..close()
      ..moveTo(size.width * 0.2493333, size.height * 0.5923333)
      ..cubicTo(size.width * 0.2493333, size.height * 0.6050000, size.width * 0.2540000,
          size.height * 0.6160000, size.width * 0.2633333, size.height * 0.6250000)
      ..cubicTo(size.width * 0.2726667, size.height * 0.6340000, size.width * 0.2840000,
          size.height * 0.6383333, size.width * 0.2970000, size.height * 0.6383333)
      ..cubicTo(size.width * 0.3103333, size.height * 0.6383333, size.width * 0.3213333,
          size.height * 0.6340000, size.width * 0.3303333, size.height * 0.6250000)
      ..cubicTo(size.width * 0.3393333, size.height * 0.6160000, size.width * 0.3436667,
          size.height * 0.6053333, size.width * 0.3436667, size.height * 0.5923333)
      ..cubicTo(size.width * 0.3436667, size.height * 0.5843333, size.width * 0.3396667,
          size.height * 0.5730000, size.width * 0.3320000, size.height * 0.5590000)
      ..cubicTo(size.width * 0.3243333, size.height * 0.5446667, size.width * 0.3170000,
          size.height * 0.5336667, size.width * 0.3103333, size.height * 0.5260000)
      ..cubicTo(size.width * 0.3033333, size.height * 0.5186667, size.width * 0.2986667,
          size.height * 0.5136667, size.width * 0.2970000, size.height * 0.5120000)
      ..lineTo(size.width * 0.2850000, size.height * 0.5253333)
      ..cubicTo(size.width * 0.2760000, size.height * 0.5350000, size.width * 0.2676667,
          size.height * 0.5463333, size.width * 0.2603333, size.height * 0.5596667)
      ..cubicTo(size.width * 0.2530000, size.height * 0.5730000, size.width * 0.2493333,
          size.height * 0.5840000, size.width * 0.2493333, size.height * 0.5923333)
      ..close()
      ..moveTo(size.width * 0.3323333, size.height * 0.1553333)
      ..cubicTo(size.width * 0.3323333, size.height * 0.1640000, size.width * 0.3350000,
          size.height * 0.1706667, size.width * 0.3403333, size.height * 0.1756667)
      ..lineTo(size.width * 0.3620000, size.height * 0.1976667)
      ..cubicTo(size.width * 0.3760000, size.height * 0.2080000, size.width * 0.3893333,
          size.height * 0.2080000, size.width * 0.4023333, size.height * 0.1976667)
      ..cubicTo(size.width * 0.4076667, size.height * 0.1913333, size.width * 0.4103333,
          size.height * 0.1840000, size.width * 0.4103333, size.height * 0.1763333)
      ..cubicTo(size.width * 0.4103333, size.height * 0.1686667, size.width * 0.4076667,
          size.height * 0.1620000, size.width * 0.4023333, size.height * 0.1566667)
      ..lineTo(size.width * 0.3810000, size.height * 0.1350000)
      ..cubicTo(size.width * 0.3746667, size.height * 0.1293333, size.width * 0.3680000,
          size.height * 0.1266667, size.width * 0.3606667, size.height * 0.1266667)
      ..cubicTo(size.width * 0.3526667, size.height * 0.1266667, size.width * 0.3456667,
          size.height * 0.1293333, size.width * 0.3403333, size.height * 0.1350000)
      ..cubicTo(size.width * 0.3350000, size.height * 0.1406667, size.width * 0.3323333,
          size.height * 0.1473333, size.width * 0.3323333, size.height * 0.1553333)
      ..close()
      ..moveTo(size.width * 0.3483333, size.height * 0.7243333)
      ..cubicTo(size.width * 0.3483333, size.height * 0.7463333, size.width * 0.3560000,
          size.height * 0.7646667, size.width * 0.3710000, size.height * 0.7793333)
      ..cubicTo(size.width * 0.3860000, size.height * 0.7940000, size.width * 0.4043333,
          size.height * 0.8016667, size.width * 0.4260000, size.height * 0.8016667)
      ..cubicTo(size.width * 0.4476667, size.height * 0.8016667, size.width * 0.4660000,
          size.height * 0.7940000, size.width * 0.4813333, size.height * 0.7790000)
      ..cubicTo(size.width * 0.4966667, size.height * 0.7636667, size.width * 0.5040000,
          size.height * 0.7456667, size.width * 0.5040000, size.height * 0.7243333)
      ..cubicTo(size.width * 0.5040000, size.height * 0.7063333, size.width * 0.4950000,
          size.height * 0.6846667, size.width * 0.4770000, size.height * 0.6586667)
      ..cubicTo(size.width * 0.4616667, size.height * 0.6383333, size.width * 0.4473333,
          size.height * 0.6220000, size.width * 0.4343333, size.height * 0.6090000)
      ..cubicTo(size.width * 0.4316667, size.height * 0.6070000, size.width * 0.4286667,
          size.height * 0.6046667, size.width * 0.4256667, size.height * 0.6013333)
      ..lineTo(size.width * 0.4180000, size.height * 0.6090000)
      ..cubicTo(size.width * 0.4060000, size.height * 0.6196667, size.width * 0.3920000,
          size.height * 0.6363333, size.width * 0.3756667, size.height * 0.6580000)
      ..cubicTo(size.width * 0.3576667, size.height * 0.6833333, size.width * 0.3483333,
          size.height * 0.7053333, size.width * 0.3483333, size.height * 0.7243333)
      ..close()
      ..moveTo(size.width * 0.3976667, size.height * 0.5036667)
      ..cubicTo(size.width * 0.3976667, size.height * 0.5120000, size.width * 0.4010000,
          size.height * 0.5193333, size.width * 0.4073333, size.height * 0.5253333)
      ..cubicTo(size.width * 0.4136667, size.height * 0.5313333, size.width * 0.4213333,
          size.height * 0.5343333, size.width * 0.4303333, size.height * 0.5343333)
      ..cubicTo(size.width * 0.4390000, size.height * 0.5343333, size.width * 0.4463333,
          size.height * 0.5313333, size.width * 0.4523333, size.height * 0.5253333)
      ..cubicTo(size.width * 0.4583333, size.height * 0.5193333, size.width * 0.4613333,
          size.height * 0.5120000, size.width * 0.4613333, size.height * 0.5036667)
      ..cubicTo(size.width * 0.4613333, size.height * 0.4900000, size.width * 0.4510000,
          size.height * 0.4720000, size.width * 0.4303333, size.height * 0.4503333)
      ..lineTo(size.width * 0.4223333, size.height * 0.4586667)
      ..cubicTo(size.width * 0.4163333, size.height * 0.4653333, size.width * 0.4106667,
          size.height * 0.4730000, size.width * 0.4056667, size.height * 0.4820000)
      ..cubicTo(size.width * 0.4000000, size.height * 0.4910000, size.width * 0.3976667,
          size.height * 0.4980000, size.width * 0.3976667, size.height * 0.5036667)
      ..close()
      ..moveTo(size.width * 0.5100000, size.height * 0.3020000)
      ..cubicTo(size.width * 0.5320000, size.height * 0.2800000, size.width * 0.5593333,
          size.height * 0.2690000, size.width * 0.5923333, size.height * 0.2690000)
      ..cubicTo(size.width * 0.6250000, size.height * 0.2690000, size.width * 0.6523333,
          size.height * 0.2803333, size.width * 0.6753333, size.height * 0.3033333)
      ..cubicTo(size.width * 0.6980000, size.height * 0.3263333, size.width * 0.7096667,
          size.height * 0.3540000, size.width * 0.7096667, size.height * 0.3866667)
      ..cubicTo(size.width * 0.7096667, size.height * 0.4063333, size.width * 0.7040000,
          size.height * 0.4266667, size.width * 0.6923333, size.height * 0.4480000)
      ..cubicTo(size.width * 0.6600000, size.height * 0.4160000, size.width * 0.6213333,
          size.height * 0.4000000, size.width * 0.5766667, size.height * 0.4000000)
      ..lineTo(size.width * 0.5656667, size.height * 0.4000000)
      ..cubicTo(size.width * 0.5560000, size.height * 0.3613333, size.width * 0.5373333,
          size.height * 0.3286667, size.width * 0.5100000, size.height * 0.3020000)
      ..close()
      ..moveTo(size.width * 0.5633333, size.height * 0.1266667)
      ..cubicTo(size.width * 0.5633333, size.height * 0.1346667, size.width * 0.5663333,
          size.height * 0.1413333, size.width * 0.5720000, size.height * 0.1470000)
      ..cubicTo(size.width * 0.5776667, size.height * 0.1526667, size.width * 0.5843333,
          size.height * 0.1553333, size.width * 0.5920000, size.height * 0.1553333)
      ..cubicTo(size.width * 0.5996667, size.height * 0.1553333, size.width * 0.6063333,
          size.height * 0.1526667, size.width * 0.6113333, size.height * 0.1470000)
      ..cubicTo(size.width * 0.6166667, size.height * 0.1413333, size.width * 0.6190000,
          size.height * 0.1346667, size.width * 0.6190000, size.height * 0.1266667)
      ..lineTo(size.width * 0.6190000, size.height * 0.05866667)
      ..cubicTo(size.width * 0.6190000, size.height * 0.05066667, size.width * 0.6163333,
          size.height * 0.04433333, size.width * 0.6113333, size.height * 0.03900000)
      ..cubicTo(size.width * 0.6063333, size.height * 0.03366667, size.width * 0.6000000,
          size.height * 0.03133333, size.width * 0.5923333, size.height * 0.03133333)
      ..cubicTo(size.width * 0.5846667, size.height * 0.03133333, size.width * 0.5776667,
          size.height * 0.03400000, size.width * 0.5720000, size.height * 0.03900000)
      ..cubicTo(size.width * 0.5663333, size.height * 0.04400000, size.width * 0.5633333,
          size.height * 0.05066667, size.width * 0.5633333, size.height * 0.05866667)
      ..lineTo(size.width * 0.5633333, size.height * 0.1266667)
      ..close()
      ..moveTo(size.width * 0.7473333, size.height * 0.2036667)
      ..cubicTo(size.width * 0.7473333, size.height * 0.2116667, size.width * 0.7500000,
          size.height * 0.2183333, size.width * 0.7556667, size.height * 0.2233333)
      ..cubicTo(size.width * 0.7613333, size.height * 0.2286667, size.width * 0.7676667,
          size.height * 0.2313333, size.width * 0.7743333, size.height * 0.2313333)
      ..cubicTo(size.width * 0.7800000, size.height * 0.2313333, size.width * 0.7870000,
          size.height * 0.2286667, size.width * 0.7946667, size.height * 0.2233333)
      ..lineTo(size.width * 0.8423333, size.height * 0.1756667)
      ..cubicTo(size.width * 0.8483333, size.height * 0.1696667, size.width * 0.8513333,
          size.height * 0.1626667, size.width * 0.8513333, size.height * 0.1550000)
      ..cubicTo(size.width * 0.8513333, size.height * 0.1470000, size.width * 0.8486667,
          size.height * 0.1400000, size.width * 0.8430000, size.height * 0.1346667)
      ..cubicTo(size.width * 0.8373333, size.height * 0.1293333, size.width * 0.8306667,
          size.height * 0.1266667, size.width * 0.8226667, size.height * 0.1266667)
      ..cubicTo(size.width * 0.8153333, size.height * 0.1266667, size.width * 0.8090000,
          size.height * 0.1293333, size.width * 0.8033333, size.height * 0.1350000)
      ..lineTo(size.width * 0.7556667, size.height * 0.1826667)
      ..cubicTo(size.width * 0.7500000, size.height * 0.1883333, size.width * 0.7473333,
          size.height * 0.1953333, size.width * 0.7473333, size.height * 0.2036667)
      ..close()
      ..moveTo(size.width * 0.7740000, size.height * 0.5963333)
      ..cubicTo(size.width * 0.7740000, size.height * 0.6046667, size.width * 0.7766667,
          size.height * 0.6116667, size.width * 0.7816667, size.height * 0.6176667)
      ..lineTo(size.width * 0.8033333, size.height * 0.6370000)
      ..cubicTo(size.width * 0.8080000, size.height * 0.6430000, size.width * 0.8146667,
          size.height * 0.6460000, size.width * 0.8230000, size.height * 0.6460000)
      ..cubicTo(size.width * 0.8310000, size.height * 0.6460000, size.width * 0.8376667,
          size.height * 0.6430000, size.width * 0.8423333, size.height * 0.6370000)
      ..cubicTo(size.width * 0.8483333, size.height * 0.6316667, size.width * 0.8513333,
          size.height * 0.6250000, size.width * 0.8513333, size.height * 0.6176667)
      ..cubicTo(size.width * 0.8513333, size.height * 0.6103333, size.width * 0.8483333,
          size.height * 0.6040000, size.width * 0.8423333, size.height * 0.5983333)
      ..lineTo(size.width * 0.8220000, size.height * 0.5766667)
      ..cubicTo(size.width * 0.8160000, size.height * 0.5713333, size.width * 0.8093333,
          size.height * 0.5686667, size.width * 0.8016667, size.height * 0.5686667)
      ..cubicTo(size.width * 0.7936667, size.height * 0.5686667, size.width * 0.7870000,
          size.height * 0.5713333, size.width * 0.7816667, size.height * 0.5766667)
      ..cubicTo(size.width * 0.7763333, size.height * 0.5820000, size.width * 0.7740000,
          size.height * 0.5886667, size.width * 0.7740000, size.height * 0.5963333)
      ..close()
      ..moveTo(size.width * 0.8223333, size.height * 0.3866667)
      ..cubicTo(size.width * 0.8223333, size.height * 0.3940000, size.width * 0.8250000,
          size.height * 0.4006667, size.width * 0.8306667, size.height * 0.4060000)
      ..cubicTo(size.width * 0.8363333, size.height * 0.4113333, size.width * 0.8433333,
          size.height * 0.4140000, size.width * 0.8516667, size.height * 0.4140000)
      ..lineTo(size.width * 0.9190000, size.height * 0.4140000)
      ..cubicTo(size.width * 0.9270000, size.height * 0.4140000, size.width * 0.9336667,
          size.height * 0.4113333, size.width * 0.9390000, size.height * 0.4060000)
      ..cubicTo(size.width * 0.9446667, size.height * 0.4006667, size.width * 0.9473333,
          size.height * 0.3943333, size.width * 0.9473333, size.height * 0.3863333)
      ..cubicTo(size.width * 0.9473333, size.height * 0.3783333, size.width * 0.9446667,
          size.height * 0.3716667, size.width * 0.9390000, size.height * 0.3663333)
      ..cubicTo(size.width * 0.9333333, size.height * 0.3610000, size.width * 0.9266667,
          size.height * 0.3580000, size.width * 0.9190000, size.height * 0.3580000)
      ..lineTo(size.width * 0.8516667, size.height * 0.3580000)
      ..cubicTo(size.width * 0.8436667, size.height * 0.3580000, size.width * 0.8370000,
          size.height * 0.3606667, size.width * 0.8310000, size.height * 0.3663333)
      ..cubicTo(size.width * 0.8250000, size.height * 0.3720000, size.width * 0.8223333,
          size.height * 0.3790000, size.width * 0.8223333, size.height * 0.3866667)
      ..close();
  }

  Path _dayStormShowersPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.04966667, size.height * 0.5626667)
      ..cubicTo(size.width * 0.04966667, size.height * 0.6000000, size.width * 0.06066667,
          size.height * 0.6333333, size.width * 0.08300000, size.height * 0.6626667)
      ..cubicTo(size.width * 0.1053333, size.height * 0.6920000, size.width * 0.1340000,
          size.height * 0.7116667, size.width * 0.1690000, size.height * 0.7213333)
      ..lineTo(size.width * 0.1470000, size.height * 0.7780000)
      ..cubicTo(size.width * 0.1453333, size.height * 0.7826667, size.width * 0.1470000,
          size.height * 0.7853333, size.width * 0.1516667, size.height * 0.7853333)
      ..lineTo(size.width * 0.2226667, size.height * 0.7853333)
      ..lineTo(size.width * 0.1750000, size.height * 0.9256667)
      ..lineTo(size.width * 0.1846667, size.height * 0.9256667)
      ..lineTo(size.width * 0.3300000, size.height * 0.7370000)
      ..cubicTo(size.width * 0.3313333, size.height * 0.7356667, size.width * 0.3313333,
          size.height * 0.7340000, size.width * 0.3306667, size.height * 0.7323333)
      ..cubicTo(size.width * 0.3300000, size.height * 0.7306667, size.width * 0.3283333,
          size.height * 0.7300000, size.width * 0.3260000, size.height * 0.7300000)
      ..lineTo(size.width * 0.2530000, size.height * 0.7300000)
      ..lineTo(size.width * 0.3360000, size.height * 0.5750000)
      ..cubicTo(size.width * 0.3383333, size.height * 0.5703333, size.width * 0.3370000,
          size.height * 0.5676667, size.width * 0.3313333, size.height * 0.5676667)
      ..lineTo(size.width * 0.2326667, size.height * 0.5676667)
      ..cubicTo(size.width * 0.2296667, size.height * 0.5676667, size.width * 0.2270000,
          size.height * 0.5693333, size.width * 0.2250000, size.height * 0.5726667)
      ..lineTo(size.width * 0.1893333, size.height * 0.6686667)
      ..cubicTo(size.width * 0.1653333, size.height * 0.6626667, size.width * 0.1453333,
          size.height * 0.6500000, size.width * 0.1300000, size.height * 0.6300000)
      ..cubicTo(size.width * 0.1143333, size.height * 0.6103333, size.width * 0.1066667,
          size.height * 0.5880000, size.width * 0.1066667, size.height * 0.5626667)
      ..cubicTo(size.width * 0.1066667, size.height * 0.5346667, size.width * 0.1160000,
          size.height * 0.5103333, size.width * 0.1346667, size.height * 0.4900000)
      ..cubicTo(size.width * 0.1533333, size.height * 0.4696667, size.width * 0.1770000,
          size.height * 0.4576667, size.width * 0.2050000, size.height * 0.4543333)
      ..lineTo(size.width * 0.2220000, size.height * 0.4533333)
      ..cubicTo(size.width * 0.2260000, size.height * 0.4533333, size.width * 0.2283333,
          size.height * 0.4516667, size.width * 0.2293333, size.height * 0.4486667)
      ..lineTo(size.width * 0.2316667, size.height * 0.4290000)
      ..cubicTo(size.width * 0.2353333, size.height * 0.3930000, size.width * 0.2503333,
          size.height * 0.3626667, size.width * 0.2773333, size.height * 0.3383333)
      ..cubicTo(size.width * 0.3043333, size.height * 0.3140000, size.width * 0.3360000,
          size.height * 0.3016667, size.width * 0.3726667, size.height * 0.3016667)
      ..cubicTo(size.width * 0.4090000, size.height * 0.3016667, size.width * 0.4406667,
          size.height * 0.3140000, size.width * 0.4680000, size.height * 0.3383333)
      ..cubicTo(size.width * 0.4953333, size.height * 0.3626667, size.width * 0.5110000,
          size.height * 0.3930000, size.width * 0.5146667, size.height * 0.4290000)
      ..lineTo(size.width * 0.5173333, size.height * 0.4486667)
      ..cubicTo(size.width * 0.5173333, size.height * 0.4523333, size.width * 0.5193333,
          size.height * 0.4543333, size.width * 0.5233333, size.height * 0.4543333)
      ..lineTo(size.width * 0.5770000, size.height * 0.4543333)
      ..cubicTo(size.width * 0.6066667, size.height * 0.4543333, size.width * 0.6323333,
          size.height * 0.4650000, size.width * 0.6540000, size.height * 0.4863333)
      ..cubicTo(size.width * 0.6756667, size.height * 0.5076667, size.width * 0.6863333,
          size.height * 0.5330000, size.width * 0.6863333, size.height * 0.5626667)
      ..cubicTo(size.width * 0.6863333, size.height * 0.5916667, size.width * 0.6763333,
          size.height * 0.6166667, size.width * 0.6563333, size.height * 0.6380000)
      ..cubicTo(size.width * 0.6363333, size.height * 0.6593333, size.width * 0.6123333,
          size.height * 0.6706667, size.width * 0.5836667, size.height * 0.6723333)
      ..cubicTo(size.width * 0.5793333, size.height * 0.6723333, size.width * 0.5770000,
          size.height * 0.6743333, size.width * 0.5770000, size.height * 0.6783333)
      ..lineTo(size.width * 0.5770000, size.height * 0.7230000)
      ..cubicTo(size.width * 0.5770000, size.height * 0.7266667, size.width * 0.5793333,
          size.height * 0.7286667, size.width * 0.5836667, size.height * 0.7286667)
      ..cubicTo(size.width * 0.6130000, size.height * 0.7280000, size.width * 0.6400000,
          size.height * 0.7200000, size.width * 0.6643333, size.height * 0.7046667)
      ..cubicTo(size.width * 0.6886667, size.height * 0.6896667, size.width * 0.7080000,
          size.height * 0.6693333, size.width * 0.7223333, size.height * 0.6443333)
      ..cubicTo(size.width * 0.7366667, size.height * 0.6193333, size.width * 0.7436667,
          size.height * 0.5920000, size.width * 0.7436667, size.height * 0.5626667)
      ..cubicTo(size.width * 0.7436667, size.height * 0.5383333, size.width * 0.7390000,
          size.height * 0.5160000, size.width * 0.7293333, size.height * 0.4953333)
      ..cubicTo(size.width * 0.7546667, size.height * 0.4633333, size.width * 0.7673333,
          size.height * 0.4266667, size.width * 0.7673333, size.height * 0.3856667)
      ..cubicTo(size.width * 0.7673333, size.height * 0.3540000, size.width * 0.7593333,
          size.height * 0.3246667, size.width * 0.7436667, size.height * 0.2976667)
      ..cubicTo(size.width * 0.7280000, size.height * 0.2706667, size.width * 0.7066667,
          size.height * 0.2493333, size.width * 0.6796667, size.height * 0.2336667)
      ..cubicTo(size.width * 0.6526667, size.height * 0.2180000, size.width * 0.6233333,
          size.height * 0.2100000, size.width * 0.5916667, size.height * 0.2100000)
      ..cubicTo(size.width * 0.5676667, size.height * 0.2100000, size.width * 0.5443333,
          size.height * 0.2150000, size.width * 0.5216667, size.height * 0.2250000)
      ..cubicTo(size.width * 0.4990000, size.height * 0.2350000, size.width * 0.4796667,
          size.height * 0.2490000, size.width * 0.4630000, size.height * 0.2666667)
      ..cubicTo(size.width * 0.4360000, size.height * 0.2523333, size.width * 0.4060000,
          size.height * 0.2450000, size.width * 0.3723333, size.height * 0.2450000)
      ..cubicTo(size.width * 0.3250000, size.height * 0.2450000, size.width * 0.2830000,
          size.height * 0.2596667, size.width * 0.2466667, size.height * 0.2890000)
      ..cubicTo(size.width * 0.2103333, size.height * 0.3183333, size.width * 0.1866667,
          size.height * 0.3556667, size.width * 0.1766667, size.height * 0.4013333)
      ..cubicTo(size.width * 0.1396667, size.height * 0.4100000, size.width * 0.1093333,
          size.height * 0.4293333, size.width * 0.08533333, size.height * 0.4593333)
      ..cubicTo(size.width * 0.06166667, size.height * 0.4900000, size.width * 0.04966667,
          size.height * 0.5243333, size.width * 0.04966667, size.height * 0.5626667)
      ..close()
      ..moveTo(size.width * 0.3223333, size.height * 0.8933333)
      ..cubicTo(size.width * 0.3223333, size.height * 0.8983333, size.width * 0.3240000,
          size.height * 0.9036667, size.width * 0.3276667, size.height * 0.9090000)
      ..cubicTo(size.width * 0.3313333, size.height * 0.9143333, size.width * 0.3363333,
          size.height * 0.9180000, size.width * 0.3430000, size.height * 0.9203333)
      ..cubicTo(size.width * 0.3466667, size.height * 0.9213333, size.width * 0.3496667,
          size.height * 0.9216667, size.width * 0.3513333, size.height * 0.9216667)
      ..cubicTo(size.width * 0.3563333, size.height * 0.9216667, size.width * 0.3606667,
          size.height * 0.9206667, size.width * 0.3640000, size.height * 0.9190000)
      ..cubicTo(size.width * 0.3710000, size.height * 0.9163333, size.width * 0.3760000,
          size.height * 0.9100000, size.width * 0.3783333, size.height * 0.9000000)
      ..lineTo(size.width * 0.3873333, size.height * 0.8656667)
      ..cubicTo(size.width * 0.3893333, size.height * 0.8573333, size.width * 0.3883333,
          size.height * 0.8500000, size.width * 0.3846667, size.height * 0.8433333)
      ..cubicTo(size.width * 0.3810000, size.height * 0.8366667, size.width * 0.3746667,
          size.height * 0.8326667, size.width * 0.3670000, size.height * 0.8310000)
      ..cubicTo(size.width * 0.3600000, size.height * 0.8286667, size.width * 0.3533333,
          size.height * 0.8296667, size.width * 0.3463333, size.height * 0.8333333)
      ..cubicTo(size.width * 0.3393333, size.height * 0.8373333, size.width * 0.3346667,
          size.height * 0.8430000, size.width * 0.3323333, size.height * 0.8506667)
      ..lineTo(size.width * 0.3240000, size.height * 0.8853333)
      ..cubicTo(size.width * 0.3230000, size.height * 0.8900000, size.width * 0.3223333,
          size.height * 0.8926667, size.width * 0.3223333, size.height * 0.8933333)
      ..close()
      ..moveTo(size.width * 0.3300000, size.height * 0.1530000)
      ..cubicTo(size.width * 0.3300000, size.height * 0.1606667, size.width * 0.3326667,
          size.height * 0.1673333, size.width * 0.3383333, size.height * 0.1730000)
      ..lineTo(size.width * 0.3600000, size.height * 0.1950000)
      ..cubicTo(size.width * 0.3653333, size.height * 0.2003333, size.width * 0.3713333,
          size.height * 0.2030000, size.width * 0.3783333, size.height * 0.2036667)
      ..cubicTo(size.width * 0.3853333, size.height * 0.2046667, size.width * 0.3920000,
          size.height * 0.2023333, size.width * 0.3986667, size.height * 0.1960000)
      ..cubicTo(size.width * 0.4053333, size.height * 0.1900000, size.width * 0.4086667,
          size.height * 0.1830000, size.width * 0.4086667, size.height * 0.1746667)
      ..cubicTo(size.width * 0.4086667, size.height * 0.1670000, size.width * 0.4060000,
          size.height * 0.1603333, size.width * 0.4003333, size.height * 0.1546667)
      ..lineTo(size.width * 0.3793333, size.height * 0.1326667)
      ..cubicTo(size.width * 0.3740000, size.height * 0.1273333, size.width * 0.3673333,
          size.height * 0.1246667, size.width * 0.3593333, size.height * 0.1246667)
      ..cubicTo(size.width * 0.3510000, size.height * 0.1246667, size.width * 0.3440000,
          size.height * 0.1273333, size.width * 0.3383333, size.height * 0.1326667)
      ..cubicTo(size.width * 0.3330000, size.height * 0.1386667, size.width * 0.3300000,
          size.height * 0.1453333, size.width * 0.3300000, size.height * 0.1530000)
      ..close()
      ..moveTo(size.width * 0.3670000, size.height * 0.7333333)
      ..cubicTo(size.width * 0.3666667, size.height * 0.7386667, size.width * 0.3683333,
          size.height * 0.7440000, size.width * 0.3716667, size.height * 0.7490000)
      ..cubicTo(size.width * 0.3750000, size.height * 0.7540000, size.width * 0.3803333,
          size.height * 0.7576667, size.width * 0.3876667, size.height * 0.7596667)
      ..cubicTo(size.width * 0.3946667, size.height * 0.7620000, size.width * 0.4016667,
          size.height * 0.7613333, size.width * 0.4083333, size.height * 0.7576667)
      ..cubicTo(size.width * 0.4150000, size.height * 0.7540000, size.width * 0.4196667,
          size.height * 0.7476667, size.width * 0.4223333, size.height * 0.7390000)
      ..lineTo(size.width * 0.4323333, size.height * 0.7046667)
      ..cubicTo(size.width * 0.4346667, size.height * 0.6973333, size.width * 0.4336667,
          size.height * 0.6903333, size.width * 0.4296667, size.height * 0.6836667)
      ..cubicTo(size.width * 0.4256667, size.height * 0.6770000, size.width * 0.4196667,
          size.height * 0.6723333, size.width * 0.4116667, size.height * 0.6700000)
      ..cubicTo(size.width * 0.4040000, size.height * 0.6676667, size.width * 0.3970000,
          size.height * 0.6683333, size.width * 0.3903333, size.height * 0.6723333)
      ..cubicTo(size.width * 0.3836667, size.height * 0.6763333, size.width * 0.3790000,
          size.height * 0.6820000, size.width * 0.3766667, size.height * 0.6900000)
      ..lineTo(size.width * 0.3686667, size.height * 0.7250000)
      ..cubicTo(size.width * 0.3676667, size.height * 0.7300000, size.width * 0.3670000,
          size.height * 0.7326667, size.width * 0.3670000, size.height * 0.7333333)
      ..close()
      ..moveTo(size.width * 0.4613333, size.height * 0.7893333)
      ..cubicTo(size.width * 0.4613333, size.height * 0.7940000, size.width * 0.4623333,
          size.height * 0.7986667, size.width * 0.4646667, size.height * 0.8023333)
      ..cubicTo(size.width * 0.4690000, size.height * 0.8093333, size.width * 0.4750000,
          size.height * 0.8143333, size.width * 0.4826667, size.height * 0.8166667)
      ..cubicTo(size.width * 0.4863333, size.height * 0.8180000, size.width * 0.4896667,
          size.height * 0.8186667, size.width * 0.4920000, size.height * 0.8186667)
      ..cubicTo(size.width * 0.4963333, size.height * 0.8186667, size.width * 0.4996667,
          size.height * 0.8180000, size.width * 0.5023333, size.height * 0.8160000)
      ..cubicTo(size.width * 0.5090000, size.height * 0.8136667, size.width * 0.5140000,
          size.height * 0.8070000, size.width * 0.5173333, size.height * 0.7960000)
      ..lineTo(size.width * 0.5256667, size.height * 0.7623333)
      ..cubicTo(size.width * 0.5280000, size.height * 0.7543333, size.width * 0.5273333,
          size.height * 0.7473333, size.width * 0.5233333, size.height * 0.7406667)
      ..cubicTo(size.width * 0.5196667, size.height * 0.7340000, size.width * 0.5140000,
          size.height * 0.7296667, size.width * 0.5063333, size.height * 0.7276667)
      ..cubicTo(size.width * 0.4986667, size.height * 0.7253333, size.width * 0.4913333,
          size.height * 0.7260000, size.width * 0.4846667, size.height * 0.7300000)
      ..cubicTo(size.width * 0.4780000, size.height * 0.7336667, size.width * 0.4733333,
          size.height * 0.7393333, size.width * 0.4710000, size.height * 0.7470000)
      ..lineTo(size.width * 0.4616667, size.height * 0.7816667)
      ..cubicTo(size.width * 0.4616667, size.height * 0.7843333, size.width * 0.4613333,
          size.height * 0.7870000, size.width * 0.4613333, size.height * 0.7893333)
      ..close()
      ..moveTo(size.width * 0.5070000, size.height * 0.6286667)
      ..cubicTo(size.width * 0.5070000, size.height * 0.6346667, size.width * 0.5086667,
          size.height * 0.6400000, size.width * 0.5123333, size.height * 0.6453333)
      ..cubicTo(size.width * 0.5160000, size.height * 0.6506667, size.width * 0.5213333,
          size.height * 0.6543333, size.width * 0.5286667, size.height * 0.6563333)
      ..cubicTo(size.width * 0.5343333, size.height * 0.6583333, size.width * 0.5410000,
          size.height * 0.6576667, size.width * 0.5490000, size.height * 0.6546667)
      ..cubicTo(size.width * 0.5556667, size.height * 0.6516667, size.width * 0.5603333,
          size.height * 0.6453333, size.width * 0.5633333, size.height * 0.6356667)
      ..lineTo(size.width * 0.5723333, size.height * 0.6023333)
      ..cubicTo(size.width * 0.5743333, size.height * 0.5940000, size.width * 0.5736667,
          size.height * 0.5866667, size.width * 0.5696667, size.height * 0.5800000)
      ..cubicTo(size.width * 0.5656667, size.height * 0.5733333, size.width * 0.5600000,
          size.height * 0.5693333, size.width * 0.5520000, size.height * 0.5676667)
      ..cubicTo(size.width * 0.5443333, size.height * 0.5653333, size.width * 0.5373333,
          size.height * 0.5660000, size.width * 0.5306667, size.height * 0.5696667)
      ..cubicTo(size.width * 0.5240000, size.height * 0.5733333, size.width * 0.5196667,
          size.height * 0.5790000, size.width * 0.5173333, size.height * 0.5863333)
      ..lineTo(size.width * 0.5076667, size.height * 0.6216667)
      ..cubicTo(size.width * 0.5073333, size.height * 0.6263333, size.width * 0.5070000,
          size.height * 0.6286667, size.width * 0.5070000, size.height * 0.6286667)
      ..close()
      ..moveTo(size.width * 0.5103333, size.height * 0.3006667)
      ..cubicTo(size.width * 0.5326667, size.height * 0.2793333, size.width * 0.5596667,
          size.height * 0.2683333, size.width * 0.5920000, size.height * 0.2683333)
      ..cubicTo(size.width * 0.6246667, size.height * 0.2683333, size.width * 0.6526667,
          size.height * 0.2796667, size.width * 0.6756667, size.height * 0.3026667)
      ..cubicTo(size.width * 0.6986667, size.height * 0.3253333, size.width * 0.7103333,
          size.height * 0.3533333, size.width * 0.7103333, size.height * 0.3860000)
      ..cubicTo(size.width * 0.7103333, size.height * 0.4080000, size.width * 0.7050000,
          size.height * 0.4280000, size.width * 0.6946667, size.height * 0.4463333)
      ..cubicTo(size.width * 0.6626667, size.height * 0.4143333, size.width * 0.6236667,
          size.height * 0.3983333, size.width * 0.5773333, size.height * 0.3983333)
      ..lineTo(size.width * 0.5670000, size.height * 0.3983333)
      ..cubicTo(size.width * 0.5573333, size.height * 0.3586667, size.width * 0.5383333,
          size.height * 0.3260000, size.width * 0.5103333, size.height * 0.3006667)
      ..close()
      ..moveTo(size.width * 0.5636667, size.height * 0.1250000)
      ..cubicTo(size.width * 0.5636667, size.height * 0.1330000, size.width * 0.5663333,
          size.height * 0.1396667, size.width * 0.5720000, size.height * 0.1453333)
      ..cubicTo(size.width * 0.5776667, size.height * 0.1510000, size.width * 0.5843333,
          size.height * 0.1536667, size.width * 0.5920000, size.height * 0.1536667)
      ..cubicTo(size.width * 0.6000000, size.height * 0.1536667, size.width * 0.6066667,
          size.height * 0.1510000, size.width * 0.6120000, size.height * 0.1453333)
      ..cubicTo(size.width * 0.6173333, size.height * 0.1396667, size.width * 0.6200000,
          size.height * 0.1330000, size.width * 0.6200000, size.height * 0.1250000)
      ..lineTo(size.width * 0.6200000, size.height * 0.05633333)
      ..cubicTo(size.width * 0.6200000, size.height * 0.04833333, size.width * 0.6173333,
          size.height * 0.04133333, size.width * 0.6120000, size.height * 0.03600000)
      ..cubicTo(size.width * 0.6066667, size.height * 0.03033333, size.width * 0.6000000,
          size.height * 0.02733333, size.width * 0.5920000, size.height * 0.02733333)
      ..cubicTo(size.width * 0.5840000, size.height * 0.02733333, size.width * 0.5773333,
          size.height * 0.03000000, size.width * 0.5720000, size.height * 0.03566667)
      ..cubicTo(size.width * 0.5666667, size.height * 0.04133333, size.width * 0.5636667,
          size.height * 0.04800000, size.width * 0.5636667, size.height * 0.05600000)
      ..lineTo(size.width * 0.5636667, size.height * 0.1250000)
      ..close()
      ..moveTo(size.width * 0.7496667, size.height * 0.2013333)
      ..cubicTo(size.width * 0.7496667, size.height * 0.2093333, size.width * 0.7523333,
          size.height * 0.2160000, size.width * 0.7573333, size.height * 0.2213333)
      ..cubicTo(size.width * 0.7620000, size.height * 0.2266667, size.width * 0.7680000,
          size.height * 0.2293333, size.width * 0.7756667, size.height * 0.2300000)
      ..cubicTo(size.width * 0.7833333, size.height * 0.2306667, size.width * 0.7903333,
          size.height * 0.2276667, size.width * 0.7966667, size.height * 0.2213333)
      ..lineTo(size.width * 0.8446667, size.height * 0.1733333)
      ..cubicTo(size.width * 0.8506667, size.height * 0.1680000, size.width * 0.8533333,
          size.height * 0.1613333, size.width * 0.8533333, size.height * 0.1533333)
      ..cubicTo(size.width * 0.8533333, size.height * 0.1453333, size.width * 0.8503333,
          size.height * 0.1386667, size.width * 0.8446667, size.height * 0.1333333)
      ..cubicTo(size.width * 0.8393333, size.height * 0.1273333, size.width * 0.8326667,
          size.height * 0.1246667, size.width * 0.8246667, size.height * 0.1246667)
      ..cubicTo(size.width * 0.8170000, size.height * 0.1246667, size.width * 0.8106667,
          size.height * 0.1276667, size.width * 0.8053333, size.height * 0.1333333)
      ..lineTo(size.width * 0.7573333, size.height * 0.1813333)
      ..cubicTo(size.width * 0.7520000, size.height * 0.1863333, size.width * 0.7496667,
          size.height * 0.1930000, size.width * 0.7496667, size.height * 0.2013333)
      ..close()
      ..moveTo(size.width * 0.7753333, size.height * 0.5983333)
      ..cubicTo(size.width * 0.7753333, size.height * 0.6060000, size.width * 0.7780000,
          size.height * 0.6126667, size.width * 0.7836667, size.height * 0.6183333)
      ..lineTo(size.width * 0.8053333, size.height * 0.6393333)
      ..cubicTo(size.width * 0.8113333, size.height * 0.6450000, size.width * 0.8183333,
          size.height * 0.6476667, size.width * 0.8260000, size.height * 0.6476667)
      ..lineTo(size.width * 0.8266667, size.height * 0.6483333)
      ..cubicTo(size.width * 0.8340000, size.height * 0.6483333, size.width * 0.8400000,
          size.height * 0.6453333, size.width * 0.8446667, size.height * 0.6393333)
      ..cubicTo(size.width * 0.8506667, size.height * 0.6340000, size.width * 0.8533333,
          size.height * 0.6273333, size.width * 0.8533333, size.height * 0.6193333)
      ..cubicTo(size.width * 0.8533333, size.height * 0.6116667, size.width * 0.8503333,
          size.height * 0.6050000, size.width * 0.8446667, size.height * 0.5990000)
      ..lineTo(size.width * 0.8240000, size.height * 0.5783333)
      ..cubicTo(size.width * 0.8180000, size.height * 0.5723333, size.width * 0.8113333,
          size.height * 0.5693333, size.width * 0.8036667, size.height * 0.5693333)
      ..cubicTo(size.width * 0.7956667, size.height * 0.5693333, size.width * 0.7890000,
          size.height * 0.5723333, size.width * 0.7836667, size.height * 0.5780000)
      ..cubicTo(size.width * 0.7783333, size.height * 0.5836667, size.width * 0.7753333,
          size.height * 0.5906667, size.width * 0.7753333, size.height * 0.5983333)
      ..close()
      ..moveTo(size.width * 0.8243333, size.height * 0.3860000)
      ..cubicTo(size.width * 0.8243333, size.height * 0.3940000, size.width * 0.8273333,
          size.height * 0.4006667, size.width * 0.8330000, size.height * 0.4056667)
      ..cubicTo(size.width * 0.8383333, size.height * 0.4116667, size.width * 0.8450000,
          size.height * 0.4143333, size.width * 0.8530000, size.height * 0.4143333)
      ..lineTo(size.width * 0.9216667, size.height * 0.4143333)
      ..cubicTo(size.width * 0.9296667, size.height * 0.4143333, size.width * 0.9363333,
          size.height * 0.4116667, size.width * 0.9420000, size.height * 0.4060000)
      ..cubicTo(size.width * 0.9476667, size.height * 0.4003333, size.width * 0.9503333,
          size.height * 0.3936667, size.width * 0.9503333, size.height * 0.3860000)
      ..cubicTo(size.width * 0.9503333, size.height * 0.3783333, size.width * 0.9476667,
          size.height * 0.3713333, size.width * 0.9420000, size.height * 0.3660000)
      ..cubicTo(size.width * 0.9363333, size.height * 0.3606667, size.width * 0.9296667,
          size.height * 0.3580000, size.width * 0.9216667, size.height * 0.3580000)
      ..lineTo(size.width * 0.8530000, size.height * 0.3580000)
      ..cubicTo(size.width * 0.8450000, size.height * 0.3580000, size.width * 0.8380000,
          size.height * 0.3606667, size.width * 0.8326667, size.height * 0.3660000)
      ..cubicTo(size.width * 0.8270000, size.height * 0.3713333, size.width * 0.8243333,
          size.height * 0.3780000, size.width * 0.8243333, size.height * 0.3860000)
      ..close();
  }

  Path _daySunnyPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1456667, size.height * 0.4873333)
      ..cubicTo(size.width * 0.1456667, size.height * 0.4793333, size.width * 0.1483333,
          size.height * 0.4723333, size.width * 0.1540000, size.height * 0.4666667)
      ..cubicTo(size.width * 0.1596667, size.height * 0.4613333, size.width * 0.1666667,
          size.height * 0.4586667, size.width * 0.1740000, size.height * 0.4586667)
      ..lineTo(size.width * 0.2420000, size.height * 0.4586667)
      ..cubicTo(size.width * 0.2496667, size.height * 0.4586667, size.width * 0.2560000,
          size.height * 0.4613333, size.width * 0.2613333, size.height * 0.4670000)
      ..cubicTo(size.width * 0.2663333, size.height * 0.4726667, size.width * 0.2690000,
          size.height * 0.4793333, size.width * 0.2690000, size.height * 0.4873333)
      ..cubicTo(size.width * 0.2690000, size.height * 0.4953333, size.width * 0.2666667,
          size.height * 0.5020000, size.width * 0.2616667, size.height * 0.5076667)
      ..cubicTo(size.width * 0.2566667, size.height * 0.5133333, size.width * 0.2500000,
          size.height * 0.5160000, size.width * 0.2423333, size.height * 0.5160000)
      ..lineTo(size.width * 0.1743333, size.height * 0.5160000)
      ..cubicTo(size.width * 0.1666667, size.height * 0.5160000, size.width * 0.1600000,
          size.height * 0.5133333, size.width * 0.1543333, size.height * 0.5076667)
      ..cubicTo(size.width * 0.1486667, size.height * 0.5020000, size.width * 0.1456667,
          size.height * 0.4953333, size.width * 0.1456667, size.height * 0.4873333)
      ..close()
      ..moveTo(size.width * 0.2410000, size.height * 0.7183333)
      ..cubicTo(size.width * 0.2410000, size.height * 0.7106667, size.width * 0.2436667,
          size.height * 0.7040000, size.width * 0.2486667, size.height * 0.6980000)
      ..lineTo(size.width * 0.2976667, size.height * 0.6503333)
      ..cubicTo(size.width * 0.3026667, size.height * 0.6450000, size.width * 0.3093333,
          size.height * 0.6426667, size.width * 0.3173333, size.height * 0.6426667)
      ..cubicTo(size.width * 0.3253333, size.height * 0.6426667, size.width * 0.3320000,
          size.height * 0.6453333, size.width * 0.3373333, size.height * 0.6503333)
      ..cubicTo(size.width * 0.3426667, size.height * 0.6553333, size.width * 0.3453333,
          size.height * 0.6616667, size.width * 0.3453333, size.height * 0.6693333)
      ..cubicTo(size.width * 0.3453333, size.height * 0.6773333, size.width * 0.3426667,
          size.height * 0.6846667, size.width * 0.3373333, size.height * 0.6906667)
      ..lineTo(size.width * 0.2900000, size.height * 0.7380000)
      ..cubicTo(size.width * 0.2763333, size.height * 0.7486667, size.width * 0.2626667,
          size.height * 0.7486667, size.width * 0.2490000, size.height * 0.7380000)
      ..cubicTo(size.width * 0.2436667, size.height * 0.7326667, size.width * 0.2410000,
          size.height * 0.7260000, size.width * 0.2410000, size.height * 0.7183333)
      ..close()
      ..moveTo(size.width * 0.2410000, size.height * 0.2570000)
      ..cubicTo(size.width * 0.2410000, size.height * 0.2493333, size.width * 0.2436667,
          size.height * 0.2426667, size.width * 0.2486667, size.height * 0.2366667)
      ..cubicTo(size.width * 0.2553333, size.height * 0.2310000, size.width * 0.2623333,
          size.height * 0.2283333, size.width * 0.2700000, size.height * 0.2283333)
      ..cubicTo(size.width * 0.2773333, size.height * 0.2283333, size.width * 0.2840000,
          size.height * 0.2310000, size.width * 0.2896667, size.height * 0.2363333)
      ..lineTo(size.width * 0.3373333, size.height * 0.2853333)
      ..cubicTo(size.width * 0.3426667, size.height * 0.2903333, size.width * 0.3453333,
          size.height * 0.2970000, size.width * 0.3453333, size.height * 0.3050000)
      ..cubicTo(size.width * 0.3453333, size.height * 0.3130000, size.width * 0.3426667,
          size.height * 0.3196667, size.width * 0.3373333, size.height * 0.3250000)
      ..cubicTo(size.width * 0.3320000, size.height * 0.3303333, size.width * 0.3253333,
          size.height * 0.3330000, size.width * 0.3173333, size.height * 0.3330000)
      ..cubicTo(size.width * 0.3093333, size.height * 0.3330000, size.width * 0.3026667,
          size.height * 0.3303333, size.width * 0.2976667, size.height * 0.3250000)
      ..lineTo(size.width * 0.2490000, size.height * 0.2773333)
      ..cubicTo(size.width * 0.2436667, size.height * 0.2720000, size.width * 0.2410000,
          size.height * 0.2650000, size.width * 0.2410000, size.height * 0.2570000)
      ..close()
      ..moveTo(size.width * 0.3260000, size.height * 0.4873333)
      ..cubicTo(size.width * 0.3260000, size.height * 0.4563333, size.width * 0.3336667,
          size.height * 0.4273333, size.width * 0.3493333, size.height * 0.4006667)
      ..cubicTo(size.width * 0.3650000, size.height * 0.3740000, size.width * 0.3860000,
          size.height * 0.3526667, size.width * 0.4130000, size.height * 0.3370000)
      ..cubicTo(size.width * 0.4400000, size.height * 0.3213333, size.width * 0.4686667,
          size.height * 0.3136667, size.width * 0.4996667, size.height * 0.3136667)
      ..cubicTo(size.width * 0.5230000, size.height * 0.3136667, size.width * 0.5453333,
          size.height * 0.3183333, size.width * 0.5670000, size.height * 0.3276667)
      ..cubicTo(size.width * 0.5883333, size.height * 0.3370000, size.width * 0.6070000,
          size.height * 0.3493333, size.width * 0.6223333, size.height * 0.3650000)
      ..cubicTo(size.width * 0.6380000, size.height * 0.3806667, size.width * 0.6503333,
          size.height * 0.3990000, size.width * 0.6593333, size.height * 0.4203333)
      ..cubicTo(size.width * 0.6683333, size.height * 0.4416667, size.width * 0.6730000,
          size.height * 0.4643333, size.width * 0.6730000, size.height * 0.4876667)
      ..cubicTo(size.width * 0.6730000, size.height * 0.5190000, size.width * 0.6653333,
          size.height * 0.5480000, size.width * 0.6496667, size.height * 0.5746667)
      ..cubicTo(size.width * 0.6340000, size.height * 0.6013333, size.width * 0.6130000,
          size.height * 0.6223333, size.width * 0.5863333, size.height * 0.6380000)
      ..cubicTo(size.width * 0.5596667, size.height * 0.6536667, size.width * 0.5306667,
          size.height * 0.6613333, size.width * 0.4993333, size.height * 0.6613333)
      ..cubicTo(size.width * 0.4680000, size.height * 0.6613333, size.width * 0.4390000,
          size.height * 0.6536667, size.width * 0.4123333, size.height * 0.6380000)
      ..cubicTo(size.width * 0.3856667, size.height * 0.6223333, size.width * 0.3646667,
          size.height * 0.6013333, size.width * 0.3490000, size.height * 0.5746667)
      ..cubicTo(size.width * 0.3340000, size.height * 0.5476667, size.width * 0.3260000,
          size.height * 0.5186667, size.width * 0.3260000, size.height * 0.4873333)
      ..close()
      ..moveTo(size.width * 0.3826667, size.height * 0.4873333)
      ..cubicTo(size.width * 0.3826667, size.height * 0.5200000, size.width * 0.3940000,
          size.height * 0.5476667, size.width * 0.4170000, size.height * 0.5706667)
      ..cubicTo(size.width * 0.4396667, size.height * 0.5936667, size.width * 0.4673333,
          size.height * 0.6053333, size.width * 0.5000000, size.height * 0.6053333)
      ..cubicTo(size.width * 0.5326667, size.height * 0.6053333, size.width * 0.5603333,
          size.height * 0.5936667, size.width * 0.5833333, size.height * 0.5706667)
      ..cubicTo(size.width * 0.6063333, size.height * 0.5476667, size.width * 0.6180000,
          size.height * 0.5200000, size.width * 0.6180000, size.height * 0.4873333)
      ..cubicTo(size.width * 0.6180000, size.height * 0.4553333, size.width * 0.6063333,
          size.height * 0.4280000, size.width * 0.5833333, size.height * 0.4050000)
      ..cubicTo(size.width * 0.5603333, size.height * 0.3823333, size.width * 0.5326667,
          size.height * 0.3710000, size.width * 0.5000000, size.height * 0.3710000)
      ..cubicTo(size.width * 0.4676667, size.height * 0.3710000, size.width * 0.4400000,
          size.height * 0.3823333, size.width * 0.4173333, size.height * 0.4050000)
      ..cubicTo(size.width * 0.3940000, size.height * 0.4280000, size.width * 0.3826667,
          size.height * 0.4553333, size.width * 0.3826667, size.height * 0.4873333)
      ..close()
      ..moveTo(size.width * 0.4713333, size.height * 0.7466667)
      ..cubicTo(size.width * 0.4713333, size.height * 0.7386667, size.width * 0.4740000,
          size.height * 0.7320000, size.width * 0.4796667, size.height * 0.7266667)
      ..cubicTo(size.width * 0.4853333, size.height * 0.7213333, size.width * 0.4920000,
          size.height * 0.7186667, size.width * 0.4996667, size.height * 0.7186667)
      ..cubicTo(size.width * 0.5076667, size.height * 0.7186667, size.width * 0.5146667,
          size.height * 0.7213333, size.width * 0.5200000, size.height * 0.7266667)
      ..cubicTo(size.width * 0.5253333, size.height * 0.7320000, size.width * 0.5280000,
          size.height * 0.7386667, size.width * 0.5280000, size.height * 0.7466667)
      ..lineTo(size.width * 0.5280000, size.height * 0.8130000)
      ..cubicTo(size.width * 0.5280000, size.height * 0.8210000, size.width * 0.5253333,
          size.height * 0.8280000, size.width * 0.5196667, size.height * 0.8336667)
      ..cubicTo(size.width * 0.5140000, size.height * 0.8393333, size.width * 0.5073333,
          size.height * 0.8420000, size.width * 0.4996667, size.height * 0.8420000)
      ..cubicTo(size.width * 0.4920000, size.height * 0.8420000, size.width * 0.4850000,
          size.height * 0.8393333, size.width * 0.4796667, size.height * 0.8336667)
      ..cubicTo(size.width * 0.4740000, size.height * 0.8280000, size.width * 0.4713333,
          size.height * 0.8210000, size.width * 0.4713333, size.height * 0.8130000)
      ..lineTo(size.width * 0.4713333, size.height * 0.7466667)
      ..close()
      ..moveTo(size.width * 0.4713333, size.height * 0.2300000)
      ..lineTo(size.width * 0.4713333, size.height * 0.1620000)
      ..cubicTo(size.width * 0.4713333, size.height * 0.1543333, size.width * 0.4740000,
          size.height * 0.1476667, size.width * 0.4796667, size.height * 0.1420000)
      ..cubicTo(size.width * 0.4853333, size.height * 0.1363333, size.width * 0.4920000,
          size.height * 0.1333333, size.width * 0.5000000, size.height * 0.1333333)
      ..cubicTo(size.width * 0.5080000, size.height * 0.1333333, size.width * 0.5143333,
          size.height * 0.1360000, size.width * 0.5200000, size.height * 0.1416667)
      ..cubicTo(size.width * 0.5256667, size.height * 0.1473333, size.width * 0.5283333,
          size.height * 0.1540000, size.width * 0.5283333, size.height * 0.1616667)
      ..lineTo(size.width * 0.5283333, size.height * 0.2300000)
      ..cubicTo(size.width * 0.5283333, size.height * 0.2376667, size.width * 0.5256667,
          size.height * 0.2440000, size.width * 0.5200000, size.height * 0.2493333)
      ..cubicTo(size.width * 0.5143333, size.height * 0.2546667, size.width * 0.5076667,
          size.height * 0.2570000, size.width * 0.5000000, size.height * 0.2570000)
      ..cubicTo(size.width * 0.4923333, size.height * 0.2570000, size.width * 0.4853333,
          size.height * 0.2543333, size.width * 0.4800000, size.height * 0.2493333)
      ..cubicTo(size.width * 0.4746667, size.height * 0.2443333, size.width * 0.4713333,
          size.height * 0.2376667, size.width * 0.4713333, size.height * 0.2300000)
      ..close()
      ..moveTo(size.width * 0.6553333, size.height * 0.6693333)
      ..cubicTo(size.width * 0.6553333, size.height * 0.6616667, size.width * 0.6580000,
          size.height * 0.6553333, size.width * 0.6630000, size.height * 0.6506667)
      ..cubicTo(size.width * 0.6680000, size.height * 0.6453333, size.width * 0.6743333,
          size.height * 0.6430000, size.width * 0.6816667, size.height * 0.6430000)
      ..cubicTo(size.width * 0.6896667, size.height * 0.6430000, size.width * 0.6963333,
          size.height * 0.6456667, size.width * 0.7016667, size.height * 0.6506667)
      ..lineTo(size.width * 0.7503333, size.height * 0.6983333)
      ..cubicTo(size.width * 0.7556667, size.height * 0.7040000, size.width * 0.7583333,
          size.height * 0.7110000, size.width * 0.7583333, size.height * 0.7186667)
      ..cubicTo(size.width * 0.7583333, size.height * 0.7263333, size.width * 0.7556667,
          size.height * 0.7330000, size.width * 0.7503333, size.height * 0.7383333)
      ..cubicTo(size.width * 0.7370000, size.height * 0.7486667, size.width * 0.7236667,
          size.height * 0.7486667, size.width * 0.7103333, size.height * 0.7383333)
      ..lineTo(size.width * 0.6630000, size.height * 0.6910000)
      ..cubicTo(size.width * 0.6580000, size.height * 0.6850000, size.width * 0.6553333,
          size.height * 0.6780000, size.width * 0.6553333, size.height * 0.6693333)
      ..close()
      ..moveTo(size.width * 0.6553333, size.height * 0.3053333)
      ..cubicTo(size.width * 0.6553333, size.height * 0.2970000, size.width * 0.6580000,
          size.height * 0.2903333, size.width * 0.6630000, size.height * 0.2856667)
      ..lineTo(size.width * 0.7103333, size.height * 0.2366667)
      ..cubicTo(size.width * 0.7160000, size.height * 0.2313333, size.width * 0.7226667,
          size.height * 0.2286667, size.width * 0.7300000, size.height * 0.2286667)
      ..cubicTo(size.width * 0.7380000, size.height * 0.2286667, size.width * 0.7446667,
          size.height * 0.2313333, size.width * 0.7500000, size.height * 0.2370000)
      ..cubicTo(size.width * 0.7556667, size.height * 0.2426667, size.width * 0.7583333,
          size.height * 0.2493333, size.width * 0.7583333, size.height * 0.2570000)
      ..cubicTo(size.width * 0.7583333, size.height * 0.2653333, size.width * 0.7556667,
          size.height * 0.2723333, size.width * 0.7503333, size.height * 0.2776667)
      ..lineTo(size.width * 0.7016667, size.height * 0.3253333)
      ..cubicTo(size.width * 0.6956667, size.height * 0.3306667, size.width * 0.6890000,
          size.height * 0.3333333, size.width * 0.6816667, size.height * 0.3333333)
      ..cubicTo(size.width * 0.6740000, size.height * 0.3333333, size.width * 0.6680000,
          size.height * 0.3306667, size.width * 0.6630000, size.height * 0.3253333)
      ..cubicTo(size.width * 0.6580000, size.height * 0.3200000, size.width * 0.6553333,
          size.height * 0.3133333, size.width * 0.6553333, size.height * 0.3053333)
      ..close()
      ..moveTo(size.width * 0.7306667, size.height * 0.4873333)
      ..cubicTo(size.width * 0.7306667, size.height * 0.4793333, size.width * 0.7333333,
          size.height * 0.4726667, size.width * 0.7386667, size.height * 0.4666667)
      ..cubicTo(size.width * 0.7440000, size.height * 0.4613333, size.width * 0.7503333,
          size.height * 0.4586667, size.width * 0.7576667, size.height * 0.4586667)
      ..lineTo(size.width * 0.8250000, size.height * 0.4586667)
      ..cubicTo(size.width * 0.8326667, size.height * 0.4586667, size.width * 0.8393333,
          size.height * 0.4616667, size.width * 0.8450000, size.height * 0.4673333)
      ..cubicTo(size.width * 0.8506667, size.height * 0.4730000, size.width * 0.8536667,
          size.height * 0.4796667, size.width * 0.8536667, size.height * 0.4873333)
      ..cubicTo(size.width * 0.8536667, size.height * 0.4950000, size.width * 0.8506667,
          size.height * 0.5016667, size.width * 0.8450000, size.height * 0.5073333)
      ..cubicTo(size.width * 0.8393333, size.height * 0.5130000, size.width * 0.8326667,
          size.height * 0.5156667, size.width * 0.8250000, size.height * 0.5156667)
      ..lineTo(size.width * 0.7576667, size.height * 0.5156667)
      ..cubicTo(size.width * 0.7500000, size.height * 0.5156667, size.width * 0.7433333,
          size.height * 0.5130000, size.width * 0.7383333, size.height * 0.5073333)
      ..cubicTo(size.width * 0.7333333, size.height * 0.5016667, size.width * 0.7306667,
          size.height * 0.4953333, size.width * 0.7306667, size.height * 0.4873333)
      ..close();
  }

  Path _daySunnyOvercastPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1030000, size.height * 0.4476667)
      ..cubicTo(size.width * 0.1030000, size.height * 0.4566667, size.width * 0.1060000,
          size.height * 0.4640000, size.width * 0.1123333, size.height * 0.4700000)
      ..cubicTo(size.width * 0.1186667, size.height * 0.4760000, size.width * 0.1266667,
          size.height * 0.4786667, size.width * 0.1363333, size.height * 0.4786667)
      ..lineTo(size.width * 0.1926667, size.height * 0.4786667)
      ..cubicTo(size.width * 0.2016667, size.height * 0.4786667, size.width * 0.2093333,
          size.height * 0.4756667, size.width * 0.2156667, size.height * 0.4696667)
      ..cubicTo(size.width * 0.2220000, size.height * 0.4636667, size.width * 0.2253333,
          size.height * 0.4563333, size.width * 0.2253333, size.height * 0.4476667)
      ..cubicTo(size.width * 0.2253333, size.height * 0.4380000, size.width * 0.2223333,
          size.height * 0.4300000, size.width * 0.2160000, size.height * 0.4240000)
      ..cubicTo(size.width * 0.2096667, size.height * 0.4180000, size.width * 0.2020000,
          size.height * 0.4146667, size.width * 0.1930000, size.height * 0.4146667)
      ..lineTo(size.width * 0.1363333, size.height * 0.4146667)
      ..cubicTo(size.width * 0.1266667, size.height * 0.4146667, size.width * 0.1186667,
          size.height * 0.4176667, size.width * 0.1123333, size.height * 0.4240000)
      ..cubicTo(size.width * 0.1060000, size.height * 0.4296667, size.width * 0.1030000,
          size.height * 0.4376667, size.width * 0.1030000, size.height * 0.4476667)
      ..close()
      ..moveTo(size.width * 0.1620000, size.height * 0.6536667)
      ..cubicTo(size.width * 0.1620000, size.height * 0.6860000, size.width * 0.1736667,
          size.height * 0.7140000, size.width * 0.1973333, size.height * 0.7376667)
      ..cubicTo(size.width * 0.2210000, size.height * 0.7613333, size.width * 0.2486667,
          size.height * 0.7730000, size.width * 0.2810000, size.height * 0.7730000)
      ..lineTo(size.width * 0.5096667, size.height * 0.7730000)
      ..cubicTo(size.width * 0.5420000, size.height * 0.7730000, size.width * 0.5696667,
          size.height * 0.7613333, size.width * 0.5926667, size.height * 0.7380000)
      ..cubicTo(size.width * 0.6156667, size.height * 0.7146667, size.width * 0.6273333,
          size.height * 0.6866667, size.width * 0.6273333, size.height * 0.6536667)
      ..cubicTo(size.width * 0.6273333, size.height * 0.6376667, size.width * 0.6250000,
          size.height * 0.6240000, size.width * 0.6203333, size.height * 0.6126667)
      ..cubicTo(size.width * 0.6480000, size.height * 0.5950000, size.width * 0.6700000,
          size.height * 0.5713333, size.width * 0.6860000, size.height * 0.5420000)
      ..cubicTo(size.width * 0.7020000, size.height * 0.5126667, size.width * 0.7103333,
          size.height * 0.4810000, size.width * 0.7103333, size.height * 0.4473333)
      ..cubicTo(size.width * 0.7103333, size.height * 0.4203333, size.width * 0.7050000,
          size.height * 0.3943333, size.width * 0.6943333, size.height * 0.3696667)
      ..cubicTo(size.width * 0.6836667, size.height * 0.3450000, size.width * 0.6693333,
          size.height * 0.3236667, size.width * 0.6516667, size.height * 0.3060000)
      ..cubicTo(size.width * 0.6340000, size.height * 0.2883333, size.width * 0.6126667,
          size.height * 0.2740000, size.width * 0.5880000, size.height * 0.2633333)
      ..cubicTo(size.width * 0.5633333, size.height * 0.2526667, size.width * 0.5376667,
          size.height * 0.2473333, size.width * 0.5106667, size.height * 0.2473333)
      ..cubicTo(size.width * 0.4743333, size.height * 0.2473333, size.width * 0.4406667,
          size.height * 0.2563333, size.width * 0.4100000, size.height * 0.2743333)
      ..cubicTo(size.width * 0.3793333, size.height * 0.2923333, size.width * 0.3550000,
          size.height * 0.3166667, size.width * 0.3373333, size.height * 0.3470000)
      ..cubicTo(size.width * 0.3196667, size.height * 0.3776667, size.width * 0.3110000,
          size.height * 0.4110000, size.width * 0.3110000, size.height * 0.4473333)
      ..lineTo(size.width * 0.3110000, size.height * 0.4586667)
      ..cubicTo(size.width * 0.2776667, size.height * 0.4776667, size.width * 0.2556667,
          size.height * 0.5053333, size.width * 0.2450000, size.height * 0.5416667)
      ..cubicTo(size.width * 0.2196667, size.height * 0.5496667, size.width * 0.1996667,
          size.height * 0.5636667, size.width * 0.1846667, size.height * 0.5840000)
      ..cubicTo(size.width * 0.1696667, size.height * 0.6043333, size.width * 0.1620000,
          size.height * 0.6276667, size.width * 0.1620000, size.height * 0.6536667)
      ..close()
      ..moveTo(size.width * 0.2140000, size.height * 0.1816667)
      ..cubicTo(size.width * 0.2140000, size.height * 0.1910000, size.width * 0.2170000,
          size.height * 0.1986667, size.width * 0.2226667, size.height * 0.2040000)
      ..lineTo(size.width * 0.2763333, size.height * 0.2603333)
      ..cubicTo(size.width * 0.2920000, size.height * 0.2723333, size.width * 0.3076667,
          size.height * 0.2723333, size.width * 0.3233333, size.height * 0.2603333)
      ..cubicTo(size.width * 0.3296667, size.height * 0.2540000, size.width * 0.3326667,
          size.height * 0.2463333, size.width * 0.3326667, size.height * 0.2370000)
      ..cubicTo(size.width * 0.3326667, size.height * 0.2280000, size.width * 0.3296667,
          size.height * 0.2203333, size.width * 0.3233333, size.height * 0.2136667)
      ..lineTo(size.width * 0.2683333, size.height * 0.1586667)
      ..cubicTo(size.width * 0.2613333, size.height * 0.1523333, size.width * 0.2533333,
          size.height * 0.1490000, size.width * 0.2450000, size.height * 0.1490000)
      ..cubicTo(size.width * 0.2356667, size.height * 0.1490000, size.width * 0.2280000,
          size.height * 0.1520000, size.width * 0.2223333, size.height * 0.1583333)
      ..cubicTo(size.width * 0.2166667, size.height * 0.1646667, size.width * 0.2140000,
          size.height * 0.1723333, size.width * 0.2140000, size.height * 0.1816667)
      ..close()
      ..moveTo(size.width * 0.2280000, size.height * 0.6536667)
      ..cubicTo(size.width * 0.2280000, size.height * 0.6396667, size.width * 0.2323333,
          size.height * 0.6276667, size.width * 0.2413333, size.height * 0.6176667)
      ..cubicTo(size.width * 0.2503333, size.height * 0.6076667, size.width * 0.2616667,
          size.height * 0.6020000, size.width * 0.2753333, size.height * 0.6006667)
      ..lineTo(size.width * 0.2960000, size.height * 0.5980000)
      ..cubicTo(size.width * 0.3003333, size.height * 0.5980000, size.width * 0.3026667,
          size.height * 0.5953333, size.width * 0.3026667, size.height * 0.5903333)
      ..lineTo(size.width * 0.3056667, size.height * 0.5716667)
      ..cubicTo(size.width * 0.3080000, size.height * 0.5523333, size.width * 0.3160000,
          size.height * 0.5363333, size.width * 0.3300000, size.height * 0.5236667)
      ..cubicTo(size.width * 0.3440000, size.height * 0.5106667, size.width * 0.3603333,
          size.height * 0.5043333, size.width * 0.3793333, size.height * 0.5043333)
      ..cubicTo(size.width * 0.3986667, size.height * 0.5043333, size.width * 0.4156667,
          size.height * 0.5106667, size.width * 0.4296667, size.height * 0.5236667)
      ..cubicTo(size.width * 0.4440000, size.height * 0.5366667, size.width * 0.4523333,
          size.height * 0.5526667, size.width * 0.4546667, size.height * 0.5716667)
      ..lineTo(size.width * 0.4573333, size.height * 0.5933333)
      ..cubicTo(size.width * 0.4593333, size.height * 0.5983333, size.width * 0.4620000,
          size.height * 0.6010000, size.width * 0.4653333, size.height * 0.6010000)
      ..lineTo(size.width * 0.5093333, size.height * 0.6010000)
      ..cubicTo(size.width * 0.5236667, size.height * 0.6010000, size.width * 0.5360000,
          size.height * 0.6063333, size.width * 0.5466667, size.height * 0.6166667)
      ..cubicTo(size.width * 0.5573333, size.height * 0.6270000, size.width * 0.5623333,
          size.height * 0.6393333, size.width * 0.5623333, size.height * 0.6540000)
      ..cubicTo(size.width * 0.5623333, size.height * 0.6690000, size.width * 0.5570000,
          size.height * 0.6816667, size.width * 0.5466667, size.height * 0.6923333)
      ..cubicTo(size.width * 0.5363333, size.height * 0.7030000, size.width * 0.5236667,
          size.height * 0.7083333, size.width * 0.5093333, size.height * 0.7083333)
      ..lineTo(size.width * 0.2810000, size.height * 0.7083333)
      ..cubicTo(size.width * 0.2660000, size.height * 0.7083333, size.width * 0.2533333,
          size.height * 0.7030000, size.width * 0.2433333, size.height * 0.6923333)
      ..cubicTo(size.width * 0.2330000, size.height * 0.6816667, size.width * 0.2280000,
          size.height * 0.6686667, size.width * 0.2280000, size.height * 0.6536667)
      ..close()
      ..moveTo(size.width * 0.3753333, size.height * 0.4406667)
      ..cubicTo(size.width * 0.3776667, size.height * 0.4043333, size.width * 0.3916667,
          size.height * 0.3736667, size.width * 0.4176667, size.height * 0.3486667)
      ..cubicTo(size.width * 0.4433333, size.height * 0.3240000, size.width * 0.4746667,
          size.height * 0.3113333, size.width * 0.5106667, size.height * 0.3113333)
      ..cubicTo(size.width * 0.5476667, size.height * 0.3113333, size.width * 0.5793333,
          size.height * 0.3246667, size.width * 0.6053333, size.height * 0.3510000)
      ..cubicTo(size.width * 0.6313333, size.height * 0.3773333, size.width * 0.6443333,
          size.height * 0.4096667, size.width * 0.6443333, size.height * 0.4473333)
      ..cubicTo(size.width * 0.6443333, size.height * 0.4706667, size.width * 0.6386667,
          size.height * 0.4923333, size.width * 0.6273333, size.height * 0.5123333)
      ..cubicTo(size.width * 0.6160000, size.height * 0.5323333, size.width * 0.6006667,
          size.height * 0.5483333, size.width * 0.5813333, size.height * 0.5606667)
      ..cubicTo(size.width * 0.5616667, size.height * 0.5443333, size.width * 0.5390000,
          size.height * 0.5363333, size.width * 0.5136667, size.height * 0.5363333)
      ..cubicTo(size.width * 0.5040000, size.height * 0.5070000, size.width * 0.4866667,
          size.height * 0.4840000, size.width * 0.4623333, size.height * 0.4666667)
      ..cubicTo(size.width * 0.4380000, size.height * 0.4493333, size.width * 0.4103333,
          size.height * 0.4406667, size.width * 0.3796667, size.height * 0.4406667)
      ..lineTo(size.width * 0.3753333, size.height * 0.4406667)
      ..close()
      ..moveTo(size.width * 0.4783333, size.height * 0.1490000)
      ..cubicTo(size.width * 0.4783333, size.height * 0.1580000, size.width * 0.4816667,
          size.height * 0.1660000, size.width * 0.4880000, size.height * 0.1723333)
      ..cubicTo(size.width * 0.4943333, size.height * 0.1786667, size.width * 0.5020000,
          size.height * 0.1820000, size.width * 0.5110000, size.height * 0.1820000)
      ..cubicTo(size.width * 0.5203333, size.height * 0.1820000, size.width * 0.5280000,
          size.height * 0.1786667, size.width * 0.5343333, size.height * 0.1723333)
      ..cubicTo(size.width * 0.5406667, size.height * 0.1660000, size.width * 0.5440000,
          size.height * 0.1583333, size.width * 0.5440000, size.height * 0.1490000)
      ..lineTo(size.width * 0.5440000, size.height * 0.07100000)
      ..cubicTo(size.width * 0.5440000, size.height * 0.06233333, size.width * 0.5406667,
          size.height * 0.05500000, size.width * 0.5343333, size.height * 0.04900000)
      ..cubicTo(size.width * 0.5280000, size.height * 0.04300000, size.width * 0.5203333,
          size.height * 0.04000000, size.width * 0.5110000, size.height * 0.04000000)
      ..cubicTo(size.width * 0.5020000, size.height * 0.04000000, size.width * 0.4943333,
          size.height * 0.04300000, size.width * 0.4880000, size.height * 0.04900000)
      ..cubicTo(size.width * 0.4816667, size.height * 0.05500000, size.width * 0.4783333,
          size.height * 0.06233333, size.width * 0.4783333, size.height * 0.07100000)
      ..lineTo(size.width * 0.4783333, size.height * 0.1490000)
      ..close()
      ..moveTo(size.width * 0.6890000, size.height * 0.6566667)
      ..cubicTo(size.width * 0.6890000, size.height * 0.6656667, size.width * 0.6920000,
          size.height * 0.6733333, size.width * 0.6980000, size.height * 0.6800000)
      ..lineTo(size.width * 0.7526667, size.height * 0.7340000)
      ..cubicTo(size.width * 0.7666667, size.height * 0.7480000, size.width * 0.7823333,
          size.height * 0.7480000, size.width * 0.7996667, size.height * 0.7340000)
      ..cubicTo(size.width * 0.8056667, size.height * 0.7283333, size.width * 0.8083333,
          size.height * 0.7210000, size.width * 0.8083333, size.height * 0.7113333)
      ..cubicTo(size.width * 0.8083333, size.height * 0.7023333, size.width * 0.8053333,
          size.height * 0.6950000, size.width * 0.7996667, size.height * 0.6890000)
      ..lineTo(size.width * 0.7433333, size.height * 0.6333333)
      ..cubicTo(size.width * 0.7373333, size.height * 0.6276667, size.width * 0.7296667,
          size.height * 0.6250000, size.width * 0.7206667, size.height * 0.6250000)
      ..cubicTo(size.width * 0.7113333, size.height * 0.6250000, size.width * 0.7040000,
          size.height * 0.6280000, size.width * 0.6980000, size.height * 0.6340000)
      ..cubicTo(size.width * 0.6920000, size.height * 0.6400000, size.width * 0.6890000,
          size.height * 0.6476667, size.width * 0.6890000, size.height * 0.6566667)
      ..close()
      ..moveTo(size.width * 0.6890000, size.height * 0.2363333)
      ..cubicTo(size.width * 0.6890000, size.height * 0.2456667, size.width * 0.6920000,
          size.height * 0.2536667, size.width * 0.6980000, size.height * 0.2603333)
      ..cubicTo(size.width * 0.7040000, size.height * 0.2663333, size.width * 0.7116667,
          size.height * 0.2693333, size.width * 0.7206667, size.height * 0.2693333)
      ..cubicTo(size.width * 0.7296667, size.height * 0.2693333, size.width * 0.7373333,
          size.height * 0.2663333, size.width * 0.7433333, size.height * 0.2603333)
      ..lineTo(size.width * 0.7996667, size.height * 0.2040000)
      ..cubicTo(size.width * 0.8056667, size.height * 0.1983333, size.width * 0.8083333,
          size.height * 0.1910000, size.width * 0.8083333, size.height * 0.1816667)
      ..cubicTo(size.width * 0.8083333, size.height * 0.1723333, size.width * 0.8050000,
          size.height * 0.1646667, size.width * 0.7986667, size.height * 0.1586667)
      ..cubicTo(size.width * 0.7923333, size.height * 0.1526667, size.width * 0.7846667,
          size.height * 0.1493333, size.width * 0.7753333, size.height * 0.1493333)
      ..cubicTo(size.width * 0.7666667, size.height * 0.1493333, size.width * 0.7590000,
          size.height * 0.1526667, size.width * 0.7526667, size.height * 0.1590000)
      ..lineTo(size.width * 0.6980000, size.height * 0.2133333)
      ..cubicTo(size.width * 0.6920000, size.height * 0.2193333, size.width * 0.6890000,
          size.height * 0.2270000, size.width * 0.6890000, size.height * 0.2363333)
      ..close()
      ..moveTo(size.width * 0.7750000, size.height * 0.4476667)
      ..cubicTo(size.width * 0.7750000, size.height * 0.4566667, size.width * 0.7780000,
          size.height * 0.4640000, size.width * 0.7843333, size.height * 0.4700000)
      ..cubicTo(size.width * 0.7906667, size.height * 0.4760000, size.width * 0.7986667,
          size.height * 0.4786667, size.width * 0.8083333, size.height * 0.4786667)
      ..lineTo(size.width * 0.8646667, size.height * 0.4786667)
      ..cubicTo(size.width * 0.8736667, size.height * 0.4786667, size.width * 0.8813333,
          size.height * 0.4756667, size.width * 0.8876667, size.height * 0.4696667)
      ..cubicTo(size.width * 0.8940000, size.height * 0.4636667, size.width * 0.8973333,
          size.height * 0.4563333, size.width * 0.8973333, size.height * 0.4476667)
      ..cubicTo(size.width * 0.8973333, size.height * 0.4380000, size.width * 0.8943333,
          size.height * 0.4300000, size.width * 0.8880000, size.height * 0.4240000)
      ..cubicTo(size.width * 0.8816667, size.height * 0.4180000, size.width * 0.8740000,
          size.height * 0.4146667, size.width * 0.8650000, size.height * 0.4146667)
      ..lineTo(size.width * 0.8086667, size.height * 0.4146667)
      ..cubicTo(size.width * 0.7990000, size.height * 0.4146667, size.width * 0.7910000,
          size.height * 0.4176667, size.width * 0.7846667, size.height * 0.4240000)
      ..cubicTo(size.width * 0.7783333, size.height * 0.4296667, size.width * 0.7750000,
          size.height * 0.4376667, size.width * 0.7750000, size.height * 0.4476667)
      ..close();
  }

  Path _dayThunderstormPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.05066667, size.height * 0.5633333)
      ..cubicTo(size.width * 0.05066667, size.height * 0.6003333, size.width * 0.06166667,
          size.height * 0.6330000, size.width * 0.08333333, size.height * 0.6620000)
      ..cubicTo(size.width * 0.1050000, size.height * 0.6910000, size.width * 0.1336667,
          size.height * 0.7106667, size.width * 0.1690000, size.height * 0.7213333)
      ..lineTo(size.width * 0.1476667, size.height * 0.7780000)
      ..cubicTo(size.width * 0.1463333, size.height * 0.7826667, size.width * 0.1476667,
          size.height * 0.7850000, size.width * 0.1523333, size.height * 0.7850000)
      ..lineTo(size.width * 0.2233333, size.height * 0.7850000)
      ..lineTo(size.width * 0.1816667, size.height * 0.9166667)
      ..lineTo(size.width * 0.1913333, size.height * 0.9166667)
      ..lineTo(size.width * 0.3303333, size.height * 0.7370000)
      ..cubicTo(size.width * 0.3316667, size.height * 0.7356667, size.width * 0.3316667,
          size.height * 0.7340000, size.width * 0.3306667, size.height * 0.7323333)
      ..cubicTo(size.width * 0.3300000, size.height * 0.7306667, size.width * 0.3283333,
          size.height * 0.7300000, size.width * 0.3260000, size.height * 0.7300000)
      ..lineTo(size.width * 0.2536667, size.height * 0.7300000)
      ..lineTo(size.width * 0.3360000, size.height * 0.5756667)
      ..cubicTo(size.width * 0.3383333, size.height * 0.5710000, size.width * 0.3366667,
          size.height * 0.5683333, size.width * 0.3313333, size.height * 0.5683333)
      ..lineTo(size.width * 0.2333333, size.height * 0.5683333)
      ..cubicTo(size.width * 0.2303333, size.height * 0.5683333, size.width * 0.2276667,
          size.height * 0.5700000, size.width * 0.2256667, size.height * 0.5730000)
      ..lineTo(size.width * 0.1900000, size.height * 0.6690000)
      ..cubicTo(size.width * 0.1663333, size.height * 0.6630000, size.width * 0.1466667,
          size.height * 0.6500000, size.width * 0.1310000, size.height * 0.6303333)
      ..cubicTo(size.width * 0.1153333, size.height * 0.6106667, size.width * 0.1076667,
          size.height * 0.5883333, size.width * 0.1076667, size.height * 0.5633333)
      ..cubicTo(size.width * 0.1076667, size.height * 0.5356667, size.width * 0.1170000,
          size.height * 0.5116667, size.width * 0.1360000, size.height * 0.4910000)
      ..cubicTo(size.width * 0.1550000, size.height * 0.4703333, size.width * 0.1783333,
          size.height * 0.4586667, size.width * 0.2060000, size.height * 0.4553333)
      ..lineTo(size.width * 0.2233333, size.height * 0.4533333)
      ..cubicTo(size.width * 0.2276667, size.height * 0.4533333, size.width * 0.2300000,
          size.height * 0.4513333, size.width * 0.2300000, size.height * 0.4473333)
      ..lineTo(size.width * 0.2320000, size.height * 0.4303333)
      ..cubicTo(size.width * 0.2356667, size.height * 0.3943333, size.width * 0.2510000,
          size.height * 0.3640000, size.width * 0.2780000, size.height * 0.3396667)
      ..cubicTo(size.width * 0.3050000, size.height * 0.3153333, size.width * 0.3370000,
          size.height * 0.3030000, size.width * 0.3733333, size.height * 0.3030000)
      ..cubicTo(size.width * 0.4096667, size.height * 0.3030000, size.width * 0.4413333,
          size.height * 0.3153333, size.width * 0.4683333, size.height * 0.3396667)
      ..cubicTo(size.width * 0.4953333, size.height * 0.3640000, size.width * 0.5110000,
          size.height * 0.3943333, size.width * 0.5150000, size.height * 0.4303333)
      ..lineTo(size.width * 0.5170000, size.height * 0.4496667)
      ..cubicTo(size.width * 0.5170000, size.height * 0.4533333, size.width * 0.5190000,
          size.height * 0.4553333, size.width * 0.5230000, size.height * 0.4553333)
      ..lineTo(size.width * 0.5766667, size.height * 0.4553333)
      ..cubicTo(size.width * 0.6070000, size.height * 0.4553333, size.width * 0.6326667,
          size.height * 0.4660000, size.width * 0.6540000, size.height * 0.4870000)
      ..cubicTo(size.width * 0.6753333, size.height * 0.5080000, size.width * 0.6860000,
          size.height * 0.5333333, size.width * 0.6860000, size.height * 0.5633333)
      ..cubicTo(size.width * 0.6860000, size.height * 0.5916667, size.width * 0.6760000,
          size.height * 0.6163333, size.width * 0.6563333, size.height * 0.6370000)
      ..cubicTo(size.width * 0.6366667, size.height * 0.6576667, size.width * 0.6123333,
          size.height * 0.6693333, size.width * 0.5833333, size.height * 0.6716667)
      ..cubicTo(size.width * 0.5790000, size.height * 0.6716667, size.width * 0.5766667,
          size.height * 0.6736667, size.width * 0.5766667, size.height * 0.6776667)
      ..lineTo(size.width * 0.5766667, size.height * 0.7233333)
      ..cubicTo(size.width * 0.5766667, size.height * 0.7270000, size.width * 0.5790000,
          size.height * 0.7290000, size.width * 0.5833333, size.height * 0.7290000)
      ..cubicTo(size.width * 0.6276667, size.height * 0.7276667, size.width * 0.6653333,
          size.height * 0.7106667, size.width * 0.6963333, size.height * 0.6786667)
      ..cubicTo(size.width * 0.7273333, size.height * 0.6466667, size.width * 0.7426667,
          size.height * 0.6083333, size.width * 0.7426667, size.height * 0.5636667)
      ..cubicTo(size.width * 0.7426667, size.height * 0.5390000, size.width * 0.7380000,
          size.height * 0.5166667, size.width * 0.7283333, size.height * 0.4966667)
      ..cubicTo(size.width * 0.7546667, size.height * 0.4646667, size.width * 0.7676667,
          size.height * 0.4280000, size.width * 0.7676667, size.height * 0.3860000)
      ..cubicTo(size.width * 0.7676667, size.height * 0.3546667, size.width * 0.7596667,
          size.height * 0.3256667, size.width * 0.7440000, size.height * 0.2986667)
      ..cubicTo(size.width * 0.7283333, size.height * 0.2716667, size.width * 0.7070000,
          size.height * 0.2503333, size.width * 0.6800000, size.height * 0.2346667)
      ..cubicTo(size.width * 0.6530000, size.height * 0.2190000, size.width * 0.6240000,
          size.height * 0.2110000, size.width * 0.5926667, size.height * 0.2110000)
      ..cubicTo(size.width * 0.5413333, size.height * 0.2110000, size.width * 0.4980000,
          size.height * 0.2303333, size.width * 0.4633333, size.height * 0.2686667)
      ..cubicTo(size.width * 0.4363333, size.height * 0.2543333, size.width * 0.4063333,
          size.height * 0.2470000, size.width * 0.3733333, size.height * 0.2470000)
      ..cubicTo(size.width * 0.3263333, size.height * 0.2470000, size.width * 0.2843333,
          size.height * 0.2616667, size.width * 0.2480000, size.height * 0.2906667)
      ..cubicTo(size.width * 0.2116667, size.height * 0.3196667, size.width * 0.1883333,
          size.height * 0.3570000, size.width * 0.1780000, size.height * 0.4026667)
      ..cubicTo(size.width * 0.1410000, size.height * 0.4113333, size.width * 0.1106667,
          size.height * 0.4303333, size.width * 0.08700000, size.height * 0.4603333)
      ..cubicTo(size.width * 0.06333333, size.height * 0.4903333, size.width * 0.05066667,
          size.height * 0.5250000, size.width * 0.05066667, size.height * 0.5633333)
      ..close()
      ..moveTo(size.width * 0.3203333, size.height * 0.8826667)
      ..cubicTo(size.width * 0.3200000, size.height * 0.8876667, size.width * 0.3213333,
          size.height * 0.8926667, size.width * 0.3250000, size.height * 0.8973333)
      ..cubicTo(size.width * 0.3286667, size.height * 0.9020000, size.width * 0.3336667,
          size.height * 0.9056667, size.width * 0.3403333, size.height * 0.9083333)
      ..cubicTo(size.width * 0.3426667, size.height * 0.9090000, size.width * 0.3450000,
          size.height * 0.9093333, size.width * 0.3473333, size.height * 0.9093333)
      ..cubicTo(size.width * 0.3530000, size.height * 0.9093333, size.width * 0.3586667,
          size.height * 0.9076667, size.width * 0.3643333, size.height * 0.9043333)
      ..cubicTo(size.width * 0.3700000, size.height * 0.9010000, size.width * 0.3736667,
          size.height * 0.8956667, size.width * 0.3756667, size.height * 0.8886667)
      ..lineTo(size.width * 0.4520000, size.height * 0.6030000)
      ..cubicTo(size.width * 0.4540000, size.height * 0.5953333, size.width * 0.4533333,
          size.height * 0.5880000, size.width * 0.4496667, size.height * 0.5816667)
      ..cubicTo(size.width * 0.4460000, size.height * 0.5750000, size.width * 0.4406667,
          size.height * 0.5706667, size.width * 0.4333333, size.height * 0.5683333)
      ..cubicTo(size.width * 0.4256667, size.height * 0.5660000, size.width * 0.4183333,
          size.height * 0.5666667, size.width * 0.4116667, size.height * 0.5706667)
      ..cubicTo(size.width * 0.4050000, size.height * 0.5743333, size.width * 0.4003333,
          size.height * 0.5800000, size.width * 0.3983333, size.height * 0.5876667)
      ..lineTo(size.width * 0.3213333, size.height * 0.8743333)
      ..cubicTo(size.width * 0.3206667, size.height * 0.8766667, size.width * 0.3203333,
          size.height * 0.8796667, size.width * 0.3203333, size.height * 0.8826667)
      ..close()
      ..moveTo(size.width * 0.3313333, size.height * 0.1543333)
      ..cubicTo(size.width * 0.3313333, size.height * 0.1623333, size.width * 0.3340000,
          size.height * 0.1686667, size.width * 0.3396667, size.height * 0.1740000)
      ..lineTo(size.width * 0.3610000, size.height * 0.1960000)
      ..cubicTo(size.width * 0.3666667, size.height * 0.2016667, size.width * 0.3733333,
          size.height * 0.2043333, size.width * 0.3813333, size.height * 0.2046667)
      ..cubicTo(size.width * 0.3893333, size.height * 0.2046667, size.width * 0.3956667,
          size.height * 0.2020000, size.width * 0.4003333, size.height * 0.1960000)
      ..cubicTo(size.width * 0.4066667, size.height * 0.1910000, size.width * 0.4096667,
          size.height * 0.1843333, size.width * 0.4096667, size.height * 0.1760000)
      ..cubicTo(size.width * 0.4096667, size.height * 0.1680000, size.width * 0.4070000,
          size.height * 0.1616667, size.width * 0.4013333, size.height * 0.1563333)
      ..lineTo(size.width * 0.3803333, size.height * 0.1343333)
      ..cubicTo(size.width * 0.3746667, size.height * 0.1290000, size.width * 0.3676667,
          size.height * 0.1263333, size.width * 0.3600000, size.height * 0.1263333)
      ..cubicTo(size.width * 0.3516667, size.height * 0.1263333, size.width * 0.3446667,
          size.height * 0.1290000, size.width * 0.3393333, size.height * 0.1343333)
      ..cubicTo(size.width * 0.3340000, size.height * 0.1396667, size.width * 0.3313333,
          size.height * 0.1463333, size.width * 0.3313333, size.height * 0.1543333)
      ..close()
      ..moveTo(size.width * 0.4590000, size.height * 0.7810000)
      ..cubicTo(size.width * 0.4590000, size.height * 0.7850000, size.width * 0.4603333,
          size.height * 0.7890000, size.width * 0.4626667, size.height * 0.7936667)
      ..cubicTo(size.width * 0.4670000, size.height * 0.8003333, size.width * 0.4723333,
          size.height * 0.8050000, size.width * 0.4793333, size.height * 0.8080000)
      ..cubicTo(size.width * 0.4816667, size.height * 0.8090000, size.width * 0.4850000,
          size.height * 0.8096667, size.width * 0.4893333, size.height * 0.8096667)
      ..cubicTo(size.width * 0.4943333, size.height * 0.8096667, size.width * 0.4980000,
          size.height * 0.8090000, size.width * 0.5003333, size.height * 0.8076667)
      ..cubicTo(size.width * 0.5070000, size.height * 0.8050000, size.width * 0.5116667,
          size.height * 0.7983333, size.width * 0.5140000, size.height * 0.7883333)
      ..lineTo(size.width * 0.5636667, size.height * 0.6033333)
      ..cubicTo(size.width * 0.5656667, size.height * 0.5953333, size.width * 0.5650000,
          size.height * 0.5883333, size.width * 0.5613333, size.height * 0.5816667)
      ..cubicTo(size.width * 0.5576667, size.height * 0.5753333, size.width * 0.5520000,
          size.height * 0.5710000, size.width * 0.5443333, size.height * 0.5686667)
      ..cubicTo(size.width * 0.5366667, size.height * 0.5663333, size.width * 0.5293333,
          size.height * 0.5670000, size.width * 0.5230000, size.height * 0.5710000)
      ..cubicTo(size.width * 0.5163333, size.height * 0.5746667, size.width * 0.5120000,
          size.height * 0.5803333, size.width * 0.5100000, size.height * 0.5880000)
      ..lineTo(size.width * 0.4600000, size.height * 0.7733333)
      ..cubicTo(size.width * 0.4600000, size.height * 0.7740000, size.width * 0.4596667,
          size.height * 0.7753333, size.width * 0.4593333, size.height * 0.7770000)
      ..cubicTo(size.width * 0.4590000, size.height * 0.7790000, size.width * 0.4590000,
          size.height * 0.7800000, size.width * 0.4590000, size.height * 0.7810000)
      ..close()
      ..moveTo(size.width * 0.5100000, size.height * 0.3013333)
      ..cubicTo(size.width * 0.5323333, size.height * 0.2800000, size.width * 0.5596667,
          size.height * 0.2690000, size.width * 0.5926667, size.height * 0.2690000)
      ..cubicTo(size.width * 0.6250000, size.height * 0.2690000, size.width * 0.6530000,
          size.height * 0.2803333, size.width * 0.6760000, size.height * 0.3030000)
      ..cubicTo(size.width * 0.6990000, size.height * 0.3256667, size.width * 0.7106667,
          size.height * 0.3533333, size.width * 0.7106667, size.height * 0.3856667)
      ..cubicTo(size.width * 0.7106667, size.height * 0.4063333, size.width * 0.7050000,
          size.height * 0.4270000, size.width * 0.6933333, size.height * 0.4473333)
      ..cubicTo(size.width * 0.6603333, size.height * 0.4146667, size.width * 0.6213333,
          size.height * 0.3983333, size.width * 0.5766667, size.height * 0.3983333)
      ..lineTo(size.width * 0.5663333, size.height * 0.3983333)
      ..cubicTo(size.width * 0.5560000, size.height * 0.3593333, size.width * 0.5370000,
          size.height * 0.3270000, size.width * 0.5100000, size.height * 0.3013333)
      ..close()
      ..moveTo(size.width * 0.5636667, size.height * 0.1263333)
      ..cubicTo(size.width * 0.5636667, size.height * 0.1340000, size.width * 0.5666667,
          size.height * 0.1406667, size.width * 0.5723333, size.height * 0.1463333)
      ..cubicTo(size.width * 0.5780000, size.height * 0.1520000, size.width * 0.5846667,
          size.height * 0.1550000, size.width * 0.5923333, size.height * 0.1550000)
      ..cubicTo(size.width * 0.6003333, size.height * 0.1550000, size.width * 0.6066667,
          size.height * 0.1523333, size.width * 0.6120000, size.height * 0.1466667)
      ..cubicTo(size.width * 0.6173333, size.height * 0.1410000, size.width * 0.6196667,
          size.height * 0.1343333, size.width * 0.6196667, size.height * 0.1263333)
      ..lineTo(size.width * 0.6196667, size.height * 0.05766667)
      ..cubicTo(size.width * 0.6196667, size.height * 0.04966667, size.width * 0.6170000,
          size.height * 0.04300000, size.width * 0.6120000, size.height * 0.03733333)
      ..cubicTo(size.width * 0.6070000, size.height * 0.03166667, size.width * 0.6003333,
          size.height * 0.02900000, size.width * 0.5923333, size.height * 0.02900000)
      ..cubicTo(size.width * 0.5846667, size.height * 0.02900000, size.width * 0.5780000,
          size.height * 0.03166667, size.width * 0.5723333, size.height * 0.03733333)
      ..cubicTo(size.width * 0.5666667, size.height * 0.04300000, size.width * 0.5636667,
          size.height * 0.04966667, size.width * 0.5636667, size.height * 0.05766667)
      ..lineTo(size.width * 0.5636667, size.height * 0.1263333)
      ..close()
      ..moveTo(size.width * 0.7480000, size.height * 0.2023333)
      ..cubicTo(size.width * 0.7480000, size.height * 0.2103333, size.width * 0.7510000,
          size.height * 0.2170000, size.width * 0.7566667, size.height * 0.2223333)
      ..cubicTo(size.width * 0.7613333, size.height * 0.2280000, size.width * 0.7676667,
          size.height * 0.2306667, size.width * 0.7756667, size.height * 0.2306667)
      ..cubicTo(size.width * 0.7836667, size.height * 0.2306667, size.width * 0.7903333,
          size.height * 0.2280000, size.width * 0.7956667, size.height * 0.2223333)
      ..lineTo(size.width * 0.8436667, size.height * 0.1740000)
      ..cubicTo(size.width * 0.8493333, size.height * 0.1686667, size.width * 0.8523333,
          size.height * 0.1623333, size.width * 0.8523333, size.height * 0.1543333)
      ..cubicTo(size.width * 0.8523333, size.height * 0.1463333, size.width * 0.8496667,
          size.height * 0.1396667, size.width * 0.8440000, size.height * 0.1340000)
      ..cubicTo(size.width * 0.8383333, size.height * 0.1283333, size.width * 0.8316667,
          size.height * 0.1256667, size.width * 0.8236667, size.height * 0.1256667)
      ..cubicTo(size.width * 0.8163333, size.height * 0.1256667, size.width * 0.8100000,
          size.height * 0.1286667, size.width * 0.8046667, size.height * 0.1343333)
      ..lineTo(size.width * 0.7566667, size.height * 0.1823333)
      ..cubicTo(size.width * 0.7510000, size.height * 0.1876667, size.width * 0.7480000,
          size.height * 0.1943333, size.width * 0.7480000, size.height * 0.2023333)
      ..close()
      ..moveTo(size.width * 0.7750000, size.height * 0.5976667)
      ..cubicTo(size.width * 0.7750000, size.height * 0.6050000, size.width * 0.7776667,
          size.height * 0.6116667, size.width * 0.7830000, size.height * 0.6176667)
      ..lineTo(size.width * 0.8050000, size.height * 0.6386667)
      ..cubicTo(size.width * 0.8090000, size.height * 0.6433333, size.width * 0.8153333,
          size.height * 0.6463333, size.width * 0.8230000, size.height * 0.6466667)
      ..lineTo(size.width * 0.8233333, size.height * 0.6470000)
      ..cubicTo(size.width * 0.8236667, size.height * 0.6470000, size.width * 0.8243333,
          size.height * 0.6470000, size.width * 0.8250000, size.height * 0.6470000)
      ..cubicTo(size.width * 0.8256667, size.height * 0.6470000, size.width * 0.8260000,
          size.height * 0.6470000, size.width * 0.8266667, size.height * 0.6470000)
      ..cubicTo(size.width * 0.8330000, size.height * 0.6470000, size.width * 0.8386667,
          size.height * 0.6440000, size.width * 0.8443333, size.height * 0.6383333)
      ..cubicTo(size.width * 0.8500000, size.height * 0.6330000, size.width * 0.8530000,
          size.height * 0.6263333, size.width * 0.8530000, size.height * 0.6183333)
      ..cubicTo(size.width * 0.8530000, size.height * 0.6106667, size.width * 0.8500000,
          size.height * 0.6040000, size.width * 0.8443333, size.height * 0.5980000)
      ..lineTo(size.width * 0.8226667, size.height * 0.5776667)
      ..cubicTo(size.width * 0.8173333, size.height * 0.5716667, size.width * 0.8106667,
          size.height * 0.5686667, size.width * 0.8033333, size.height * 0.5686667)
      ..cubicTo(size.width * 0.7956667, size.height * 0.5686667, size.width * 0.7890000,
          size.height * 0.5713333, size.width * 0.7833333, size.height * 0.5770000)
      ..cubicTo(size.width * 0.7776667, size.height * 0.5830000, size.width * 0.7750000,
          size.height * 0.5900000, size.width * 0.7750000, size.height * 0.5976667)
      ..close()
      ..moveTo(size.width * 0.8233333, size.height * 0.3860000)
      ..cubicTo(size.width * 0.8233333, size.height * 0.3936667, size.width * 0.8263333,
          size.height * 0.4003333, size.width * 0.8323333, size.height * 0.4060000)
      ..cubicTo(size.width * 0.8383333, size.height * 0.4120000, size.width * 0.8450000,
          size.height * 0.4150000, size.width * 0.8526667, size.height * 0.4150000)
      ..lineTo(size.width * 0.9203333, size.height * 0.4150000)
      ..cubicTo(size.width * 0.9280000, size.height * 0.4150000, size.width * 0.9346667,
          size.height * 0.4120000, size.width * 0.9403333, size.height * 0.4063333)
      ..cubicTo(size.width * 0.9460000, size.height * 0.4006667, size.width * 0.9490000,
          size.height * 0.3936667, size.width * 0.9490000, size.height * 0.3860000)
      ..cubicTo(size.width * 0.9490000, size.height * 0.3783333, size.width * 0.9463333,
          size.height * 0.3716667, size.width * 0.9406667, size.height * 0.3663333)
      ..cubicTo(size.width * 0.9350000, size.height * 0.3610000, size.width * 0.9283333,
          size.height * 0.3583333, size.width * 0.9203333, size.height * 0.3583333)
      ..lineTo(size.width * 0.8526667, size.height * 0.3583333)
      ..cubicTo(size.width * 0.8443333, size.height * 0.3583333, size.width * 0.8373333,
          size.height * 0.3610000, size.width * 0.8316667, size.height * 0.3663333)
      ..cubicTo(size.width * 0.8260000, size.height * 0.3716667, size.width * 0.8233333,
          size.height * 0.3783333, size.width * 0.8233333, size.height * 0.3860000)
      ..close();
  }

  Path _dustPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.2443333, size.height * 0.5526667)
      ..cubicTo(size.width * 0.2443333, size.height * 0.5450000, size.width * 0.2470000,
          size.height * 0.5390000, size.width * 0.2520000, size.height * 0.5340000)
      ..cubicTo(size.width * 0.2573333, size.height * 0.5290000, size.width * 0.2643333,
          size.height * 0.5266667, size.width * 0.2733333, size.height * 0.5266667)
      ..lineTo(size.width * 0.4636667, size.height * 0.5266667)
      ..cubicTo(size.width * 0.4726667, size.height * 0.5266667, size.width * 0.4796667,
          size.height * 0.5290000, size.width * 0.4850000, size.height * 0.5340000)
      ..cubicTo(size.width * 0.4903333, size.height * 0.5390000, size.width * 0.4926667,
          size.height * 0.5450000, size.width * 0.4926667, size.height * 0.5526667)
      ..cubicTo(size.width * 0.4926667, size.height * 0.5616667, size.width * 0.4900000,
          size.height * 0.5690000, size.width * 0.4850000, size.height * 0.5740000)
      ..cubicTo(size.width * 0.4800000, size.height * 0.5790000, size.width * 0.4726667,
          size.height * 0.5816667, size.width * 0.4636667, size.height * 0.5816667)
      ..lineTo(size.width * 0.2733333, size.height * 0.5816667)
      ..cubicTo(size.width * 0.2643333, size.height * 0.5816667, size.width * 0.2573333,
          size.height * 0.5790000, size.width * 0.2520000, size.height * 0.5740000)
      ..cubicTo(size.width * 0.2466667, size.height * 0.5690000, size.width * 0.2443333,
          size.height * 0.5620000, size.width * 0.2443333, size.height * 0.5526667)
      ..close()
      ..moveTo(size.width * 0.2443333, size.height * 0.3556667)
      ..cubicTo(size.width * 0.2443333, size.height * 0.3483333, size.width * 0.2470000,
          size.height * 0.3420000, size.width * 0.2520000, size.height * 0.3373333)
      ..cubicTo(size.width * 0.2573333, size.height * 0.3323333, size.width * 0.2643333,
          size.height * 0.3300000, size.width * 0.2733333, size.height * 0.3300000)
      ..lineTo(size.width * 0.3720000, size.height * 0.3300000)
      ..cubicTo(size.width * 0.3810000, size.height * 0.3300000, size.width * 0.3880000,
          size.height * 0.3323333, size.width * 0.3933333, size.height * 0.3373333)
      ..cubicTo(size.width * 0.3986667, size.height * 0.3420000, size.width * 0.4013333,
          size.height * 0.3483333, size.width * 0.4013333, size.height * 0.3556667)
      ..cubicTo(size.width * 0.4013333, size.height * 0.3646667, size.width * 0.3986667,
          size.height * 0.3716667, size.width * 0.3933333, size.height * 0.3770000)
      ..cubicTo(size.width * 0.3880000, size.height * 0.3823333, size.width * 0.3810000,
          size.height * 0.3850000, size.width * 0.3720000, size.height * 0.3850000)
      ..lineTo(size.width * 0.2733333, size.height * 0.3850000)
      ..cubicTo(size.width * 0.2643333, size.height * 0.3850000, size.width * 0.2573333,
          size.height * 0.3823333, size.width * 0.2520000, size.height * 0.3773333)
      ..cubicTo(size.width * 0.2466667, size.height * 0.3723333, size.width * 0.2443333,
          size.height * 0.3646667, size.width * 0.2443333, size.height * 0.3556667)
      ..close()
      ..moveTo(size.width * 0.2773333, size.height * 0.6513333)
      ..cubicTo(size.width * 0.2773333, size.height * 0.6440000, size.width * 0.2803333,
          size.height * 0.6373333, size.width * 0.2866667, size.height * 0.6313333)
      ..cubicTo(size.width * 0.2926667, size.height * 0.6253333, size.width * 0.2996667,
          size.height * 0.6220000, size.width * 0.3066667, size.height * 0.6220000)
      ..cubicTo(size.width * 0.3153333, size.height * 0.6220000, size.width * 0.3220000,
          size.height * 0.6250000, size.width * 0.3273333, size.height * 0.6310000)
      ..cubicTo(size.width * 0.3326667, size.height * 0.6370000, size.width * 0.3353333,
          size.height * 0.6436667, size.width * 0.3353333, size.height * 0.6513333)
      ..cubicTo(size.width * 0.3353333, size.height * 0.6603333, size.width * 0.3326667,
          size.height * 0.6676667, size.width * 0.3276667, size.height * 0.6730000)
      ..cubicTo(size.width * 0.3226667, size.height * 0.6783333, size.width * 0.3156667,
          size.height * 0.6806667, size.width * 0.3066667, size.height * 0.6806667)
      ..cubicTo(size.width * 0.2990000, size.height * 0.6806667, size.width * 0.2920000,
          size.height * 0.6780000, size.width * 0.2863333, size.height * 0.6726667)
      ..cubicTo(size.width * 0.2800000, size.height * 0.6670000, size.width * 0.2773333,
          size.height * 0.6600000, size.width * 0.2773333, size.height * 0.6513333)
      ..close()
      ..moveTo(size.width * 0.3246667, size.height * 0.4536667)
      ..cubicTo(size.width * 0.3246667, size.height * 0.4460000, size.width * 0.3270000,
          size.height * 0.4390000, size.width * 0.3320000, size.height * 0.4333333)
      ..cubicTo(size.width * 0.3370000, size.height * 0.4273333, size.width * 0.3430000,
          size.height * 0.4243333, size.width * 0.3500000, size.height * 0.4243333)
      ..cubicTo(size.width * 0.3586667, size.height * 0.4243333, size.width * 0.3660000,
          size.height * 0.4273333, size.width * 0.3713333, size.height * 0.4333333)
      ..cubicTo(size.width * 0.3766667, size.height * 0.4393333, size.width * 0.3793333,
          size.height * 0.4460000, size.width * 0.3793333, size.height * 0.4536667)
      ..cubicTo(size.width * 0.3793333, size.height * 0.4626667, size.width * 0.3766667,
          size.height * 0.4700000, size.width * 0.3716667, size.height * 0.4753333)
      ..cubicTo(size.width * 0.3663333, size.height * 0.4806667, size.width * 0.3593333,
          size.height * 0.4830000, size.width * 0.3500000, size.height * 0.4830000)
      ..cubicTo(size.width * 0.3423333, size.height * 0.4830000, size.width * 0.3363333,
          size.height * 0.4803333, size.width * 0.3316667, size.height * 0.4750000)
      ..cubicTo(size.width * 0.3270000, size.height * 0.4696667, size.width * 0.3246667,
          size.height * 0.4626667, size.width * 0.3246667, size.height * 0.4536667)
      ..close()
      ..moveTo(size.width * 0.3576667, size.height * 0.6513333)
      ..cubicTo(size.width * 0.3576667, size.height * 0.6436667, size.width * 0.3603333,
          size.height * 0.6366667, size.width * 0.3656667, size.height * 0.6310000)
      ..cubicTo(size.width * 0.3710000, size.height * 0.6253333, size.width * 0.3783333,
          size.height * 0.6220000, size.width * 0.3870000, size.height * 0.6220000)
      ..lineTo(size.width * 0.5146667, size.height * 0.6220000)
      ..lineTo(size.width * 0.5440000, size.height * 0.6513333)
      ..cubicTo(size.width * 0.5440000, size.height * 0.6600000, size.width * 0.5410000,
          size.height * 0.6670000, size.width * 0.5350000, size.height * 0.6726667)
      ..cubicTo(size.width * 0.5290000, size.height * 0.6783333, size.width * 0.5223333,
          size.height * 0.6806667, size.width * 0.5146667, size.height * 0.6806667)
      ..lineTo(size.width * 0.3870000, size.height * 0.6806667)
      ..cubicTo(size.width * 0.3780000, size.height * 0.6806667, size.width * 0.3706667,
          size.height * 0.6780000, size.width * 0.3653333, size.height * 0.6726667)
      ..cubicTo(size.width * 0.3600000, size.height * 0.6673333, size.width * 0.3576667,
          size.height * 0.6603333, size.width * 0.3576667, size.height * 0.6513333)
      ..close()
      ..moveTo(size.width * 0.4016667, size.height * 0.4536667)
      ..cubicTo(size.width * 0.4016667, size.height * 0.4463333, size.width * 0.4046667,
          size.height * 0.4396667, size.width * 0.4110000, size.height * 0.4336667)
      ..cubicTo(size.width * 0.4170000, size.height * 0.4276667, size.width * 0.4240000,
          size.height * 0.4243333, size.width * 0.4310000, size.height * 0.4243333)
      ..lineTo(size.width * 0.5586667, size.height * 0.4243333)
      ..cubicTo(size.width * 0.5673333, size.height * 0.4243333, size.width * 0.5743333,
          size.height * 0.4273333, size.width * 0.5796667, size.height * 0.4333333)
      ..cubicTo(size.width * 0.5850000, size.height * 0.4393333, size.width * 0.5876667,
          size.height * 0.4460000, size.width * 0.5876667, size.height * 0.4536667)
      ..cubicTo(size.width * 0.5876667, size.height * 0.4626667, size.width * 0.5850000,
          size.height * 0.4700000, size.width * 0.5800000, size.height * 0.4753333)
      ..cubicTo(size.width * 0.5746667, size.height * 0.4806667, size.width * 0.5676667,
          size.height * 0.4830000, size.width * 0.5586667, size.height * 0.4830000)
      ..lineTo(size.width * 0.4310000, size.height * 0.4830000)
      ..cubicTo(size.width * 0.4233333, size.height * 0.4830000, size.width * 0.4163333,
          size.height * 0.4803333, size.width * 0.4106667, size.height * 0.4750000)
      ..cubicTo(size.width * 0.4046667, size.height * 0.4696667, size.width * 0.4016667,
          size.height * 0.4626667, size.width * 0.4016667, size.height * 0.4536667)
      ..close()
      ..moveTo(size.width * 0.4270000, size.height * 0.3556667)
      ..cubicTo(size.width * 0.4270000, size.height * 0.3483333, size.width * 0.4296667,
          size.height * 0.3420000, size.width * 0.4350000, size.height * 0.3373333)
      ..cubicTo(size.width * 0.4403333, size.height * 0.3326667, size.width * 0.4473333,
          size.height * 0.3300000, size.width * 0.4563333, size.height * 0.3300000)
      ..lineTo(size.width * 0.6466667, size.height * 0.3300000)
      ..cubicTo(size.width * 0.6543333, size.height * 0.3300000, size.width * 0.6610000,
          size.height * 0.3326667, size.width * 0.6670000, size.height * 0.3376667)
      ..cubicTo(size.width * 0.6730000, size.height * 0.3426667, size.width * 0.6760000,
          size.height * 0.3486667, size.width * 0.6760000, size.height * 0.3556667)
      ..cubicTo(size.width * 0.6760000, size.height * 0.3643333, size.width * 0.6730000,
          size.height * 0.3716667, size.width * 0.6670000, size.height * 0.3770000)
      ..cubicTo(size.width * 0.6610000, size.height * 0.3823333, size.width * 0.6543333,
          size.height * 0.3850000, size.width * 0.6466667, size.height * 0.3850000)
      ..lineTo(size.width * 0.4563333, size.height * 0.3850000)
      ..cubicTo(size.width * 0.4473333, size.height * 0.3850000, size.width * 0.4400000,
          size.height * 0.3823333, size.width * 0.4346667, size.height * 0.3770000)
      ..cubicTo(size.width * 0.4293333, size.height * 0.3716667, size.width * 0.4270000,
          size.height * 0.3646667, size.width * 0.4270000, size.height * 0.3556667)
      ..close()
      ..moveTo(size.width * 0.5146667, size.height * 0.5526667)
      ..cubicTo(size.width * 0.5146667, size.height * 0.5456667, size.width * 0.5176667,
          size.height * 0.5393333, size.width * 0.5236667, size.height * 0.5343333)
      ..cubicTo(size.width * 0.5296667, size.height * 0.5293333, size.width * 0.5363333,
          size.height * 0.5266667, size.width * 0.5440000, size.height * 0.5266667)
      ..cubicTo(size.width * 0.5516667, size.height * 0.5266667, size.width * 0.5583333,
          size.height * 0.5293333, size.width * 0.5643333, size.height * 0.5343333)
      ..cubicTo(size.width * 0.5703333, size.height * 0.5393333, size.width * 0.5733333,
          size.height * 0.5456667, size.width * 0.5733333, size.height * 0.5526667)
      ..cubicTo(size.width * 0.5733333, size.height * 0.5613333, size.width * 0.5703333,
          size.height * 0.5683333, size.width * 0.5643333, size.height * 0.5736667)
      ..cubicTo(size.width * 0.5583333, size.height * 0.5790000, size.width * 0.5516667,
          size.height * 0.5816667, size.width * 0.5440000, size.height * 0.5816667)
      ..cubicTo(size.width * 0.5363333, size.height * 0.5816667, size.width * 0.5293333,
          size.height * 0.5790000, size.width * 0.5236667, size.height * 0.5736667)
      ..cubicTo(size.width * 0.5176667, size.height * 0.5686667, size.width * 0.5146667,
          size.height * 0.5616667, size.width * 0.5146667, size.height * 0.5526667)
      ..close()
      ..moveTo(size.width * 0.5660000, size.height * 0.6513333)
      ..cubicTo(size.width * 0.5660000, size.height * 0.6436667, size.width * 0.5686667,
          size.height * 0.6366667, size.width * 0.5740000, size.height * 0.6310000)
      ..cubicTo(size.width * 0.5793333, size.height * 0.6250000, size.width * 0.5863333,
          size.height * 0.6220000, size.width * 0.5950000, size.height * 0.6220000)
      ..lineTo(size.width * 0.6573333, size.height * 0.6220000)
      ..cubicTo(size.width * 0.6660000, size.height * 0.6220000, size.width * 0.6730000,
          size.height * 0.6250000, size.width * 0.6783333, size.height * 0.6306667)
      ..cubicTo(size.width * 0.6836667, size.height * 0.6363333, size.width * 0.6863333,
          size.height * 0.6433333, size.width * 0.6863333, size.height * 0.6513333)
      ..cubicTo(size.width * 0.6863333, size.height * 0.6603333, size.width * 0.6836667,
          size.height * 0.6676667, size.width * 0.6786667, size.height * 0.6730000)
      ..cubicTo(size.width * 0.6736667, size.height * 0.6783333, size.width * 0.6663333,
          size.height * 0.6806667, size.width * 0.6573333, size.height * 0.6806667)
      ..lineTo(size.width * 0.5950000, size.height * 0.6806667)
      ..cubicTo(size.width * 0.5860000, size.height * 0.6806667, size.width * 0.5790000,
          size.height * 0.6780000, size.width * 0.5736667, size.height * 0.6730000)
      ..cubicTo(size.width * 0.5686667, size.height * 0.6676667, size.width * 0.5660000,
          size.height * 0.6603333, size.width * 0.5660000, size.height * 0.6513333)
      ..close()
      ..moveTo(size.width * 0.5950000, size.height * 0.5526667)
      ..cubicTo(size.width * 0.5950000, size.height * 0.5456667, size.width * 0.5980000,
          size.height * 0.5393333, size.width * 0.6040000, size.height * 0.5343333)
      ..cubicTo(size.width * 0.6100000, size.height * 0.5293333, size.width * 0.6166667,
          size.height * 0.5266667, size.width * 0.6243333, size.height * 0.5266667)
      ..lineTo(size.width * 0.7266667, size.height * 0.5266667)
      ..cubicTo(size.width * 0.7340000, size.height * 0.5266667, size.width * 0.7400000,
          size.height * 0.5293333, size.width * 0.7446667, size.height * 0.5343333)
      ..cubicTo(size.width * 0.7493333, size.height * 0.5393333, size.width * 0.7520000,
          size.height * 0.5453333, size.width * 0.7520000, size.height * 0.5526667)
      ..cubicTo(size.width * 0.7520000, size.height * 0.5616667, size.width * 0.7496667,
          size.height * 0.5686667, size.width * 0.7450000, size.height * 0.5740000)
      ..cubicTo(size.width * 0.7403333, size.height * 0.5793333, size.width * 0.7343333,
          size.height * 0.5816667, size.width * 0.7266667, size.height * 0.5816667)
      ..lineTo(size.width * 0.6243333, size.height * 0.5816667)
      ..cubicTo(size.width * 0.6166667, size.height * 0.5816667, size.width * 0.6096667,
          size.height * 0.5790000, size.width * 0.6040000, size.height * 0.5736667)
      ..cubicTo(size.width * 0.5980000, size.height * 0.5686667, size.width * 0.5950000,
          size.height * 0.5616667, size.width * 0.5950000, size.height * 0.5526667)
      ..close()
      ..moveTo(size.width * 0.6096667, size.height * 0.4536667)
      ..cubicTo(size.width * 0.6096667, size.height * 0.4463333, size.width * 0.6126667,
          size.height * 0.4396667, size.width * 0.6190000, size.height * 0.4336667)
      ..cubicTo(size.width * 0.6250000, size.height * 0.4276667, size.width * 0.6320000,
          size.height * 0.4243333, size.width * 0.6390000, size.height * 0.4243333)
      ..lineTo(size.width * 0.7043333, size.height * 0.4243333)
      ..cubicTo(size.width * 0.7113333, size.height * 0.4243333, size.width * 0.7173333,
          size.height * 0.4273333, size.width * 0.7223333, size.height * 0.4333333)
      ..cubicTo(size.width * 0.7273333, size.height * 0.4393333, size.width * 0.7300000,
          size.height * 0.4460000, size.width * 0.7300000, size.height * 0.4536667)
      ..cubicTo(size.width * 0.7300000, size.height * 0.4626667, size.width * 0.7276667,
          size.height * 0.4696667, size.width * 0.7226667, size.height * 0.4750000)
      ..cubicTo(size.width * 0.7180000, size.height * 0.4803333, size.width * 0.7116667,
          size.height * 0.4830000, size.width * 0.7043333, size.height * 0.4830000)
      ..lineTo(size.width * 0.6390000, size.height * 0.4830000)
      ..cubicTo(size.width * 0.6313333, size.height * 0.4830000, size.width * 0.6243333,
          size.height * 0.4803333, size.width * 0.6186667, size.height * 0.4750000)
      ..cubicTo(size.width * 0.6126667, size.height * 0.4696667, size.width * 0.6096667,
          size.height * 0.4626667, size.width * 0.6096667, size.height * 0.4536667)
      ..close()
      ..moveTo(size.width * 0.7010000, size.height * 0.3556667)
      ..cubicTo(size.width * 0.7010000, size.height * 0.3483333, size.width * 0.7033333,
          size.height * 0.3423333, size.width * 0.7083333, size.height * 0.3373333)
      ..cubicTo(size.width * 0.7133333, size.height * 0.3323333, size.width * 0.7193333,
          size.height * 0.3300000, size.width * 0.7266667, size.height * 0.3300000)
      ..cubicTo(size.width * 0.7356667, size.height * 0.3300000, size.width * 0.7426667,
          size.height * 0.3323333, size.width * 0.7480000, size.height * 0.3373333)
      ..cubicTo(size.width * 0.7533333, size.height * 0.3420000, size.width * 0.7560000,
          size.height * 0.3483333, size.width * 0.7560000, size.height * 0.3556667)
      ..cubicTo(size.width * 0.7560000, size.height * 0.3646667, size.width * 0.7533333,
          size.height * 0.3716667, size.width * 0.7480000, size.height * 0.3770000)
      ..cubicTo(size.width * 0.7426667, size.height * 0.3823333, size.width * 0.7356667,
          size.height * 0.3850000, size.width * 0.7266667, size.height * 0.3850000)
      ..cubicTo(size.width * 0.7190000, size.height * 0.3850000, size.width * 0.7130000,
          size.height * 0.3823333, size.width * 0.7083333, size.height * 0.3770000)
      ..cubicTo(size.width * 0.7033333, size.height * 0.3716667, size.width * 0.7010000,
          size.height * 0.3646667, size.width * 0.7010000, size.height * 0.3556667)
      ..close();
  }

  Path _fogPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.08733333, size.height * 0.7016667)
      ..cubicTo(size.width * 0.08733333, size.height * 0.6936667, size.width * 0.09000000,
          size.height * 0.6866667, size.width * 0.09566667, size.height * 0.6813333)
      ..cubicTo(size.width * 0.1013333, size.height * 0.6760000, size.width * 0.1083333,
          size.height * 0.6733333, size.width * 0.1166667, size.height * 0.6733333)
      ..lineTo(size.width * 0.7390000, size.height * 0.6733333)
      ..cubicTo(size.width * 0.7473333, size.height * 0.6733333, size.width * 0.7540000,
          size.height * 0.6760000, size.width * 0.7593333, size.height * 0.6813333)
      ..cubicTo(size.width * 0.7646667, size.height * 0.6866667, size.width * 0.7673333,
          size.height * 0.6933333, size.width * 0.7673333, size.height * 0.7016667)
      ..cubicTo(size.width * 0.7673333, size.height * 0.7093333, size.width * 0.7646667,
          size.height * 0.7160000, size.width * 0.7590000, size.height * 0.7210000)
      ..cubicTo(size.width * 0.7533333, size.height * 0.7263333, size.width * 0.7466667,
          size.height * 0.7286667, size.width * 0.7390000, size.height * 0.7286667)
      ..lineTo(size.width * 0.1166667, size.height * 0.7286667)
      ..cubicTo(size.width * 0.1083333, size.height * 0.7286667, size.width * 0.1013333,
          size.height * 0.7260000, size.width * 0.09566667, size.height * 0.7210000)
      ..cubicTo(size.width * 0.09000000, size.height * 0.7156667, size.width * 0.08733333,
          size.height * 0.7093333, size.width * 0.08733333, size.height * 0.7016667)
      ..close()
      ..moveTo(size.width * 0.1746667, size.height * 0.5970000)
      ..cubicTo(size.width * 0.1746667, size.height * 0.5890000, size.width * 0.1776667,
          size.height * 0.5823333, size.width * 0.1833333, size.height * 0.5770000)
      ..cubicTo(size.width * 0.1883333, size.height * 0.5720000, size.width * 0.1950000,
          size.height * 0.5693333, size.width * 0.2030000, size.height * 0.5693333)
      ..lineTo(size.width * 0.8253333, size.height * 0.5693333)
      ..cubicTo(size.width * 0.8330000, size.height * 0.5693333, size.width * 0.8393333,
          size.height * 0.5720000, size.width * 0.8446667, size.height * 0.5773333)
      ..cubicTo(size.width * 0.8500000, size.height * 0.5826667, size.width * 0.8523333,
          size.height * 0.5890000, size.width * 0.8523333, size.height * 0.5970000)
      ..cubicTo(size.width * 0.8523333, size.height * 0.6050000, size.width * 0.8496667,
          size.height * 0.6116667, size.width * 0.8446667, size.height * 0.6170000)
      ..cubicTo(size.width * 0.8393333, size.height * 0.6226667, size.width * 0.8330000,
          size.height * 0.6253333, size.width * 0.8253333, size.height * 0.6253333)
      ..lineTo(size.width * 0.2030000, size.height * 0.6253333)
      ..cubicTo(size.width * 0.1950000, size.height * 0.6253333, size.width * 0.1883333,
          size.height * 0.6226667, size.width * 0.1830000, size.height * 0.6170000)
      ..cubicTo(size.width * 0.1773333, size.height * 0.6113333, size.width * 0.1746667,
          size.height * 0.6046667, size.width * 0.1746667, size.height * 0.5970000)
      ..close()
      ..moveTo(size.width * 0.1790000, size.height * 0.5173333)
      ..cubicTo(size.width * 0.1790000, size.height * 0.5203333, size.width * 0.1806667,
          size.height * 0.5216667, size.width * 0.1840000, size.height * 0.5216667)
      ..lineTo(size.width * 0.2316667, size.height * 0.5216667)
      ..cubicTo(size.width * 0.2336667, size.height * 0.5216667, size.width * 0.2360000,
          size.height * 0.5200000, size.width * 0.2383333, size.height * 0.5163333)
      ..cubicTo(size.width * 0.2463333, size.height * 0.4990000, size.width * 0.2580000,
          size.height * 0.4850000, size.width * 0.2736667, size.height * 0.4740000)
      ..cubicTo(size.width * 0.2893333, size.height * 0.4630000, size.width * 0.3066667,
          size.height * 0.4566667, size.width * 0.3253333, size.height * 0.4553333)
      ..lineTo(size.width * 0.3436667, size.height * 0.4530000)
      ..cubicTo(size.width * 0.3473333, size.height * 0.4530000, size.width * 0.3493333,
          size.height * 0.4510000, size.width * 0.3493333, size.height * 0.4470000)
      ..lineTo(size.width * 0.3516667, size.height * 0.4303333)
      ..cubicTo(size.width * 0.3553333, size.height * 0.3943333, size.width * 0.3703333,
          size.height * 0.3643333, size.width * 0.3973333, size.height * 0.3403333)
      ..cubicTo(size.width * 0.4243333, size.height * 0.3163333, size.width * 0.4560000,
          size.height * 0.3043333, size.width * 0.4923333, size.height * 0.3043333)
      ..cubicTo(size.width * 0.5283333, size.height * 0.3043333, size.width * 0.5596667,
          size.height * 0.3163333, size.width * 0.5866667, size.height * 0.3400000)
      ..cubicTo(size.width * 0.6133333, size.height * 0.3636667, size.width * 0.6286667,
          size.height * 0.3936667, size.width * 0.6323333, size.height * 0.4293333)
      ..lineTo(size.width * 0.6350000, size.height * 0.4483333)
      ..cubicTo(size.width * 0.6350000, size.height * 0.4520000, size.width * 0.6373333,
          size.height * 0.4540000, size.width * 0.6416667, size.height * 0.4540000)
      ..lineTo(size.width * 0.6946667, size.height * 0.4540000)
      ..cubicTo(size.width * 0.7160000, size.height * 0.4540000, size.width * 0.7356667,
          size.height * 0.4596667, size.width * 0.7533333, size.height * 0.4713333)
      ..cubicTo(size.width * 0.7710000, size.height * 0.4830000, size.width * 0.7840000,
          size.height * 0.4980000, size.width * 0.7926667, size.height * 0.5170000)
      ..cubicTo(size.width * 0.7950000, size.height * 0.5206667, size.width * 0.7973333,
          size.height * 0.5223333, size.width * 0.7996667, size.height * 0.5223333)
      ..lineTo(size.width * 0.8473333, size.height * 0.5223333)
      ..cubicTo(size.width * 0.8513333, size.height * 0.5223333, size.width * 0.8530000,
          size.height * 0.5200000, size.width * 0.8520000, size.height * 0.5146667)
      ..cubicTo(size.width * 0.8423333, size.height * 0.4806667, size.width * 0.8226667,
          size.height * 0.4526667, size.width * 0.7940000, size.height * 0.4310000)
      ..cubicTo(size.width * 0.7650000, size.height * 0.4093333, size.width * 0.7320000,
          size.height * 0.3986667, size.width * 0.6950000, size.height * 0.3986667)
      ..lineTo(size.width * 0.6843333, size.height * 0.3986667)
      ..cubicTo(size.width * 0.6733333, size.height * 0.3543333, size.width * 0.6500000,
          size.height * 0.3180000, size.width * 0.6143333, size.height * 0.2896667)
      ..cubicTo(size.width * 0.5786667, size.height * 0.2613333, size.width * 0.5383333,
          size.height * 0.2473333, size.width * 0.4926667, size.height * 0.2473333)
      ..cubicTo(size.width * 0.4460000, size.height * 0.2473333, size.width * 0.4046667,
          size.height * 0.2620000, size.width * 0.3683333, size.height * 0.2913333)
      ..cubicTo(size.width * 0.3320000, size.height * 0.3206667, size.width * 0.3090000,
          size.height * 0.3580000, size.width * 0.2986667, size.height * 0.4033333)
      ..cubicTo(size.width * 0.2703333, size.height * 0.4100000, size.width * 0.2453333,
          size.height * 0.4233333, size.width * 0.2240000, size.height * 0.4436667)
      ..cubicTo(size.width * 0.2026667, size.height * 0.4640000, size.width * 0.1876667,
          size.height * 0.4880000, size.width * 0.1793333, size.height * 0.5163333)
      ..lineTo(size.width * 0.1793333, size.height * 0.5150000)
      ..cubicTo(size.width * 0.1790000, size.height * 0.5150000, size.width * 0.1790000,
          size.height * 0.5160000, size.width * 0.1790000, size.height * 0.5173333)
      ..close()
      ..moveTo(size.width * 0.2326667, size.height * 0.8036667)
      ..cubicTo(size.width * 0.2326667, size.height * 0.7956667, size.width * 0.2356667,
          size.height * 0.7893333, size.width * 0.2413333, size.height * 0.7840000)
      ..cubicTo(size.width * 0.2463333, size.height * 0.7790000, size.width * 0.2530000,
          size.height * 0.7763333, size.width * 0.2613333, size.height * 0.7763333)
      ..lineTo(size.width * 0.8840000, size.height * 0.7763333)
      ..cubicTo(size.width * 0.8920000, size.height * 0.7763333, size.width * 0.8986667,
          size.height * 0.7790000, size.width * 0.9040000, size.height * 0.7840000)
      ..cubicTo(size.width * 0.9096667, size.height * 0.7893333, size.width * 0.9123333,
          size.height * 0.7956667, size.width * 0.9123333, size.height * 0.8033333)
      ..cubicTo(size.width * 0.9123333, size.height * 0.8113333, size.width * 0.9096667,
          size.height * 0.8180000, size.width * 0.9040000, size.height * 0.8236667)
      ..cubicTo(size.width * 0.8983333, size.height * 0.8293333, size.width * 0.8916667,
          size.height * 0.8320000, size.width * 0.8840000, size.height * 0.8320000)
      ..lineTo(size.width * 0.2613333, size.height * 0.8320000)
      ..cubicTo(size.width * 0.2536667, size.height * 0.8320000, size.width * 0.2470000,
          size.height * 0.8290000, size.width * 0.2413333, size.height * 0.8233333)
      ..cubicTo(size.width * 0.2356667, size.height * 0.8183333, size.width * 0.2326667,
          size.height * 0.8113333, size.width * 0.2326667, size.height * 0.8036667)
      ..close();
  }

  Path _hailPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1546667, size.height * 0.5633333)
      ..cubicTo(size.width * 0.1546667, size.height * 0.6076667, size.width * 0.1700000,
          size.height * 0.6456667, size.width * 0.2010000, size.height * 0.6776667)
      ..cubicTo(size.width * 0.2320000, size.height * 0.7096667, size.width * 0.2696667,
          size.height * 0.7266667, size.width * 0.3143333, size.height * 0.7286667)
      ..cubicTo(size.width * 0.3180000, size.height * 0.7286667, size.width * 0.3200000,
          size.height * 0.7266667, size.width * 0.3200000, size.height * 0.7230000)
      ..lineTo(size.width * 0.3200000, size.height * 0.6783333)
      ..cubicTo(size.width * 0.3200000, size.height * 0.6746667, size.width * 0.3180000,
          size.height * 0.6726667, size.width * 0.3143333, size.height * 0.6726667)
      ..cubicTo(size.width * 0.2856667, size.height * 0.6713333, size.width * 0.2616667,
          size.height * 0.6600000, size.width * 0.2416667, size.height * 0.6386667)
      ..cubicTo(size.width * 0.2216667, size.height * 0.6173333, size.width * 0.2116667,
          size.height * 0.5923333, size.width * 0.2116667, size.height * 0.5633333)
      ..cubicTo(size.width * 0.2116667, size.height * 0.5356667, size.width * 0.2210000,
          size.height * 0.5120000, size.width * 0.2396667, size.height * 0.4913333)
      ..cubicTo(size.width * 0.2583333, size.height * 0.4710000, size.width * 0.2816667,
          size.height * 0.4590000, size.width * 0.3093333, size.height * 0.4556667)
      ..lineTo(size.width * 0.3270000, size.height * 0.4546667)
      ..cubicTo(size.width * 0.3313333, size.height * 0.4546667, size.width * 0.3336667,
          size.height * 0.4526667, size.width * 0.3336667, size.height * 0.4483333)
      ..lineTo(size.width * 0.3356667, size.height * 0.4306667)
      ..cubicTo(size.width * 0.3393333, size.height * 0.3946667, size.width * 0.3543333,
          size.height * 0.3643333, size.width * 0.3813333, size.height * 0.3403333)
      ..cubicTo(size.width * 0.4083333, size.height * 0.3160000, size.width * 0.4400000,
          size.height * 0.3040000, size.width * 0.4763333, size.height * 0.3040000)
      ..cubicTo(size.width * 0.5126667, size.height * 0.3040000, size.width * 0.5443333,
          size.height * 0.3160000, size.width * 0.5713333, size.height * 0.3403333)
      ..cubicTo(size.width * 0.5983333, size.height * 0.3646667, size.width * 0.6136667,
          size.height * 0.3946667, size.width * 0.6176667, size.height * 0.4306667)
      ..lineTo(size.width * 0.6203333, size.height * 0.4500000)
      ..cubicTo(size.width * 0.6203333, size.height * 0.4536667, size.width * 0.6223333,
          size.height * 0.4556667, size.width * 0.6263333, size.height * 0.4556667)
      ..lineTo(size.width * 0.6800000, size.height * 0.4556667)
      ..cubicTo(size.width * 0.7096667, size.height * 0.4556667, size.width * 0.7353333,
          size.height * 0.4663333, size.width * 0.7570000, size.height * 0.4876667)
      ..cubicTo(size.width * 0.7786667, size.height * 0.5090000, size.width * 0.7896667,
          size.height * 0.5340000, size.width * 0.7896667, size.height * 0.5633333)
      ..cubicTo(size.width * 0.7896667, size.height * 0.5923333, size.width * 0.7796667,
          size.height * 0.6173333, size.width * 0.7596667, size.height * 0.6386667)
      ..cubicTo(size.width * 0.7396667, size.height * 0.6600000, size.width * 0.7153333,
          size.height * 0.6713333, size.width * 0.6870000, size.height * 0.6726667)
      ..cubicTo(size.width * 0.6826667, size.height * 0.6726667, size.width * 0.6803333,
          size.height * 0.6746667, size.width * 0.6803333, size.height * 0.6783333)
      ..lineTo(size.width * 0.6803333, size.height * 0.7230000)
      ..cubicTo(size.width * 0.6803333, size.height * 0.7266667, size.width * 0.6826667,
          size.height * 0.7286667, size.width * 0.6870000, size.height * 0.7286667)
      ..cubicTo(size.width * 0.7160000, size.height * 0.7280000, size.width * 0.7426667,
          size.height * 0.7200000, size.width * 0.7670000, size.height * 0.7050000)
      ..cubicTo(size.width * 0.7913333, size.height * 0.6900000, size.width * 0.8106667,
          size.height * 0.6700000, size.width * 0.8246667, size.height * 0.6450000)
      ..cubicTo(size.width * 0.8386667, size.height * 0.6200000, size.width * 0.8456667,
          size.height * 0.5926667, size.width * 0.8456667, size.height * 0.5636667)
      ..cubicTo(size.width * 0.8456667, size.height * 0.5340000, size.width * 0.8383333,
          size.height * 0.5063333, size.width * 0.8233333, size.height * 0.4813333)
      ..cubicTo(size.width * 0.8086667, size.height * 0.4563333, size.width * 0.7883333,
          size.height * 0.4363333, size.width * 0.7630000, size.height * 0.4220000)
      ..cubicTo(size.width * 0.7376667, size.height * 0.4076667, size.width * 0.7096667,
          size.height * 0.4000000, size.width * 0.6800000, size.height * 0.4000000)
      ..lineTo(size.width * 0.6693333, size.height * 0.4000000)
      ..cubicTo(size.width * 0.6586667, size.height * 0.3553333, size.width * 0.6350000,
          size.height * 0.3190000, size.width * 0.5993333, size.height * 0.2906667)
      ..cubicTo(size.width * 0.5636667, size.height * 0.2623333, size.width * 0.5226667,
          size.height * 0.2480000, size.width * 0.4766667, size.height * 0.2480000)
      ..cubicTo(size.width * 0.4296667, size.height * 0.2480000, size.width * 0.3880000,
          size.height * 0.2626667, size.width * 0.3516667, size.height * 0.2916667)
      ..cubicTo(size.width * 0.3153333, size.height * 0.3206667, size.width * 0.2920000,
          size.height * 0.3580000, size.width * 0.2816667, size.height * 0.4033333)
      ..cubicTo(size.width * 0.2446667, size.height * 0.4120000, size.width * 0.2143333,
          size.height * 0.4310000, size.width * 0.1906667, size.height * 0.4610000)
      ..cubicTo(size.width * 0.1670000, size.height * 0.4910000, size.width * 0.1546667,
          size.height * 0.5250000, size.width * 0.1546667, size.height * 0.5633333)
      ..close()
      ..moveTo(size.width * 0.3363333, size.height * 0.8033333)
      ..cubicTo(size.width * 0.3393333, size.height * 0.8103333, size.width * 0.3446667,
          size.height * 0.8156667, size.width * 0.3516667, size.height * 0.8186667)
      ..cubicTo(size.width * 0.3583333, size.height * 0.8220000, size.width * 0.3653333,
          size.height * 0.8223333, size.width * 0.3723333, size.height * 0.8193333)
      ..cubicTo(size.width * 0.3796667, size.height * 0.8163333, size.width * 0.3843333,
          size.height * 0.8113333, size.width * 0.3873333, size.height * 0.8043333)
      ..cubicTo(size.width * 0.3906667, size.height * 0.7970000, size.width * 0.3910000,
          size.height * 0.7900000, size.width * 0.3880000, size.height * 0.7830000)
      ..cubicTo(size.width * 0.3853333, size.height * 0.7760000, size.width * 0.3800000,
          size.height * 0.7713333, size.width * 0.3730000, size.height * 0.7683333)
      ..cubicTo(size.width * 0.3663333, size.height * 0.7646667, size.width * 0.3596667,
          size.height * 0.7643333, size.width * 0.3526667, size.height * 0.7673333)
      ..cubicTo(size.width * 0.3456667, size.height * 0.7703333, size.width * 0.3406667,
          size.height * 0.7753333, size.width * 0.3373333, size.height * 0.7830000)
      ..cubicTo(size.width * 0.3336667, size.height * 0.7886667, size.width * 0.3336667,
          size.height * 0.7953333, size.width * 0.3363333, size.height * 0.8033333)
      ..close()
      ..moveTo(size.width * 0.3573333, size.height * 0.7093333)
      ..cubicTo(size.width * 0.3573333, size.height * 0.7146667, size.width * 0.3590000,
          size.height * 0.7196667, size.width * 0.3623333, size.height * 0.7243333)
      ..cubicTo(size.width * 0.3656667, size.height * 0.7293333, size.width * 0.3710000,
          size.height * 0.7326667, size.width * 0.3776667, size.height * 0.7350000)
      ..cubicTo(size.width * 0.3840000, size.height * 0.7386667, size.width * 0.3910000,
          size.height * 0.7390000, size.width * 0.3983333, size.height * 0.7353333)
      ..cubicTo(size.width * 0.4056667, size.height * 0.7320000, size.width * 0.4106667,
          size.height * 0.7253333, size.width * 0.4130000, size.height * 0.7153333)
      ..lineTo(size.width * 0.4430000, size.height * 0.6026667)
      ..cubicTo(size.width * 0.4450000, size.height * 0.5943333, size.width * 0.4443333,
          size.height * 0.5870000, size.width * 0.4403333, size.height * 0.5803333)
      ..cubicTo(size.width * 0.4363333, size.height * 0.5736667, size.width * 0.4306667,
          size.height * 0.5696667, size.width * 0.4226667, size.height * 0.5683333)
      ..cubicTo(size.width * 0.4200000, size.height * 0.5676667, size.width * 0.4173333,
          size.height * 0.5673333, size.width * 0.4146667, size.height * 0.5673333)
      ..cubicTo(size.width * 0.4093333, size.height * 0.5673333, size.width * 0.4040000,
          size.height * 0.5690000, size.width * 0.3990000, size.height * 0.5723333)
      ..cubicTo(size.width * 0.3940000, size.height * 0.5756667, size.width * 0.3903333,
          size.height * 0.5806667, size.width * 0.3883333, size.height * 0.5870000)
      ..lineTo(size.width * 0.3590000, size.height * 0.7000000)
      ..cubicTo(size.width * 0.3576667, size.height * 0.7053333, size.width * 0.3573333,
          size.height * 0.7083333, size.width * 0.3573333, size.height * 0.7093333)
      ..close()
      ..moveTo(size.width * 0.4193333, size.height * 0.8956667)
      ..cubicTo(size.width * 0.4193333, size.height * 0.8996667, size.width * 0.4200000,
          size.height * 0.9030000, size.width * 0.4213333, size.height * 0.9053333)
      ..cubicTo(size.width * 0.4243333, size.height * 0.9126667, size.width * 0.4293333,
          size.height * 0.9176667, size.width * 0.4363333, size.height * 0.9203333)
      ..cubicTo(size.width * 0.4393333, size.height * 0.9220000, size.width * 0.4430000,
          size.height * 0.9230000, size.width * 0.4473333, size.height * 0.9230000)
      ..cubicTo(size.width * 0.4493333, size.height * 0.9230000, size.width * 0.4526667,
          size.height * 0.9223333, size.width * 0.4573333, size.height * 0.9210000)
      ..cubicTo(size.width * 0.4646667, size.height * 0.9183333, size.width * 0.4700000,
          size.height * 0.9133333, size.width * 0.4730000, size.height * 0.9060000)
      ..cubicTo(size.width * 0.4763333, size.height * 0.8986667, size.width * 0.4763333,
          size.height * 0.8913333, size.width * 0.4730000, size.height * 0.8840000)
      ..cubicTo(size.width * 0.4696667, size.height * 0.8766667, size.width * 0.4646667,
          size.height * 0.8716667, size.width * 0.4580000, size.height * 0.8686667)
      ..cubicTo(size.width * 0.4513333, size.height * 0.8656667, size.width * 0.4446667,
          size.height * 0.8656667, size.width * 0.4373333, size.height * 0.8686667)
      ..cubicTo(size.width * 0.4310000, size.height * 0.8713333, size.width * 0.4266667,
          size.height * 0.8753333, size.width * 0.4236667, size.height * 0.8806667)
      ..cubicTo(size.width * 0.4206667, size.height * 0.8860000, size.width * 0.4193333,
          size.height * 0.8910000, size.width * 0.4193333, size.height * 0.8956667)
      ..close()
      ..moveTo(size.width * 0.4436667, size.height * 0.8086667)
      ..cubicTo(size.width * 0.4436667, size.height * 0.8210000, size.width * 0.4506667,
          size.height * 0.8290000, size.width * 0.4646667, size.height * 0.8330000)
      ..cubicTo(size.width * 0.4683333, size.height * 0.8340000, size.width * 0.4710000,
          size.height * 0.8343333, size.width * 0.4726667, size.height * 0.8343333)
      ..cubicTo(size.width * 0.4776667, size.height * 0.8343333, size.width * 0.4820000,
          size.height * 0.8333333, size.width * 0.4853333, size.height * 0.8316667)
      ..cubicTo(size.width * 0.4923333, size.height * 0.8290000, size.width * 0.4970000,
          size.height * 0.8226667, size.width * 0.4993333, size.height * 0.8126667)
      ..lineTo(size.width * 0.5550000, size.height * 0.6030000)
      ..cubicTo(size.width * 0.5570000, size.height * 0.5950000, size.width * 0.5563333,
          size.height * 0.5880000, size.width * 0.5530000, size.height * 0.5813333)
      ..cubicTo(size.width * 0.5496667, size.height * 0.5750000, size.width * 0.5440000,
          size.height * 0.5706667, size.width * 0.5366667, size.height * 0.5686667)
      ..cubicTo(size.width * 0.5340000, size.height * 0.5680000, size.width * 0.5310000,
          size.height * 0.5676667, size.width * 0.5276667, size.height * 0.5676667)
      ..cubicTo(size.width * 0.5223333, size.height * 0.5676667, size.width * 0.5170000,
          size.height * 0.5693333, size.width * 0.5116667, size.height * 0.5726667)
      ..cubicTo(size.width * 0.5063333, size.height * 0.5760000, size.width * 0.5030000,
          size.height * 0.5810000, size.width * 0.5016667, size.height * 0.5873333)
      ..lineTo(size.width * 0.4446667, size.height * 0.7986667)
      ..cubicTo(size.width * 0.4440000, size.height * 0.8033333, size.width * 0.4436667,
          size.height * 0.8066667, size.width * 0.4436667, size.height * 0.8086667)
      ..close()
      ..moveTo(size.width * 0.5580000, size.height * 0.7933333)
      ..cubicTo(size.width * 0.5580000, size.height * 0.7973333, size.width * 0.5586667,
          size.height * 0.8010000, size.width * 0.5606667, size.height * 0.8040000)
      ..cubicTo(size.width * 0.5633333, size.height * 0.8103333, size.width * 0.5683333,
          size.height * 0.8153333, size.width * 0.5753333, size.height * 0.8186667)
      ..cubicTo(size.width * 0.5790000, size.height * 0.8200000, size.width * 0.5830000,
          size.height * 0.8210000, size.width * 0.5870000, size.height * 0.8210000)
      ..cubicTo(size.width * 0.5890000, size.height * 0.8210000, size.width * 0.5923333,
          size.height * 0.8203333, size.width * 0.5970000, size.height * 0.8190000)
      ..cubicTo(size.width * 0.6040000, size.height * 0.8163333, size.width * 0.6093333,
          size.height * 0.8113333, size.width * 0.6123333, size.height * 0.8043333)
      ..cubicTo(size.width * 0.6146667, size.height * 0.7970000, size.width * 0.6146667,
          size.height * 0.7900000, size.width * 0.6120000, size.height * 0.7833333)
      ..cubicTo(size.width * 0.6093333, size.height * 0.7766667, size.width * 0.6046667,
          size.height * 0.7716667, size.width * 0.5980000, size.height * 0.7683333)
      ..cubicTo(size.width * 0.5903333, size.height * 0.7646667, size.width * 0.5833333,
          size.height * 0.7643333, size.width * 0.5763333, size.height * 0.7673333)
      ..cubicTo(size.width * 0.5693333, size.height * 0.7703333, size.width * 0.5643333,
          size.height * 0.7753333, size.width * 0.5610000, size.height * 0.7830000)
      ..cubicTo(size.width * 0.5590000, size.height * 0.7863333, size.width * 0.5580000,
          size.height * 0.7896667, size.width * 0.5580000, size.height * 0.7933333)
      ..close()
      ..moveTo(size.width * 0.5823333, size.height * 0.7076667)
      ..cubicTo(size.width * 0.5823333, size.height * 0.7123333, size.width * 0.5840000,
          size.height * 0.7173333, size.width * 0.5876667, size.height * 0.7226667)
      ..cubicTo(size.width * 0.5913333, size.height * 0.7280000, size.width * 0.5963333,
          size.height * 0.7316667, size.width * 0.6026667, size.height * 0.7336667)
      ..cubicTo(size.width * 0.6080000, size.height * 0.7346667, size.width * 0.6110000,
          size.height * 0.7353333, size.width * 0.6116667, size.height * 0.7353333)
      ..cubicTo(size.width * 0.6146667, size.height * 0.7353333, size.width * 0.6190000,
          size.height * 0.7343333, size.width * 0.6240000, size.height * 0.7320000)
      ..cubicTo(size.width * 0.6306667, size.height * 0.7290000, size.width * 0.6350000,
          size.height * 0.7230000, size.width * 0.6373333, size.height * 0.7146667)
      ..lineTo(size.width * 0.6673333, size.height * 0.6033333)
      ..cubicTo(size.width * 0.6680000, size.height * 0.5976667, size.width * 0.6683333,
          size.height * 0.5946667, size.width * 0.6683333, size.height * 0.5946667)
      ..cubicTo(size.width * 0.6683333, size.height * 0.5893333, size.width * 0.6666667,
          size.height * 0.5843333, size.width * 0.6633333, size.height * 0.5793333)
      ..cubicTo(size.width * 0.6600000, size.height * 0.5743333, size.width * 0.6550000,
          size.height * 0.5710000, size.width * 0.6483333, size.height * 0.5690000)
      ..cubicTo(size.width * 0.6453333, size.height * 0.5683333, size.width * 0.6423333,
          size.height * 0.5680000, size.width * 0.6396667, size.height * 0.5680000)
      ..cubicTo(size.width * 0.6343333, size.height * 0.5680000, size.width * 0.6290000,
          size.height * 0.5696667, size.width * 0.6240000, size.height * 0.5730000)
      ..cubicTo(size.width * 0.6190000, size.height * 0.5763333, size.width * 0.6156667,
          size.height * 0.5813333, size.width * 0.6136667, size.height * 0.5880000)
      ..lineTo(size.width * 0.5836667, size.height * 0.7000000)
      ..lineTo(size.width * 0.5823333, size.height * 0.7076667)
      ..close();
  }

  Path _hotPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1380000, size.height * 0.4920000)
      ..cubicTo(size.width * 0.1380000, size.height * 0.4840000, size.width * 0.1410000,
          size.height * 0.4773333, size.width * 0.1470000, size.height * 0.4716667)
      ..cubicTo(size.width * 0.1526667, size.height * 0.4660000, size.width * 0.1596667,
          size.height * 0.4633333, size.width * 0.1676667, size.height * 0.4633333)
      ..lineTo(size.width * 0.2363333, size.height * 0.4633333)
      ..cubicTo(size.width * 0.2443333, size.height * 0.4633333, size.width * 0.2510000,
          size.height * 0.4660000, size.width * 0.2563333, size.height * 0.4716667)
      ..cubicTo(size.width * 0.2620000, size.height * 0.4773333, size.width * 0.2646667,
          size.height * 0.4840000, size.width * 0.2646667, size.height * 0.4920000)
      ..cubicTo(size.width * 0.2646667, size.height * 0.5003333, size.width * 0.2620000,
          size.height * 0.5073333, size.width * 0.2563333, size.height * 0.5130000)
      ..cubicTo(size.width * 0.2506667, size.height * 0.5186667, size.width * 0.2440000,
          size.height * 0.5213333, size.width * 0.2363333, size.height * 0.5213333)
      ..lineTo(size.width * 0.1676667, size.height * 0.5213333)
      ..cubicTo(size.width * 0.1593333, size.height * 0.5213333, size.width * 0.1523333,
          size.height * 0.5186667, size.width * 0.1466667, size.height * 0.5130000)
      ..cubicTo(size.width * 0.1406667, size.height * 0.5073333, size.width * 0.1380000,
          size.height * 0.5003333, size.width * 0.1380000, size.height * 0.4920000)
      ..close()
      ..moveTo(size.width * 0.2353333, size.height * 0.2580000)
      ..cubicTo(size.width * 0.2353333, size.height * 0.2503333, size.width * 0.2380000,
          size.height * 0.2433333, size.width * 0.2433333, size.height * 0.2373333)
      ..cubicTo(size.width * 0.2500000, size.height * 0.2320000, size.width * 0.2570000,
          size.height * 0.2290000, size.width * 0.2653333, size.height * 0.2290000)
      ..cubicTo(size.width * 0.2723333, size.height * 0.2290000, size.width * 0.2790000,
          size.height * 0.2316667, size.width * 0.2850000, size.height * 0.2373333)
      ..lineTo(size.width * 0.3333333, size.height * 0.2866667)
      ..cubicTo(size.width * 0.3390000, size.height * 0.2920000, size.width * 0.3416667,
          size.height * 0.2986667, size.width * 0.3416667, size.height * 0.3066667)
      ..cubicTo(size.width * 0.3416667, size.height * 0.3146667, size.width * 0.3390000,
          size.height * 0.3213333, size.width * 0.3333333, size.height * 0.3266667)
      ..cubicTo(size.width * 0.3276667, size.height * 0.3323333, size.width * 0.3213333,
          size.height * 0.3350000, size.width * 0.3133333, size.height * 0.3350000)
      ..cubicTo(size.width * 0.3046667, size.height * 0.3350000, size.width * 0.2980000,
          size.height * 0.3323333, size.width * 0.2930000, size.height * 0.3266667)
      ..lineTo(size.width * 0.2430000, size.height * 0.2786667)
      ..cubicTo(size.width * 0.2383333, size.height * 0.2730000, size.width * 0.2353333,
          size.height * 0.2660000, size.width * 0.2353333, size.height * 0.2580000)
      ..close()
      ..moveTo(size.width * 0.3223333, size.height * 0.4920000)
      ..cubicTo(size.width * 0.3223333, size.height * 0.4683333, size.width * 0.3270000,
          size.height * 0.4456667, size.width * 0.3366667, size.height * 0.4240000)
      ..cubicTo(size.width * 0.3460000, size.height * 0.4023333, size.width * 0.3590000,
          size.height * 0.3833333, size.width * 0.3746667, size.height * 0.3676667)
      ..cubicTo(size.width * 0.3906667, size.height * 0.3520000, size.width * 0.4096667,
          size.height * 0.3393333, size.width * 0.4313333, size.height * 0.3300000)
      ..cubicTo(size.width * 0.4530000, size.height * 0.3206667, size.width * 0.4760000,
          size.height * 0.3156667, size.width * 0.5000000, size.height * 0.3156667)
      ..cubicTo(size.width * 0.5320000, size.height * 0.3156667, size.width * 0.5613333,
          size.height * 0.3236667, size.width * 0.5886667, size.height * 0.3396667)
      ..cubicTo(size.width * 0.6160000, size.height * 0.3556667, size.width * 0.6376667,
          size.height * 0.3770000, size.width * 0.6533333, size.height * 0.4043333)
      ..cubicTo(size.width * 0.6690000, size.height * 0.4313333, size.width * 0.6770000,
          size.height * 0.4606667, size.width * 0.6770000, size.height * 0.4920000)
      ..cubicTo(size.width * 0.6770000, size.height * 0.4970000, size.width * 0.6766667,
          size.height * 0.5016667, size.width * 0.6760000, size.height * 0.5060000)
      ..cubicTo(size.width * 0.6666667, size.height * 0.5003333, size.width * 0.6560000,
          size.height * 0.4976667, size.width * 0.6436667, size.height * 0.4976667)
      ..cubicTo(size.width * 0.6356667, size.height * 0.4976667, size.width * 0.6276667,
          size.height * 0.4993333, size.width * 0.6196667, size.height * 0.5026667)
      ..cubicTo(size.width * 0.6200000, size.height * 0.5003333, size.width * 0.6200000,
          size.height * 0.4966667, size.width * 0.6200000, size.height * 0.4920000)
      ..cubicTo(size.width * 0.6200000, size.height * 0.4593333, size.width * 0.6083333,
          size.height * 0.4316667, size.width * 0.5846667, size.height * 0.4086667)
      ..cubicTo(size.width * 0.5610000, size.height * 0.3856667, size.width * 0.5326667,
          size.height * 0.3740000, size.width * 0.4996667, size.height * 0.3740000)
      ..cubicTo(size.width * 0.4666667, size.height * 0.3740000, size.width * 0.4386667,
          size.height * 0.3856667, size.width * 0.4150000, size.height * 0.4086667)
      ..cubicTo(size.width * 0.3913333, size.height * 0.4316667, size.width * 0.3800000,
          size.height * 0.4593333, size.width * 0.3800000, size.height * 0.4920000)
      ..lineTo(size.width * 0.3800000, size.height * 0.4980000)
      ..cubicTo(size.width * 0.3703333, size.height * 0.4986667, size.width * 0.3610000,
          size.height * 0.5013333, size.width * 0.3520000, size.height * 0.5063333)
      ..cubicTo(size.width * 0.3516667, size.height * 0.5066667, size.width * 0.3506667,
          size.height * 0.5073333, size.width * 0.3486667, size.height * 0.5086667)
      ..cubicTo(size.width * 0.3466667, size.height * 0.5100000, size.width * 0.3446667,
          size.height * 0.5116667, size.width * 0.3423333, size.height * 0.5133333)
      ..cubicTo(size.width * 0.3400000, size.height * 0.5150000, size.width * 0.3376667,
          size.height * 0.5170000, size.width * 0.3346667, size.height * 0.5196667)
      ..cubicTo(size.width * 0.3316667, size.height * 0.5223333, size.width * 0.3286667,
          size.height * 0.5250000, size.width * 0.3260000, size.height * 0.5276667)
      ..cubicTo(size.width * 0.3233333, size.height * 0.5170000, size.width * 0.3223333,
          size.height * 0.5050000, size.width * 0.3223333, size.height * 0.4920000)
      ..close()
      ..moveTo(size.width * 0.3233333, size.height * 0.6136667)
      ..lineTo(size.width * 0.3233333, size.height * 0.6086667)
      ..cubicTo(size.width * 0.3230000, size.height * 0.6056667, size.width * 0.3233333,
          size.height * 0.6020000, size.width * 0.3240000, size.height * 0.5976667)
      ..cubicTo(size.width * 0.3256667, size.height * 0.5856667, size.width * 0.3303333,
          size.height * 0.5743333, size.width * 0.3380000, size.height * 0.5636667)
      ..cubicTo(size.width * 0.3423333, size.height * 0.5583333, size.width * 0.3453333,
          size.height * 0.5546667, size.width * 0.3470000, size.height * 0.5533333)
      ..cubicTo(size.width * 0.3473333, size.height * 0.5526667, size.width * 0.3476667,
          size.height * 0.5520000, size.width * 0.3483333, size.height * 0.5513333)
      ..lineTo(size.width * 0.3496667, size.height * 0.5500000)
      ..cubicTo(size.width * 0.3506667, size.height * 0.5496667, size.width * 0.3520000,
          size.height * 0.5483333, size.width * 0.3536667, size.height * 0.5466667)
      ..cubicTo(size.width * 0.3543333, size.height * 0.5460000, size.width * 0.3553333,
          size.height * 0.5450000, size.width * 0.3563333, size.height * 0.5440000)
      ..cubicTo(size.width * 0.3573333, size.height * 0.5430000, size.width * 0.3583333,
          size.height * 0.5426667, size.width * 0.3586667, size.height * 0.5420000)
      ..cubicTo(size.width * 0.3603333, size.height * 0.5403333, size.width * 0.3620000,
          size.height * 0.5393333, size.width * 0.3633333, size.height * 0.5386667)
      ..lineTo(size.width * 0.3690000, size.height * 0.5350000)
      ..cubicTo(size.width * 0.3736667, size.height * 0.5320000, size.width * 0.3793333,
          size.height * 0.5303333, size.width * 0.3856667, size.height * 0.5303333)
      ..lineTo(size.width * 0.3866667, size.height * 0.5303333)
      ..cubicTo(size.width * 0.3900000, size.height * 0.5303333, size.width * 0.3930000,
          size.height * 0.5306667, size.width * 0.3953333, size.height * 0.5313333)
      ..cubicTo(size.width * 0.3963333, size.height * 0.5316667, size.width * 0.3976667,
          size.height * 0.5323333, size.width * 0.3996667, size.height * 0.5336667)
      ..lineTo(size.width * 0.3996667, size.height * 0.5340000)
      ..cubicTo(size.width * 0.4043333, size.height * 0.5360000, size.width * 0.4083333,
          size.height * 0.5393333, size.width * 0.4110000, size.height * 0.5436667)
      ..cubicTo(size.width * 0.4136667, size.height * 0.5480000, size.width * 0.4153333,
          size.height * 0.5526667, size.width * 0.4153333, size.height * 0.5576667)
      ..cubicTo(size.width * 0.4153333, size.height * 0.5633333, size.width * 0.4136667,
          size.height * 0.5680000, size.width * 0.4106667, size.height * 0.5716667)
      ..cubicTo(size.width * 0.4086667, size.height * 0.5746667, size.width * 0.4060000,
          size.height * 0.5773333, size.width * 0.4033333, size.height * 0.5793333)
      ..cubicTo(size.width * 0.4026667, size.height * 0.5796667, size.width * 0.4020000,
          size.height * 0.5800000, size.width * 0.4013333, size.height * 0.5803333)
      ..cubicTo(size.width * 0.4006667, size.height * 0.5806667, size.width * 0.4000000,
          size.height * 0.5810000, size.width * 0.4000000, size.height * 0.5810000)
      ..lineTo(size.width * 0.3980000, size.height * 0.5823333)
      ..cubicTo(size.width * 0.3966667, size.height * 0.5833333, size.width * 0.3956667,
          size.height * 0.5843333, size.width * 0.3946667, size.height * 0.5850000)
      ..cubicTo(size.width * 0.3936667, size.height * 0.5856667, size.width * 0.3926667,
          size.height * 0.5870000, size.width * 0.3910000, size.height * 0.5886667)
      ..cubicTo(size.width * 0.3896667, size.height * 0.5903333, size.width * 0.3883333,
          size.height * 0.5916667, size.width * 0.3873333, size.height * 0.5933333)
      ..cubicTo(size.width * 0.3863333, size.height * 0.5946667, size.width * 0.3853333,
          size.height * 0.5966667, size.width * 0.3843333, size.height * 0.5983333)
      ..cubicTo(size.width * 0.3833333, size.height * 0.6003333, size.width * 0.3826667,
          size.height * 0.6023333, size.width * 0.3826667, size.height * 0.6040000)
      ..lineTo(size.width * 0.3826667, size.height * 0.6090000)
      ..cubicTo(size.width * 0.3840000, size.height * 0.6140000, size.width * 0.3853333,
          size.height * 0.6180000, size.width * 0.3863333, size.height * 0.6210000)
      ..cubicTo(size.width * 0.3886667, size.height * 0.6256667, size.width * 0.3923333,
          size.height * 0.6303333, size.width * 0.3976667, size.height * 0.6356667)
      ..cubicTo(size.width * 0.3980000, size.height * 0.6363333, size.width * 0.4006667,
          size.height * 0.6390000, size.width * 0.4056667, size.height * 0.6440000)
      ..cubicTo(size.width * 0.4343333, size.height * 0.6700000, size.width * 0.4480000,
          size.height * 0.6980000, size.width * 0.4460000, size.height * 0.7273333)
      ..cubicTo(size.width * 0.4453333, size.height * 0.7373333, size.width * 0.4430000,
          size.height * 0.7470000, size.width * 0.4390000, size.height * 0.7563333)
      ..cubicTo(size.width * 0.4350000, size.height * 0.7656667, size.width * 0.4303333,
          size.height * 0.7733333, size.width * 0.4246667, size.height * 0.7796667)
      ..cubicTo(size.width * 0.4193333, size.height * 0.7860000, size.width * 0.4150000,
          size.height * 0.7906667, size.width * 0.4116667, size.height * 0.7940000)
      ..cubicTo(size.width * 0.4083333, size.height * 0.7970000, size.width * 0.4056667,
          size.height * 0.7993333, size.width * 0.4033333, size.height * 0.8010000)
      ..cubicTo(size.width * 0.4030000, size.height * 0.8013333, size.width * 0.4023333,
          size.height * 0.8016667, size.width * 0.4013333, size.height * 0.8023333)
      ..cubicTo(size.width * 0.4003333, size.height * 0.8030000, size.width * 0.3993333,
          size.height * 0.8036667, size.width * 0.3990000, size.height * 0.8036667)
      ..cubicTo(size.width * 0.3963333, size.height * 0.8050000, size.width * 0.3940000,
          size.height * 0.8056667, size.width * 0.3916667, size.height * 0.8060000)
      ..cubicTo(size.width * 0.3886667, size.height * 0.8063333, size.width * 0.3866667,
          size.height * 0.8066667, size.width * 0.3850000, size.height * 0.8066667)
      ..cubicTo(size.width * 0.3750000, size.height * 0.8066667, size.width * 0.3670000,
          size.height * 0.8033333, size.width * 0.3613333, size.height * 0.7966667)
      ..cubicTo(size.width * 0.3566667, size.height * 0.7910000, size.width * 0.3546667,
          size.height * 0.7843333, size.width * 0.3553333, size.height * 0.7770000)
      ..cubicTo(size.width * 0.3560000, size.height * 0.7696667, size.width * 0.3596667,
          size.height * 0.7636667, size.width * 0.3663333, size.height * 0.7593333)
      ..lineTo(size.width * 0.3666667, size.height * 0.7583333)
      ..cubicTo(size.width * 0.3670000, size.height * 0.7580000, size.width * 0.3676667,
          size.height * 0.7573333, size.width * 0.3683333, size.height * 0.7570000)
      ..cubicTo(size.width * 0.3690000, size.height * 0.7563333, size.width * 0.3696667,
          size.height * 0.7556667, size.width * 0.3706667, size.height * 0.7550000)
      ..cubicTo(size.width * 0.3716667, size.height * 0.7543333, size.width * 0.3726667,
          size.height * 0.7533333, size.width * 0.3733333, size.height * 0.7523333)
      ..cubicTo(size.width * 0.3743333, size.height * 0.7513333, size.width * 0.3753333,
          size.height * 0.7500000, size.width * 0.3760000, size.height * 0.7490000)
      ..cubicTo(size.width * 0.3770000, size.height * 0.7476667, size.width * 0.3780000,
          size.height * 0.7463333, size.width * 0.3786667, size.height * 0.7450000)
      ..cubicTo(size.width * 0.3796667, size.height * 0.7436667, size.width * 0.3806667,
          size.height * 0.7420000, size.width * 0.3813333, size.height * 0.7403333)
      ..cubicTo(size.width * 0.3823333, size.height * 0.7386667, size.width * 0.3830000,
          size.height * 0.7370000, size.width * 0.3836667, size.height * 0.7353333)
      ..cubicTo(size.width * 0.3843333, size.height * 0.7336667, size.width * 0.3846667,
          size.height * 0.7320000, size.width * 0.3853333, size.height * 0.7300000)
      ..cubicTo(size.width * 0.3856667, size.height * 0.7280000, size.width * 0.3860000,
          size.height * 0.7260000, size.width * 0.3860000, size.height * 0.7243333)
      ..cubicTo(size.width * 0.3866667, size.height * 0.7176667, size.width * 0.3850000,
          size.height * 0.7110000, size.width * 0.3810000, size.height * 0.7043333)
      ..cubicTo(size.width * 0.3793333, size.height * 0.7006667, size.width * 0.3770000,
          size.height * 0.6970000, size.width * 0.3736667, size.height * 0.6933333)
      ..cubicTo(size.width * 0.3713333, size.height * 0.6906667, size.width * 0.3696667,
          size.height * 0.6890000, size.width * 0.3686667, size.height * 0.6880000)
      ..cubicTo(size.width * 0.3656667, size.height * 0.6843333, size.width * 0.3640000,
          size.height * 0.6823333, size.width * 0.3636667, size.height * 0.6820000)
      ..cubicTo(size.width * 0.3630000, size.height * 0.6816667, size.width * 0.3623333,
          size.height * 0.6810000, size.width * 0.3613333, size.height * 0.6800000)
      ..cubicTo(size.width * 0.3603333, size.height * 0.6790000, size.width * 0.3596667,
          size.height * 0.6786667, size.width * 0.3593333, size.height * 0.6783333)
      ..cubicTo(size.width * 0.3543333, size.height * 0.6736667, size.width * 0.3506667,
          size.height * 0.6696667, size.width * 0.3480000, size.height * 0.6663333)
      ..cubicTo(size.width * 0.3440000, size.height * 0.6610000, size.width * 0.3410000,
          size.height * 0.6576667, size.width * 0.3400000, size.height * 0.6556667)
      ..cubicTo(size.width * 0.3336667, size.height * 0.6470000, size.width * 0.3293333,
          size.height * 0.6383333, size.width * 0.3270000, size.height * 0.6296667)
      ..cubicTo(size.width * 0.3256667, size.height * 0.6250000, size.width * 0.3246667,
          size.height * 0.6213333, size.width * 0.3243333, size.height * 0.6190000)
      ..cubicTo(size.width * 0.3243333, size.height * 0.6183333, size.width * 0.3240000,
          size.height * 0.6173333, size.width * 0.3236667, size.height * 0.6163333)
      ..cubicTo(size.width * 0.3233333, size.height * 0.6153333, size.width * 0.3233333,
          size.height * 0.6146667, size.width * 0.3233333, size.height * 0.6136667)
      ..close()
      ..moveTo(size.width * 0.4526667, size.height * 0.6026667)
      ..cubicTo(size.width * 0.4526667, size.height * 0.6006667, size.width * 0.4526667,
          size.height * 0.5993333, size.width * 0.4530000, size.height * 0.5980000)
      ..cubicTo(size.width * 0.4536667, size.height * 0.5906667, size.width * 0.4560000,
          size.height * 0.5836667, size.width * 0.4596667, size.height * 0.5766667)
      ..cubicTo(size.width * 0.4633333, size.height * 0.5696667, size.width * 0.4670000,
          size.height * 0.5636667, size.width * 0.4713333, size.height * 0.5590000)
      ..cubicTo(size.width * 0.4756667, size.height * 0.5543333, size.width * 0.4796667,
          size.height * 0.5500000, size.width * 0.4840000, size.height * 0.5463333)
      ..cubicTo(size.width * 0.4883333, size.height * 0.5426667, size.width * 0.4916667,
          size.height * 0.5400000, size.width * 0.4943333, size.height * 0.5380000)
      ..lineTo(size.width * 0.4983333, size.height * 0.5356667)
      ..cubicTo(size.width * 0.5033333, size.height * 0.5326667, size.width * 0.5090000,
          size.height * 0.5310000, size.width * 0.5150000, size.height * 0.5310000)
      ..cubicTo(size.width * 0.5186667, size.height * 0.5310000, size.width * 0.5220000,
          size.height * 0.5313333, size.width * 0.5250000, size.height * 0.5320000)
      ..cubicTo(size.width * 0.5253333, size.height * 0.5320000, size.width * 0.5256667,
          size.height * 0.5323333, size.width * 0.5266667, size.height * 0.5326667)
      ..cubicTo(size.width * 0.5276667, size.height * 0.5333333, size.width * 0.5283333,
          size.height * 0.5336667, size.width * 0.5286667, size.height * 0.5340000)
      ..cubicTo(size.width * 0.5290000, size.height * 0.5340000, size.width * 0.5293333,
          size.height * 0.5340000, size.width * 0.5296667, size.height * 0.5343333)
      ..cubicTo(size.width * 0.5300000, size.height * 0.5343333, size.width * 0.5306667,
          size.height * 0.5350000, size.width * 0.5320000, size.height * 0.5360000)
      ..cubicTo(size.width * 0.5386667, size.height * 0.5400000, size.width * 0.5426667,
          size.height * 0.5460000, size.width * 0.5446667, size.height * 0.5540000)
      ..cubicTo(size.width * 0.5446667, size.height * 0.5546667, size.width * 0.5446667,
          size.height * 0.5553333, size.width * 0.5446667, size.height * 0.5563333)
      ..cubicTo(size.width * 0.5446667, size.height * 0.5570000, size.width * 0.5446667,
          size.height * 0.5576667, size.width * 0.5446667, size.height * 0.5580000)
      ..cubicTo(size.width * 0.5446667, size.height * 0.5590000, size.width * 0.5443333,
          size.height * 0.5603333, size.width * 0.5440000, size.height * 0.5620000)
      ..cubicTo(size.width * 0.5436667, size.height * 0.5636667, size.width * 0.5433333,
          size.height * 0.5646667, size.width * 0.5433333, size.height * 0.5650000)
      ..cubicTo(size.width * 0.5410000, size.height * 0.5726667, size.width * 0.5363333,
          size.height * 0.5780000, size.width * 0.5293333, size.height * 0.5816667)
      ..cubicTo(size.width * 0.5183333, size.height * 0.5890000, size.width * 0.5123333,
          size.height * 0.5966667, size.width * 0.5116667, size.height * 0.6046667)
      ..cubicTo(size.width * 0.5113333, size.height * 0.6073333, size.width * 0.5113333,
          size.height * 0.6096667, size.width * 0.5116667, size.height * 0.6120000)
      ..cubicTo(size.width * 0.5123333, size.height * 0.6160000, size.width * 0.5143333,
          size.height * 0.6203333, size.width * 0.5173333, size.height * 0.6250000)
      ..cubicTo(size.width * 0.5210000, size.height * 0.6303333, size.width * 0.5236667,
          size.height * 0.6340000, size.width * 0.5253333, size.height * 0.6356667)
      ..cubicTo(size.width * 0.5306667, size.height * 0.6410000, size.width * 0.5336667,
          size.height * 0.6440000, size.width * 0.5346667, size.height * 0.6446667)
      ..cubicTo(size.width * 0.5386667, size.height * 0.6483333, size.width * 0.5440000,
          size.height * 0.6540000, size.width * 0.5503333, size.height * 0.6616667)
      ..cubicTo(size.width * 0.5683333, size.height * 0.6833333, size.width * 0.5766667,
          size.height * 0.7056667, size.width * 0.5750000, size.height * 0.7283333)
      ..cubicTo(size.width * 0.5743333, size.height * 0.7383333, size.width * 0.5720000,
          size.height * 0.7480000, size.width * 0.5680000, size.height * 0.7573333)
      ..cubicTo(size.width * 0.5640000, size.height * 0.7666667, size.width * 0.5593333,
          size.height * 0.7743333, size.width * 0.5536667, size.height * 0.7806667)
      ..cubicTo(size.width * 0.5483333, size.height * 0.7866667, size.width * 0.5436667,
          size.height * 0.7916667, size.width * 0.5403333, size.height * 0.7950000)
      ..cubicTo(size.width * 0.5366667, size.height * 0.7983333, size.width * 0.5340000,
          size.height * 0.8006667, size.width * 0.5320000, size.height * 0.8020000)
      ..lineTo(size.width * 0.5280000, size.height * 0.8046667)
      ..cubicTo(size.width * 0.5243333, size.height * 0.8060000, size.width * 0.5223333,
          size.height * 0.8066667, size.width * 0.5210000, size.height * 0.8070000)
      ..cubicTo(size.width * 0.5173333, size.height * 0.8073333, size.width * 0.5150000,
          size.height * 0.8076667, size.width * 0.5143333, size.height * 0.8076667)
      ..lineTo(size.width * 0.5133333, size.height * 0.8076667)
      ..cubicTo(size.width * 0.5106667, size.height * 0.8076667, size.width * 0.5086667,
          size.height * 0.8073333, size.width * 0.5070000, size.height * 0.8070000)
      ..cubicTo(size.width * 0.5063333, size.height * 0.8070000, size.width * 0.5053333,
          size.height * 0.8070000, size.width * 0.5043333, size.height * 0.8066667)
      ..cubicTo(size.width * 0.5033333, size.height * 0.8063333, size.width * 0.5023333,
          size.height * 0.8063333, size.width * 0.5020000, size.height * 0.8063333)
      ..cubicTo(size.width * 0.5016667, size.height * 0.8063333, size.width * 0.5013333,
          size.height * 0.8063333, size.width * 0.5010000, size.height * 0.8060000)
      ..cubicTo(size.width * 0.5006667, size.height * 0.8056667, size.width * 0.5003333,
          size.height * 0.8056667, size.width * 0.4996667, size.height * 0.8053333)
      ..cubicTo(size.width * 0.4993333, size.height * 0.8050000, size.width * 0.4990000,
          size.height * 0.8050000, size.width * 0.4986667, size.height * 0.8050000)
      ..cubicTo(size.width * 0.4936667, size.height * 0.8013333, size.width * 0.4906667,
          size.height * 0.7993333, size.width * 0.4900000, size.height * 0.7980000)
      ..cubicTo(size.width * 0.4846667, size.height * 0.7920000, size.width * 0.4826667,
          size.height * 0.7853333, size.width * 0.4836667, size.height * 0.7780000)
      ..cubicTo(size.width * 0.4846667, size.height * 0.7706667, size.width * 0.4883333,
          size.height * 0.7650000, size.width * 0.4950000, size.height * 0.7603333)
      ..lineTo(size.width * 0.4960000, size.height * 0.7590000)
      ..cubicTo(size.width * 0.4966667, size.height * 0.7583333, size.width * 0.4976667,
          size.height * 0.7573333, size.width * 0.4990000, size.height * 0.7563333)
      ..lineTo(size.width * 0.5030000, size.height * 0.7523333)
      ..lineTo(size.width * 0.5073333, size.height * 0.7470000)
      ..lineTo(size.width * 0.5113333, size.height * 0.7406667)
      ..lineTo(size.width * 0.5143333, size.height * 0.7333333)
      ..lineTo(size.width * 0.5156667, size.height * 0.7253333)
      ..cubicTo(size.width * 0.5160000, size.height * 0.7120000, size.width * 0.5083333,
          size.height * 0.6980000, size.width * 0.4926667, size.height * 0.6830000)
      ..cubicTo(size.width * 0.4863333, size.height * 0.6773333, size.width * 0.4816667,
          size.height * 0.6726667, size.width * 0.4780000, size.height * 0.6686667)
      ..cubicTo(size.width * 0.4596667, size.height * 0.6456667, size.width * 0.4513333,
          size.height * 0.6240000, size.width * 0.4526667, size.height * 0.6026667)
      ..close()
      ..moveTo(size.width * 0.4706667, size.height * 0.2306667)
      ..lineTo(size.width * 0.4706667, size.height * 0.1616667)
      ..cubicTo(size.width * 0.4706667, size.height * 0.1536667, size.width * 0.4736667,
          size.height * 0.1466667, size.width * 0.4793333, size.height * 0.1410000)
      ..cubicTo(size.width * 0.4850000, size.height * 0.1353333, size.width * 0.4920000,
          size.height * 0.1326667, size.width * 0.4996667, size.height * 0.1326667)
      ..cubicTo(size.width * 0.5076667, size.height * 0.1326667, size.width * 0.5146667,
          size.height * 0.1353333, size.width * 0.5203333, size.height * 0.1410000)
      ..cubicTo(size.width * 0.5260000, size.height * 0.1466667, size.width * 0.5286667,
          size.height * 0.1536667, size.width * 0.5286667, size.height * 0.1616667)
      ..lineTo(size.width * 0.5286667, size.height * 0.2306667)
      ..cubicTo(size.width * 0.5286667, size.height * 0.2386667, size.width * 0.5260000,
          size.height * 0.2450000, size.width * 0.5203333, size.height * 0.2503333)
      ..cubicTo(size.width * 0.5146667, size.height * 0.2556667, size.width * 0.5080000,
          size.height * 0.2580000, size.width * 0.5000000, size.height * 0.2580000)
      ..cubicTo(size.width * 0.4920000, size.height * 0.2580000, size.width * 0.4853333,
          size.height * 0.2553333, size.width * 0.4796667, size.height * 0.2503333)
      ..cubicTo(size.width * 0.4736667, size.height * 0.2450000, size.width * 0.4706667,
          size.height * 0.2386667, size.width * 0.4706667, size.height * 0.2306667)
      ..close()
      ..moveTo(size.width * 0.5826667, size.height * 0.5976667)
      ..cubicTo(size.width * 0.5833333, size.height * 0.5903333, size.width * 0.5856667,
          size.height * 0.5833333, size.width * 0.5893333, size.height * 0.5763333)
      ..cubicTo(size.width * 0.5930000, size.height * 0.5693333, size.width * 0.5966667,
          size.height * 0.5633333, size.width * 0.6010000, size.height * 0.5586667)
      ..cubicTo(size.width * 0.6053333, size.height * 0.5540000, size.width * 0.6093333,
          size.height * 0.5496667, size.width * 0.6136667, size.height * 0.5460000)
      ..cubicTo(size.width * 0.6176667, size.height * 0.5423333, size.width * 0.6210000,
          size.height * 0.5396667, size.width * 0.6236667, size.height * 0.5376667)
      ..lineTo(size.width * 0.6280000, size.height * 0.5353333)
      ..cubicTo(size.width * 0.6286667, size.height * 0.5346667, size.width * 0.6300000,
          size.height * 0.5340000, size.width * 0.6313333, size.height * 0.5326667)
      ..cubicTo(size.width * 0.6350000, size.height * 0.5313333, size.width * 0.6393333,
          size.height * 0.5303333, size.width * 0.6440000, size.height * 0.5303333)
      ..cubicTo(size.width * 0.6553333, size.height * 0.5303333, size.width * 0.6636667,
          size.height * 0.5346667, size.width * 0.6696667, size.height * 0.5430000)
      ..cubicTo(size.width * 0.6713333, size.height * 0.5453333, size.width * 0.6723333,
          size.height * 0.5476667, size.width * 0.6730000, size.height * 0.5506667)
      ..cubicTo(size.width * 0.6733333, size.height * 0.5513333, size.width * 0.6736667,
          size.height * 0.5523333, size.width * 0.6736667, size.height * 0.5533333)
      ..lineTo(size.width * 0.6736667, size.height * 0.5570000)
      ..cubicTo(size.width * 0.6736667, size.height * 0.5673333, size.width * 0.6686667,
          size.height * 0.5753333, size.width * 0.6586667, size.height * 0.5803333)
      ..cubicTo(size.width * 0.6480000, size.height * 0.5873333, size.width * 0.6423333,
          size.height * 0.5950000, size.width * 0.6413333, size.height * 0.6033333)
      ..cubicTo(size.width * 0.6400000, size.height * 0.6146667, size.width * 0.6476667,
          size.height * 0.6280000, size.width * 0.6640000, size.height * 0.6433333)
      ..cubicTo(size.width * 0.6933333, size.height * 0.6690000, size.width * 0.7066667,
          size.height * 0.6970000, size.width * 0.7050000, size.height * 0.7266667)
      ..cubicTo(size.width * 0.7043333, size.height * 0.7366667, size.width * 0.7020000,
          size.height * 0.7463333, size.width * 0.6980000, size.height * 0.7556667)
      ..cubicTo(size.width * 0.6940000, size.height * 0.7650000, size.width * 0.6890000,
          size.height * 0.7726667, size.width * 0.6836667, size.height * 0.7790000)
      ..cubicTo(size.width * 0.6780000, size.height * 0.7853333, size.width * 0.6736667,
          size.height * 0.7900000, size.width * 0.6706667, size.height * 0.7933333)
      ..cubicTo(size.width * 0.6676667, size.height * 0.7966667, size.width * 0.6646667,
          size.height * 0.7986667, size.width * 0.6623333, size.height * 0.8003333)
      ..cubicTo(size.width * 0.6570000, size.height * 0.8036667, size.width * 0.6523333,
          size.height * 0.8053333, size.width * 0.6486667, size.height * 0.8056667)
      ..cubicTo(size.width * 0.6476667, size.height * 0.8060000, size.width * 0.6460000,
          size.height * 0.8060000, size.width * 0.6436667, size.height * 0.8060000)
      ..cubicTo(size.width * 0.6336667, size.height * 0.8060000, size.width * 0.6260000,
          size.height * 0.8026667, size.width * 0.6206667, size.height * 0.7960000)
      ..cubicTo(size.width * 0.6156667, size.height * 0.7903333, size.width * 0.6136667,
          size.height * 0.7836667, size.width * 0.6143333, size.height * 0.7763333)
      ..cubicTo(size.width * 0.6150000, size.height * 0.7690000, size.width * 0.6186667,
          size.height * 0.7630000, size.width * 0.6250000, size.height * 0.7586667)
      ..cubicTo(size.width * 0.6260000, size.height * 0.7583333, size.width * 0.6280000,
          size.height * 0.7566667, size.width * 0.6310000, size.height * 0.7540000)
      ..cubicTo(size.width * 0.6340000, size.height * 0.7513333, size.width * 0.6370000,
          size.height * 0.7470000, size.width * 0.6406667, size.height * 0.7413333)
      ..cubicTo(size.width * 0.6440000, size.height * 0.7353333, size.width * 0.6460000,
          size.height * 0.7296667, size.width * 0.6463333, size.height * 0.7236667)
      ..cubicTo(size.width * 0.6470000, size.height * 0.7103333, size.width * 0.6390000,
          size.height * 0.6963333, size.width * 0.6230000, size.height * 0.6813333)
      ..cubicTo(size.width * 0.6093333, size.height * 0.6693333, size.width * 0.5986667,
          size.height * 0.6563333, size.width * 0.5916667, size.height * 0.6426667)
      ..cubicTo(size.width * 0.5836667, size.height * 0.6286667, size.width * 0.5806667,
          size.height * 0.6133333, size.width * 0.5826667, size.height * 0.5976667)
      ..close()
      ..moveTo(size.width * 0.6590000, size.height * 0.3070000)
      ..cubicTo(size.width * 0.6590000, size.height * 0.2986667, size.width * 0.6616667,
          size.height * 0.2920000, size.width * 0.6666667, size.height * 0.2870000)
      ..lineTo(size.width * 0.7153333, size.height * 0.2376667)
      ..cubicTo(size.width * 0.7213333, size.height * 0.2320000, size.width * 0.7280000,
          size.height * 0.2293333, size.width * 0.7356667, size.height * 0.2293333)
      ..cubicTo(size.width * 0.7436667, size.height * 0.2293333, size.width * 0.7503333,
          size.height * 0.2323333, size.width * 0.7560000, size.height * 0.2380000)
      ..cubicTo(size.width * 0.7616667, size.height * 0.2436667, size.width * 0.7646667,
          size.height * 0.2506667, size.width * 0.7646667, size.height * 0.2583333)
      ..cubicTo(size.width * 0.7646667, size.height * 0.2666667, size.width * 0.7616667,
          size.height * 0.2736667, size.width * 0.7560000, size.height * 0.2790000)
      ..lineTo(size.width * 0.7066667, size.height * 0.3270000)
      ..cubicTo(size.width * 0.7006667, size.height * 0.3326667, size.width * 0.6940000,
          size.height * 0.3353333, size.width * 0.6863333, size.height * 0.3353333)
      ..cubicTo(size.width * 0.6786667, size.height * 0.3353333, size.width * 0.6720000,
          size.height * 0.3326667, size.width * 0.6670000, size.height * 0.3270000)
      ..cubicTo(size.width * 0.6616667, size.height * 0.3216667, size.width * 0.6590000,
          size.height * 0.3146667, size.width * 0.6590000, size.height * 0.3070000)
      ..close()
      ..moveTo(size.width * 0.7356667, size.height * 0.4920000)
      ..cubicTo(size.width * 0.7356667, size.height * 0.4846667, size.width * 0.7386667,
          size.height * 0.4780000, size.width * 0.7443333, size.height * 0.4716667)
      ..cubicTo(size.width * 0.7496667, size.height * 0.4660000, size.width * 0.7560000,
          size.height * 0.4633333, size.width * 0.7636667, size.height * 0.4633333)
      ..lineTo(size.width * 0.8323333, size.height * 0.4633333)
      ..cubicTo(size.width * 0.8403333, size.height * 0.4633333, size.width * 0.8473333,
          size.height * 0.4663333, size.width * 0.8530000, size.height * 0.4720000)
      ..cubicTo(size.width * 0.8586667, size.height * 0.4776667, size.width * 0.8620000,
          size.height * 0.4843333, size.width * 0.8620000, size.height * 0.4920000)
      ..cubicTo(size.width * 0.8620000, size.height * 0.5000000, size.width * 0.8590000,
          size.height * 0.5070000, size.width * 0.8533333, size.height * 0.5126667)
      ..cubicTo(size.width * 0.8473333, size.height * 0.5183333, size.width * 0.8406667,
          size.height * 0.5213333, size.width * 0.8323333, size.height * 0.5213333)
      ..lineTo(size.width * 0.7636667, size.height * 0.5213333)
      ..cubicTo(size.width * 0.7556667, size.height * 0.5213333, size.width * 0.7486667,
          size.height * 0.5186667, size.width * 0.7436667, size.height * 0.5130000)
      ..cubicTo(size.width * 0.7383333, size.height * 0.5073333, size.width * 0.7356667,
          size.height * 0.5003333, size.width * 0.7356667, size.height * 0.4920000)
      ..close();
  }

  Path _hurricanePath(Size size) {
    return Path()
      ..moveTo(size.width * 0.3693333, size.height * 0.4843333)
      ..lineTo(size.width * 0.3693333, size.height * 0.4836667)
      ..cubicTo(size.width * 0.3690000, size.height * 0.4810000, size.width * 0.3693333,
          size.height * 0.4770000, size.width * 0.3693333, size.height * 0.4713333)
      ..cubicTo(size.width * 0.3696667, size.height * 0.4660000, size.width * 0.3706667,
          size.height * 0.4570000, size.width * 0.3726667, size.height * 0.4443333)
      ..cubicTo(size.width * 0.3746667, size.height * 0.4316667, size.width * 0.3773333,
          size.height * 0.4190000, size.width * 0.3810000, size.height * 0.4060000)
      ..cubicTo(size.width * 0.3846667, size.height * 0.3930000, size.width * 0.3903333,
          size.height * 0.3780000, size.width * 0.3980000, size.height * 0.3610000)
      ..cubicTo(size.width * 0.4056667, size.height * 0.3440000, size.width * 0.4146667,
          size.height * 0.3280000, size.width * 0.4253333, size.height * 0.3130000)
      ..cubicTo(size.width * 0.4360000, size.height * 0.2980000, size.width * 0.4500000,
          size.height * 0.2823333, size.width * 0.4673333, size.height * 0.2666667)
      ..cubicTo(size.width * 0.4846667, size.height * 0.2510000, size.width * 0.5040000,
          size.height * 0.2370000, size.width * 0.5250000, size.height * 0.2253333)
      ..cubicTo(size.width * 0.5303333, size.height * 0.2223333, size.width * 0.5356667,
          size.height * 0.2216667, size.width * 0.5413333, size.height * 0.2233333)
      ..cubicTo(size.width * 0.5470000, size.height * 0.2250000, size.width * 0.5513333,
          size.height * 0.2283333, size.width * 0.5540000, size.height * 0.2336667)
      ..cubicTo(size.width * 0.5570000, size.height * 0.2390000, size.width * 0.5576667,
          size.height * 0.2443333, size.width * 0.5560000, size.height * 0.2503333)
      ..cubicTo(size.width * 0.5543333, size.height * 0.2560000, size.width * 0.5510000,
          size.height * 0.2606667, size.width * 0.5460000, size.height * 0.2633333)
      ..cubicTo(size.width * 0.5023333, size.height * 0.2873333, size.width * 0.4686667,
          size.height * 0.3210000, size.width * 0.4450000, size.height * 0.3650000)
      ..cubicTo(size.width * 0.4630000, size.height * 0.3566667, size.width * 0.4810000,
          size.height * 0.3523333, size.width * 0.4993333, size.height * 0.3523333)
      ..cubicTo(size.width * 0.5350000, size.height * 0.3523333, size.width * 0.5660000,
          size.height * 0.3650000, size.width * 0.5916667, size.height * 0.3906667)
      ..cubicTo(size.width * 0.6173333, size.height * 0.4163333, size.width * 0.6300000,
          size.height * 0.4470000, size.width * 0.6300000, size.height * 0.4826667)
      ..cubicTo(size.width * 0.6300000, size.height * 0.4853333, size.width * 0.6300000,
          size.height * 0.4880000, size.width * 0.6300000, size.height * 0.4906667)
      ..cubicTo(size.width * 0.6300000, size.height * 0.4933333, size.width * 0.6293333,
          size.height * 0.4990000, size.width * 0.6286667, size.height * 0.5080000)
      ..cubicTo(size.width * 0.6280000, size.height * 0.5170000, size.width * 0.6266667,
          size.height * 0.5253333, size.width * 0.6250000, size.height * 0.5336667)
      ..cubicTo(size.width * 0.6233333, size.height * 0.5420000, size.width * 0.6206667,
          size.height * 0.5523333, size.width * 0.6173333, size.height * 0.5646667)
      ..cubicTo(size.width * 0.6136667, size.height * 0.5770000, size.width * 0.6096667,
          size.height * 0.5890000, size.width * 0.6046667, size.height * 0.6000000)
      ..cubicTo(size.width * 0.5996667, size.height * 0.6110000, size.width * 0.5933333,
          size.height * 0.6233333, size.width * 0.5853333, size.height * 0.6366667)
      ..cubicTo(size.width * 0.5773333, size.height * 0.6500000, size.width * 0.5683333,
          size.height * 0.6623333, size.width * 0.5583333, size.height * 0.6740000)
      ..cubicTo(size.width * 0.5483333, size.height * 0.6856667, size.width * 0.5363333,
          size.height * 0.6973333, size.width * 0.5223333, size.height * 0.7090000)
      ..cubicTo(size.width * 0.5080000, size.height * 0.7206667, size.width * 0.4926667,
          size.height * 0.7313333, size.width * 0.4760000, size.height * 0.7406667)
      ..cubicTo(size.width * 0.4730000, size.height * 0.7426667, size.width * 0.4693333,
          size.height * 0.7433333, size.width * 0.4656667, size.height * 0.7433333)
      ..cubicTo(size.width * 0.4570000, size.height * 0.7433333, size.width * 0.4506667,
          size.height * 0.7393333, size.width * 0.4463333, size.height * 0.7316667)
      ..cubicTo(size.width * 0.4433333, size.height * 0.7263333, size.width * 0.4426667,
          size.height * 0.7210000, size.width * 0.4443333, size.height * 0.7153333)
      ..cubicTo(size.width * 0.4460000, size.height * 0.7096667, size.width * 0.4493333,
          size.height * 0.7053333, size.width * 0.4546667, size.height * 0.7026667)
      ..cubicTo(size.width * 0.4993333, size.height * 0.6776667, size.width * 0.5333333,
          size.height * 0.6433333, size.width * 0.5566667, size.height * 0.6000000)
      ..cubicTo(size.width * 0.5386667, size.height * 0.6086667, size.width * 0.5196667,
          size.height * 0.6126667, size.width * 0.4996667, size.height * 0.6126667)
      ..cubicTo(size.width * 0.4766667, size.height * 0.6126667, size.width * 0.4550000,
          size.height * 0.6070000, size.width * 0.4350000, size.height * 0.5953333)
      ..cubicTo(size.width * 0.4150000, size.height * 0.5840000, size.width * 0.3993333,
          size.height * 0.5683333, size.width * 0.3873333, size.height * 0.5483333)
      ..cubicTo(size.width * 0.3756667, size.height * 0.5290000, size.width * 0.3696667,
          size.height * 0.5076667, size.width * 0.3693333, size.height * 0.4843333)
      ..close()
      ..moveTo(size.width * 0.4260000, size.height * 0.4826667)
      ..cubicTo(size.width * 0.4260000, size.height * 0.5030000, size.width * 0.4333333,
          size.height * 0.5203333, size.width * 0.4476667, size.height * 0.5350000)
      ..cubicTo(size.width * 0.4620000, size.height * 0.5493333, size.width * 0.4793333,
          size.height * 0.5566667, size.width * 0.4996667, size.height * 0.5566667)
      ..cubicTo(size.width * 0.5186667, size.height * 0.5566667, size.width * 0.5350000,
          size.height * 0.5503333, size.width * 0.5493333, size.height * 0.5376667)
      ..cubicTo(size.width * 0.5633333, size.height * 0.5250000, size.width * 0.5713333,
          size.height * 0.5093333, size.width * 0.5736667, size.height * 0.4906667)
      ..lineTo(size.width * 0.5740000, size.height * 0.4830000)
      ..cubicTo(size.width * 0.5740000, size.height * 0.4823333, size.width * 0.5740000,
          size.height * 0.4816667, size.width * 0.5743333, size.height * 0.4813333)
      ..cubicTo(size.width * 0.5740000, size.height * 0.4613333, size.width * 0.5666667,
          size.height * 0.4443333, size.width * 0.5523333, size.height * 0.4306667)
      ..cubicTo(size.width * 0.5380000, size.height * 0.4166667, size.width * 0.5203333,
          size.height * 0.4100000, size.width * 0.5000000, size.height * 0.4100000)
      ..cubicTo(size.width * 0.4813333, size.height * 0.4100000, size.width * 0.4653333,
          size.height * 0.4160000, size.width * 0.4513333, size.height * 0.4280000)
      ..cubicTo(size.width * 0.4373333, size.height * 0.4400000, size.width * 0.4293333,
          size.height * 0.4553333, size.width * 0.4270000, size.height * 0.4733333)
      ..lineTo(size.width * 0.4263333, size.height * 0.4816667)
      ..lineTo(size.width * 0.4263333, size.height * 0.4826667)
      ..close();
  }

  Path _lightningPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.2653333, size.height * 0.8170000)
      ..lineTo(size.width * 0.2783333, size.height * 0.8170000)
      ..lineTo(size.width * 0.5076667, size.height * 0.4776667)
      ..cubicTo(size.width * 0.5106667, size.height * 0.4716667, size.width * 0.5090000,
          size.height * 0.4686667, size.width * 0.5026667, size.height * 0.4686667)
      ..lineTo(size.width * 0.4080000, size.height * 0.4686667)
      ..lineTo(size.width * 0.5076667, size.height * 0.2870000)
      ..cubicTo(size.width * 0.5106667, size.height * 0.2810000, size.width * 0.5083333,
          size.height * 0.2780000, size.width * 0.5010000, size.height * 0.2780000)
      ..lineTo(size.width * 0.3740000, size.height * 0.2780000)
      ..cubicTo(size.width * 0.3703333, size.height * 0.2780000, size.width * 0.3673333,
          size.height * 0.2800000, size.width * 0.3643333, size.height * 0.2840000)
      ..lineTo(size.width * 0.2716667, size.height * 0.5306667)
      ..cubicTo(size.width * 0.2710000, size.height * 0.5366667, size.width * 0.2730000,
          size.height * 0.5396667, size.width * 0.2780000, size.height * 0.5396667)
      ..lineTo(size.width * 0.3696667, size.height * 0.5396667)
      ..lineTo(size.width * 0.2653333, size.height * 0.8170000)
      ..close()
      ..moveTo(size.width * 0.5486667, size.height * 0.6060000)
      ..lineTo(size.width * 0.5576667, size.height * 0.6060000)
      ..lineTo(size.width * 0.7316667, size.height * 0.3503333)
      ..cubicTo(size.width * 0.7333333, size.height * 0.3476667, size.width * 0.7336667,
          size.height * 0.3453333, size.width * 0.7330000, size.height * 0.3436667)
      ..cubicTo(size.width * 0.7323333, size.height * 0.3420000, size.width * 0.7303333,
          size.height * 0.3413333, size.width * 0.7273333, size.height * 0.3413333)
      ..lineTo(size.width * 0.6573333, size.height * 0.3413333)
      ..lineTo(size.width * 0.7300000, size.height * 0.2070000)
      ..cubicTo(size.width * 0.7340000, size.height * 0.2003333, size.width * 0.7320000,
          size.height * 0.1970000, size.width * 0.7240000, size.height * 0.1970000)
      ..lineTo(size.width * 0.6326667, size.height * 0.1970000)
      ..cubicTo(size.width * 0.6283333, size.height * 0.1970000, size.width * 0.6250000,
          size.height * 0.1990000, size.width * 0.6226667, size.height * 0.2033333)
      ..lineTo(size.width * 0.5533333, size.height * 0.3860000)
      ..cubicTo(size.width * 0.5523333, size.height * 0.3890000, size.width * 0.5523333,
          size.height * 0.3913333, size.width * 0.5536667, size.height * 0.3930000)
      ..cubicTo(size.width * 0.5550000, size.height * 0.3946667, size.width * 0.5570000,
          size.height * 0.3953333, size.width * 0.5600000, size.height * 0.3953333)
      ..lineTo(size.width * 0.6280000, size.height * 0.3953333)
      ..lineTo(size.width * 0.5486667, size.height * 0.6060000)
      ..close();
  }

  Path _naPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.2290000, size.height * 0.6076667)
      ..lineTo(size.width * 0.2936667, size.height * 0.6076667)
      ..lineTo(size.width * 0.2936667, size.height * 0.4863333)
      ..lineTo(size.width * 0.2943333, size.height * 0.4863333)
      ..lineTo(size.width * 0.3626667, size.height * 0.6076667)
      ..lineTo(size.width * 0.4290000, size.height * 0.6076667)
      ..lineTo(size.width * 0.4290000, size.height * 0.3856667)
      ..lineTo(size.width * 0.3643333, size.height * 0.3856667)
      ..lineTo(size.width * 0.3643333, size.height * 0.5040000)
      ..lineTo(size.width * 0.3636667, size.height * 0.5040000)
      ..lineTo(size.width * 0.2990000, size.height * 0.3856667)
      ..lineTo(size.width * 0.2290000, size.height * 0.3856667)
      ..lineTo(size.width * 0.2290000, size.height * 0.6076667)
      ..close()
      ..moveTo(size.width * 0.4463333, size.height * 0.6126667)
      ..lineTo(size.width * 0.4940000, size.height * 0.6126667)
      ..lineTo(size.width * 0.5810000, size.height * 0.3803333)
      ..lineTo(size.width * 0.5336667, size.height * 0.3803333)
      ..lineTo(size.width * 0.4463333, size.height * 0.6126667)
      ..close()
      ..moveTo(size.width * 0.5420000, size.height * 0.6076667)
      ..lineTo(size.width * 0.6110000, size.height * 0.6076667)
      ..lineTo(size.width * 0.6206667, size.height * 0.5760000)
      ..lineTo(size.width * 0.6913333, size.height * 0.5760000)
      ..lineTo(size.width * 0.7006667, size.height * 0.6076667)
      ..lineTo(size.width * 0.7716667, size.height * 0.6076667)
      ..lineTo(size.width * 0.6906667, size.height * 0.3856667)
      ..lineTo(size.width * 0.6236667, size.height * 0.3856667)
      ..lineTo(size.width * 0.5420000, size.height * 0.6076667)
      ..close()
      ..moveTo(size.width * 0.6356667, size.height * 0.5280000)
      ..lineTo(size.width * 0.6570000, size.height * 0.4600000)
      ..lineTo(size.width * 0.6580000, size.height * 0.4600000)
      ..lineTo(size.width * 0.6780000, size.height * 0.5280000)
      ..lineTo(size.width * 0.6356667, size.height * 0.5280000)
      ..close();
  }

  Path _nightCloudyPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1380000, size.height * 0.5633333)
      ..cubicTo(size.width * 0.1380000, size.height * 0.5246667, size.width * 0.1496667,
          size.height * 0.4906667, size.width * 0.1733333, size.height * 0.4606667)
      ..cubicTo(size.width * 0.1970000, size.height * 0.4306667, size.width * 0.2273333,
          size.height * 0.4116667, size.width * 0.2646667, size.height * 0.4033333)
      ..cubicTo(size.width * 0.2723333, size.height * 0.3690000, size.width * 0.2880000,
          size.height * 0.3390000, size.width * 0.3113333, size.height * 0.3133333)
      ..cubicTo(size.width * 0.3346667, size.height * 0.2876667, size.width * 0.3630000,
          size.height * 0.2693333, size.width * 0.3956667, size.height * 0.2583333)
      ..cubicTo(size.width * 0.4163333, size.height * 0.2513333, size.width * 0.4376667,
          size.height * 0.2476667, size.width * 0.4600000, size.height * 0.2476667)
      ..cubicTo(size.width * 0.4870000, size.height * 0.2476667, size.width * 0.5133333,
          size.height * 0.2530000, size.width * 0.5383333, size.height * 0.2636667)
      ..cubicTo(size.width * 0.5476667, size.height * 0.2480000, size.width * 0.5586667,
          size.height * 0.2343333, size.width * 0.5713333, size.height * 0.2230000)
      ..cubicTo(size.width * 0.5840000, size.height * 0.2116667, size.width * 0.5970000,
          size.height * 0.2026667, size.width * 0.6103333, size.height * 0.1966667)
      ..cubicTo(size.width * 0.6236667, size.height * 0.1906667, size.width * 0.6370000,
          size.height * 0.1860000, size.width * 0.6496667, size.height * 0.1830000)
      ..cubicTo(size.width * 0.6623333, size.height * 0.1800000, size.width * 0.6750000,
          size.height * 0.1786667, size.width * 0.6870000, size.height * 0.1786667)
      ..cubicTo(size.width * 0.6996667, size.height * 0.1786667, size.width * 0.7133333,
          size.height * 0.1803333, size.width * 0.7280000, size.height * 0.1840000)
      ..lineTo(size.width * 0.7553333, size.height * 0.1923333)
      ..cubicTo(size.width * 0.7600000, size.height * 0.1943333, size.width * 0.7613333,
          size.height * 0.1966667, size.width * 0.7600000, size.height * 0.1996667)
      ..lineTo(size.width * 0.7553333, size.height * 0.2196667)
      ..cubicTo(size.width * 0.7530000, size.height * 0.2300000, size.width * 0.7520000,
          size.height * 0.2396667, size.width * 0.7520000, size.height * 0.2483333)
      ..cubicTo(size.width * 0.7520000, size.height * 0.2586667, size.width * 0.7536667,
          size.height * 0.2693333, size.width * 0.7570000, size.height * 0.2800000)
      ..cubicTo(size.width * 0.7603333, size.height * 0.2906667, size.width * 0.7650000,
          size.height * 0.3010000, size.width * 0.7716667, size.height * 0.3113333)
      ..cubicTo(size.width * 0.7780000, size.height * 0.3216667, size.width * 0.7870000,
          size.height * 0.3306667, size.width * 0.7983333, size.height * 0.3390000)
      ..cubicTo(size.width * 0.8096667, size.height * 0.3473333, size.width * 0.8223333,
          size.height * 0.3536667, size.width * 0.8366667, size.height * 0.3580000)
      ..lineTo(size.width * 0.8573333, size.height * 0.3653333)
      ..cubicTo(size.width * 0.8606667, size.height * 0.3663333, size.width * 0.8623333,
          size.height * 0.3680000, size.width * 0.8623333, size.height * 0.3706667)
      ..cubicTo(size.width * 0.8623333, size.height * 0.3713333, size.width * 0.8620000,
          size.height * 0.3720000, size.width * 0.8616667, size.height * 0.3730000)
      ..lineTo(size.width * 0.8556667, size.height * 0.3953333)
      ..cubicTo(size.width * 0.8466667, size.height * 0.4313333, size.width * 0.8296667,
          size.height * 0.4596667, size.width * 0.8056667, size.height * 0.4810000)
      ..cubicTo(size.width * 0.8190000, size.height * 0.5043333, size.width * 0.8263333,
          size.height * 0.5293333, size.width * 0.8273333, size.height * 0.5556667)
      ..cubicTo(size.width * 0.8276667, size.height * 0.5573333, size.width * 0.8276667,
          size.height * 0.5596667, size.width * 0.8276667, size.height * 0.5633333)
      ..cubicTo(size.width * 0.8276667, size.height * 0.5930000, size.width * 0.8203333,
          size.height * 0.6206667, size.width * 0.8053333, size.height * 0.6460000)
      ..cubicTo(size.width * 0.7906667, size.height * 0.6713333, size.width * 0.7703333,
          size.height * 0.6913333, size.width * 0.7453333, size.height * 0.7060000)
      ..cubicTo(size.width * 0.7200000, size.height * 0.7206667, size.width * 0.6923333,
          size.height * 0.7283333, size.width * 0.6626667, size.height * 0.7283333)
      ..lineTo(size.width * 0.3023333, size.height * 0.7283333)
      ..cubicTo(size.width * 0.2726667, size.height * 0.7283333, size.width * 0.2450000,
          size.height * 0.7210000, size.width * 0.2196667, size.height * 0.7060000)
      ..cubicTo(size.width * 0.1943333, size.height * 0.6910000, size.width * 0.1746667,
          size.height * 0.6710000, size.width * 0.1600000, size.height * 0.6460000)
      ..cubicTo(size.width * 0.1453333, size.height * 0.6210000, size.width * 0.1380000,
          size.height * 0.5933333, size.width * 0.1380000, size.height * 0.5633333)
      ..close()
      ..moveTo(size.width * 0.1950000, size.height * 0.5633333)
      ..cubicTo(size.width * 0.1950000, size.height * 0.5930000, size.width * 0.2056667,
          size.height * 0.6186667, size.width * 0.2270000, size.height * 0.6403333)
      ..cubicTo(size.width * 0.2483333, size.height * 0.6620000, size.width * 0.2733333,
          size.height * 0.6730000, size.width * 0.3023333, size.height * 0.6730000)
      ..lineTo(size.width * 0.6626667, size.height * 0.6730000)
      ..cubicTo(size.width * 0.6923333, size.height * 0.6730000, size.width * 0.7176667,
          size.height * 0.6623333, size.width * 0.7386667, size.height * 0.6406667)
      ..cubicTo(size.width * 0.7596667, size.height * 0.6190000, size.width * 0.7703333,
          size.height * 0.5933333, size.width * 0.7703333, size.height * 0.5633333)
      ..cubicTo(size.width * 0.7703333, size.height * 0.5340000, size.width * 0.7596667,
          size.height * 0.5090000, size.width * 0.7383333, size.height * 0.4880000)
      ..cubicTo(size.width * 0.7170000, size.height * 0.4670000, size.width * 0.6916667,
          size.height * 0.4563333, size.width * 0.6623333, size.height * 0.4563333)
      ..lineTo(size.width * 0.6030000, size.height * 0.4563333)
      ..lineTo(size.width * 0.5996667, size.height * 0.4313333)
      ..cubicTo(size.width * 0.5963333, size.height * 0.3976667, size.width * 0.5823333,
          size.height * 0.3686667, size.width * 0.5576667, size.height * 0.3450000)
      ..cubicTo(size.width * 0.5330000, size.height * 0.3213333, size.width * 0.5036667,
          size.height * 0.3080000, size.width * 0.4700000, size.height * 0.3050000)
      ..cubicTo(size.width * 0.4690000, size.height * 0.3050000, size.width * 0.4673333,
          size.height * 0.3050000, size.width * 0.4650000, size.height * 0.3046667)
      ..cubicTo(size.width * 0.4626667, size.height * 0.3043333, size.width * 0.4613333,
          size.height * 0.3043333, size.width * 0.4600000, size.height * 0.3043333)
      ..cubicTo(size.width * 0.4430000, size.height * 0.3043333, size.width * 0.4260000,
          size.height * 0.3076667, size.width * 0.4086667, size.height * 0.3140000)
      ..lineTo(size.width * 0.4086667, size.height * 0.3133333)
      ..cubicTo(size.width * 0.3843333, size.height * 0.3226667, size.width * 0.3636667,
          size.height * 0.3380000, size.width * 0.3473333, size.height * 0.3590000)
      ..cubicTo(size.width * 0.3306667, size.height * 0.3800000, size.width * 0.3206667,
          size.height * 0.4040000, size.width * 0.3173333, size.height * 0.4313333)
      ..lineTo(size.width * 0.3150000, size.height * 0.4553333)
      ..lineTo(size.width * 0.2923333, size.height * 0.4563333)
      ..cubicTo(size.width * 0.2643333, size.height * 0.4596667, size.width * 0.2410000,
          size.height * 0.4713333, size.width * 0.2223333, size.height * 0.4916667)
      ..cubicTo(size.width * 0.2036667, size.height * 0.5120000, size.width * 0.1950000,
          size.height * 0.5356667, size.width * 0.1950000, size.height * 0.5633333)
      ..close()
      ..moveTo(size.width * 0.5866667, size.height * 0.2930000)
      ..cubicTo(size.width * 0.6220000, size.height * 0.3233333, size.width * 0.6440000,
          size.height * 0.3586667, size.width * 0.6523333, size.height * 0.3990000)
      ..lineTo(size.width * 0.6630000, size.height * 0.3990000)
      ..cubicTo(size.width * 0.7043333, size.height * 0.3990000, size.width * 0.7396667,
          size.height * 0.4120000, size.width * 0.7686667, size.height * 0.4383333)
      ..cubicTo(size.width * 0.7796667, size.height * 0.4280000, size.width * 0.7880000,
          size.height * 0.4160000, size.width * 0.7940000, size.height * 0.4026667)
      ..cubicTo(size.width * 0.7636667, size.height * 0.3883333, size.width * 0.7396667,
          size.height * 0.3663333, size.width * 0.7220000, size.height * 0.3370000)
      ..cubicTo(size.width * 0.7046667, size.height * 0.3076667, size.width * 0.6956667,
          size.height * 0.2766667, size.width * 0.6956667, size.height * 0.2443333)
      ..lineTo(size.width * 0.6956667, size.height * 0.2363333)
      ..cubicTo(size.width * 0.6940000, size.height * 0.2360000, size.width * 0.6913333,
          size.height * 0.2360000, size.width * 0.6876667, size.height * 0.2360000)
      ..cubicTo(size.width * 0.6683333, size.height * 0.2356667, size.width * 0.6493333,
          size.height * 0.2403333, size.width * 0.6310000, size.height * 0.2506667)
      ..cubicTo(size.width * 0.6126667, size.height * 0.2606667, size.width * 0.5976667,
          size.height * 0.2746667, size.width * 0.5866667, size.height * 0.2930000)
      ..close();
  }

  Path _nightCloudyGustsPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.09933333, size.height * 0.7006667)
      ..cubicTo(size.width * 0.09933333, size.height * 0.7083333, size.width * 0.1023333,
          size.height * 0.7150000, size.width * 0.1083333, size.height * 0.7206667)
      ..cubicTo(size.width * 0.1140000, size.height * 0.7263333, size.width * 0.1206667,
          size.height * 0.7290000, size.width * 0.1286667, size.height * 0.7290000)
      ..lineTo(size.width * 0.3200000, size.height * 0.7290000)
      ..cubicTo(size.width * 0.3286667, size.height * 0.7290000, size.width * 0.3363333,
          size.height * 0.7323333, size.width * 0.3430000, size.height * 0.7386667)
      ..cubicTo(size.width * 0.3496667, size.height * 0.7450000, size.width * 0.3530000,
          size.height * 0.7526667, size.width * 0.3530000, size.height * 0.7613333)
      ..cubicTo(size.width * 0.3530000, size.height * 0.7703333, size.width * 0.3496667,
          size.height * 0.7780000, size.width * 0.3430000, size.height * 0.7843333)
      ..cubicTo(size.width * 0.3363333, size.height * 0.7906667, size.width * 0.3286667,
          size.height * 0.7940000, size.width * 0.3200000, size.height * 0.7940000)
      ..cubicTo(size.width * 0.3113333, size.height * 0.7940000, size.width * 0.3040000,
          size.height * 0.7906667, size.width * 0.2973333, size.height * 0.7840000)
      ..cubicTo(size.width * 0.2913333, size.height * 0.7786667, size.width * 0.2846667,
          size.height * 0.7760000, size.width * 0.2770000, size.height * 0.7760000)
      ..cubicTo(size.width * 0.2690000, size.height * 0.7760000, size.width * 0.2623333,
          size.height * 0.7786667, size.width * 0.2570000, size.height * 0.7840000)
      ..cubicTo(size.width * 0.2516667, size.height * 0.7893333, size.width * 0.2490000,
          size.height * 0.7960000, size.width * 0.2490000, size.height * 0.8040000)
      ..cubicTo(size.width * 0.2490000, size.height * 0.8113333, size.width * 0.2516667,
          size.height * 0.8180000, size.width * 0.2570000, size.height * 0.8240000)
      ..cubicTo(size.width * 0.2743333, size.height * 0.8416667, size.width * 0.2956667,
          size.height * 0.8503333, size.width * 0.3200000, size.height * 0.8503333)
      ..cubicTo(size.width * 0.3443333, size.height * 0.8503333, size.width * 0.3656667,
          size.height * 0.8416667, size.width * 0.3830000, size.height * 0.8243333)
      ..cubicTo(size.width * 0.4003333, size.height * 0.8070000, size.width * 0.4090000,
          size.height * 0.7860000, size.width * 0.4090000, size.height * 0.7613333)
      ..cubicTo(size.width * 0.4090000, size.height * 0.7366667, size.width * 0.4003333,
          size.height * 0.7156667, size.width * 0.3830000, size.height * 0.6983333)
      ..cubicTo(size.width * 0.3656667, size.height * 0.6810000, size.width * 0.3446667,
          size.height * 0.6720000, size.width * 0.3200000, size.height * 0.6720000)
      ..lineTo(size.width * 0.1286667, size.height * 0.6720000)
      ..cubicTo(size.width * 0.1206667, size.height * 0.6720000, size.width * 0.1140000,
          size.height * 0.6750000, size.width * 0.1080000, size.height * 0.6806667)
      ..cubicTo(size.width * 0.1023333, size.height * 0.6863333, size.width * 0.09933333,
          size.height * 0.6930000, size.width * 0.09933333, size.height * 0.7006667)
      ..close()
      ..moveTo(size.width * 0.09933333, size.height * 0.6000000)
      ..cubicTo(size.width * 0.09933333, size.height * 0.6073333, size.width * 0.1023333,
          size.height * 0.6136667, size.width * 0.1083333, size.height * 0.6193333)
      ..cubicTo(size.width * 0.1140000, size.height * 0.6246667, size.width * 0.1210000,
          size.height * 0.6273333, size.width * 0.1286667, size.height * 0.6273333)
      ..lineTo(size.width * 0.4903333, size.height * 0.6273333)
      ..cubicTo(size.width * 0.5150000, size.height * 0.6273333, size.width * 0.5360000,
          size.height * 0.6186667, size.width * 0.5533333, size.height * 0.6013333)
      ..cubicTo(size.width * 0.5706667, size.height * 0.5840000, size.width * 0.5793333,
          size.height * 0.5630000, size.width * 0.5793333, size.height * 0.5386667)
      ..cubicTo(size.width * 0.5793333, size.height * 0.5140000, size.width * 0.5706667,
          size.height * 0.4933333, size.width * 0.5533333, size.height * 0.4760000)
      ..cubicTo(size.width * 0.5360000, size.height * 0.4586667, size.width * 0.5150000,
          size.height * 0.4503333, size.width * 0.4903333, size.height * 0.4503333)
      ..cubicTo(size.width * 0.4650000, size.height * 0.4503333, size.width * 0.4440000,
          size.height * 0.4586667, size.width * 0.4273333, size.height * 0.4756667)
      ..cubicTo(size.width * 0.4223333, size.height * 0.4810000, size.width * 0.4196667,
          size.height * 0.4876667, size.width * 0.4196667, size.height * 0.4960000)
      ..cubicTo(size.width * 0.4196667, size.height * 0.5043333, size.width * 0.4223333,
          size.height * 0.5110000, size.width * 0.4273333, size.height * 0.5160000)
      ..cubicTo(size.width * 0.4323333, size.height * 0.5210000, size.width * 0.4390000,
          size.height * 0.5236667, size.width * 0.4470000, size.height * 0.5236667)
      ..cubicTo(size.width * 0.4550000, size.height * 0.5236667, size.width * 0.4616667,
          size.height * 0.5213333, size.width * 0.4676667, size.height * 0.5160000)
      ..cubicTo(size.width * 0.4740000, size.height * 0.5096667, size.width * 0.4816667,
          size.height * 0.5066667, size.width * 0.4903333, size.height * 0.5066667)
      ..cubicTo(size.width * 0.4990000, size.height * 0.5066667, size.width * 0.5063333,
          size.height * 0.5096667, size.width * 0.5126667, size.height * 0.5160000)
      ..cubicTo(size.width * 0.5190000, size.height * 0.5223333, size.width * 0.5223333,
          size.height * 0.5300000, size.width * 0.5223333, size.height * 0.5386667)
      ..cubicTo(size.width * 0.5223333, size.height * 0.5473333, size.width * 0.5190000,
          size.height * 0.5550000, size.width * 0.5126667, size.height * 0.5613333)
      ..cubicTo(size.width * 0.5063333, size.height * 0.5676667, size.width * 0.4986667,
          size.height * 0.5710000, size.width * 0.4903333, size.height * 0.5710000)
      ..lineTo(size.width * 0.1286667, size.height * 0.5710000)
      ..cubicTo(size.width * 0.1206667, size.height * 0.5710000, size.width * 0.1140000,
          size.height * 0.5740000, size.width * 0.1080000, size.height * 0.5796667)
      ..cubicTo(size.width * 0.1023333, size.height * 0.5856667, size.width * 0.09933333,
          size.height * 0.5923333, size.width * 0.09933333, size.height * 0.6000000)
      ..close()
      ..moveTo(size.width * 0.1833333, size.height * 0.5216667)
      ..cubicTo(size.width * 0.1833333, size.height * 0.5246667, size.width * 0.1850000,
          size.height * 0.5260000, size.width * 0.1886667, size.height * 0.5260000)
      ..lineTo(size.width * 0.2366667, size.height * 0.5260000)
      ..cubicTo(size.width * 0.2393333, size.height * 0.5260000, size.width * 0.2416667,
          size.height * 0.5243333, size.width * 0.2440000, size.height * 0.5210000)
      ..cubicTo(size.width * 0.2513333, size.height * 0.5030000, size.width * 0.2630000,
          size.height * 0.4880000, size.width * 0.2790000, size.height * 0.4760000)
      ..cubicTo(size.width * 0.2946667, size.height * 0.4643333, size.width * 0.3123333,
          size.height * 0.4576667, size.width * 0.3316667, size.height * 0.4560000)
      ..lineTo(size.width * 0.3490000, size.height * 0.4536667)
      ..cubicTo(size.width * 0.3530000, size.height * 0.4536667, size.width * 0.3553333,
          size.height * 0.4516667, size.width * 0.3553333, size.height * 0.4480000)
      ..lineTo(size.width * 0.3580000, size.height * 0.4306667)
      ..cubicTo(size.width * 0.3616667, size.height * 0.3946667, size.width * 0.3770000,
          size.height * 0.3643333, size.width * 0.4040000, size.height * 0.3403333)
      ..cubicTo(size.width * 0.4310000, size.height * 0.3160000, size.width * 0.4630000,
          size.height * 0.3040000, size.width * 0.4993333, size.height * 0.3040000)
      ..cubicTo(size.width * 0.5356667, size.height * 0.3040000, size.width * 0.5676667,
          size.height * 0.3160000, size.width * 0.5943333, size.height * 0.3403333)
      ..cubicTo(size.width * 0.6213333, size.height * 0.3643333, size.width * 0.6366667,
          size.height * 0.3946667, size.width * 0.6403333, size.height * 0.4310000)
      ..lineTo(size.width * 0.6426667, size.height * 0.4503333)
      ..cubicTo(size.width * 0.6426667, size.height * 0.4543333, size.width * 0.6446667,
          size.height * 0.4563333, size.width * 0.6490000, size.height * 0.4563333)
      ..lineTo(size.width * 0.7030000, size.height * 0.4563333)
      ..cubicTo(size.width * 0.7333333, size.height * 0.4563333, size.width * 0.7590000,
          size.height * 0.4670000, size.width * 0.7803333, size.height * 0.4880000)
      ..cubicTo(size.width * 0.8016667, size.height * 0.5090000, size.width * 0.8123333,
          size.height * 0.5343333, size.width * 0.8123333, size.height * 0.5640000)
      ..cubicTo(size.width * 0.8123333, size.height * 0.5936667, size.width * 0.8016667,
          size.height * 0.6190000, size.width * 0.7803333, size.height * 0.6403333)
      ..cubicTo(size.width * 0.7590000, size.height * 0.6616667, size.width * 0.7333333,
          size.height * 0.6723333, size.width * 0.7033333, size.height * 0.6723333)
      ..lineTo(size.width * 0.4730000, size.height * 0.6723333)
      ..cubicTo(size.width * 0.4693333, size.height * 0.6723333, size.width * 0.4673333,
          size.height * 0.6743333, size.width * 0.4673333, size.height * 0.6783333)
      ..lineTo(size.width * 0.4673333, size.height * 0.7240000)
      ..cubicTo(size.width * 0.4673333, size.height * 0.7276667, size.width * 0.4693333,
          size.height * 0.7296667, size.width * 0.4730000, size.height * 0.7296667)
      ..lineTo(size.width * 0.7033333, size.height * 0.7296667)
      ..cubicTo(size.width * 0.7330000, size.height * 0.7296667, size.width * 0.7606667,
          size.height * 0.7223333, size.width * 0.7860000, size.height * 0.7073333)
      ..cubicTo(size.width * 0.8113333, size.height * 0.6923333, size.width * 0.8313333,
          size.height * 0.6723333, size.width * 0.8460000, size.height * 0.6470000)
      ..cubicTo(size.width * 0.8606667, size.height * 0.6216667, size.width * 0.8683333,
          size.height * 0.5940000, size.width * 0.8683333, size.height * 0.5643333)
      ..cubicTo(size.width * 0.8683333, size.height * 0.5350000, size.width * 0.8606667,
          size.height * 0.5073333, size.width * 0.8456667, size.height * 0.4816667)
      ..cubicTo(size.width * 0.8700000, size.height * 0.4580000, size.width * 0.8866667,
          size.height * 0.4293333, size.width * 0.8960000, size.height * 0.3956667)
      ..lineTo(size.width * 0.9000000, size.height * 0.3726667)
      ..cubicTo(size.width * 0.9006667, size.height * 0.3720000, size.width * 0.9010000,
          size.height * 0.3713333, size.width * 0.9010000, size.height * 0.3703333)
      ..cubicTo(size.width * 0.9010000, size.height * 0.3690000, size.width * 0.8993333,
          size.height * 0.3670000, size.width * 0.8963333, size.height * 0.3650000)
      ..lineTo(size.width * 0.8763333, size.height * 0.3580000)
      ..cubicTo(size.width * 0.8483333, size.height * 0.3493333, size.width * 0.8270000,
          size.height * 0.3343333, size.width * 0.8123333, size.height * 0.3126667)
      ..cubicTo(size.width * 0.7976667, size.height * 0.2910000, size.width * 0.7903333,
          size.height * 0.2686667, size.width * 0.7903333, size.height * 0.2453333)
      ..cubicTo(size.width * 0.7903333, size.height * 0.2373333, size.width * 0.7913333,
          size.height * 0.2283333, size.width * 0.7933333, size.height * 0.2190000)
      ..lineTo(size.width * 0.7976667, size.height * 0.1983333)
      ..cubicTo(size.width * 0.7983333, size.height * 0.1950000, size.width * 0.7970000,
          size.height * 0.1923333, size.width * 0.7933333, size.height * 0.1910000)
      ..lineTo(size.width * 0.7666667, size.height * 0.1830000)
      ..cubicTo(size.width * 0.7520000, size.height * 0.1793333, size.width * 0.7383333,
          size.height * 0.1776667, size.width * 0.7250000, size.height * 0.1776667)
      ..cubicTo(size.width * 0.7126667, size.height * 0.1776667, size.width * 0.7003333,
          size.height * 0.1790000, size.width * 0.6876667, size.height * 0.1820000)
      ..cubicTo(size.width * 0.6750000, size.height * 0.1850000, size.width * 0.6620000,
          size.height * 0.1893333, size.width * 0.6483333, size.height * 0.1956667)
      ..cubicTo(size.width * 0.6350000, size.height * 0.2016667, size.width * 0.6216667,
          size.height * 0.2106667, size.width * 0.6090000, size.height * 0.2223333)
      ..cubicTo(size.width * 0.5963333, size.height * 0.2340000, size.width * 0.5850000,
          size.height * 0.2473333, size.width * 0.5756667, size.height * 0.2630000)
      ..cubicTo(size.width * 0.5520000, size.height * 0.2530000, size.width * 0.5263333,
          size.height * 0.2480000, size.width * 0.4983333, size.height * 0.2480000)
      ..cubicTo(size.width * 0.4513333, size.height * 0.2480000, size.width * 0.4096667,
          size.height * 0.2626667, size.width * 0.3733333, size.height * 0.2916667)
      ..cubicTo(size.width * 0.3370000, size.height * 0.3206667, size.width * 0.3143333,
          size.height * 0.3580000, size.width * 0.3043333, size.height * 0.4033333)
      ..cubicTo(size.width * 0.2756667, size.height * 0.4100000, size.width * 0.2506667,
          size.height * 0.4236667, size.width * 0.2286667, size.height * 0.4443333)
      ..cubicTo(size.width * 0.2066667, size.height * 0.4650000, size.width * 0.1916667,
          size.height * 0.4893333, size.width * 0.1833333, size.height * 0.5176667)
      ..lineTo(size.width * 0.1833333, size.height * 0.5186667)
      ..cubicTo(size.width * 0.1836667, size.height * 0.5193333, size.width * 0.1833333,
          size.height * 0.5203333, size.width * 0.1833333, size.height * 0.5216667)
      ..close()
      ..moveTo(size.width * 0.6243333, size.height * 0.2920000)
      ..cubicTo(size.width * 0.6346667, size.height * 0.2736667, size.width * 0.6490000,
          size.height * 0.2596667, size.width * 0.6673333, size.height * 0.2500000)
      ..cubicTo(size.width * 0.6856667, size.height * 0.2403333, size.width * 0.7046667,
          size.height * 0.2353333, size.width * 0.7243333, size.height * 0.2353333)
      ..cubicTo(size.width * 0.7290000, size.height * 0.2353333, size.width * 0.7323333,
          size.height * 0.2353333, size.width * 0.7346667, size.height * 0.2356667)
      ..cubicTo(size.width * 0.7343333, size.height * 0.2386667, size.width * 0.7340000,
          size.height * 0.2426667, size.width * 0.7340000, size.height * 0.2476667)
      ..cubicTo(size.width * 0.7340000, size.height * 0.2790000, size.width * 0.7426667,
          size.height * 0.3093333, size.width * 0.7603333, size.height * 0.3380000)
      ..cubicTo(size.width * 0.7776667, size.height * 0.3666667, size.width * 0.8020000,
          size.height * 0.3883333, size.width * 0.8326667, size.height * 0.4026667)
      ..cubicTo(size.width * 0.8273333, size.height * 0.4153333, size.width * 0.8190000,
          size.height * 0.4266667, size.width * 0.8076667, size.height * 0.4370000)
      ..cubicTo(size.width * 0.7780000, size.height * 0.4116667, size.width * 0.7430000,
          size.height * 0.3990000, size.width * 0.7023333, size.height * 0.3990000)
      ..lineTo(size.width * 0.6913333, size.height * 0.3990000)
      ..cubicTo(size.width * 0.6826667, size.height * 0.3570000, size.width * 0.6603333,
          size.height * 0.3213333, size.width * 0.6243333, size.height * 0.2920000)
      ..close();
  }

  Path _nightHailPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1366667, size.height * 0.5636667)
      ..cubicTo(size.width * 0.1366667, size.height * 0.6080000, size.width * 0.1520000,
          size.height * 0.6463333, size.width * 0.1830000, size.height * 0.6780000)
      ..cubicTo(size.width * 0.2140000, size.height * 0.7096667, size.width * 0.2516667,
          size.height * 0.7270000, size.width * 0.2963333, size.height * 0.7290000)
      ..cubicTo(size.width * 0.3003333, size.height * 0.7290000, size.width * 0.3023333,
          size.height * 0.7270000, size.width * 0.3023333, size.height * 0.7233333)
      ..lineTo(size.width * 0.3023333, size.height * 0.6786667)
      ..cubicTo(size.width * 0.3023333, size.height * 0.6750000, size.width * 0.3003333,
          size.height * 0.6730000, size.width * 0.2963333, size.height * 0.6730000)
      ..cubicTo(size.width * 0.2676667, size.height * 0.6716667, size.width * 0.2436667,
          size.height * 0.6603333, size.width * 0.2236667, size.height * 0.6390000)
      ..cubicTo(size.width * 0.2036667, size.height * 0.6176667, size.width * 0.1936667,
          size.height * 0.5926667, size.width * 0.1936667, size.height * 0.5636667)
      ..cubicTo(size.width * 0.1936667, size.height * 0.5360000, size.width * 0.2030000,
          size.height * 0.5120000, size.width * 0.2216667, size.height * 0.4913333)
      ..cubicTo(size.width * 0.2403333, size.height * 0.4710000, size.width * 0.2636667,
          size.height * 0.4590000, size.width * 0.2916667, size.height * 0.4556667)
      ..lineTo(size.width * 0.3093333, size.height * 0.4546667)
      ..cubicTo(size.width * 0.3136667, size.height * 0.4546667, size.width * 0.3160000,
          size.height * 0.4526667, size.width * 0.3160000, size.height * 0.4486667)
      ..lineTo(size.width * 0.3183333, size.height * 0.4306667)
      ..cubicTo(size.width * 0.3220000, size.height * 0.3946667, size.width * 0.3370000,
          size.height * 0.3643333, size.width * 0.3640000, size.height * 0.3400000)
      ..cubicTo(size.width * 0.3910000, size.height * 0.3156667, size.width * 0.4226667,
          size.height * 0.3033333, size.width * 0.4590000, size.height * 0.3033333)
      ..cubicTo(size.width * 0.4950000, size.height * 0.3033333, size.width * 0.5266667,
          size.height * 0.3156667, size.width * 0.5540000, size.height * 0.3400000)
      ..cubicTo(size.width * 0.5813333, size.height * 0.3643333, size.width * 0.5966667,
          size.height * 0.3946667, size.width * 0.6006667, size.height * 0.4306667)
      ..lineTo(size.width * 0.6033333, size.height * 0.4500000)
      ..cubicTo(size.width * 0.6033333, size.height * 0.4536667, size.width * 0.6053333,
          size.height * 0.4556667, size.width * 0.6090000, size.height * 0.4556667)
      ..lineTo(size.width * 0.6626667, size.height * 0.4556667)
      ..cubicTo(size.width * 0.6923333, size.height * 0.4556667, size.width * 0.7180000,
          size.height * 0.4663333, size.width * 0.7396667, size.height * 0.4876667)
      ..cubicTo(size.width * 0.7613333, size.height * 0.5090000, size.width * 0.7723333,
          size.height * 0.5343333, size.width * 0.7723333, size.height * 0.5633333)
      ..cubicTo(size.width * 0.7723333, size.height * 0.5923333, size.width * 0.7623333,
          size.height * 0.6173333, size.width * 0.7423333, size.height * 0.6386667)
      ..cubicTo(size.width * 0.7223333, size.height * 0.6600000, size.width * 0.6980000,
          size.height * 0.6713333, size.width * 0.6696667, size.height * 0.6726667)
      ..cubicTo(size.width * 0.6653333, size.height * 0.6726667, size.width * 0.6630000,
          size.height * 0.6746667, size.width * 0.6630000, size.height * 0.6783333)
      ..lineTo(size.width * 0.6630000, size.height * 0.7230000)
      ..cubicTo(size.width * 0.6630000, size.height * 0.7266667, size.width * 0.6653333,
          size.height * 0.7286667, size.width * 0.6696667, size.height * 0.7286667)
      ..cubicTo(size.width * 0.7140000, size.height * 0.7273333, size.width * 0.7516667,
          size.height * 0.7103333, size.width * 0.7823333, size.height * 0.6783333)
      ..cubicTo(size.width * 0.8133333, size.height * 0.6463333, size.width * 0.8286667,
          size.height * 0.6080000, size.width * 0.8286667, size.height * 0.5633333)
      ..cubicTo(size.width * 0.8286667, size.height * 0.5346667, size.width * 0.8213333,
          size.height * 0.5080000, size.width * 0.8070000, size.height * 0.4830000)
      ..cubicTo(size.width * 0.8333333, size.height * 0.4583333, size.width * 0.8503333,
          size.height * 0.4290000, size.width * 0.8586667, size.height * 0.3956667)
      ..lineTo(size.width * 0.8630000, size.height * 0.3730000)
      ..cubicTo(size.width * 0.8636667, size.height * 0.3726667, size.width * 0.8640000,
          size.height * 0.3720000, size.width * 0.8640000, size.height * 0.3706667)
      ..cubicTo(size.width * 0.8640000, size.height * 0.3683333, size.width * 0.8623333,
          size.height * 0.3663333, size.width * 0.8586667, size.height * 0.3653333)
      ..lineTo(size.width * 0.8400000, size.height * 0.3596667)
      ..cubicTo(size.width * 0.8210000, size.height * 0.3540000, size.width * 0.8050000,
          size.height * 0.3446667, size.width * 0.7913333, size.height * 0.3313333)
      ..cubicTo(size.width * 0.7780000, size.height * 0.3180000, size.width * 0.7683333,
          size.height * 0.3043333, size.width * 0.7626667, size.height * 0.2896667)
      ..cubicTo(size.width * 0.7570000, size.height * 0.2753333, size.width * 0.7543333,
          size.height * 0.2606667, size.width * 0.7543333, size.height * 0.2456667)
      ..cubicTo(size.width * 0.7540000, size.height * 0.2376667, size.width * 0.7550000,
          size.height * 0.2286667, size.width * 0.7570000, size.height * 0.2193333)
      ..lineTo(size.width * 0.7616667, size.height * 0.2000000)
      ..cubicTo(size.width * 0.7626667, size.height * 0.1970000, size.width * 0.7610000,
          size.height * 0.1946667, size.width * 0.7570000, size.height * 0.1926667)
      ..lineTo(size.width * 0.7303333, size.height * 0.1843333)
      ..cubicTo(size.width * 0.7163333, size.height * 0.1803333, size.width * 0.7016667,
          size.height * 0.1780000, size.width * 0.6866667, size.height * 0.1780000)
      ..cubicTo(size.width * 0.6750000, size.height * 0.1780000, size.width * 0.6630000,
          size.height * 0.1793333, size.width * 0.6506667, size.height * 0.1823333)
      ..cubicTo(size.width * 0.6383333, size.height * 0.1853333, size.width * 0.6253333,
          size.height * 0.1896667, size.width * 0.6116667, size.height * 0.1956667)
      ..cubicTo(size.width * 0.5980000, size.height * 0.2016667, size.width * 0.5850000,
          size.height * 0.2106667, size.width * 0.5720000, size.height * 0.2223333)
      ..cubicTo(size.width * 0.5593333, size.height * 0.2340000, size.width * 0.5480000,
          size.height * 0.2473333, size.width * 0.5386667, size.height * 0.2630000)
      ..cubicTo(size.width * 0.5136667, size.height * 0.2523333, size.width * 0.4873333,
          size.height * 0.2466667, size.width * 0.4596667, size.height * 0.2466667)
      ..cubicTo(size.width * 0.4126667, size.height * 0.2466667, size.width * 0.3706667,
          size.height * 0.2613333, size.width * 0.3343333, size.height * 0.2903333)
      ..cubicTo(size.width * 0.2980000, size.height * 0.3193333, size.width * 0.2746667,
          size.height * 0.3566667, size.width * 0.2643333, size.height * 0.4023333)
      ..cubicTo(size.width * 0.2273333, size.height * 0.4110000, size.width * 0.1970000,
          size.height * 0.4300000, size.width * 0.1730000, size.height * 0.4600000)
      ..cubicTo(size.width * 0.1490000, size.height * 0.4900000, size.width * 0.1366667,
          size.height * 0.5253333, size.width * 0.1366667, size.height * 0.5636667)
      ..close()
      ..moveTo(size.width * 0.3193333, size.height * 0.7980000)
      ..cubicTo(size.width * 0.3223333, size.height * 0.8050000, size.width * 0.3273333,
          size.height * 0.8100000, size.width * 0.3346667, size.height * 0.8130000)
      ..cubicTo(size.width * 0.3410000, size.height * 0.8163333, size.width * 0.3480000,
          size.height * 0.8166667, size.width * 0.3553333, size.height * 0.8136667)
      ..cubicTo(size.width * 0.3626667, size.height * 0.8110000, size.width * 0.3676667,
          size.height * 0.8060000, size.width * 0.3703333, size.height * 0.7986667)
      ..cubicTo(size.width * 0.3736667, size.height * 0.7913333, size.width * 0.3740000,
          size.height * 0.7843333, size.width * 0.3710000, size.height * 0.7770000)
      ..cubicTo(size.width * 0.3683333, size.height * 0.7700000, size.width * 0.3633333,
          size.height * 0.7650000, size.width * 0.3560000, size.height * 0.7623333)
      ..cubicTo(size.width * 0.3493333, size.height * 0.7590000, size.width * 0.3423333,
          size.height * 0.7586667, size.width * 0.3353333, size.height * 0.7616667)
      ..cubicTo(size.width * 0.3283333, size.height * 0.7646667, size.width * 0.3230000,
          size.height * 0.7696667, size.width * 0.3196667, size.height * 0.7770000)
      ..cubicTo(size.width * 0.3166667, size.height * 0.7826667, size.width * 0.3163333,
          size.height * 0.7896667, size.width * 0.3193333, size.height * 0.7980000)
      ..close()
      ..moveTo(size.width * 0.3400000, size.height * 0.7036667)
      ..cubicTo(size.width * 0.3400000, size.height * 0.7086667, size.width * 0.3416667,
          size.height * 0.7136667, size.width * 0.3453333, size.height * 0.7186667)
      ..cubicTo(size.width * 0.3490000, size.height * 0.7236667, size.width * 0.3540000,
          size.height * 0.7273333, size.width * 0.3606667, size.height * 0.7293333)
      ..cubicTo(size.width * 0.3693333, size.height * 0.7326667, size.width * 0.3766667,
          size.height * 0.7326667, size.width * 0.3830000, size.height * 0.7293333)
      ..cubicTo(size.width * 0.3893333, size.height * 0.7260000, size.width * 0.3936667,
          size.height * 0.7196667, size.width * 0.3963333, size.height * 0.7103333)
      ..lineTo(size.width * 0.4256667, size.height * 0.6033333)
      ..cubicTo(size.width * 0.4280000, size.height * 0.5950000, size.width * 0.4270000,
          size.height * 0.5876667, size.width * 0.4230000, size.height * 0.5810000)
      ..cubicTo(size.width * 0.4190000, size.height * 0.5743333, size.width * 0.4130000,
          size.height * 0.5703333, size.width * 0.4050000, size.height * 0.5686667)
      ..cubicTo(size.width * 0.3976667, size.height * 0.5663333, size.width * 0.3906667,
          size.height * 0.5670000, size.width * 0.3840000, size.height * 0.5710000)
      ..cubicTo(size.width * 0.3773333, size.height * 0.5746667, size.width * 0.3730000,
          size.height * 0.5803333, size.width * 0.3706667, size.height * 0.5880000)
      ..lineTo(size.width * 0.3413333, size.height * 0.6953333)
      ..cubicTo(size.width * 0.3413333, size.height * 0.6960000, size.width * 0.3410000,
          size.height * 0.6973333, size.width * 0.3406667, size.height * 0.6993333)
      ..cubicTo(size.width * 0.3403333, size.height * 0.7010000, size.width * 0.3400000,
          size.height * 0.7026667, size.width * 0.3400000, size.height * 0.7036667)
      ..close()
      ..moveTo(size.width * 0.4023333, size.height * 0.8903333)
      ..cubicTo(size.width * 0.4023333, size.height * 0.8943333, size.width * 0.4030000,
          size.height * 0.8976667, size.width * 0.4043333, size.height * 0.9000000)
      ..cubicTo(size.width * 0.4073333, size.height * 0.9073333, size.width * 0.4123333,
          size.height * 0.9123333, size.width * 0.4193333, size.height * 0.9150000)
      ..cubicTo(size.width * 0.4223333, size.height * 0.9166667, size.width * 0.4260000,
          size.height * 0.9173333, size.width * 0.4303333, size.height * 0.9173333)
      ..cubicTo(size.width * 0.4323333, size.height * 0.9173333, size.width * 0.4356667,
          size.height * 0.9166667, size.width * 0.4403333, size.height * 0.9153333)
      ..cubicTo(size.width * 0.4480000, size.height * 0.9126667, size.width * 0.4533333,
          size.height * 0.9076667, size.width * 0.4563333, size.height * 0.9003333)
      ..cubicTo(size.width * 0.4596667, size.height * 0.8930000, size.width * 0.4596667,
          size.height * 0.8856667, size.width * 0.4563333, size.height * 0.8783333)
      ..cubicTo(size.width * 0.4530000, size.height * 0.8710000, size.width * 0.4480000,
          size.height * 0.8660000, size.width * 0.4413333, size.height * 0.8630000)
      ..cubicTo(size.width * 0.4346667, size.height * 0.8600000, size.width * 0.4280000,
          size.height * 0.8600000, size.width * 0.4210000, size.height * 0.8630000)
      ..cubicTo(size.width * 0.4146667, size.height * 0.8656667, size.width * 0.4100000,
          size.height * 0.8696667, size.width * 0.4070000, size.height * 0.8750000)
      ..cubicTo(size.width * 0.4036667, size.height * 0.8806667, size.width * 0.4023333,
          size.height * 0.8856667, size.width * 0.4023333, size.height * 0.8903333)
      ..close()
      ..moveTo(size.width * 0.4270000, size.height * 0.8020000)
      ..cubicTo(size.width * 0.4270000, size.height * 0.8146667, size.width * 0.4340000,
          size.height * 0.8233333, size.width * 0.4483333, size.height * 0.8280000)
      ..cubicTo(size.width * 0.4513333, size.height * 0.8290000, size.width * 0.4540000,
          size.height * 0.8296667, size.width * 0.4560000, size.height * 0.8296667)
      ..cubicTo(size.width * 0.4596667, size.height * 0.8296667, size.width * 0.4636667,
          size.height * 0.8286667, size.width * 0.4676667, size.height * 0.8270000)
      ..cubicTo(size.width * 0.4753333, size.height * 0.8243333, size.width * 0.4806667,
          size.height * 0.8180000, size.width * 0.4833333, size.height * 0.8080000)
      ..lineTo(size.width * 0.5383333, size.height * 0.6040000)
      ..cubicTo(size.width * 0.5403333, size.height * 0.5960000, size.width * 0.5396667,
          size.height * 0.5890000, size.width * 0.5360000, size.height * 0.5823333)
      ..cubicTo(size.width * 0.5323333, size.height * 0.5760000, size.width * 0.5266667,
          size.height * 0.5716667, size.width * 0.5193333, size.height * 0.5693333)
      ..cubicTo(size.width * 0.5116667, size.height * 0.5670000, size.width * 0.5043333,
          size.height * 0.5676667, size.width * 0.4976667, size.height * 0.5716667)
      ..cubicTo(size.width * 0.4910000, size.height * 0.5753333, size.width * 0.4863333,
          size.height * 0.5810000, size.width * 0.4843333, size.height * 0.5886667)
      ..lineTo(size.width * 0.4283333, size.height * 0.7943333)
      ..cubicTo(size.width * 0.4273333, size.height * 0.7973333, size.width * 0.4270000,
          size.height * 0.8000000, size.width * 0.4270000, size.height * 0.8020000)
      ..close()
      ..moveTo(size.width * 0.5416667, size.height * 0.7880000)
      ..cubicTo(size.width * 0.5416667, size.height * 0.7923333, size.width * 0.5423333,
          size.height * 0.7956667, size.width * 0.5440000, size.height * 0.7983333)
      ..cubicTo(size.width * 0.5466667, size.height * 0.8050000, size.width * 0.5516667,
          size.height * 0.8100000, size.width * 0.5586667, size.height * 0.8130000)
      ..cubicTo(size.width * 0.5626667, size.height * 0.8146667, size.width * 0.5663333,
          size.height * 0.8156667, size.width * 0.5703333, size.height * 0.8156667)
      ..cubicTo(size.width * 0.5723333, size.height * 0.8156667, size.width * 0.5756667,
          size.height * 0.8150000, size.width * 0.5803333, size.height * 0.8136667)
      ..cubicTo(size.width * 0.5876667, size.height * 0.8106667, size.width * 0.5926667,
          size.height * 0.8060000, size.width * 0.5953333, size.height * 0.7990000)
      ..cubicTo(size.width * 0.5980000, size.height * 0.7916667, size.width * 0.5980000,
          size.height * 0.7846667, size.width * 0.5953333, size.height * 0.7780000)
      ..cubicTo(size.width * 0.5926667, size.height * 0.7713333, size.width * 0.5880000,
          size.height * 0.7663333, size.width * 0.5813333, size.height * 0.7630000)
      ..cubicTo(size.width * 0.5740000, size.height * 0.7596667, size.width * 0.5666667,
          size.height * 0.7593333, size.width * 0.5596667, size.height * 0.7623333)
      ..cubicTo(size.width * 0.5523333, size.height * 0.7650000, size.width * 0.5473333,
          size.height * 0.7703333, size.width * 0.5440000, size.height * 0.7776667)
      ..cubicTo(size.width * 0.5423333, size.height * 0.7803333, size.width * 0.5416667,
          size.height * 0.7836667, size.width * 0.5416667, size.height * 0.7880000)
      ..close()
      ..moveTo(size.width * 0.5656667, size.height * 0.7026667)
      ..cubicTo(size.width * 0.5656667, size.height * 0.7080000, size.width * 0.5673333,
          size.height * 0.7133333, size.width * 0.5706667, size.height * 0.7180000)
      ..cubicTo(size.width * 0.5740000, size.height * 0.7226667, size.width * 0.5790000,
          size.height * 0.7263333, size.width * 0.5856667, size.height * 0.7283333)
      ..cubicTo(size.width * 0.5913333, size.height * 0.7290000, size.width * 0.5943333,
          size.height * 0.7293333, size.width * 0.5946667, size.height * 0.7293333)
      ..cubicTo(size.width * 0.6083333, size.height * 0.7293333, size.width * 0.6166667,
          size.height * 0.7226667, size.width * 0.6203333, size.height * 0.7090000)
      ..lineTo(size.width * 0.6493333, size.height * 0.6033333)
      ..cubicTo(size.width * 0.6513333, size.height * 0.5953333, size.width * 0.6506667,
          size.height * 0.5883333, size.width * 0.6470000, size.height * 0.5816667)
      ..cubicTo(size.width * 0.6433333, size.height * 0.5753333, size.width * 0.6376667,
          size.height * 0.5710000, size.width * 0.6303333, size.height * 0.5686667)
      ..cubicTo(size.width * 0.6226667, size.height * 0.5663333, size.width * 0.6153333,
          size.height * 0.5670000, size.width * 0.6090000, size.height * 0.5710000)
      ..cubicTo(size.width * 0.6023333, size.height * 0.5746667, size.width * 0.5980000,
          size.height * 0.5803333, size.width * 0.5956667, size.height * 0.5880000)
      ..lineTo(size.width * 0.5666667, size.height * 0.6936667)
      ..cubicTo(size.width * 0.5660000, size.height * 0.6966667, size.width * 0.5656667,
          size.height * 0.6996667, size.width * 0.5656667, size.height * 0.7026667)
      ..close()
      ..moveTo(size.width * 0.5873333, size.height * 0.2943333)
      ..cubicTo(size.width * 0.5976667, size.height * 0.2753333, size.width * 0.6123333,
          size.height * 0.2606667, size.width * 0.6306667, size.height * 0.2506667)
      ..cubicTo(size.width * 0.6490000, size.height * 0.2406667, size.width * 0.6686667,
          size.height * 0.2356667, size.width * 0.6893333, size.height * 0.2360000)
      ..cubicTo(size.width * 0.6930000, size.height * 0.2360000, size.width * 0.6960000,
          size.height * 0.2363333, size.width * 0.6976667, size.height * 0.2366667)
      ..lineTo(size.width * 0.6976667, size.height * 0.2470000)
      ..cubicTo(size.width * 0.6976667, size.height * 0.2796667, size.width * 0.7063333,
          size.height * 0.3100000, size.width * 0.7236667, size.height * 0.3386667)
      ..cubicTo(size.width * 0.7410000, size.height * 0.3673333, size.width * 0.7653333,
          size.height * 0.3890000, size.width * 0.7960000, size.height * 0.4036667)
      ..cubicTo(size.width * 0.7896667, size.height * 0.4183333, size.width * 0.7813333,
          size.height * 0.4300000, size.width * 0.7710000, size.height * 0.4393333)
      ..cubicTo(size.width * 0.7416667, size.height * 0.4130000, size.width * 0.7056667,
          size.height * 0.4000000, size.width * 0.6626667, size.height * 0.4000000)
      ..lineTo(size.width * 0.6520000, size.height * 0.4000000)
      ..cubicTo(size.width * 0.6433333, size.height * 0.3583333, size.width * 0.6220000,
          size.height * 0.3230000, size.width * 0.5873333, size.height * 0.2943333)
      ..close();
  }

  Path _nightLightningPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1373333, size.height * 0.5636667)
      ..cubicTo(size.width * 0.1373333, size.height * 0.6080000, size.width * 0.1526667,
          size.height * 0.6463333, size.width * 0.1836667, size.height * 0.6780000)
      ..cubicTo(size.width * 0.2146667, size.height * 0.7096667, size.width * 0.2523333,
          size.height * 0.7270000, size.width * 0.2970000, size.height * 0.7290000)
      ..cubicTo(size.width * 0.3006667, size.height * 0.7290000, size.width * 0.3026667,
          size.height * 0.7270000, size.width * 0.3026667, size.height * 0.7233333)
      ..lineTo(size.width * 0.3026667, size.height * 0.6776667)
      ..cubicTo(size.width * 0.3026667, size.height * 0.6736667, size.width * 0.3006667,
          size.height * 0.6716667, size.width * 0.2970000, size.height * 0.6716667)
      ..cubicTo(size.width * 0.2680000, size.height * 0.6693333, size.width * 0.2436667,
          size.height * 0.6580000, size.width * 0.2240000, size.height * 0.6370000)
      ..cubicTo(size.width * 0.2043333, size.height * 0.6163333, size.width * 0.1943333,
          size.height * 0.5916667, size.width * 0.1943333, size.height * 0.5633333)
      ..cubicTo(size.width * 0.1943333, size.height * 0.5353333, size.width * 0.2036667,
          size.height * 0.5110000, size.width * 0.2226667, size.height * 0.4903333)
      ..cubicTo(size.width * 0.2416667, size.height * 0.4696667, size.width * 0.2646667,
          size.height * 0.4580000, size.width * 0.2926667, size.height * 0.4556667)
      ..lineTo(size.width * 0.3103333, size.height * 0.4533333)
      ..cubicTo(size.width * 0.3146667, size.height * 0.4533333, size.width * 0.3170000,
          size.height * 0.4513333, size.width * 0.3170000, size.height * 0.4476667)
      ..lineTo(size.width * 0.3193333, size.height * 0.4303333)
      ..cubicTo(size.width * 0.3230000, size.height * 0.3943333, size.width * 0.3380000,
          size.height * 0.3640000, size.width * 0.3650000, size.height * 0.3400000)
      ..cubicTo(size.width * 0.3920000, size.height * 0.3156667, size.width * 0.4236667,
          size.height * 0.3036667, size.width * 0.4600000, size.height * 0.3036667)
      ..cubicTo(size.width * 0.4963333, size.height * 0.3036667, size.width * 0.5280000,
          size.height * 0.3156667, size.width * 0.5550000, size.height * 0.3400000)
      ..cubicTo(size.width * 0.5820000, size.height * 0.3640000, size.width * 0.5973333,
          size.height * 0.3943333, size.width * 0.6013333, size.height * 0.4306667)
      ..lineTo(size.width * 0.6036667, size.height * 0.4500000)
      ..cubicTo(size.width * 0.6036667, size.height * 0.4540000, size.width * 0.6056667,
          size.height * 0.4560000, size.width * 0.6096667, size.height * 0.4560000)
      ..lineTo(size.width * 0.6633333, size.height * 0.4560000)
      ..cubicTo(size.width * 0.6936667, size.height * 0.4560000, size.width * 0.7193333,
          size.height * 0.4666667, size.width * 0.7406667, size.height * 0.4876667)
      ..cubicTo(size.width * 0.7620000, size.height * 0.5086667, size.width * 0.7726667,
          size.height * 0.5340000, size.width * 0.7726667, size.height * 0.5636667)
      ..cubicTo(size.width * 0.7726667, size.height * 0.5920000, size.width * 0.7626667,
          size.height * 0.6166667, size.width * 0.7430000, size.height * 0.6373333)
      ..cubicTo(size.width * 0.7233333, size.height * 0.6580000, size.width * 0.6990000,
          size.height * 0.6696667, size.width * 0.6700000, size.height * 0.6720000)
      ..cubicTo(size.width * 0.6656667, size.height * 0.6720000, size.width * 0.6633333,
          size.height * 0.6740000, size.width * 0.6633333, size.height * 0.6780000)
      ..lineTo(size.width * 0.6633333, size.height * 0.7236667)
      ..cubicTo(size.width * 0.6633333, size.height * 0.7273333, size.width * 0.6656667,
          size.height * 0.7293333, size.width * 0.6700000, size.height * 0.7293333)
      ..cubicTo(size.width * 0.7143333, size.height * 0.7280000, size.width * 0.7520000,
          size.height * 0.7110000, size.width * 0.7826667, size.height * 0.6790000)
      ..cubicTo(size.width * 0.8133333, size.height * 0.6470000, size.width * 0.8286667,
          size.height * 0.6086667, size.width * 0.8286667, size.height * 0.5640000)
      ..cubicTo(size.width * 0.8286667, size.height * 0.5343333, size.width * 0.8210000,
          size.height * 0.5066667, size.width * 0.8060000, size.height * 0.4813333)
      ..cubicTo(size.width * 0.8326667, size.height * 0.4573333, size.width * 0.8500000,
          size.height * 0.4286667, size.width * 0.8576667, size.height * 0.3953333)
      ..lineTo(size.width * 0.8626667, size.height * 0.3713333)
      ..cubicTo(size.width * 0.8630000, size.height * 0.3710000, size.width * 0.8630000,
          size.height * 0.3703333, size.width * 0.8630000, size.height * 0.3690000)
      ..cubicTo(size.width * 0.8630000, size.height * 0.3666667, size.width * 0.8613333,
          size.height * 0.3646667, size.width * 0.8576667, size.height * 0.3636667)
      ..lineTo(size.width * 0.8383333, size.height * 0.3580000)
      ..cubicTo(size.width * 0.8193333, size.height * 0.3526667, size.width * 0.8033333,
          size.height * 0.3433333, size.width * 0.7900000, size.height * 0.3306667)
      ..cubicTo(size.width * 0.7766667, size.height * 0.3176667, size.width * 0.7673333,
          size.height * 0.3040000, size.width * 0.7616667, size.height * 0.2896667)
      ..cubicTo(size.width * 0.7560000, size.height * 0.2753333, size.width * 0.7533333,
          size.height * 0.2606667, size.width * 0.7533333, size.height * 0.2456667)
      ..cubicTo(size.width * 0.7533333, size.height * 0.2376667, size.width * 0.7543333,
          size.height * 0.2286667, size.width * 0.7563333, size.height * 0.2193333)
      ..lineTo(size.width * 0.7610000, size.height * 0.1986667)
      ..cubicTo(size.width * 0.7620000, size.height * 0.1956667, size.width * 0.7603333,
          size.height * 0.1930000, size.width * 0.7563333, size.height * 0.1913333)
      ..lineTo(size.width * 0.7300000, size.height * 0.1833333)
      ..cubicTo(size.width * 0.7153333, size.height * 0.1796667, size.width * 0.7016667,
          size.height * 0.1780000, size.width * 0.6883333, size.height * 0.1780000)
      ..cubicTo(size.width * 0.6763333, size.height * 0.1780000, size.width * 0.6640000,
          size.height * 0.1793333, size.width * 0.6510000, size.height * 0.1823333)
      ..cubicTo(size.width * 0.6383333, size.height * 0.1853333, size.width * 0.6250000,
          size.height * 0.1896667, size.width * 0.6113333, size.height * 0.1960000)
      ..cubicTo(size.width * 0.5976667, size.height * 0.2020000, size.width * 0.5843333,
          size.height * 0.2110000, size.width * 0.5713333, size.height * 0.2226667)
      ..cubicTo(size.width * 0.5583333, size.height * 0.2343333, size.width * 0.5473333,
          size.height * 0.2476667, size.width * 0.5380000, size.height * 0.2633333)
      ..cubicTo(size.width * 0.5143333, size.height * 0.2533333, size.width * 0.4886667,
          size.height * 0.2483333, size.width * 0.4603333, size.height * 0.2483333)
      ..cubicTo(size.width * 0.4133333, size.height * 0.2483333, size.width * 0.3716667,
          size.height * 0.2630000, size.width * 0.3353333, size.height * 0.2920000)
      ..cubicTo(size.width * 0.2990000, size.height * 0.3210000, size.width * 0.2756667,
          size.height * 0.3583333, size.width * 0.2653333, size.height * 0.4036667)
      ..cubicTo(size.width * 0.2286667, size.height * 0.4123333, size.width * 0.1983333,
          size.height * 0.4316667, size.width * 0.1743333, size.height * 0.4616667)
      ..cubicTo(size.width * 0.1493333, size.height * 0.4913333, size.width * 0.1373333,
          size.height * 0.5253333, size.width * 0.1373333, size.height * 0.5636667)
      ..close()
      ..moveTo(size.width * 0.3930000, size.height * 0.7186667)
      ..cubicTo(size.width * 0.3913333, size.height * 0.7233333, size.width * 0.3930000,
          size.height * 0.7260000, size.width * 0.3976667, size.height * 0.7260000)
      ..lineTo(size.width * 0.4696667, size.height * 0.7260000)
      ..lineTo(size.width * 0.4260000, size.height * 0.8640000)
      ..lineTo(size.width * 0.4360000, size.height * 0.8640000)
      ..lineTo(size.width * 0.5750000, size.height * 0.6776667)
      ..cubicTo(size.width * 0.5763333, size.height * 0.6763333, size.width * 0.5766667,
          size.height * 0.6746667, size.width * 0.5760000, size.height * 0.6730000)
      ..cubicTo(size.width * 0.5753333, size.height * 0.6713333, size.width * 0.5740000,
          size.height * 0.6706667, size.width * 0.5716667, size.height * 0.6706667)
      ..lineTo(size.width * 0.4983333, size.height * 0.6706667)
      ..lineTo(size.width * 0.5753333, size.height * 0.5303333)
      ..cubicTo(size.width * 0.5776667, size.height * 0.5256667, size.width * 0.5760000,
          size.height * 0.5230000, size.width * 0.5706667, size.height * 0.5230000)
      ..lineTo(size.width * 0.4726667, size.height * 0.5230000)
      ..cubicTo(size.width * 0.4700000, size.height * 0.5230000, size.width * 0.4676667,
          size.height * 0.5246667, size.width * 0.4653333, size.height * 0.5276667)
      ..lineTo(size.width * 0.3930000, size.height * 0.7186667)
      ..close()
      ..moveTo(size.width * 0.5866667, size.height * 0.2936667)
      ..cubicTo(size.width * 0.5976667, size.height * 0.2746667, size.width * 0.6123333,
          size.height * 0.2603333, size.width * 0.6310000, size.height * 0.2503333)
      ..cubicTo(size.width * 0.6493333, size.height * 0.2403333, size.width * 0.6686667,
          size.height * 0.2353333, size.width * 0.6883333, size.height * 0.2353333)
      ..cubicTo(size.width * 0.6926667, size.height * 0.2353333, size.width * 0.6956667,
          size.height * 0.2356667, size.width * 0.6973333, size.height * 0.2360000)
      ..lineTo(size.width * 0.6973333, size.height * 0.2463333)
      ..cubicTo(size.width * 0.6973333, size.height * 0.2783333, size.width * 0.7060000,
          size.height * 0.3086667, size.width * 0.7233333, size.height * 0.3373333)
      ..cubicTo(size.width * 0.7406667, size.height * 0.3660000, size.width * 0.7646667,
          size.height * 0.3876667, size.width * 0.7956667, size.height * 0.4026667)
      ..cubicTo(size.width * 0.7903333, size.height * 0.4150000, size.width * 0.7820000,
          size.height * 0.4270000, size.width * 0.7706667, size.height * 0.4383333)
      ..cubicTo(size.width * 0.7400000, size.height * 0.4120000, size.width * 0.7043333,
          size.height * 0.3990000, size.width * 0.6633333, size.height * 0.3990000)
      ..lineTo(size.width * 0.6526667, size.height * 0.3990000)
      ..cubicTo(size.width * 0.6430000, size.height * 0.3570000, size.width * 0.6210000,
          size.height * 0.3220000, size.width * 0.5866667, size.height * 0.2936667)
      ..close();
  }

  Path _nightRainPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1356667, size.height * 0.5633333)
      ..cubicTo(size.width * 0.1356667, size.height * 0.6076667, size.width * 0.1513333,
          size.height * 0.6460000, size.width * 0.1823333, size.height * 0.6780000)
      ..cubicTo(size.width * 0.2133333, size.height * 0.7100000, size.width * 0.2513333,
          size.height * 0.7270000, size.width * 0.2956667, size.height * 0.7290000)
      ..cubicTo(size.width * 0.2996667, size.height * 0.7290000, size.width * 0.3016667,
          size.height * 0.7270000, size.width * 0.3016667, size.height * 0.7233333)
      ..lineTo(size.width * 0.3016667, size.height * 0.6786667)
      ..cubicTo(size.width * 0.3016667, size.height * 0.6750000, size.width * 0.2996667,
          size.height * 0.6730000, size.width * 0.2956667, size.height * 0.6730000)
      ..cubicTo(size.width * 0.2670000, size.height * 0.6713333, size.width * 0.2426667,
          size.height * 0.6600000, size.width * 0.2226667, size.height * 0.6386667)
      ..cubicTo(size.width * 0.2026667, size.height * 0.6173333, size.width * 0.1926667,
          size.height * 0.5923333, size.width * 0.1926667, size.height * 0.5633333)
      ..cubicTo(size.width * 0.1926667, size.height * 0.5356667, size.width * 0.2020000,
          size.height * 0.5116667, size.width * 0.2210000, size.height * 0.4910000)
      ..cubicTo(size.width * 0.2400000, size.height * 0.4703333, size.width * 0.2633333,
          size.height * 0.4586667, size.width * 0.2910000, size.height * 0.4553333)
      ..lineTo(size.width * 0.3086667, size.height * 0.4540000)
      ..cubicTo(size.width * 0.3130000, size.height * 0.4540000, size.width * 0.3153333,
          size.height * 0.4520000, size.width * 0.3153333, size.height * 0.4483333)
      ..lineTo(size.width * 0.3176667, size.height * 0.4303333)
      ..cubicTo(size.width * 0.3213333, size.height * 0.3943333, size.width * 0.3366667,
          size.height * 0.3640000, size.width * 0.3636667, size.height * 0.3396667)
      ..cubicTo(size.width * 0.3906667, size.height * 0.3153333, size.width * 0.4226667,
          size.height * 0.3030000, size.width * 0.4590000, size.height * 0.3030000)
      ..cubicTo(size.width * 0.4953333, size.height * 0.3030000, size.width * 0.5270000,
          size.height * 0.3153333, size.width * 0.5543333, size.height * 0.3396667)
      ..cubicTo(size.width * 0.5816667, size.height * 0.3640000, size.width * 0.5970000,
          size.height * 0.3943333, size.width * 0.6010000, size.height * 0.4303333)
      ..lineTo(size.width * 0.6036667, size.height * 0.4493333)
      ..cubicTo(size.width * 0.6036667, size.height * 0.4533333, size.width * 0.6056667,
          size.height * 0.4553333, size.width * 0.6093333, size.height * 0.4553333)
      ..lineTo(size.width * 0.6633333, size.height * 0.4553333)
      ..cubicTo(size.width * 0.6930000, size.height * 0.4553333, size.width * 0.7190000,
          size.height * 0.4660000, size.width * 0.7406667, size.height * 0.4873333)
      ..cubicTo(size.width * 0.7623333, size.height * 0.5086667, size.width * 0.7733333,
          size.height * 0.5340000, size.width * 0.7733333, size.height * 0.5633333)
      ..cubicTo(size.width * 0.7733333, size.height * 0.5923333, size.width * 0.7633333,
          size.height * 0.6173333, size.width * 0.7433333, size.height * 0.6386667)
      ..cubicTo(size.width * 0.7233333, size.height * 0.6600000, size.width * 0.6990000,
          size.height * 0.6713333, size.width * 0.6703333, size.height * 0.6730000)
      ..cubicTo(size.width * 0.6656667, size.height * 0.6730000, size.width * 0.6633333,
          size.height * 0.6750000, size.width * 0.6633333, size.height * 0.6786667)
      ..lineTo(size.width * 0.6633333, size.height * 0.7233333)
      ..cubicTo(size.width * 0.6633333, size.height * 0.7270000, size.width * 0.6656667,
          size.height * 0.7290000, size.width * 0.6703333, size.height * 0.7290000)
      ..cubicTo(size.width * 0.7146667, size.height * 0.7276667, size.width * 0.7523333,
          size.height * 0.7106667, size.width * 0.7830000, size.height * 0.6786667)
      ..cubicTo(size.width * 0.8140000, size.height * 0.6463333, size.width * 0.8293333,
          size.height * 0.6080000, size.width * 0.8293333, size.height * 0.5636667)
      ..cubicTo(size.width * 0.8293333, size.height * 0.5343333, size.width * 0.8216667,
          size.height * 0.5070000, size.width * 0.8066667, size.height * 0.4816667)
      ..cubicTo(size.width * 0.8336667, size.height * 0.4573333, size.width * 0.8510000,
          size.height * 0.4283333, size.width * 0.8593333, size.height * 0.3943333)
      ..lineTo(size.width * 0.8640000, size.height * 0.3703333)
      ..cubicTo(size.width * 0.8643333, size.height * 0.3700000, size.width * 0.8646667,
          size.height * 0.3693333, size.width * 0.8646667, size.height * 0.3680000)
      ..cubicTo(size.width * 0.8646667, size.height * 0.3656667, size.width * 0.8630000,
          size.height * 0.3636667, size.width * 0.8593333, size.height * 0.3626667)
      ..lineTo(size.width * 0.8406667, size.height * 0.3566667)
      ..cubicTo(size.width * 0.8216667, size.height * 0.3513333, size.width * 0.8053333,
          size.height * 0.3420000, size.width * 0.7920000, size.height * 0.3290000)
      ..cubicTo(size.width * 0.7783333, size.height * 0.3160000, size.width * 0.7686667,
          size.height * 0.3023333, size.width * 0.7630000, size.height * 0.2880000)
      ..cubicTo(size.width * 0.7573333, size.height * 0.2736667, size.width * 0.7543333,
          size.height * 0.2593333, size.width * 0.7543333, size.height * 0.2453333)
      ..cubicTo(size.width * 0.7536667, size.height * 0.2380000, size.width * 0.7546667,
          size.height * 0.2286667, size.width * 0.7570000, size.height * 0.2180000)
      ..lineTo(size.width * 0.7616667, size.height * 0.1976667)
      ..cubicTo(size.width * 0.7630000, size.height * 0.1943333, size.width * 0.7616667,
          size.height * 0.1916667, size.width * 0.7570000, size.height * 0.1896667)
      ..lineTo(size.width * 0.7306667, size.height * 0.1816667)
      ..cubicTo(size.width * 0.7156667, size.height * 0.1783333, size.width * 0.7016667,
          size.height * 0.1766667, size.width * 0.6883333, size.height * 0.1766667)
      ..cubicTo(size.width * 0.6756667, size.height * 0.1766667, size.width * 0.6630000,
          size.height * 0.1780000, size.width * 0.6503333, size.height * 0.1810000)
      ..cubicTo(size.width * 0.6373333, size.height * 0.1840000, size.width * 0.6240000,
          size.height * 0.1883333, size.width * 0.6103333, size.height * 0.1946667)
      ..cubicTo(size.width * 0.5966667, size.height * 0.2006667, size.width * 0.5833333,
          size.height * 0.2096667, size.width * 0.5703333, size.height * 0.2213333)
      ..cubicTo(size.width * 0.5573333, size.height * 0.2330000, size.width * 0.5463333,
          size.height * 0.2463333, size.width * 0.5370000, size.height * 0.2620000)
      ..cubicTo(size.width * 0.5096667, size.height * 0.2520000, size.width * 0.4836667,
          size.height * 0.2470000, size.width * 0.4593333, size.height * 0.2470000)
      ..cubicTo(size.width * 0.4123333, size.height * 0.2470000, size.width * 0.3703333,
          size.height * 0.2616667, size.width * 0.3340000, size.height * 0.2910000)
      ..cubicTo(size.width * 0.2976667, size.height * 0.3203333, size.width * 0.2740000,
          size.height * 0.3576667, size.width * 0.2636667, size.height * 0.4033333)
      ..cubicTo(size.width * 0.2266667, size.height * 0.4120000, size.width * 0.1963333,
          size.height * 0.4310000, size.width * 0.1723333, size.height * 0.4610000)
      ..cubicTo(size.width * 0.1476667, size.height * 0.4906667, size.width * 0.1356667,
          size.height * 0.5250000, size.width * 0.1356667, size.height * 0.5633333)
      ..close()
      ..moveTo(size.width * 0.3210000, size.height * 0.7913333)
      ..cubicTo(size.width * 0.3210000, size.height * 0.7970000, size.width * 0.3226667,
          size.height * 0.8023333, size.width * 0.3263333, size.height * 0.8076667)
      ..cubicTo(size.width * 0.3300000, size.height * 0.8130000, size.width * 0.3353333,
          size.height * 0.8166667, size.width * 0.3426667, size.height * 0.8186667)
      ..cubicTo(size.width * 0.3503333, size.height * 0.8210000, size.width * 0.3576667,
          size.height * 0.8203333, size.width * 0.3640000, size.height * 0.8173333)
      ..cubicTo(size.width * 0.3706667, size.height * 0.8140000, size.width * 0.3750000,
          size.height * 0.8080000, size.width * 0.3773333, size.height * 0.7986667)
      ..lineTo(size.width * 0.4250000, size.height * 0.6030000)
      ..cubicTo(size.width * 0.4270000, size.height * 0.5946667, size.width * 0.4260000,
          size.height * 0.5870000, size.width * 0.4223333, size.height * 0.5806667)
      ..cubicTo(size.width * 0.4183333, size.height * 0.5740000, size.width * 0.4126667,
          size.height * 0.5700000, size.width * 0.4050000, size.height * 0.5683333)
      ..cubicTo(size.width * 0.3976667, size.height * 0.5660000, size.width * 0.3906667,
          size.height * 0.5666667, size.width * 0.3840000, size.height * 0.5706667)
      ..cubicTo(size.width * 0.3773333, size.height * 0.5743333, size.width * 0.3726667,
          size.height * 0.5800000, size.width * 0.3703333, size.height * 0.5876667)
      ..lineTo(size.width * 0.3223333, size.height * 0.7843333)
      ..cubicTo(size.width * 0.3223333, size.height * 0.7846667, size.width * 0.3220000,
          size.height * 0.7856667, size.width * 0.3216667, size.height * 0.7873333)
      ..cubicTo(size.width * 0.3213333, size.height * 0.7890000, size.width * 0.3210000,
          size.height * 0.7903333, size.width * 0.3210000, size.height * 0.7913333)
      ..close()
      ..moveTo(size.width * 0.4080000, size.height * 0.8936667)
      ..cubicTo(size.width * 0.4080000, size.height * 0.8990000, size.width * 0.4096667,
          size.height * 0.9040000, size.width * 0.4130000, size.height * 0.9090000)
      ..cubicTo(size.width * 0.4163333, size.height * 0.9140000, size.width * 0.4213333,
          size.height * 0.9173333, size.width * 0.4280000, size.height * 0.9193333)
      ..cubicTo(size.width * 0.4316667, size.height * 0.9203333, size.width * 0.4343333,
          size.height * 0.9206667, size.width * 0.4360000, size.height * 0.9206667)
      ..cubicTo(size.width * 0.4506667, size.height * 0.9206667, size.width * 0.4596667,
          size.height * 0.9140000, size.width * 0.4633333, size.height * 0.9010000)
      ..lineTo(size.width * 0.5383333, size.height * 0.6033333)
      ..cubicTo(size.width * 0.5403333, size.height * 0.5953333, size.width * 0.5396667,
          size.height * 0.5880000, size.width * 0.5360000, size.height * 0.5816667)
      ..cubicTo(size.width * 0.5323333, size.height * 0.5753333, size.width * 0.5266667,
          size.height * 0.5710000, size.width * 0.5193333, size.height * 0.5686667)
      ..cubicTo(size.width * 0.5116667, size.height * 0.5663333, size.width * 0.5043333,
          size.height * 0.5670000, size.width * 0.4973333, size.height * 0.5710000)
      ..cubicTo(size.width * 0.4903333, size.height * 0.5750000, size.width * 0.4860000,
          size.height * 0.5803333, size.width * 0.4843333, size.height * 0.5876667)
      ..lineTo(size.width * 0.4090000, size.height * 0.8850000)
      ..cubicTo(size.width * 0.4090000, size.height * 0.8853333, size.width * 0.4090000,
          size.height * 0.8866667, size.width * 0.4086667, size.height * 0.8890000)
      ..cubicTo(size.width * 0.4080000, size.height * 0.8910000, size.width * 0.4080000,
          size.height * 0.8926667, size.width * 0.4080000, size.height * 0.8936667)
      ..close()
      ..moveTo(size.width * 0.5466667, size.height * 0.7940000)
      ..cubicTo(size.width * 0.5466667, size.height * 0.8060000, size.width * 0.5536667,
          size.height * 0.8140000, size.width * 0.5676667, size.height * 0.8186667)
      ..cubicTo(size.width * 0.5723333, size.height * 0.8200000, size.width * 0.5756667,
          size.height * 0.8206667, size.width * 0.5776667, size.height * 0.8206667)
      ..cubicTo(size.width * 0.5813333, size.height * 0.8206667, size.width * 0.5853333,
          size.height * 0.8200000, size.width * 0.5893333, size.height * 0.8183333)
      ..cubicTo(size.width * 0.5963333, size.height * 0.8156667, size.width * 0.6006667,
          size.height * 0.8090000, size.width * 0.6023333, size.height * 0.7990000)
      ..lineTo(size.width * 0.6500000, size.height * 0.6033333)
      ..cubicTo(size.width * 0.6520000, size.height * 0.5953333, size.width * 0.6513333,
          size.height * 0.5883333, size.width * 0.6473333, size.height * 0.5816667)
      ..cubicTo(size.width * 0.6436667, size.height * 0.5753333, size.width * 0.6380000,
          size.height * 0.5710000, size.width * 0.6303333, size.height * 0.5686667)
      ..cubicTo(size.width * 0.6226667, size.height * 0.5663333, size.width * 0.6153333,
          size.height * 0.5670000, size.width * 0.6083333, size.height * 0.5710000)
      ..cubicTo(size.width * 0.6013333, size.height * 0.5746667, size.width * 0.5973333,
          size.height * 0.5803333, size.width * 0.5956667, size.height * 0.5880000)
      ..lineTo(size.width * 0.5480000, size.height * 0.7846667)
      ..cubicTo(size.width * 0.5473333, size.height * 0.7900000, size.width * 0.5466667,
          size.height * 0.7933333, size.width * 0.5466667, size.height * 0.7940000)
      ..close()
      ..moveTo(size.width * 0.5860000, size.height * 0.2923333)
      ..cubicTo(size.width * 0.5966667, size.height * 0.2730000, size.width * 0.6110000,
          size.height * 0.2583333, size.width * 0.6296667, size.height * 0.2480000)
      ..cubicTo(size.width * 0.6480000, size.height * 0.2380000, size.width * 0.6676667,
          size.height * 0.2330000, size.width * 0.6883333, size.height * 0.2333333)
      ..cubicTo(size.width * 0.6923333, size.height * 0.2333333, size.width * 0.6953333,
          size.height * 0.2333333, size.width * 0.6973333, size.height * 0.2336667)
      ..lineTo(size.width * 0.6973333, size.height * 0.2436667)
      ..cubicTo(size.width * 0.6970000, size.height * 0.2760000, size.width * 0.7053333,
          size.height * 0.3063333, size.width * 0.7230000, size.height * 0.3353333)
      ..cubicTo(size.width * 0.7403333, size.height * 0.3640000, size.width * 0.7650000,
          size.height * 0.3860000, size.width * 0.7966667, size.height * 0.4010000)
      ..cubicTo(size.width * 0.7893333, size.height * 0.4163333, size.width * 0.7803333,
          size.height * 0.4280000, size.width * 0.7703333, size.height * 0.4366667)
      ..cubicTo(size.width * 0.7396667, size.height * 0.4113333, size.width * 0.7040000,
          size.height * 0.3990000, size.width * 0.6626667, size.height * 0.3990000)
      ..lineTo(size.width * 0.6523333, size.height * 0.3990000)
      ..cubicTo(size.width * 0.6433333, size.height * 0.3566667, size.width * 0.6213333,
          size.height * 0.3213333, size.width * 0.5860000, size.height * 0.2923333)
      ..close();
  }

  Path _nightRainMixPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1356667, size.height * 0.5643333)
      ..cubicTo(size.width * 0.1356667, size.height * 0.6086667, size.width * 0.1513333,
          size.height * 0.6466667, size.width * 0.1823333, size.height * 0.6786667)
      ..cubicTo(size.width * 0.2133333, size.height * 0.7106667, size.width * 0.2513333,
          size.height * 0.7276667, size.width * 0.2956667, size.height * 0.7290000)
      ..cubicTo(size.width * 0.2996667, size.height * 0.7290000, size.width * 0.3016667,
          size.height * 0.7270000, size.width * 0.3016667, size.height * 0.7233333)
      ..lineTo(size.width * 0.3016667, size.height * 0.6786667)
      ..cubicTo(size.width * 0.3016667, size.height * 0.6750000, size.width * 0.2996667,
          size.height * 0.6730000, size.width * 0.2956667, size.height * 0.6730000)
      ..cubicTo(size.width * 0.2673333, size.height * 0.6716667, size.width * 0.2430000,
          size.height * 0.6600000, size.width * 0.2230000, size.height * 0.6386667)
      ..cubicTo(size.width * 0.2030000, size.height * 0.6173333, size.width * 0.1926667,
          size.height * 0.5923333, size.width * 0.1926667, size.height * 0.5643333)
      ..cubicTo(size.width * 0.1926667, size.height * 0.5360000, size.width * 0.2020000,
          size.height * 0.5113333, size.width * 0.2210000, size.height * 0.4906667)
      ..cubicTo(size.width * 0.2400000, size.height * 0.4700000, size.width * 0.2633333,
          size.height * 0.4583333, size.width * 0.2910000, size.height * 0.4560000)
      ..lineTo(size.width * 0.3086667, size.height * 0.4536667)
      ..cubicTo(size.width * 0.3130000, size.height * 0.4536667, size.width * 0.3153333,
          size.height * 0.4516667, size.width * 0.3153333, size.height * 0.4476667)
      ..lineTo(size.width * 0.3176667, size.height * 0.4306667)
      ..cubicTo(size.width * 0.3213333, size.height * 0.3940000, size.width * 0.3363333,
          size.height * 0.3633333, size.width * 0.3633333, size.height * 0.3390000)
      ..cubicTo(size.width * 0.3903333, size.height * 0.3146667, size.width * 0.4220000,
          size.height * 0.3023333, size.width * 0.4586667, size.height * 0.3023333)
      ..cubicTo(size.width * 0.4950000, size.height * 0.3023333, size.width * 0.5266667,
          size.height * 0.3146667, size.width * 0.5540000, size.height * 0.3390000)
      ..cubicTo(size.width * 0.5813333, size.height * 0.3633333, size.width * 0.5970000,
          size.height * 0.3936667, size.width * 0.6006667, size.height * 0.4296667)
      ..lineTo(size.width * 0.6030000, size.height * 0.4486667)
      ..cubicTo(size.width * 0.6030000, size.height * 0.4526667, size.width * 0.6050000,
          size.height * 0.4550000, size.width * 0.6086667, size.height * 0.4550000)
      ..lineTo(size.width * 0.6626667, size.height * 0.4550000)
      ..cubicTo(size.width * 0.6930000, size.height * 0.4550000, size.width * 0.7186667,
          size.height * 0.4656667, size.width * 0.7403333, size.height * 0.4873333)
      ..cubicTo(size.width * 0.7620000, size.height * 0.5086667, size.width * 0.7726667,
          size.height * 0.5343333, size.width * 0.7726667, size.height * 0.5643333)
      ..cubicTo(size.width * 0.7726667, size.height * 0.5826667, size.width * 0.7680000,
          size.height * 0.6000000, size.width * 0.7590000, size.height * 0.6163333)
      ..cubicTo(size.width * 0.7500000, size.height * 0.6326667, size.width * 0.7373333,
          size.height * 0.6460000, size.width * 0.7213333, size.height * 0.6563333)
      ..cubicTo(size.width * 0.7053333, size.height * 0.6666667, size.width * 0.6880000,
          size.height * 0.6723333, size.width * 0.6693333, size.height * 0.6733333)
      ..cubicTo(size.width * 0.6650000, size.height * 0.6733333, size.width * 0.6626667,
          size.height * 0.6753333, size.width * 0.6626667, size.height * 0.6790000)
      ..lineTo(size.width * 0.6626667, size.height * 0.7236667)
      ..cubicTo(size.width * 0.6626667, size.height * 0.7273333, size.width * 0.6650000,
          size.height * 0.7293333, size.width * 0.6693333, size.height * 0.7293333)
      ..cubicTo(size.width * 0.6986667, size.height * 0.7286667, size.width * 0.7256667,
          size.height * 0.7206667, size.width * 0.7500000, size.height * 0.7056667)
      ..cubicTo(size.width * 0.7743333, size.height * 0.6906667, size.width * 0.7936667,
          size.height * 0.6706667, size.width * 0.8076667, size.height * 0.6456667)
      ..cubicTo(size.width * 0.8216667, size.height * 0.6206667, size.width * 0.8286667,
          size.height * 0.5936667, size.width * 0.8286667, size.height * 0.5646667)
      ..cubicTo(size.width * 0.8286667, size.height * 0.5353333, size.width * 0.8210000,
          size.height * 0.5073333, size.width * 0.8060000, size.height * 0.4810000)
      ..cubicTo(size.width * 0.8336667, size.height * 0.4563333, size.width * 0.8513333,
          size.height * 0.4270000, size.width * 0.8586667, size.height * 0.3936667)
      ..lineTo(size.width * 0.8633333, size.height * 0.3710000)
      ..cubicTo(size.width * 0.8640000, size.height * 0.3703333, size.width * 0.8643333,
          size.height * 0.3696667, size.width * 0.8643333, size.height * 0.3686667)
      ..cubicTo(size.width * 0.8643333, size.height * 0.3666667, size.width * 0.8623333,
          size.height * 0.3650000, size.width * 0.8586667, size.height * 0.3633333)
      ..lineTo(size.width * 0.8403333, size.height * 0.3573333)
      ..cubicTo(size.width * 0.8213333, size.height * 0.3516667, size.width * 0.8046667,
          size.height * 0.3423333, size.width * 0.7913333, size.height * 0.3290000)
      ..cubicTo(size.width * 0.7776667, size.height * 0.3156667, size.width * 0.7680000,
          size.height * 0.3020000, size.width * 0.7623333, size.height * 0.2873333)
      ..cubicTo(size.width * 0.7566667, size.height * 0.2730000, size.width * 0.7536667,
          size.height * 0.2586667, size.width * 0.7536667, size.height * 0.2443333)
      ..cubicTo(size.width * 0.7530000, size.height * 0.2373333, size.width * 0.7540000,
          size.height * 0.2280000, size.width * 0.7566667, size.height * 0.2170000)
      ..lineTo(size.width * 0.7610000, size.height * 0.1976667)
      ..cubicTo(size.width * 0.7623333, size.height * 0.1943333, size.width * 0.7610000,
          size.height * 0.1916667, size.width * 0.7566667, size.height * 0.1900000)
      ..lineTo(size.width * 0.7300000, size.height * 0.1820000)
      ..cubicTo(size.width * 0.7163333, size.height * 0.1783333, size.width * 0.7020000,
          size.height * 0.1763333, size.width * 0.6870000, size.height * 0.1763333)
      ..cubicTo(size.width * 0.6750000, size.height * 0.1763333, size.width * 0.6623333,
          size.height * 0.1776667, size.width * 0.6496667, size.height * 0.1806667)
      ..cubicTo(size.width * 0.6370000, size.height * 0.1836667, size.width * 0.6236667,
          size.height * 0.1880000, size.width * 0.6100000, size.height * 0.1943333)
      ..cubicTo(size.width * 0.5963333, size.height * 0.2006667, size.width * 0.5830000,
          size.height * 0.2096667, size.width * 0.5700000, size.height * 0.2213333)
      ..cubicTo(size.width * 0.5570000, size.height * 0.2330000, size.width * 0.5460000,
          size.height * 0.2466667, size.width * 0.5366667, size.height * 0.2623333)
      ..cubicTo(size.width * 0.5096667, size.height * 0.2520000, size.width * 0.4833333,
          size.height * 0.2470000, size.width * 0.4583333, size.height * 0.2470000)
      ..cubicTo(size.width * 0.4113333, size.height * 0.2470000, size.width * 0.3693333,
          size.height * 0.2616667, size.width * 0.3330000, size.height * 0.2910000)
      ..cubicTo(size.width * 0.2966667, size.height * 0.3203333, size.width * 0.2730000,
          size.height * 0.3576667, size.width * 0.2626667, size.height * 0.4033333)
      ..cubicTo(size.width * 0.2253333, size.height * 0.4130000, size.width * 0.1946667,
          size.height * 0.4326667, size.width * 0.1710000, size.height * 0.4623333)
      ..cubicTo(size.width * 0.1473333, size.height * 0.4913333, size.width * 0.1356667,
          size.height * 0.5256667, size.width * 0.1356667, size.height * 0.5643333)
      ..close()
      ..moveTo(size.width * 0.3160000, size.height * 0.7993333)
      ..cubicTo(size.width * 0.3160000, size.height * 0.8050000, size.width * 0.3176667,
          size.height * 0.8106667, size.width * 0.3213333, size.height * 0.8163333)
      ..cubicTo(size.width * 0.3250000, size.height * 0.8220000, size.width * 0.3303333,
          size.height * 0.8256667, size.width * 0.3370000, size.height * 0.8280000)
      ..cubicTo(size.width * 0.3446667, size.height * 0.8303333, size.width * 0.3516667,
          size.height * 0.8300000, size.width * 0.3583333, size.height * 0.8266667)
      ..cubicTo(size.width * 0.3650000, size.height * 0.8233333, size.width * 0.3690000,
          size.height * 0.8173333, size.width * 0.3713333, size.height * 0.8080000)
      ..lineTo(size.width * 0.3760000, size.height * 0.7876667)
      ..cubicTo(size.width * 0.3776667, size.height * 0.7800000, size.width * 0.3766667,
          size.height * 0.7730000, size.width * 0.3730000, size.height * 0.7666667)
      ..cubicTo(size.width * 0.3693333, size.height * 0.7600000, size.width * 0.3636667,
          size.height * 0.7556667, size.width * 0.3556667, size.height * 0.7533333)
      ..cubicTo(size.width * 0.3480000, size.height * 0.7510000, size.width * 0.3410000,
          size.height * 0.7520000, size.width * 0.3343333, size.height * 0.7560000)
      ..cubicTo(size.width * 0.3276667, size.height * 0.7600000, size.width * 0.3230000,
          size.height * 0.7660000, size.width * 0.3210000, size.height * 0.7736667)
      ..lineTo(size.width * 0.3166667, size.height * 0.7930000)
      ..cubicTo(size.width * 0.3160000, size.height * 0.7943333, size.width * 0.3160000,
          size.height * 0.7963333, size.width * 0.3160000, size.height * 0.7993333)
      ..close()
      ..moveTo(size.width * 0.3413333, size.height * 0.7026667)
      ..cubicTo(size.width * 0.3413333, size.height * 0.7096667, size.width * 0.3440000,
          size.height * 0.7160000, size.width * 0.3496667, size.height * 0.7216667)
      ..cubicTo(size.width * 0.3550000, size.height * 0.7273333, size.width * 0.3610000,
          size.height * 0.7300000, size.width * 0.3683333, size.height * 0.7300000)
      ..cubicTo(size.width * 0.3763333, size.height * 0.7300000, size.width * 0.3830000,
          size.height * 0.7273333, size.width * 0.3883333, size.height * 0.7220000)
      ..cubicTo(size.width * 0.3936667, size.height * 0.7166667, size.width * 0.3963333,
          size.height * 0.7103333, size.width * 0.3963333, size.height * 0.7023333)
      ..cubicTo(size.width * 0.3963333, size.height * 0.6946667, size.width * 0.3936667,
          size.height * 0.6880000, size.width * 0.3883333, size.height * 0.6826667)
      ..cubicTo(size.width * 0.3830000, size.height * 0.6773333, size.width * 0.3763333,
          size.height * 0.6746667, size.width * 0.3683333, size.height * 0.6746667)
      ..cubicTo(size.width * 0.3606667, size.height * 0.6746667, size.width * 0.3540000,
          size.height * 0.6773333, size.width * 0.3490000, size.height * 0.6823333)
      ..cubicTo(size.width * 0.3440000, size.height * 0.6873333, size.width * 0.3413333,
          size.height * 0.6950000, size.width * 0.3413333, size.height * 0.7026667)
      ..close()
      ..moveTo(size.width * 0.3616667, size.height * 0.6270000)
      ..cubicTo(size.width * 0.3613333, size.height * 0.6323333, size.width * 0.3626667,
          size.height * 0.6373333, size.width * 0.3663333, size.height * 0.6420000)
      ..cubicTo(size.width * 0.3696667, size.height * 0.6470000, size.width * 0.3750000,
          size.height * 0.6503333, size.width * 0.3823333, size.height * 0.6526667)
      ..cubicTo(size.width * 0.3893333, size.height * 0.6546667, size.width * 0.3960000,
          size.height * 0.6540000, size.width * 0.4030000, size.height * 0.6503333)
      ..cubicTo(size.width * 0.4100000, size.height * 0.6466667, size.width * 0.4143333,
          size.height * 0.6410000, size.width * 0.4166667, size.height * 0.6333333)
      ..lineTo(size.width * 0.4260000, size.height * 0.6033333)
      ..cubicTo(size.width * 0.4283333, size.height * 0.5953333, size.width * 0.4276667,
          size.height * 0.5880000, size.width * 0.4236667, size.height * 0.5816667)
      ..cubicTo(size.width * 0.4196667, size.height * 0.5753333, size.width * 0.4136667,
          size.height * 0.5710000, size.width * 0.4056667, size.height * 0.5686667)
      ..cubicTo(size.width * 0.3983333, size.height * 0.5663333, size.width * 0.3913333,
          size.height * 0.5670000, size.width * 0.3846667, size.height * 0.5710000)
      ..cubicTo(size.width * 0.3780000, size.height * 0.5746667, size.width * 0.3733333,
          size.height * 0.5803333, size.width * 0.3710000, size.height * 0.5876667)
      ..lineTo(size.width * 0.3630000, size.height * 0.6183333)
      ..cubicTo(size.width * 0.3630000, size.height * 0.6190000, size.width * 0.3626667,
          size.height * 0.6203333, size.width * 0.3623333, size.height * 0.6223333)
      ..cubicTo(size.width * 0.3616667, size.height * 0.6240000, size.width * 0.3616667,
          size.height * 0.6256667, size.width * 0.3616667, size.height * 0.6270000)
      ..close()
      ..moveTo(size.width * 0.4003333, size.height * 0.9033333)
      ..cubicTo(size.width * 0.4003333, size.height * 0.9093333, size.width * 0.4020000,
          size.height * 0.9146667, size.width * 0.4053333, size.height * 0.9200000)
      ..cubicTo(size.width * 0.4086667, size.height * 0.9253333, size.width * 0.4140000,
          size.height * 0.9290000, size.width * 0.4213333, size.height * 0.9310000)
      ..cubicTo(size.width * 0.4240000, size.height * 0.9316667, size.width * 0.4270000,
          size.height * 0.9320000, size.width * 0.4296667, size.height * 0.9320000)
      ..cubicTo(size.width * 0.4440000, size.height * 0.9320000, size.width * 0.4526667,
          size.height * 0.9253333, size.width * 0.4560000, size.height * 0.9116667)
      ..lineTo(size.width * 0.4606667, size.height * 0.8920000)
      ..cubicTo(size.width * 0.4626667, size.height * 0.8833333, size.width * 0.4616667,
          size.height * 0.8760000, size.width * 0.4580000, size.height * 0.8693333)
      ..cubicTo(size.width * 0.4543333, size.height * 0.8626667, size.width * 0.4483333,
          size.height * 0.8586667, size.width * 0.4406667, size.height * 0.8570000)
      ..cubicTo(size.width * 0.4336667, size.height * 0.8546667, size.width * 0.4266667,
          size.height * 0.8553333, size.width * 0.4196667, size.height * 0.8593333)
      ..cubicTo(size.width * 0.4126667, size.height * 0.8633333, size.width * 0.4083333,
          size.height * 0.8690000, size.width * 0.4060000, size.height * 0.8763333)
      ..lineTo(size.width * 0.4013333, size.height * 0.8960000)
      ..cubicTo(size.width * 0.4006667, size.height * 0.8990000, size.width * 0.4003333,
          size.height * 0.9013333, size.width * 0.4003333, size.height * 0.9033333)
      ..close()
      ..moveTo(size.width * 0.4263333, size.height * 0.8066667)
      ..cubicTo(size.width * 0.4263333, size.height * 0.8140000, size.width * 0.4290000,
          size.height * 0.8203333, size.width * 0.4346667, size.height * 0.8260000)
      ..cubicTo(size.width * 0.4400000, size.height * 0.8313333, size.width * 0.4463333,
          size.height * 0.8340000, size.width * 0.4536667, size.height * 0.8340000)
      ..cubicTo(size.width * 0.4616667, size.height * 0.8340000, size.width * 0.4680000,
          size.height * 0.8313333, size.width * 0.4733333, size.height * 0.8263333)
      ..cubicTo(size.width * 0.4786667, size.height * 0.8210000, size.width * 0.4810000,
          size.height * 0.8146667, size.width * 0.4810000, size.height * 0.8066667)
      ..cubicTo(size.width * 0.4810000, size.height * 0.7990000, size.width * 0.4783333,
          size.height * 0.7926667, size.width * 0.4733333, size.height * 0.7873333)
      ..cubicTo(size.width * 0.4683333, size.height * 0.7820000, size.width * 0.4616667,
          size.height * 0.7796667, size.width * 0.4536667, size.height * 0.7796667)
      ..cubicTo(size.width * 0.4456667, size.height * 0.7796667, size.width * 0.4393333,
          size.height * 0.7823333, size.width * 0.4340000, size.height * 0.7873333)
      ..cubicTo(size.width * 0.4290000, size.height * 0.7923333, size.width * 0.4263333,
          size.height * 0.7990000, size.width * 0.4263333, size.height * 0.8066667)
      ..close()
      ..moveTo(size.width * 0.4473333, size.height * 0.7310000)
      ..cubicTo(size.width * 0.4470000, size.height * 0.7360000, size.width * 0.4483333,
          size.height * 0.7413333, size.width * 0.4516667, size.height * 0.7466667)
      ..cubicTo(size.width * 0.4550000, size.height * 0.7520000, size.width * 0.4600000,
          size.height * 0.7553333, size.width * 0.4666667, size.height * 0.7566667)
      ..cubicTo(size.width * 0.4743333, size.height * 0.7586667, size.width * 0.4813333,
          size.height * 0.7580000, size.width * 0.4880000, size.height * 0.7546667)
      ..cubicTo(size.width * 0.4943333, size.height * 0.7513333, size.width * 0.4990000,
          size.height * 0.7450000, size.width * 0.5016667, size.height * 0.7360000)
      ..lineTo(size.width * 0.5106667, size.height * 0.7060000)
      ..cubicTo(size.width * 0.5130000, size.height * 0.6986667, size.width * 0.5123333,
          size.height * 0.6916667, size.width * 0.5083333, size.height * 0.6850000)
      ..cubicTo(size.width * 0.5043333, size.height * 0.6783333, size.width * 0.4986667,
          size.height * 0.6740000, size.width * 0.4906667, size.height * 0.6716667)
      ..cubicTo(size.width * 0.4833333, size.height * 0.6693333, size.width * 0.4763333,
          size.height * 0.6703333, size.width * 0.4693333, size.height * 0.6743333)
      ..cubicTo(size.width * 0.4623333, size.height * 0.6783333, size.width * 0.4580000,
          size.height * 0.6843333, size.width * 0.4556667, size.height * 0.6920000)
      ..lineTo(size.width * 0.4483333, size.height * 0.7220000)
      ..cubicTo(size.width * 0.4476667, size.height * 0.7246667, size.width * 0.4473333,
          size.height * 0.7276667, size.width * 0.4473333, size.height * 0.7310000)
      ..close()
      ..moveTo(size.width * 0.5390000, size.height * 0.8026667)
      ..cubicTo(size.width * 0.5390000, size.height * 0.8080000, size.width * 0.5406667,
          size.height * 0.8133333, size.width * 0.5440000, size.height * 0.8186667)
      ..cubicTo(size.width * 0.5473333, size.height * 0.8240000, size.width * 0.5526667,
          size.height * 0.8276667, size.width * 0.5593333, size.height * 0.8296667)
      ..cubicTo(size.width * 0.5603333, size.height * 0.8296667, size.width * 0.5620000,
          size.height * 0.8300000, size.width * 0.5640000, size.height * 0.8303333)
      ..cubicTo(size.width * 0.5660000, size.height * 0.8306667, size.width * 0.5673333,
          size.height * 0.8310000, size.width * 0.5686667, size.height * 0.8310000)
      ..cubicTo(size.width * 0.5823333, size.height * 0.8310000, size.width * 0.5906667,
          size.height * 0.8236667, size.width * 0.5940000, size.height * 0.8090000)
      ..lineTo(size.width * 0.5986667, size.height * 0.7890000)
      ..cubicTo(size.width * 0.6010000, size.height * 0.7820000, size.width * 0.6003333,
          size.height * 0.7750000, size.width * 0.5963333, size.height * 0.7680000)
      ..cubicTo(size.width * 0.5926667, size.height * 0.7610000, size.width * 0.5870000,
          size.height * 0.7566667, size.width * 0.5793333, size.height * 0.7543333)
      ..cubicTo(size.width * 0.5710000, size.height * 0.7523333, size.width * 0.5633333,
          size.height * 0.7530000, size.width * 0.5566667, size.height * 0.7570000)
      ..cubicTo(size.width * 0.5500000, size.height * 0.7610000, size.width * 0.5453333,
          size.height * 0.7666667, size.width * 0.5430000, size.height * 0.7746667)
      ..lineTo(size.width * 0.5400000, size.height * 0.7943333)
      ..cubicTo(size.width * 0.5400000, size.height * 0.7950000, size.width * 0.5396667,
          size.height * 0.7966667, size.width * 0.5393333, size.height * 0.7983333)
      ..cubicTo(size.width * 0.5393333, size.height * 0.8000000, size.width * 0.5390000,
          size.height * 0.8013333, size.width * 0.5390000, size.height * 0.8026667)
      ..close()
      ..moveTo(size.width * 0.5636667, size.height * 0.7040000)
      ..cubicTo(size.width * 0.5636667, size.height * 0.7113333, size.width * 0.5663333,
          size.height * 0.7180000, size.width * 0.5720000, size.height * 0.7230000)
      ..cubicTo(size.width * 0.5770000, size.height * 0.7283333, size.width * 0.5833333,
          size.height * 0.7310000, size.width * 0.5910000, size.height * 0.7310000)
      ..cubicTo(size.width * 0.5990000, size.height * 0.7310000, size.width * 0.6053333,
          size.height * 0.7283333, size.width * 0.6106667, size.height * 0.7233333)
      ..cubicTo(size.width * 0.6160000, size.height * 0.7183333, size.width * 0.6183333,
          size.height * 0.7116667, size.width * 0.6183333, size.height * 0.7040000)
      ..cubicTo(size.width * 0.6183333, size.height * 0.6960000, size.width * 0.6156667,
          size.height * 0.6896667, size.width * 0.6106667, size.height * 0.6843333)
      ..cubicTo(size.width * 0.6056667, size.height * 0.6790000, size.width * 0.5990000,
          size.height * 0.6766667, size.width * 0.5910000, size.height * 0.6766667)
      ..cubicTo(size.width * 0.5830000, size.height * 0.6766667, size.width * 0.5766667,
          size.height * 0.6793333, size.width * 0.5713333, size.height * 0.6843333)
      ..cubicTo(size.width * 0.5660000, size.height * 0.6893333, size.width * 0.5636667,
          size.height * 0.6960000, size.width * 0.5636667, size.height * 0.7040000)
      ..close()
      ..moveTo(size.width * 0.5840000, size.height * 0.6270000)
      ..cubicTo(size.width * 0.5840000, size.height * 0.6326667, size.width * 0.5856667,
          size.height * 0.6380000, size.width * 0.5893333, size.height * 0.6430000)
      ..cubicTo(size.width * 0.5930000, size.height * 0.6480000, size.width * 0.5983333,
          size.height * 0.6516667, size.width * 0.6056667, size.height * 0.6536667)
      ..cubicTo(size.width * 0.6063333, size.height * 0.6536667, size.width * 0.6076667,
          size.height * 0.6540000, size.width * 0.6096667, size.height * 0.6543333)
      ..cubicTo(size.width * 0.6116667, size.height * 0.6546667, size.width * 0.6133333,
          size.height * 0.6550000, size.width * 0.6143333, size.height * 0.6550000)
      ..cubicTo(size.width * 0.6176667, size.height * 0.6550000, size.width * 0.6216667,
          size.height * 0.6540000, size.width * 0.6263333, size.height * 0.6520000)
      ..cubicTo(size.width * 0.6333333, size.height * 0.6483333, size.width * 0.6380000,
          size.height * 0.6423333, size.width * 0.6400000, size.height * 0.6346667)
      ..lineTo(size.width * 0.6480000, size.height * 0.6046667)
      ..cubicTo(size.width * 0.6500000, size.height * 0.5970000, size.width * 0.6493333,
          size.height * 0.5900000, size.width * 0.6453333, size.height * 0.5836667)
      ..cubicTo(size.width * 0.6416667, size.height * 0.5770000, size.width * 0.6360000,
          size.height * 0.5726667, size.width * 0.6283333, size.height * 0.5703333)
      ..cubicTo(size.width * 0.6206667, size.height * 0.5680000, size.width * 0.6136667,
          size.height * 0.5686667, size.width * 0.6070000, size.height * 0.5723333)
      ..cubicTo(size.width * 0.6003333, size.height * 0.5760000, size.width * 0.5963333,
          size.height * 0.5813333, size.width * 0.5940000, size.height * 0.5893333)
      ..lineTo(size.width * 0.5846667, size.height * 0.6196667)
      ..cubicTo(size.width * 0.5846667, size.height * 0.6203333, size.width * 0.5843333,
          size.height * 0.6216667, size.width * 0.5840000, size.height * 0.6236667)
      ..cubicTo(size.width * 0.5843333, size.height * 0.6246667, size.width * 0.5840000,
          size.height * 0.6260000, size.width * 0.5840000, size.height * 0.6270000)
      ..close()
      ..moveTo(size.width * 0.5863333, size.height * 0.2920000)
      ..cubicTo(size.width * 0.5970000, size.height * 0.2726667, size.width * 0.6116667,
          size.height * 0.2580000, size.width * 0.6300000, size.height * 0.2473333)
      ..cubicTo(size.width * 0.6486667, size.height * 0.2366667, size.width * 0.6676667,
          size.height * 0.2316667, size.width * 0.6876667, size.height * 0.2320000)
      ..cubicTo(size.width * 0.6906667, size.height * 0.2320000, size.width * 0.6940000,
          size.height * 0.2323333, size.width * 0.6976667, size.height * 0.2330000)
      ..lineTo(size.width * 0.6976667, size.height * 0.2433333)
      ..cubicTo(size.width * 0.6973333, size.height * 0.2760000, size.width * 0.7060000,
          size.height * 0.3066667, size.width * 0.7233333, size.height * 0.3353333)
      ..cubicTo(size.width * 0.7410000, size.height * 0.3640000, size.width * 0.7656667,
          size.height * 0.3853333, size.width * 0.7973333, size.height * 0.4000000)
      ..cubicTo(size.width * 0.7910000, size.height * 0.4136667, size.width * 0.7820000,
          size.height * 0.4260000, size.width * 0.7706667, size.height * 0.4370000)
      ..cubicTo(size.width * 0.7400000, size.height * 0.4116667, size.width * 0.7040000,
          size.height * 0.3990000, size.width * 0.6630000, size.height * 0.3990000)
      ..lineTo(size.width * 0.6526667, size.height * 0.3990000)
      ..cubicTo(size.width * 0.6423333, size.height * 0.3553333, size.width * 0.6203333,
          size.height * 0.3196667, size.width * 0.5863333, size.height * 0.2920000)
      ..close();
  }

  Path _nightShowersPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1356667, size.height * 0.5636667)
      ..cubicTo(size.width * 0.1356667, size.height * 0.6080000, size.width * 0.1510000,
          size.height * 0.6463333, size.width * 0.1820000, size.height * 0.6780000)
      ..cubicTo(size.width * 0.2130000, size.height * 0.7096667, size.width * 0.2506667,
          size.height * 0.7270000, size.width * 0.2953333, size.height * 0.7290000)
      ..cubicTo(size.width * 0.2990000, size.height * 0.7290000, size.width * 0.3010000,
          size.height * 0.7270000, size.width * 0.3010000, size.height * 0.7233333)
      ..lineTo(size.width * 0.3010000, size.height * 0.6776667)
      ..cubicTo(size.width * 0.3010000, size.height * 0.6736667, size.width * 0.2990000,
          size.height * 0.6716667, size.width * 0.2953333, size.height * 0.6716667)
      ..cubicTo(size.width * 0.2663333, size.height * 0.6693333, size.width * 0.2420000,
          size.height * 0.6580000, size.width * 0.2223333, size.height * 0.6370000)
      ..cubicTo(size.width * 0.2026667, size.height * 0.6163333, size.width * 0.1926667,
          size.height * 0.5916667, size.width * 0.1926667, size.height * 0.5633333)
      ..cubicTo(size.width * 0.1926667, size.height * 0.5356667, size.width * 0.2020000,
          size.height * 0.5120000, size.width * 0.2206667, size.height * 0.4913333)
      ..cubicTo(size.width * 0.2393333, size.height * 0.4706667, size.width * 0.2626667,
          size.height * 0.4590000, size.width * 0.2906667, size.height * 0.4556667)
      ..lineTo(size.width * 0.3083333, size.height * 0.4533333)
      ..cubicTo(size.width * 0.3126667, size.height * 0.4533333, size.width * 0.3150000,
          size.height * 0.4513333, size.width * 0.3150000, size.height * 0.4476667)
      ..lineTo(size.width * 0.3173333, size.height * 0.4303333)
      ..cubicTo(size.width * 0.3210000, size.height * 0.3943333, size.width * 0.3360000,
          size.height * 0.3640000, size.width * 0.3630000, size.height * 0.3400000)
      ..cubicTo(size.width * 0.3900000, size.height * 0.3156667, size.width * 0.4216667,
          size.height * 0.3036667, size.width * 0.4580000, size.height * 0.3036667)
      ..cubicTo(size.width * 0.4943333, size.height * 0.3036667, size.width * 0.5260000,
          size.height * 0.3156667, size.width * 0.5530000, size.height * 0.3400000)
      ..cubicTo(size.width * 0.5800000, size.height * 0.3640000, size.width * 0.5956667,
          size.height * 0.3943333, size.width * 0.5993333, size.height * 0.4306667)
      ..lineTo(size.width * 0.6020000, size.height * 0.4500000)
      ..cubicTo(size.width * 0.6020000, size.height * 0.4540000, size.width * 0.6040000,
          size.height * 0.4560000, size.width * 0.6080000, size.height * 0.4560000)
      ..lineTo(size.width * 0.6616667, size.height * 0.4560000)
      ..cubicTo(size.width * 0.6916667, size.height * 0.4560000, size.width * 0.7173333,
          size.height * 0.4666667, size.width * 0.7390000, size.height * 0.4876667)
      ..cubicTo(size.width * 0.7603333, size.height * 0.5086667, size.width * 0.7713333,
          size.height * 0.5340000, size.width * 0.7713333, size.height * 0.5636667)
      ..cubicTo(size.width * 0.7713333, size.height * 0.5920000, size.width * 0.7613333,
          size.height * 0.6166667, size.width * 0.7416667, size.height * 0.6373333)
      ..cubicTo(size.width * 0.7220000, size.height * 0.6580000, size.width * 0.6973333,
          size.height * 0.6696667, size.width * 0.6686667, size.height * 0.6720000)
      ..cubicTo(size.width * 0.6643333, size.height * 0.6720000, size.width * 0.6620000,
          size.height * 0.6740000, size.width * 0.6620000, size.height * 0.6780000)
      ..lineTo(size.width * 0.6620000, size.height * 0.7236667)
      ..cubicTo(size.width * 0.6620000, size.height * 0.7273333, size.width * 0.6643333,
          size.height * 0.7293333, size.width * 0.6686667, size.height * 0.7293333)
      ..cubicTo(size.width * 0.7130000, size.height * 0.7280000, size.width * 0.7506667,
          size.height * 0.7110000, size.width * 0.7813333, size.height * 0.6790000)
      ..cubicTo(size.width * 0.8120000, size.height * 0.6470000, size.width * 0.8273333,
          size.height * 0.6086667, size.width * 0.8273333, size.height * 0.5640000)
      ..cubicTo(size.width * 0.8273333, size.height * 0.5350000, size.width * 0.8200000,
          size.height * 0.5080000, size.width * 0.8056667, size.height * 0.4830000)
      ..cubicTo(size.width * 0.8326667, size.height * 0.4586667, size.width * 0.8503333,
          size.height * 0.4296667, size.width * 0.8583333, size.height * 0.3956667)
      ..lineTo(size.width * 0.8583333, size.height * 0.3913333)
      ..lineTo(size.width * 0.8646667, size.height * 0.3650000)
      ..lineTo(size.width * 0.8393333, size.height * 0.3580000)
      ..cubicTo(size.width * 0.8123333, size.height * 0.3500000, size.width * 0.7913333,
          size.height * 0.3346667, size.width * 0.7763333, size.height * 0.3130000)
      ..cubicTo(size.width * 0.7613333, size.height * 0.2910000, size.width * 0.7540000,
          size.height * 0.2683333, size.width * 0.7540000, size.height * 0.2453333)
      ..cubicTo(size.width * 0.7540000, size.height * 0.2366667, size.width * 0.7550000,
          size.height * 0.2280000, size.width * 0.7566667, size.height * 0.2193333)
      ..lineTo(size.width * 0.7633333, size.height * 0.1926667)
      ..lineTo(size.width * 0.7350000, size.height * 0.1843333)
      ..lineTo(size.width * 0.7300000, size.height * 0.1830000)
      ..cubicTo(size.width * 0.7143333, size.height * 0.1800000, size.width * 0.7006667,
          size.height * 0.1783333, size.width * 0.6883333, size.height * 0.1783333)
      ..cubicTo(size.width * 0.6756667, size.height * 0.1783333, size.width * 0.6630000,
          size.height * 0.1796667, size.width * 0.6503333, size.height * 0.1826667)
      ..cubicTo(size.width * 0.6373333, size.height * 0.1856667, size.width * 0.6240000,
          size.height * 0.1900000, size.width * 0.6103333, size.height * 0.1963333)
      ..cubicTo(size.width * 0.5963333, size.height * 0.2026667, size.width * 0.5830000,
          size.height * 0.2113333, size.width * 0.5703333, size.height * 0.2230000)
      ..cubicTo(size.width * 0.5576667, size.height * 0.2346667, size.width * 0.5463333,
          size.height * 0.2483333, size.width * 0.5370000, size.height * 0.2640000)
      ..cubicTo(size.width * 0.5123333, size.height * 0.2530000, size.width * 0.4860000,
          size.height * 0.2476667, size.width * 0.4583333, size.height * 0.2476667)
      ..cubicTo(size.width * 0.4113333, size.height * 0.2476667, size.width * 0.3696667,
          size.height * 0.2623333, size.width * 0.3333333, size.height * 0.2913333)
      ..cubicTo(size.width * 0.2970000, size.height * 0.3203333, size.width * 0.2743333,
          size.height * 0.3576667, size.width * 0.2643333, size.height * 0.4033333)
      ..cubicTo(size.width * 0.2270000, size.height * 0.4120000, size.width * 0.1960000,
          size.height * 0.4310000, size.width * 0.1720000, size.height * 0.4606667)
      ..cubicTo(size.width * 0.1476667, size.height * 0.4910000, size.width * 0.1356667,
          size.height * 0.5253333, size.width * 0.1356667, size.height * 0.5636667)
      ..close()
      ..moveTo(size.width * 0.3156667, size.height * 0.7893333)
      ..cubicTo(size.width * 0.3156667, size.height * 0.7943333, size.width * 0.3173333,
          size.height * 0.7993333, size.width * 0.3206667, size.height * 0.8043333)
      ..cubicTo(size.width * 0.3240000, size.height * 0.8093333, size.width * 0.3290000,
          size.height * 0.8130000, size.width * 0.3356667, size.height * 0.8153333)
      ..cubicTo(size.width * 0.3430000, size.height * 0.8176667, size.width * 0.3500000,
          size.height * 0.8173333, size.width * 0.3570000, size.height * 0.8136667)
      ..cubicTo(size.width * 0.3640000, size.height * 0.8100000, size.width * 0.3683333,
          size.height * 0.8043333, size.width * 0.3706667, size.height * 0.7966667)
      ..lineTo(size.width * 0.3800000, size.height * 0.7613333)
      ..cubicTo(size.width * 0.3823333, size.height * 0.7543333, size.width * 0.3816667,
          size.height * 0.7476667, size.width * 0.3776667, size.height * 0.7406667)
      ..cubicTo(size.width * 0.3736667, size.height * 0.7336667, size.width * 0.3680000,
          size.height * 0.7293333, size.width * 0.3606667, size.height * 0.7270000)
      ..cubicTo(size.width * 0.3530000, size.height * 0.7250000, size.width * 0.3456667,
          size.height * 0.7260000, size.width * 0.3390000, size.height * 0.7296667)
      ..cubicTo(size.width * 0.3323333, size.height * 0.7333333, size.width * 0.3276667,
          size.height * 0.7396667, size.width * 0.3250000, size.height * 0.7473333)
      ..lineTo(size.width * 0.3173333, size.height * 0.7803333)
      ..cubicTo(size.width * 0.3163333, size.height * 0.7856667, size.width * 0.3156667,
          size.height * 0.7886667, size.width * 0.3156667, size.height * 0.7893333)
      ..close()
      ..moveTo(size.width * 0.3590000, size.height * 0.6316667)
      ..cubicTo(size.width * 0.3590000, size.height * 0.6353333, size.width * 0.3600000,
          size.height * 0.6393333, size.width * 0.3623333, size.height * 0.6436667)
      ..cubicTo(size.width * 0.3646667, size.height * 0.6493333, size.width * 0.3706667,
          size.height * 0.6536667, size.width * 0.3800000, size.height * 0.6563333)
      ..cubicTo(size.width * 0.3880000, size.height * 0.6583333, size.width * 0.3953333,
          size.height * 0.6576667, size.width * 0.4020000, size.height * 0.6543333)
      ..cubicTo(size.width * 0.4083333, size.height * 0.6510000, size.width * 0.4130000,
          size.height * 0.6450000, size.width * 0.4153333, size.height * 0.6370000)
      ..lineTo(size.width * 0.4246667, size.height * 0.6026667)
      ..cubicTo(size.width * 0.4270000, size.height * 0.5950000, size.width * 0.4263333,
          size.height * 0.5876667, size.width * 0.4223333, size.height * 0.5813333)
      ..cubicTo(size.width * 0.4183333, size.height * 0.5746667, size.width * 0.4126667,
          size.height * 0.5703333, size.width * 0.4053333, size.height * 0.5683333)
      ..cubicTo(size.width * 0.3973333, size.height * 0.5663333, size.width * 0.3896667,
          size.height * 0.5670000, size.width * 0.3830000, size.height * 0.5706667)
      ..cubicTo(size.width * 0.3763333, size.height * 0.5743333, size.width * 0.3720000,
          size.height * 0.5800000, size.width * 0.3696667, size.height * 0.5880000)
      ..lineTo(size.width * 0.3606667, size.height * 0.6216667)
      ..cubicTo(size.width * 0.3596667, size.height * 0.6260000, size.width * 0.3590000,
          size.height * 0.6293333, size.width * 0.3590000, size.height * 0.6316667)
      ..close()
      ..moveTo(size.width * 0.4006667, size.height * 0.8933333)
      ..cubicTo(size.width * 0.4006667, size.height * 0.8990000, size.width * 0.4023333,
          size.height * 0.9043333, size.width * 0.4056667, size.height * 0.9096667)
      ..cubicTo(size.width * 0.4090000, size.height * 0.9150000, size.width * 0.4140000,
          size.height * 0.9186667, size.width * 0.4206667, size.height * 0.9206667)
      ..cubicTo(size.width * 0.4243333, size.height * 0.9216667, size.width * 0.4266667,
          size.height * 0.9223333, size.width * 0.4283333, size.height * 0.9223333)
      ..cubicTo(size.width * 0.4313333, size.height * 0.9223333, size.width * 0.4353333,
          size.height * 0.9213333, size.width * 0.4410000, size.height * 0.9190000)
      ..cubicTo(size.width * 0.4476667, size.height * 0.9163333, size.width * 0.4523333,
          size.height * 0.9100000, size.width * 0.4553333, size.height * 0.9006667)
      ..lineTo(size.width * 0.4653333, size.height * 0.8656667)
      ..cubicTo(size.width * 0.4676667, size.height * 0.8586667, size.width * 0.4670000,
          size.height * 0.8516667, size.width * 0.4630000, size.height * 0.8446667)
      ..cubicTo(size.width * 0.4590000, size.height * 0.8376667, size.width * 0.4533333,
          size.height * 0.8333333, size.width * 0.4460000, size.height * 0.8310000)
      ..cubicTo(size.width * 0.4380000, size.height * 0.8290000, size.width * 0.4303333,
          size.height * 0.8296667, size.width * 0.4236667, size.height * 0.8336667)
      ..cubicTo(size.width * 0.4170000, size.height * 0.8376667, size.width * 0.4123333,
          size.height * 0.8433333, size.width * 0.4100000, size.height * 0.8513333)
      ..lineTo(size.width * 0.4016667, size.height * 0.8850000)
      ..cubicTo(size.width * 0.4010000, size.height * 0.8876667, size.width * 0.4006667,
          size.height * 0.8906667, size.width * 0.4006667, size.height * 0.8933333)
      ..close()
      ..moveTo(size.width * 0.4450000, size.height * 0.7343333)
      ..cubicTo(size.width * 0.4450000, size.height * 0.7393333, size.width * 0.4466667,
          size.height * 0.7443333, size.width * 0.4500000, size.height * 0.7493333)
      ..cubicTo(size.width * 0.4533333, size.height * 0.7543333, size.width * 0.4583333,
          size.height * 0.7580000, size.width * 0.4653333, size.height * 0.7603333)
      ..cubicTo(size.width * 0.4726667, size.height * 0.7626667, size.width * 0.4800000,
          size.height * 0.7620000, size.width * 0.4866667, size.height * 0.7583333)
      ..cubicTo(size.width * 0.4933333, size.height * 0.7546667, size.width * 0.4976667,
          size.height * 0.7490000, size.width * 0.5000000, size.height * 0.7410000)
      ..lineTo(size.width * 0.5090000, size.height * 0.7063333)
      ..cubicTo(size.width * 0.5113333, size.height * 0.6993333, size.width * 0.5106667,
          size.height * 0.6923333, size.width * 0.5070000, size.height * 0.6856667)
      ..cubicTo(size.width * 0.5033333, size.height * 0.6790000, size.width * 0.4980000,
          size.height * 0.6743333, size.width * 0.4906667, size.height * 0.6720000)
      ..cubicTo(size.width * 0.4826667, size.height * 0.6700000, size.width * 0.4750000,
          size.height * 0.6710000, size.width * 0.4680000, size.height * 0.6746667)
      ..cubicTo(size.width * 0.4610000, size.height * 0.6783333, size.width * 0.4563333,
          size.height * 0.6846667, size.width * 0.4540000, size.height * 0.6923333)
      ..lineTo(size.width * 0.4460000, size.height * 0.7256667)
      ..lineTo(size.width * 0.4450000, size.height * 0.7343333)
      ..close()
      ..moveTo(size.width * 0.5386667, size.height * 0.7930000)
      ..cubicTo(size.width * 0.5386667, size.height * 0.8056667, size.width * 0.5456667,
          size.height * 0.8136667, size.width * 0.5600000, size.height * 0.8180000)
      ..cubicTo(size.width * 0.5630000, size.height * 0.8186667, size.width * 0.5656667,
          size.height * 0.8190000, size.width * 0.5680000, size.height * 0.8190000)
      ..cubicTo(size.width * 0.5730000, size.height * 0.8190000, size.width * 0.5770000,
          size.height * 0.8183333, size.width * 0.5803333, size.height * 0.8166667)
      ..cubicTo(size.width * 0.5873333, size.height * 0.8140000, size.width * 0.5923333,
          size.height * 0.8076667, size.width * 0.5950000, size.height * 0.7976667)
      ..lineTo(size.width * 0.6040000, size.height * 0.7636667)
      ..cubicTo(size.width * 0.6060000, size.height * 0.7553333, size.width * 0.6053333,
          size.height * 0.7480000, size.width * 0.6013333, size.height * 0.7413333)
      ..cubicTo(size.width * 0.5973333, size.height * 0.7346667, size.width * 0.5916667,
          size.height * 0.7306667, size.width * 0.5836667, size.height * 0.7290000)
      ..cubicTo(size.width * 0.5760000, size.height * 0.7266667, size.width * 0.5686667,
          size.height * 0.7273333, size.width * 0.5623333, size.height * 0.7313333)
      ..cubicTo(size.width * 0.5560000, size.height * 0.7353333, size.width * 0.5513333,
          size.height * 0.7410000, size.width * 0.5490000, size.height * 0.7483333)
      ..lineTo(size.width * 0.5400000, size.height * 0.7830000)
      ..cubicTo(size.width * 0.5400000, size.height * 0.7836667, size.width * 0.5396667,
          size.height * 0.7853333, size.width * 0.5393333, size.height * 0.7880000)
      ..cubicTo(size.width * 0.5386667, size.height * 0.7903333, size.width * 0.5386667,
          size.height * 0.7920000, size.width * 0.5386667, size.height * 0.7930000)
      ..close()
      ..moveTo(size.width * 0.5850000, size.height * 0.6326667)
      ..cubicTo(size.width * 0.5850000, size.height * 0.6380000, size.width * 0.5866667,
          size.height * 0.6430000, size.width * 0.5900000, size.height * 0.6480000)
      ..cubicTo(size.width * 0.5933333, size.height * 0.6530000, size.width * 0.5986667,
          size.height * 0.6566667, size.width * 0.6053333, size.height * 0.6586667)
      ..cubicTo(size.width * 0.6100000, size.height * 0.6596667, size.width * 0.6126667,
          size.height * 0.6603333, size.width * 0.6130000, size.height * 0.6603333)
      ..cubicTo(size.width * 0.6160000, size.height * 0.6603333, size.width * 0.6200000,
          size.height * 0.6593333, size.width * 0.6256667, size.height * 0.6570000)
      ..cubicTo(size.width * 0.6326667, size.height * 0.6543333, size.width * 0.6373333,
          size.height * 0.6480000, size.width * 0.6403333, size.height * 0.6386667)
      ..lineTo(size.width * 0.6496667, size.height * 0.6040000)
      ..cubicTo(size.width * 0.6516667, size.height * 0.5966667, size.width * 0.6506667,
          size.height * 0.5896667, size.width * 0.6470000, size.height * 0.5830000)
      ..cubicTo(size.width * 0.6433333, size.height * 0.5763333, size.width * 0.6370000,
          size.height * 0.5720000, size.width * 0.6293333, size.height * 0.5696667)
      ..cubicTo(size.width * 0.6220000, size.height * 0.5673333, size.width * 0.6150000,
          size.height * 0.5680000, size.width * 0.6083333, size.height * 0.5720000)
      ..cubicTo(size.width * 0.6016667, size.height * 0.5760000, size.width * 0.5973333,
          size.height * 0.5816667, size.width * 0.5950000, size.height * 0.5893333)
      ..lineTo(size.width * 0.5863333, size.height * 0.6246667)
      ..cubicTo(size.width * 0.5853333, size.height * 0.6276667, size.width * 0.5850000,
          size.height * 0.6306667, size.width * 0.5850000, size.height * 0.6326667)
      ..close()
      ..moveTo(size.width * 0.5860000, size.height * 0.2936667)
      ..cubicTo(size.width * 0.5966667, size.height * 0.2750000, size.width * 0.6113333,
          size.height * 0.2603333, size.width * 0.6303333, size.height * 0.2500000)
      ..cubicTo(size.width * 0.6493333, size.height * 0.2396667, size.width * 0.6693333,
          size.height * 0.2343333, size.width * 0.6906667, size.height * 0.2343333)
      ..lineTo(size.width * 0.6976667, size.height * 0.2343333)
      ..cubicTo(size.width * 0.6973333, size.height * 0.2373333, size.width * 0.6973333,
          size.height * 0.2413333, size.width * 0.6973333, size.height * 0.2470000)
      ..cubicTo(size.width * 0.6973333, size.height * 0.2786667, size.width * 0.7060000,
          size.height * 0.3086667, size.width * 0.7233333, size.height * 0.3373333)
      ..cubicTo(size.width * 0.7406667, size.height * 0.3660000, size.width * 0.7650000,
          size.height * 0.3876667, size.width * 0.7956667, size.height * 0.4026667)
      ..cubicTo(size.width * 0.7883333, size.height * 0.4170000, size.width * 0.7796667,
          size.height * 0.4293333, size.width * 0.7696667, size.height * 0.4393333)
      ..cubicTo(size.width * 0.7386667, size.height * 0.4123333, size.width * 0.7023333,
          size.height * 0.3990000, size.width * 0.6613333, size.height * 0.3990000)
      ..lineTo(size.width * 0.6506667, size.height * 0.3990000)
      ..cubicTo(size.width * 0.6423333, size.height * 0.3593333, size.width * 0.6210000,
          size.height * 0.3243333, size.width * 0.5860000, size.height * 0.2936667)
      ..close();
  }

  Path _nightSleetPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1363333, size.height * 0.5710000)
      ..lineTo(size.width * 0.1363333, size.height * 0.5586667)
      ..cubicTo(size.width * 0.1376667, size.height * 0.5213333, size.width * 0.1503333,
          size.height * 0.4883333, size.width * 0.1740000, size.height * 0.4596667)
      ..cubicTo(size.width * 0.1976667, size.height * 0.4310000, size.width * 0.2276667,
          size.height * 0.4123333, size.width * 0.2633333, size.height * 0.4040000)
      ..cubicTo(size.width * 0.2736667, size.height * 0.3586667, size.width * 0.2973333,
          size.height * 0.3213333, size.width * 0.3336667, size.height * 0.2920000)
      ..cubicTo(size.width * 0.3700000, size.height * 0.2626667, size.width * 0.4120000,
          size.height * 0.2483333, size.width * 0.4590000, size.height * 0.2483333)
      ..cubicTo(size.width * 0.4836667, size.height * 0.2483333, size.width * 0.5100000,
          size.height * 0.2533333, size.width * 0.5383333, size.height * 0.2636667)
      ..cubicTo(size.width * 0.5476667, size.height * 0.2483333, size.width * 0.5586667,
          size.height * 0.2350000, size.width * 0.5713333, size.height * 0.2236667)
      ..cubicTo(size.width * 0.5840000, size.height * 0.2123333, size.width * 0.5970000,
          size.height * 0.2036667, size.width * 0.6106667, size.height * 0.1973333)
      ..cubicTo(size.width * 0.6243333, size.height * 0.1913333, size.width * 0.6373333,
          size.height * 0.1866667, size.width * 0.6503333, size.height * 0.1840000)
      ..cubicTo(size.width * 0.6630000, size.height * 0.1813333, size.width * 0.6756667,
          size.height * 0.1800000, size.width * 0.6880000, size.height * 0.1800000)
      ..cubicTo(size.width * 0.7010000, size.height * 0.1800000, size.width * 0.7146667,
          size.height * 0.1813333, size.width * 0.7293333, size.height * 0.1843333)
      ..lineTo(size.width * 0.7560000, size.height * 0.1926667)
      ..cubicTo(size.width * 0.7600000, size.height * 0.1946667, size.width * 0.7616667,
          size.height * 0.1970000, size.width * 0.7606667, size.height * 0.2003333)
      ..lineTo(size.width * 0.7566667, size.height * 0.2210000)
      ..cubicTo(size.width * 0.7543333, size.height * 0.2306667, size.width * 0.7533333,
          size.height * 0.2400000, size.width * 0.7533333, size.height * 0.2490000)
      ..cubicTo(size.width * 0.7533333, size.height * 0.2593333, size.width * 0.7550000,
          size.height * 0.2696667, size.width * 0.7583333, size.height * 0.2806667)
      ..cubicTo(size.width * 0.7616667, size.height * 0.2913333, size.width * 0.7663333,
          size.height * 0.3020000, size.width * 0.7730000, size.height * 0.3123333)
      ..cubicTo(size.width * 0.7796667, size.height * 0.3226667, size.width * 0.7883333,
          size.height * 0.3320000, size.width * 0.7996667, size.height * 0.3406667)
      ..cubicTo(size.width * 0.8110000, size.height * 0.3493333, size.width * 0.8236667,
          size.height * 0.3556667, size.width * 0.8383333, size.height * 0.3600000)
      ..lineTo(size.width * 0.8590000, size.height * 0.3656667)
      ..cubicTo(size.width * 0.8623333, size.height * 0.3666667, size.width * 0.8640000,
          size.height * 0.3683333, size.width * 0.8640000, size.height * 0.3710000)
      ..cubicTo(size.width * 0.8640000, size.height * 0.3723333, size.width * 0.8640000,
          size.height * 0.3730000, size.width * 0.8636667, size.height * 0.3733333)
      ..lineTo(size.width * 0.8573333, size.height * 0.3960000)
      ..cubicTo(size.width * 0.8493333, size.height * 0.4296667, size.width * 0.8323333,
          size.height * 0.4590000, size.width * 0.8070000, size.height * 0.4833333)
      ..cubicTo(size.width * 0.8216667, size.height * 0.5086667, size.width * 0.8290000,
          size.height * 0.5360000, size.width * 0.8290000, size.height * 0.5650000)
      ..cubicTo(size.width * 0.8290000, size.height * 0.6096667, size.width * 0.8136667,
          size.height * 0.6480000, size.width * 0.7826667, size.height * 0.6800000)
      ..cubicTo(size.width * 0.7516667, size.height * 0.7123333, size.width * 0.7140000,
          size.height * 0.7290000, size.width * 0.6696667, size.height * 0.7303333)
      ..cubicTo(size.width * 0.6656667, size.height * 0.7303333, size.width * 0.6633333,
          size.height * 0.7283333, size.width * 0.6633333, size.height * 0.7240000)
      ..lineTo(size.width * 0.6633333, size.height * 0.6786667)
      ..cubicTo(size.width * 0.6633333, size.height * 0.6746667, size.width * 0.6653333,
          size.height * 0.6726667, size.width * 0.6696667, size.height * 0.6726667)
      ..cubicTo(size.width * 0.6986667, size.height * 0.6706667, size.width * 0.7230000,
          size.height * 0.6590000, size.width * 0.7430000, size.height * 0.6383333)
      ..cubicTo(size.width * 0.7630000, size.height * 0.6176667, size.width * 0.7730000,
          size.height * 0.5930000, size.width * 0.7730000, size.height * 0.5646667)
      ..cubicTo(size.width * 0.7730000, size.height * 0.5350000, size.width * 0.7623333,
          size.height * 0.5093333, size.width * 0.7406667, size.height * 0.4883333)
      ..cubicTo(size.width * 0.7190000, size.height * 0.4673333, size.width * 0.6933333,
          size.height * 0.4566667, size.width * 0.6630000, size.height * 0.4566667)
      ..lineTo(size.width * 0.6090000, size.height * 0.4566667)
      ..cubicTo(size.width * 0.6053333, size.height * 0.4566667, size.width * 0.6033333,
          size.height * 0.4546667, size.width * 0.6033333, size.height * 0.4506667)
      ..lineTo(size.width * 0.6010000, size.height * 0.4313333)
      ..cubicTo(size.width * 0.5973333, size.height * 0.3956667, size.width * 0.5816667,
          size.height * 0.3653333, size.width * 0.5543333, size.height * 0.3410000)
      ..cubicTo(size.width * 0.5270000, size.height * 0.3166667, size.width * 0.4953333,
          size.height * 0.3043333, size.width * 0.4590000, size.height * 0.3043333)
      ..cubicTo(size.width * 0.4226667, size.height * 0.3043333, size.width * 0.3906667,
          size.height * 0.3166667, size.width * 0.3640000, size.height * 0.3410000)
      ..cubicTo(size.width * 0.3370000, size.height * 0.3653333, size.width * 0.3216667,
          size.height * 0.3956667, size.width * 0.3183333, size.height * 0.4316667)
      ..lineTo(size.width * 0.3160000, size.height * 0.4490000)
      ..cubicTo(size.width * 0.3160000, size.height * 0.4526667, size.width * 0.3136667,
          size.height * 0.4546667, size.width * 0.3093333, size.height * 0.4546667)
      ..lineTo(size.width * 0.2916667, size.height * 0.4570000)
      ..cubicTo(size.width * 0.2636667, size.height * 0.4603333, size.width * 0.2403333,
          size.height * 0.4723333, size.width * 0.2216667, size.height * 0.4926667)
      ..cubicTo(size.width * 0.2026667, size.height * 0.5133333, size.width * 0.1933333,
          size.height * 0.5373333, size.width * 0.1933333, size.height * 0.5650000)
      ..lineTo(size.width * 0.1933333, size.height * 0.5656667)
      ..lineTo(size.width * 0.1936667, size.height * 0.5660000)
      ..lineTo(size.width * 0.1943333, size.height * 0.5660000)
      ..cubicTo(size.width * 0.1943333, size.height * 0.5833333, size.width * 0.1983333,
          size.height * 0.6000000, size.width * 0.2063333, size.height * 0.6153333)
      ..cubicTo(size.width * 0.2143333, size.height * 0.6306667, size.width * 0.2250000,
          size.height * 0.6433333, size.width * 0.2386667, size.height * 0.6533333)
      ..lineTo(size.width * 0.2390000, size.height * 0.6533333)
      ..lineTo(size.width * 0.2393333, size.height * 0.6536667)
      ..lineTo(size.width * 0.2396667, size.height * 0.6540000)
      ..cubicTo(size.width * 0.2470000, size.height * 0.6593333, size.width * 0.2536667,
          size.height * 0.6630000, size.width * 0.2603333, size.height * 0.6656667)
      ..cubicTo(size.width * 0.2716667, size.height * 0.6706667, size.width * 0.2833333,
          size.height * 0.6733333, size.width * 0.2960000, size.height * 0.6736667)
      ..cubicTo(size.width * 0.2996667, size.height * 0.6736667, size.width * 0.3016667,
          size.height * 0.6756667, size.width * 0.3016667, size.height * 0.6793333)
      ..lineTo(size.width * 0.3016667, size.height * 0.7240000)
      ..cubicTo(size.width * 0.3016667, size.height * 0.7280000, size.width * 0.2996667,
          size.height * 0.7300000, size.width * 0.2960000, size.height * 0.7300000)
      ..cubicTo(size.width * 0.2650000, size.height * 0.7286667, size.width * 0.2366667,
          size.height * 0.7193333, size.width * 0.2110000, size.height * 0.7026667)
      ..lineTo(size.width * 0.2106667, size.height * 0.7026667)
      ..cubicTo(size.width * 0.1886667, size.height * 0.6883333, size.width * 0.1710000,
          size.height * 0.6696667, size.width * 0.1576667, size.height * 0.6463333)
      ..cubicTo(size.width * 0.1443333, size.height * 0.6230000, size.width * 0.1373333,
          size.height * 0.5980000, size.width * 0.1363333, size.height * 0.5710000)
      ..close()
      ..moveTo(size.width * 0.3196667, size.height * 0.8033333)
      ..cubicTo(size.width * 0.3196667, size.height * 0.8023333, size.width * 0.3200000,
          size.height * 0.8010000, size.width * 0.3203333, size.height * 0.7990000)
      ..cubicTo(size.width * 0.3206667, size.height * 0.7970000, size.width * 0.3210000,
          size.height * 0.7960000, size.width * 0.3210000, size.height * 0.7950000)
      ..lineTo(size.width * 0.3240000, size.height * 0.7753333)
      ..cubicTo(size.width * 0.3263333, size.height * 0.7673333, size.width * 0.3306667,
          size.height * 0.7616667, size.width * 0.3376667, size.height * 0.7576667)
      ..cubicTo(size.width * 0.3446667, size.height * 0.7536667, size.width * 0.3520000,
          size.height * 0.7530000, size.width * 0.3603333, size.height * 0.7550000)
      ..cubicTo(size.width * 0.3680000, size.height * 0.7573333, size.width * 0.3733333,
          size.height * 0.7620000, size.width * 0.3773333, size.height * 0.7686667)
      ..cubicTo(size.width * 0.3810000, size.height * 0.7756667, size.width * 0.3816667,
          size.height * 0.7826667, size.width * 0.3796667, size.height * 0.7896667)
      ..lineTo(size.width * 0.3750000, size.height * 0.8096667)
      ..cubicTo(size.width * 0.3716667, size.height * 0.8240000, size.width * 0.3633333,
          size.height * 0.8313333, size.width * 0.3496667, size.height * 0.8313333)
      ..cubicTo(size.width * 0.3486667, size.height * 0.8313333, size.width * 0.3470000,
          size.height * 0.8313333, size.width * 0.3446667, size.height * 0.8310000)
      ..cubicTo(size.width * 0.3423333, size.height * 0.8306667, size.width * 0.3410000,
          size.height * 0.8306667, size.width * 0.3403333, size.height * 0.8306667)
      ..cubicTo(size.width * 0.3333333, size.height * 0.8286667, size.width * 0.3283333,
          size.height * 0.8250000, size.width * 0.3250000, size.height * 0.8196667)
      ..cubicTo(size.width * 0.3213333, size.height * 0.8143333, size.width * 0.3196667,
          size.height * 0.8090000, size.width * 0.3196667, size.height * 0.8033333)
      ..close()
      ..moveTo(size.width * 0.3443333, size.height * 0.7053333)
      ..cubicTo(size.width * 0.3443333, size.height * 0.6973333, size.width * 0.3470000,
          size.height * 0.6910000, size.width * 0.3520000, size.height * 0.6856667)
      ..cubicTo(size.width * 0.3570000, size.height * 0.6803333, size.width * 0.3636667,
          size.height * 0.6780000, size.width * 0.3716667, size.height * 0.6780000)
      ..cubicTo(size.width * 0.3796667, size.height * 0.6780000, size.width * 0.3860000,
          size.height * 0.6806667, size.width * 0.3913333, size.height * 0.6856667)
      ..cubicTo(size.width * 0.3966667, size.height * 0.6906667, size.width * 0.3990000,
          size.height * 0.6973333, size.width * 0.3990000, size.height * 0.7053333)
      ..cubicTo(size.width * 0.3990000, size.height * 0.7130000, size.width * 0.3963333,
          size.height * 0.7196667, size.width * 0.3913333, size.height * 0.7246667)
      ..cubicTo(size.width * 0.3863333, size.height * 0.7296667, size.width * 0.3796667,
          size.height * 0.7323333, size.width * 0.3716667, size.height * 0.7323333)
      ..cubicTo(size.width * 0.3640000, size.height * 0.7323333, size.width * 0.3576667,
          size.height * 0.7296667, size.width * 0.3526667, size.height * 0.7240000)
      ..cubicTo(size.width * 0.3473333, size.height * 0.7190000, size.width * 0.3443333,
          size.height * 0.7126667, size.width * 0.3443333, size.height * 0.7053333)
      ..close()
      ..moveTo(size.width * 0.3990000, size.height * 0.9053333)
      ..cubicTo(size.width * 0.3990000, size.height * 0.9040000, size.width * 0.3993333,
          size.height * 0.9016667, size.width * 0.4003333, size.height * 0.8980000)
      ..lineTo(size.width * 0.4046667, size.height * 0.8783333)
      ..cubicTo(size.width * 0.4070000, size.height * 0.8706667, size.width * 0.4116667,
          size.height * 0.8650000, size.width * 0.4183333, size.height * 0.8613333)
      ..cubicTo(size.width * 0.4253333, size.height * 0.8573333, size.width * 0.4323333,
          size.height * 0.8566667, size.width * 0.4393333, size.height * 0.8590000)
      ..cubicTo(size.width * 0.4470000, size.height * 0.8603333, size.width * 0.4530000,
          size.height * 0.8646667, size.width * 0.4570000, size.height * 0.8713333)
      ..cubicTo(size.width * 0.4610000, size.height * 0.8780000, size.width * 0.4620000,
          size.height * 0.8856667, size.width * 0.4596667, size.height * 0.8940000)
      ..lineTo(size.width * 0.4553333, size.height * 0.9136667)
      ..cubicTo(size.width * 0.4520000, size.height * 0.9273333, size.width * 0.4430000,
          size.height * 0.9340000, size.width * 0.4286667, size.height * 0.9340000)
      ..cubicTo(size.width * 0.4263333, size.height * 0.9340000, size.width * 0.4233333,
          size.height * 0.9336667, size.width * 0.4206667, size.height * 0.9330000)
      ..cubicTo(size.width * 0.4133333, size.height * 0.9310000, size.width * 0.4080000,
          size.height * 0.9273333, size.width * 0.4043333, size.height * 0.9220000)
      ..cubicTo(size.width * 0.4010000, size.height * 0.9163333, size.width * 0.3990000,
          size.height * 0.9110000, size.width * 0.3990000, size.height * 0.9053333)
      ..close()
      ..moveTo(size.width * 0.4253333, size.height * 0.8083333)
      ..cubicTo(size.width * 0.4253333, size.height * 0.8006667, size.width * 0.4280000,
          size.height * 0.7943333, size.width * 0.4330000, size.height * 0.7890000)
      ..cubicTo(size.width * 0.4383333, size.height * 0.7836667, size.width * 0.4446667,
          size.height * 0.7813333, size.width * 0.4526667, size.height * 0.7813333)
      ..cubicTo(size.width * 0.4606667, size.height * 0.7813333, size.width * 0.4670000,
          size.height * 0.7840000, size.width * 0.4723333, size.height * 0.7890000)
      ..cubicTo(size.width * 0.4776667, size.height * 0.7943333, size.width * 0.4800000,
          size.height * 0.8006667, size.width * 0.4800000, size.height * 0.8083333)
      ..cubicTo(size.width * 0.4800000, size.height * 0.8163333, size.width * 0.4773333,
          size.height * 0.8226667, size.width * 0.4723333, size.height * 0.8280000)
      ..cubicTo(size.width * 0.4670000, size.height * 0.8333333, size.width * 0.4606667,
          size.height * 0.8356667, size.width * 0.4526667, size.height * 0.8356667)
      ..cubicTo(size.width * 0.4450000, size.height * 0.8356667, size.width * 0.4386667,
          size.height * 0.8330000, size.width * 0.4333333, size.height * 0.8276667)
      ..cubicTo(size.width * 0.4280000, size.height * 0.8223333, size.width * 0.4253333,
          size.height * 0.8160000, size.width * 0.4253333, size.height * 0.8083333)
      ..close()
      ..moveTo(size.width * 0.4460000, size.height * 0.7326667)
      ..cubicTo(size.width * 0.4460000, size.height * 0.7296667, size.width * 0.4463333,
          size.height * 0.7266667, size.width * 0.4470000, size.height * 0.7236667)
      ..lineTo(size.width * 0.4546667, size.height * 0.6936667)
      ..cubicTo(size.width * 0.4570000, size.height * 0.6860000, size.width * 0.4616667,
          size.height * 0.6800000, size.width * 0.4683333, size.height * 0.6760000)
      ..cubicTo(size.width * 0.4753333, size.height * 0.6720000, size.width * 0.4823333,
          size.height * 0.6710000, size.width * 0.4896667, size.height * 0.6733333)
      ..cubicTo(size.width * 0.4976667, size.height * 0.6756667, size.width * 0.5033333,
          size.height * 0.6800000, size.width * 0.5073333, size.height * 0.6866667)
      ..cubicTo(size.width * 0.5113333, size.height * 0.6933333, size.width * 0.5120000,
          size.height * 0.7003333, size.width * 0.5096667, size.height * 0.7076667)
      ..lineTo(size.width * 0.5010000, size.height * 0.7376667)
      ..cubicTo(size.width * 0.4983333, size.height * 0.7470000, size.width * 0.4936667,
          size.height * 0.7530000, size.width * 0.4873333, size.height * 0.7563333)
      ..cubicTo(size.width * 0.4810000, size.height * 0.7596667, size.width * 0.4736667,
          size.height * 0.7603333, size.width * 0.4660000, size.height * 0.7583333)
      ..cubicTo(size.width * 0.4593333, size.height * 0.7570000, size.width * 0.4543333,
          size.height * 0.7536667, size.width * 0.4510000, size.height * 0.7483333)
      ..cubicTo(size.width * 0.4470000, size.height * 0.7430000, size.width * 0.4456667,
          size.height * 0.7376667, size.width * 0.4460000, size.height * 0.7326667)
      ..close()
      ..moveTo(size.width * 0.5380000, size.height * 0.8040000)
      ..cubicTo(size.width * 0.5380000, size.height * 0.8030000, size.width * 0.5380000,
          size.height * 0.8013333, size.width * 0.5383333, size.height * 0.7996667)
      ..cubicTo(size.width * 0.5386667, size.height * 0.7980000, size.width * 0.5386667,
          size.height * 0.7966667, size.width * 0.5386667, size.height * 0.7960000)
      ..lineTo(size.width * 0.5416667, size.height * 0.7763333)
      ..cubicTo(size.width * 0.5440000, size.height * 0.7683333, size.width * 0.5483333,
          size.height * 0.7626667, size.width * 0.5553333, size.height * 0.7586667)
      ..cubicTo(size.width * 0.5623333, size.height * 0.7546667, size.width * 0.5696667,
          size.height * 0.7540000, size.width * 0.5780000, size.height * 0.7560000)
      ..cubicTo(size.width * 0.5856667, size.height * 0.7583333, size.width * 0.5913333,
          size.height * 0.7630000, size.width * 0.5950000, size.height * 0.7696667)
      ..cubicTo(size.width * 0.5990000, size.height * 0.7766667, size.width * 0.5996667,
          size.height * 0.7836667, size.width * 0.5973333, size.height * 0.7906667)
      ..lineTo(size.width * 0.5926667, size.height * 0.8106667)
      ..cubicTo(size.width * 0.5893333, size.height * 0.8253333, size.width * 0.5810000,
          size.height * 0.8326667, size.width * 0.5673333, size.height * 0.8326667)
      ..cubicTo(size.width * 0.5663333, size.height * 0.8326667, size.width * 0.5646667,
          size.height * 0.8323333, size.width * 0.5626667, size.height * 0.8320000)
      ..cubicTo(size.width * 0.5606667, size.height * 0.8316667, size.width * 0.5590000,
          size.height * 0.8313333, size.width * 0.5580000, size.height * 0.8313333)
      ..cubicTo(size.width * 0.5513333, size.height * 0.8293333, size.width * 0.5463333,
          size.height * 0.8256667, size.width * 0.5430000, size.height * 0.8203333)
      ..cubicTo(size.width * 0.5396667, size.height * 0.8150000, size.width * 0.5380000,
          size.height * 0.8096667, size.width * 0.5380000, size.height * 0.8040000)
      ..close()
      ..moveTo(size.width * 0.5626667, size.height * 0.7060000)
      ..cubicTo(size.width * 0.5626667, size.height * 0.6980000, size.width * 0.5653333,
          size.height * 0.6916667, size.width * 0.5703333, size.height * 0.6863333)
      ..cubicTo(size.width * 0.5753333, size.height * 0.6810000, size.width * 0.5820000,
          size.height * 0.6786667, size.width * 0.5900000, size.height * 0.6786667)
      ..cubicTo(size.width * 0.5980000, size.height * 0.6786667, size.width * 0.6043333,
          size.height * 0.6813333, size.width * 0.6096667, size.height * 0.6863333)
      ..cubicTo(size.width * 0.6150000, size.height * 0.6916667, size.width * 0.6173333,
          size.height * 0.6980000, size.width * 0.6173333, size.height * 0.7060000)
      ..cubicTo(size.width * 0.6173333, size.height * 0.7136667, size.width * 0.6146667,
          size.height * 0.7200000, size.width * 0.6096667, size.height * 0.7253333)
      ..cubicTo(size.width * 0.6043333, size.height * 0.7306667, size.width * 0.5980000,
          size.height * 0.7330000, size.width * 0.5900000, size.height * 0.7330000)
      ..cubicTo(size.width * 0.5820000, size.height * 0.7330000, size.width * 0.5756667,
          size.height * 0.7303333, size.width * 0.5706667, size.height * 0.7250000)
      ..cubicTo(size.width * 0.5656667, size.height * 0.7200000, size.width * 0.5626667,
          size.height * 0.7136667, size.width * 0.5626667, size.height * 0.7060000)
      ..close()
      ..moveTo(size.width * 0.5863333, size.height * 0.2940000)
      ..cubicTo(size.width * 0.6210000, size.height * 0.3223333, size.width * 0.6430000,
          size.height * 0.3573333, size.width * 0.6523333, size.height * 0.3993333)
      ..lineTo(size.width * 0.6633333, size.height * 0.3993333)
      ..cubicTo(size.width * 0.7043333, size.height * 0.3993333, size.width * 0.7400000,
          size.height * 0.4123333, size.width * 0.7706667, size.height * 0.4386667)
      ..cubicTo(size.width * 0.7820000, size.height * 0.4283333, size.width * 0.7903333,
          size.height * 0.4170000, size.width * 0.7960000, size.height * 0.4040000)
      ..cubicTo(size.width * 0.7753333, size.height * 0.3940000, size.width * 0.7576667,
          size.height * 0.3806667, size.width * 0.7423333, size.height * 0.3636667)
      ..cubicTo(size.width * 0.7273333, size.height * 0.3466667, size.width * 0.7160000,
          size.height * 0.3283333, size.width * 0.7083333, size.height * 0.3083333)
      ..cubicTo(size.width * 0.7006667, size.height * 0.2883333, size.width * 0.6970000,
          size.height * 0.2676667, size.width * 0.6970000, size.height * 0.2463333)
      ..lineTo(size.width * 0.6970000, size.height * 0.2363333)
      ..lineTo(size.width * 0.6896667, size.height * 0.2363333)
      ..cubicTo(size.width * 0.6690000, size.height * 0.2363333, size.width * 0.6493333,
          size.height * 0.2413333, size.width * 0.6306667, size.height * 0.2513333)
      ..cubicTo(size.width * 0.6120000, size.height * 0.2613333, size.width * 0.5973333,
          size.height * 0.2756667, size.width * 0.5863333, size.height * 0.2940000)
      ..close();
  }

  Path _nightSnowPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1356667, size.height * 0.5643333)
      ..cubicTo(size.width * 0.1356667, size.height * 0.6086667, size.width * 0.1513333,
          size.height * 0.6466667, size.width * 0.1823333, size.height * 0.6786667)
      ..cubicTo(size.width * 0.2133333, size.height * 0.7106667, size.width * 0.2513333,
          size.height * 0.7276667, size.width * 0.2956667, size.height * 0.7290000)
      ..cubicTo(size.width * 0.2996667, size.height * 0.7290000, size.width * 0.3016667,
          size.height * 0.7270000, size.width * 0.3016667, size.height * 0.7233333)
      ..lineTo(size.width * 0.3016667, size.height * 0.6786667)
      ..cubicTo(size.width * 0.3016667, size.height * 0.6750000, size.width * 0.2996667,
          size.height * 0.6730000, size.width * 0.2956667, size.height * 0.6730000)
      ..cubicTo(size.width * 0.2673333, size.height * 0.6716667, size.width * 0.2430000,
          size.height * 0.6600000, size.width * 0.2230000, size.height * 0.6386667)
      ..cubicTo(size.width * 0.2026667, size.height * 0.6173333, size.width * 0.1926667,
          size.height * 0.5923333, size.width * 0.1926667, size.height * 0.5640000)
      ..cubicTo(size.width * 0.1926667, size.height * 0.5356667, size.width * 0.2020000,
          size.height * 0.5113333, size.width * 0.2210000, size.height * 0.4906667)
      ..cubicTo(size.width * 0.2400000, size.height * 0.4700000, size.width * 0.2633333,
          size.height * 0.4586667, size.width * 0.2910000, size.height * 0.4563333)
      ..lineTo(size.width * 0.3086667, size.height * 0.4540000)
      ..cubicTo(size.width * 0.3130000, size.height * 0.4540000, size.width * 0.3153333,
          size.height * 0.4520000, size.width * 0.3153333, size.height * 0.4483333)
      ..lineTo(size.width * 0.3176667, size.height * 0.4310000)
      ..cubicTo(size.width * 0.3213333, size.height * 0.3946667, size.width * 0.3363333,
          size.height * 0.3640000, size.width * 0.3633333, size.height * 0.3393333)
      ..cubicTo(size.width * 0.3903333, size.height * 0.3146667, size.width * 0.4220000,
          size.height * 0.3023333, size.width * 0.4586667, size.height * 0.3023333)
      ..cubicTo(size.width * 0.4950000, size.height * 0.3023333, size.width * 0.5266667,
          size.height * 0.3146667, size.width * 0.5540000, size.height * 0.3390000)
      ..cubicTo(size.width * 0.5813333, size.height * 0.3633333, size.width * 0.5966667,
          size.height * 0.3936667, size.width * 0.6006667, size.height * 0.4296667)
      ..lineTo(size.width * 0.6033333, size.height * 0.4486667)
      ..cubicTo(size.width * 0.6033333, size.height * 0.4526667, size.width * 0.6053333,
          size.height * 0.4546667, size.width * 0.6090000, size.height * 0.4546667)
      ..lineTo(size.width * 0.6630000, size.height * 0.4546667)
      ..cubicTo(size.width * 0.6933333, size.height * 0.4546667, size.width * 0.7190000,
          size.height * 0.4653333, size.width * 0.7406667, size.height * 0.4870000)
      ..cubicTo(size.width * 0.7623333, size.height * 0.5083333, size.width * 0.7730000,
          size.height * 0.5340000, size.width * 0.7730000, size.height * 0.5640000)
      ..cubicTo(size.width * 0.7730000, size.height * 0.5923333, size.width * 0.7630000,
          size.height * 0.6173333, size.width * 0.7426667, size.height * 0.6386667)
      ..cubicTo(size.width * 0.7223333, size.height * 0.6600000, size.width * 0.6983333,
          size.height * 0.6713333, size.width * 0.6700000, size.height * 0.6730000)
      ..cubicTo(size.width * 0.6653333, size.height * 0.6730000, size.width * 0.6630000,
          size.height * 0.6750000, size.width * 0.6630000, size.height * 0.6786667)
      ..lineTo(size.width * 0.6630000, size.height * 0.7233333)
      ..cubicTo(size.width * 0.6630000, size.height * 0.7270000, size.width * 0.6653333,
          size.height * 0.7290000, size.width * 0.6700000, size.height * 0.7290000)
      ..cubicTo(size.width * 0.6993333, size.height * 0.7283333, size.width * 0.7260000,
          size.height * 0.7203333, size.width * 0.7503333, size.height * 0.7053333)
      ..cubicTo(size.width * 0.7746667, size.height * 0.6903333, size.width * 0.7940000,
          size.height * 0.6703333, size.width * 0.8080000, size.height * 0.6453333)
      ..cubicTo(size.width * 0.8220000, size.height * 0.6203333, size.width * 0.8290000,
          size.height * 0.5933333, size.width * 0.8290000, size.height * 0.5643333)
      ..cubicTo(size.width * 0.8290000, size.height * 0.5340000, size.width * 0.8216667,
          size.height * 0.5063333, size.width * 0.8073333, size.height * 0.4816667)
      ..cubicTo(size.width * 0.8320000, size.height * 0.4596667, size.width * 0.8486667,
          size.height * 0.4310000, size.width * 0.8580000, size.height * 0.3956667)
      ..lineTo(size.width * 0.8636667, size.height * 0.3716667)
      ..cubicTo(size.width * 0.8640000, size.height * 0.3713333, size.width * 0.8643333,
          size.height * 0.3703333, size.width * 0.8643333, size.height * 0.3690000)
      ..cubicTo(size.width * 0.8643333, size.height * 0.3666667, size.width * 0.8626667,
          size.height * 0.3646667, size.width * 0.8590000, size.height * 0.3636667)
      ..lineTo(size.width * 0.8386667, size.height * 0.3580000)
      ..cubicTo(size.width * 0.8240000, size.height * 0.3536667, size.width * 0.8110000,
          size.height * 0.3473333, size.width * 0.7996667, size.height * 0.3390000)
      ..cubicTo(size.width * 0.7883333, size.height * 0.3306667, size.width * 0.7793333,
          size.height * 0.3213333, size.width * 0.7726667, size.height * 0.3110000)
      ..cubicTo(size.width * 0.7660000, size.height * 0.3006667, size.width * 0.7613333,
          size.height * 0.2903333, size.width * 0.7580000, size.height * 0.2793333)
      ..cubicTo(size.width * 0.7546667, size.height * 0.2686667, size.width * 0.7530000,
          size.height * 0.2580000, size.width * 0.7530000, size.height * 0.2476667)
      ..cubicTo(size.width * 0.7530000, size.height * 0.2386667, size.width * 0.7540000,
          size.height * 0.2290000, size.width * 0.7563333, size.height * 0.2190000)
      ..lineTo(size.width * 0.7600000, size.height * 0.1983333)
      ..cubicTo(size.width * 0.7606667, size.height * 0.1953333, size.width * 0.7593333,
          size.height * 0.1926667, size.width * 0.7553333, size.height * 0.1910000)
      ..lineTo(size.width * 0.7286667, size.height * 0.1830000)
      ..cubicTo(size.width * 0.7140000, size.height * 0.1793333, size.width * 0.7003333,
          size.height * 0.1776667, size.width * 0.6870000, size.height * 0.1776667)
      ..cubicTo(size.width * 0.6746667, size.height * 0.1776667, size.width * 0.6623333,
          size.height * 0.1790000, size.width * 0.6496667, size.height * 0.1820000)
      ..cubicTo(size.width * 0.6370000, size.height * 0.1850000, size.width * 0.6240000,
          size.height * 0.1893333, size.width * 0.6103333, size.height * 0.1956667)
      ..cubicTo(size.width * 0.5966667, size.height * 0.2020000, size.width * 0.5836667,
          size.height * 0.2106667, size.width * 0.5710000, size.height * 0.2223333)
      ..cubicTo(size.width * 0.5583333, size.height * 0.2340000, size.width * 0.5473333,
          size.height * 0.2473333, size.width * 0.5380000, size.height * 0.2630000)
      ..cubicTo(size.width * 0.5110000, size.height * 0.2520000, size.width * 0.4846667,
          size.height * 0.2463333, size.width * 0.4586667, size.height * 0.2463333)
      ..cubicTo(size.width * 0.4116667, size.height * 0.2463333, size.width * 0.3696667,
          size.height * 0.2610000, size.width * 0.3333333, size.height * 0.2903333)
      ..cubicTo(size.width * 0.2970000, size.height * 0.3196667, size.width * 0.2733333,
          size.height * 0.3570000, size.width * 0.2630000, size.height * 0.4026667)
      ..cubicTo(size.width * 0.2256667, size.height * 0.4120000, size.width * 0.1950000,
          size.height * 0.4316667, size.width * 0.1713333, size.height * 0.4613333)
      ..cubicTo(size.width * 0.1476667, size.height * 0.4913333, size.width * 0.1356667,
          size.height * 0.5256667, size.width * 0.1356667, size.height * 0.5643333)
      ..close()
      ..moveTo(size.width * 0.3486667, size.height * 0.7006667)
      ..cubicTo(size.width * 0.3486667, size.height * 0.7086667, size.width * 0.3513333,
          size.height * 0.7153333, size.width * 0.3566667, size.height * 0.7206667)
      ..cubicTo(size.width * 0.3620000, size.height * 0.7263333, size.width * 0.3683333,
          size.height * 0.7290000, size.width * 0.3763333, size.height * 0.7290000)
      ..cubicTo(size.width * 0.3843333, size.height * 0.7290000, size.width * 0.3910000,
          size.height * 0.7263333, size.width * 0.3963333, size.height * 0.7206667)
      ..cubicTo(size.width * 0.4016667, size.height * 0.7150000, size.width * 0.4043333,
          size.height * 0.7083333, size.width * 0.4043333, size.height * 0.7006667)
      ..cubicTo(size.width * 0.4043333, size.height * 0.6933333, size.width * 0.4016667,
          size.height * 0.6866667, size.width * 0.3963333, size.height * 0.6813333)
      ..cubicTo(size.width * 0.3910000, size.height * 0.6760000, size.width * 0.3843333,
          size.height * 0.6733333, size.width * 0.3763333, size.height * 0.6733333)
      ..cubicTo(size.width * 0.3686667, size.height * 0.6733333, size.width * 0.3620000,
          size.height * 0.6760000, size.width * 0.3566667, size.height * 0.6813333)
      ..cubicTo(size.width * 0.3513333, size.height * 0.6866667, size.width * 0.3486667,
          size.height * 0.6930000, size.width * 0.3486667, size.height * 0.7006667)
      ..close()
      ..moveTo(size.width * 0.3486667, size.height * 0.8220000)
      ..cubicTo(size.width * 0.3486667, size.height * 0.8296667, size.width * 0.3513333,
          size.height * 0.8360000, size.width * 0.3566667, size.height * 0.8413333)
      ..cubicTo(size.width * 0.3620000, size.height * 0.8466667, size.width * 0.3686667,
          size.height * 0.8493333, size.width * 0.3760000, size.height * 0.8493333)
      ..cubicTo(size.width * 0.3840000, size.height * 0.8493333, size.width * 0.3906667,
          size.height * 0.8466667, size.width * 0.3960000, size.height * 0.8416667)
      ..cubicTo(size.width * 0.4013333, size.height * 0.8363333, size.width * 0.4040000,
          size.height * 0.8300000, size.width * 0.4040000, size.height * 0.8220000)
      ..cubicTo(size.width * 0.4040000, size.height * 0.8140000, size.width * 0.4013333,
          size.height * 0.8076667, size.width * 0.3960000, size.height * 0.8023333)
      ..cubicTo(size.width * 0.3906667, size.height * 0.7970000, size.width * 0.3840000,
          size.height * 0.7946667, size.width * 0.3760000, size.height * 0.7946667)
      ..cubicTo(size.width * 0.3680000, size.height * 0.7946667, size.width * 0.3616667,
          size.height * 0.7973333, size.width * 0.3563333, size.height * 0.8023333)
      ..cubicTo(size.width * 0.3513333, size.height * 0.8073333, size.width * 0.3486667,
          size.height * 0.8140000, size.width * 0.3486667, size.height * 0.8220000)
      ..close()
      ..moveTo(size.width * 0.4553333, size.height * 0.7653333)
      ..cubicTo(size.width * 0.4553333, size.height * 0.7733333, size.width * 0.4580000,
          size.height * 0.7800000, size.width * 0.4633333, size.height * 0.7850000)
      ..cubicTo(size.width * 0.4686667, size.height * 0.7903333, size.width * 0.4753333,
          size.height * 0.7930000, size.width * 0.4826667, size.height * 0.7930000)
      ..cubicTo(size.width * 0.4906667, size.height * 0.7930000, size.width * 0.4973333,
          size.height * 0.7903333, size.width * 0.5030000, size.height * 0.7850000)
      ..cubicTo(size.width * 0.5086667, size.height * 0.7796667, size.width * 0.5113333,
          size.height * 0.7730000, size.width * 0.5113333, size.height * 0.7653333)
      ..cubicTo(size.width * 0.5113333, size.height * 0.7573333, size.width * 0.5086667,
          size.height * 0.7506667, size.width * 0.5030000, size.height * 0.7450000)
      ..cubicTo(size.width * 0.4973333, size.height * 0.7393333, size.width * 0.4906667,
          size.height * 0.7363333, size.width * 0.4826667, size.height * 0.7363333)
      ..cubicTo(size.width * 0.4753333, size.height * 0.7363333, size.width * 0.4690000,
          size.height * 0.7393333, size.width * 0.4633333, size.height * 0.7450000)
      ..cubicTo(size.width * 0.4576667, size.height * 0.7506667, size.width * 0.4553333,
          size.height * 0.7573333, size.width * 0.4553333, size.height * 0.7653333)
      ..close()
      ..moveTo(size.width * 0.4553333, size.height * 0.6440000)
      ..cubicTo(size.width * 0.4553333, size.height * 0.6520000, size.width * 0.4580000,
          size.height * 0.6583333, size.width * 0.4633333, size.height * 0.6633333)
      ..cubicTo(size.width * 0.4686667, size.height * 0.6686667, size.width * 0.4753333,
          size.height * 0.6713333, size.width * 0.4826667, size.height * 0.6713333)
      ..cubicTo(size.width * 0.4906667, size.height * 0.6713333, size.width * 0.4976667,
          size.height * 0.6686667, size.width * 0.5030000, size.height * 0.6636667)
      ..cubicTo(size.width * 0.5083333, size.height * 0.6586667, size.width * 0.5113333,
          size.height * 0.6520000, size.width * 0.5113333, size.height * 0.6440000)
      ..cubicTo(size.width * 0.5113333, size.height * 0.6363333, size.width * 0.5086667,
          size.height * 0.6296667, size.width * 0.5030000, size.height * 0.6240000)
      ..cubicTo(size.width * 0.4973333, size.height * 0.6183333, size.width * 0.4906667,
          size.height * 0.6156667, size.width * 0.4826667, size.height * 0.6156667)
      ..cubicTo(size.width * 0.4753333, size.height * 0.6156667, size.width * 0.4686667,
          size.height * 0.6183333, size.width * 0.4633333, size.height * 0.6240000)
      ..cubicTo(size.width * 0.4580000, size.height * 0.6296667, size.width * 0.4553333,
          size.height * 0.6363333, size.width * 0.4553333, size.height * 0.6440000)
      ..close()
      ..moveTo(size.width * 0.4553333, size.height * 0.8876667)
      ..cubicTo(size.width * 0.4553333, size.height * 0.8950000, size.width * 0.4580000,
          size.height * 0.9013333, size.width * 0.4633333, size.height * 0.9066667)
      ..cubicTo(size.width * 0.4690000, size.height * 0.9123333, size.width * 0.4753333,
          size.height * 0.9150000, size.width * 0.4826667, size.height * 0.9150000)
      ..cubicTo(size.width * 0.4906667, size.height * 0.9150000, size.width * 0.4973333,
          size.height * 0.9123333, size.width * 0.5030000, size.height * 0.9070000)
      ..cubicTo(size.width * 0.5086667, size.height * 0.9016667, size.width * 0.5113333,
          size.height * 0.8953333, size.width * 0.5113333, size.height * 0.8873333)
      ..cubicTo(size.width * 0.5113333, size.height * 0.8793333, size.width * 0.5086667,
          size.height * 0.8726667, size.width * 0.5030000, size.height * 0.8670000)
      ..cubicTo(size.width * 0.4973333, size.height * 0.8613333, size.width * 0.4906667,
          size.height * 0.8583333, size.width * 0.4826667, size.height * 0.8583333)
      ..cubicTo(size.width * 0.4753333, size.height * 0.8583333, size.width * 0.4690000,
          size.height * 0.8613333, size.width * 0.4633333, size.height * 0.8670000)
      ..cubicTo(size.width * 0.4583333, size.height * 0.8730000, size.width * 0.4553333,
          size.height * 0.8800000, size.width * 0.4553333, size.height * 0.8876667)
      ..close()
      ..moveTo(size.width * 0.5633333, size.height * 0.7006667)
      ..cubicTo(size.width * 0.5633333, size.height * 0.7086667, size.width * 0.5660000,
          size.height * 0.7153333, size.width * 0.5716667, size.height * 0.7206667)
      ..cubicTo(size.width * 0.5773333, size.height * 0.7260000, size.width * 0.5836667,
          size.height * 0.7290000, size.width * 0.5916667, size.height * 0.7290000)
      ..cubicTo(size.width * 0.5996667, size.height * 0.7290000, size.width * 0.6060000,
          size.height * 0.7263333, size.width * 0.6113333, size.height * 0.7206667)
      ..cubicTo(size.width * 0.6166667, size.height * 0.7150000, size.width * 0.6193333,
          size.height * 0.7083333, size.width * 0.6193333, size.height * 0.7006667)
      ..cubicTo(size.width * 0.6193333, size.height * 0.6933333, size.width * 0.6166667,
          size.height * 0.6866667, size.width * 0.6113333, size.height * 0.6813333)
      ..cubicTo(size.width * 0.6060000, size.height * 0.6760000, size.width * 0.5996667,
          size.height * 0.6733333, size.width * 0.5916667, size.height * 0.6733333)
      ..cubicTo(size.width * 0.5836667, size.height * 0.6733333, size.width * 0.5773333,
          size.height * 0.6760000, size.width * 0.5716667, size.height * 0.6813333)
      ..cubicTo(size.width * 0.5660000, size.height * 0.6866667, size.width * 0.5633333,
          size.height * 0.6930000, size.width * 0.5633333, size.height * 0.7006667)
      ..close()
      ..moveTo(size.width * 0.5633333, size.height * 0.8220000)
      ..cubicTo(size.width * 0.5633333, size.height * 0.8296667, size.width * 0.5660000,
          size.height * 0.8360000, size.width * 0.5713333, size.height * 0.8413333)
      ..cubicTo(size.width * 0.5766667, size.height * 0.8466667, size.width * 0.5833333,
          size.height * 0.8493333, size.width * 0.5913333, size.height * 0.8493333)
      ..cubicTo(size.width * 0.5993333, size.height * 0.8493333, size.width * 0.6056667,
          size.height * 0.8466667, size.width * 0.6110000, size.height * 0.8413333)
      ..cubicTo(size.width * 0.6163333, size.height * 0.8360000, size.width * 0.6186667,
          size.height * 0.8296667, size.width * 0.6186667, size.height * 0.8216667)
      ..cubicTo(size.width * 0.6186667, size.height * 0.8136667, size.width * 0.6160000,
          size.height * 0.8073333, size.width * 0.6110000, size.height * 0.8020000)
      ..cubicTo(size.width * 0.6056667, size.height * 0.7966667, size.width * 0.5993333,
          size.height * 0.7943333, size.width * 0.5913333, size.height * 0.7943333)
      ..cubicTo(size.width * 0.5833333, size.height * 0.7943333, size.width * 0.5766667,
          size.height * 0.7970000, size.width * 0.5713333, size.height * 0.8020000)
      ..cubicTo(size.width * 0.5660000, size.height * 0.8073333, size.width * 0.5633333,
          size.height * 0.8140000, size.width * 0.5633333, size.height * 0.8220000)
      ..close()
      ..moveTo(size.width * 0.5860000, size.height * 0.2923333)
      ..cubicTo(size.width * 0.5963333, size.height * 0.2743333, size.width * 0.6110000,
          size.height * 0.2603333, size.width * 0.6293333, size.height * 0.2503333)
      ..cubicTo(size.width * 0.6476667, size.height * 0.2403333, size.width * 0.6666667,
          size.height * 0.2353333, size.width * 0.6863333, size.height * 0.2350000)
      ..cubicTo(size.width * 0.6913333, size.height * 0.2350000, size.width * 0.6950000,
          size.height * 0.2353333, size.width * 0.6973333, size.height * 0.2356667)
      ..lineTo(size.width * 0.6973333, size.height * 0.2460000)
      ..cubicTo(size.width * 0.6973333, size.height * 0.2783333, size.width * 0.7060000,
          size.height * 0.3086667, size.width * 0.7233333, size.height * 0.3373333)
      ..cubicTo(size.width * 0.7406667, size.height * 0.3660000, size.width * 0.7650000,
          size.height * 0.3876667, size.width * 0.7956667, size.height * 0.4026667)
      ..cubicTo(size.width * 0.7903333, size.height * 0.4146667, size.width * 0.7820000,
          size.height * 0.4266667, size.width * 0.7703333, size.height * 0.4383333)
      ..cubicTo(size.width * 0.7406667, size.height * 0.4120000, size.width * 0.7050000,
          size.height * 0.3990000, size.width * 0.6626667, size.height * 0.3990000)
      ..lineTo(size.width * 0.6523333, size.height * 0.3990000)
      ..cubicTo(size.width * 0.6433333, size.height * 0.3580000, size.width * 0.6213333,
          size.height * 0.3226667, size.width * 0.5860000, size.height * 0.2923333)
      ..close();
  }

  Path _nightSprinklePath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1370000, size.height * 0.5630000)
      ..cubicTo(size.width * 0.1370000, size.height * 0.6073333, size.width * 0.1523333,
          size.height * 0.6456667, size.width * 0.1833333, size.height * 0.6773333)
      ..cubicTo(size.width * 0.2143333, size.height * 0.7093333, size.width * 0.2520000,
          size.height * 0.7263333, size.width * 0.2966667, size.height * 0.7286667)
      ..cubicTo(size.width * 0.3006667, size.height * 0.7286667, size.width * 0.3026667,
          size.height * 0.7266667, size.width * 0.3026667, size.height * 0.7226667)
      ..lineTo(size.width * 0.3026667, size.height * 0.6783333)
      ..cubicTo(size.width * 0.3026667, size.height * 0.6743333, size.width * 0.3006667,
          size.height * 0.6723333, size.width * 0.2966667, size.height * 0.6723333)
      ..cubicTo(size.width * 0.2680000, size.height * 0.6710000, size.width * 0.2440000,
          size.height * 0.6596667, size.width * 0.2240000, size.height * 0.6383333)
      ..cubicTo(size.width * 0.2040000, size.height * 0.6170000, size.width * 0.1940000,
          size.height * 0.5920000, size.width * 0.1940000, size.height * 0.5630000)
      ..cubicTo(size.width * 0.1940000, size.height * 0.5353333, size.width * 0.2033333,
          size.height * 0.5113333, size.width * 0.2220000, size.height * 0.4906667)
      ..cubicTo(size.width * 0.2406667, size.height * 0.4703333, size.width * 0.2640000,
          size.height * 0.4583333, size.width * 0.2920000, size.height * 0.4550000)
      ..lineTo(size.width * 0.3093333, size.height * 0.4536667)
      ..cubicTo(size.width * 0.3136667, size.height * 0.4536667, size.width * 0.3160000,
          size.height * 0.4516667, size.width * 0.3160000, size.height * 0.4476667)
      ..lineTo(size.width * 0.3183333, size.height * 0.4296667)
      ..cubicTo(size.width * 0.3220000, size.height * 0.3936667, size.width * 0.3370000,
          size.height * 0.3633333, size.width * 0.3640000, size.height * 0.3393333)
      ..cubicTo(size.width * 0.3910000, size.height * 0.3150000, size.width * 0.4226667,
          size.height * 0.3030000, size.width * 0.4590000, size.height * 0.3030000)
      ..cubicTo(size.width * 0.4953333, size.height * 0.3030000, size.width * 0.5270000,
          size.height * 0.3153333, size.width * 0.5543333, size.height * 0.3396667)
      ..cubicTo(size.width * 0.5816667, size.height * 0.3640000, size.width * 0.5970000,
          size.height * 0.3940000, size.width * 0.6010000, size.height * 0.4300000)
      ..lineTo(size.width * 0.6033333, size.height * 0.4490000)
      ..cubicTo(size.width * 0.6033333, size.height * 0.4530000, size.width * 0.6053333,
          size.height * 0.4553333, size.width * 0.6093333, size.height * 0.4553333)
      ..lineTo(size.width * 0.6633333, size.height * 0.4553333)
      ..cubicTo(size.width * 0.6930000, size.height * 0.4553333, size.width * 0.7183333,
          size.height * 0.4660000, size.width * 0.7400000, size.height * 0.4873333)
      ..cubicTo(size.width * 0.7616667, size.height * 0.5086667, size.width * 0.7723333,
          size.height * 0.5340000, size.width * 0.7723333, size.height * 0.5630000)
      ..cubicTo(size.width * 0.7723333, size.height * 0.5920000, size.width * 0.7623333,
          size.height * 0.6170000, size.width * 0.7423333, size.height * 0.6383333)
      ..cubicTo(size.width * 0.7223333, size.height * 0.6596667, size.width * 0.6980000,
          size.height * 0.6710000, size.width * 0.6696667, size.height * 0.6723333)
      ..cubicTo(size.width * 0.6656667, size.height * 0.6723333, size.width * 0.6633333,
          size.height * 0.6743333, size.width * 0.6633333, size.height * 0.6783333)
      ..lineTo(size.width * 0.6633333, size.height * 0.7226667)
      ..cubicTo(size.width * 0.6633333, size.height * 0.7266667, size.width * 0.6653333,
          size.height * 0.7286667, size.width * 0.6696667, size.height * 0.7286667)
      ..cubicTo(size.width * 0.6990000, size.height * 0.7276667, size.width * 0.7256667,
          size.height * 0.7196667, size.width * 0.7500000, size.height * 0.7046667)
      ..cubicTo(size.width * 0.7743333, size.height * 0.6896667, size.width * 0.7936667,
          size.height * 0.6696667, size.width * 0.8076667, size.height * 0.6446667)
      ..cubicTo(size.width * 0.8216667, size.height * 0.6196667, size.width * 0.8286667,
          size.height * 0.5923333, size.width * 0.8286667, size.height * 0.5633333)
      ..cubicTo(size.width * 0.8286667, size.height * 0.5343333, size.width * 0.8210000,
          size.height * 0.5073333, size.width * 0.8060000, size.height * 0.4816667)
      ..cubicTo(size.width * 0.8320000, size.height * 0.4570000, size.width * 0.8490000,
          size.height * 0.4283333, size.width * 0.8573333, size.height * 0.3956667)
      ..lineTo(size.width * 0.8620000, size.height * 0.3713333)
      ..cubicTo(size.width * 0.8623333, size.height * 0.3710000, size.width * 0.8626667,
          size.height * 0.3703333, size.width * 0.8626667, size.height * 0.3690000)
      ..cubicTo(size.width * 0.8626667, size.height * 0.3666667, size.width * 0.8610000,
          size.height * 0.3646667, size.width * 0.8573333, size.height * 0.3636667)
      ..lineTo(size.width * 0.8383333, size.height * 0.3580000)
      ..cubicTo(size.width * 0.8193333, size.height * 0.3526667, size.width * 0.8030000,
          size.height * 0.3433333, size.width * 0.7896667, size.height * 0.3306667)
      ..cubicTo(size.width * 0.7760000, size.height * 0.3180000, size.width * 0.7663333,
          size.height * 0.3043333, size.width * 0.7606667, size.height * 0.2903333)
      ..cubicTo(size.width * 0.7550000, size.height * 0.2760000, size.width * 0.7520000,
          size.height * 0.2620000, size.width * 0.7520000, size.height * 0.2476667)
      ..cubicTo(size.width * 0.7520000, size.height * 0.2380000, size.width * 0.7533333,
          size.height * 0.2286667, size.width * 0.7556667, size.height * 0.2193333)
      ..lineTo(size.width * 0.7600000, size.height * 0.1990000)
      ..cubicTo(size.width * 0.7606667, size.height * 0.1956667, size.width * 0.7593333,
          size.height * 0.1930000, size.width * 0.7556667, size.height * 0.1913333)
      ..lineTo(size.width * 0.7290000, size.height * 0.1833333)
      ..cubicTo(size.width * 0.7140000, size.height * 0.1800000, size.width * 0.7000000,
          size.height * 0.1783333, size.width * 0.6866667, size.height * 0.1783333)
      ..cubicTo(size.width * 0.6746667, size.height * 0.1783333, size.width * 0.6623333,
          size.height * 0.1796667, size.width * 0.6493333, size.height * 0.1826667)
      ..cubicTo(size.width * 0.6366667, size.height * 0.1856667, size.width * 0.6233333,
          size.height * 0.1900000, size.width * 0.6096667, size.height * 0.1960000)
      ..cubicTo(size.width * 0.5960000, size.height * 0.2020000, size.width * 0.5826667,
          size.height * 0.2106667, size.width * 0.5696667, size.height * 0.2223333)
      ..cubicTo(size.width * 0.5566667, size.height * 0.2340000, size.width * 0.5456667,
          size.height * 0.2470000, size.width * 0.5363333, size.height * 0.2623333)
      ..cubicTo(size.width * 0.5093333, size.height * 0.2520000, size.width * 0.4833333,
          size.height * 0.2470000, size.width * 0.4586667, size.height * 0.2470000)
      ..cubicTo(size.width * 0.4116667, size.height * 0.2470000, size.width * 0.3696667,
          size.height * 0.2616667, size.width * 0.3333333, size.height * 0.2910000)
      ..cubicTo(size.width * 0.2970000, size.height * 0.3203333, size.width * 0.2733333,
          size.height * 0.3576667, size.width * 0.2630000, size.height * 0.4030000)
      ..cubicTo(size.width * 0.2260000, size.height * 0.4116667, size.width * 0.1956667,
          size.height * 0.4310000, size.width * 0.1720000, size.height * 0.4610000)
      ..cubicTo(size.width * 0.1490000, size.height * 0.4903333, size.width * 0.1370000,
          size.height * 0.5246667, size.width * 0.1370000, size.height * 0.5630000)
      ..close()
      ..moveTo(size.width * 0.3350000, size.height * 0.5923333)
      ..cubicTo(size.width * 0.3350000, size.height * 0.6050000, size.width * 0.3396667,
          size.height * 0.6160000, size.width * 0.3490000, size.height * 0.6250000)
      ..cubicTo(size.width * 0.3583333, size.height * 0.6340000, size.width * 0.3696667,
          size.height * 0.6383333, size.width * 0.3830000, size.height * 0.6383333)
      ..cubicTo(size.width * 0.3963333, size.height * 0.6383333, size.width * 0.4073333,
          size.height * 0.6340000, size.width * 0.4163333, size.height * 0.6250000)
      ..cubicTo(size.width * 0.4253333, size.height * 0.6160000, size.width * 0.4296667,
          size.height * 0.6053333, size.width * 0.4296667, size.height * 0.5923333)
      ..cubicTo(size.width * 0.4296667, size.height * 0.5836667, size.width * 0.4256667,
          size.height * 0.5723333, size.width * 0.4180000, size.height * 0.5583333)
      ..cubicTo(size.width * 0.4103333, size.height * 0.5443333, size.width * 0.4030000,
          size.height * 0.5333333, size.width * 0.3963333, size.height * 0.5256667)
      ..cubicTo(size.width * 0.3926667, size.height * 0.5216667, size.width * 0.3883333,
          size.height * 0.5170000, size.width * 0.3826667, size.height * 0.5113333)
      ..lineTo(size.width * 0.3710000, size.height * 0.5250000)
      ..cubicTo(size.width * 0.3620000, size.height * 0.5346667, size.width * 0.3536667,
          size.height * 0.5463333, size.width * 0.3460000, size.height * 0.5596667)
      ..cubicTo(size.width * 0.3383333, size.height * 0.5730000, size.width * 0.3350000,
          size.height * 0.5836667, size.width * 0.3350000, size.height * 0.5923333)
      ..close()
      ..moveTo(size.width * 0.4346667, size.height * 0.7253333)
      ..cubicTo(size.width * 0.4346667, size.height * 0.7473333, size.width * 0.4423333,
          size.height * 0.7656667, size.width * 0.4573333, size.height * 0.7806667)
      ..cubicTo(size.width * 0.4726667, size.height * 0.7956667, size.width * 0.4910000,
          size.height * 0.8030000, size.width * 0.5123333, size.height * 0.8030000)
      ..cubicTo(size.width * 0.5343333, size.height * 0.8030000, size.width * 0.5526667,
          size.height * 0.7953333, size.width * 0.5676667, size.height * 0.7803333)
      ..cubicTo(size.width * 0.5826667, size.height * 0.7650000, size.width * 0.5903333,
          size.height * 0.7466667, size.width * 0.5903333, size.height * 0.7253333)
      ..cubicTo(size.width * 0.5903333, size.height * 0.7070000, size.width * 0.5813333,
          size.height * 0.6846667, size.width * 0.5636667, size.height * 0.6586667)
      ..cubicTo(size.width * 0.5490000, size.height * 0.6393333, size.width * 0.5346667,
          size.height * 0.6226667, size.width * 0.5210000, size.height * 0.6090000)
      ..cubicTo(size.width * 0.5183333, size.height * 0.6070000, size.width * 0.5153333,
          size.height * 0.6046667, size.width * 0.5123333, size.height * 0.6013333)
      ..lineTo(size.width * 0.5046667, size.height * 0.6090000)
      ..cubicTo(size.width * 0.4916667, size.height * 0.6210000, size.width * 0.4773333,
          size.height * 0.6376667, size.width * 0.4620000, size.height * 0.6583333)
      ..cubicTo(size.width * 0.4540000, size.height * 0.6693333, size.width * 0.4476667,
          size.height * 0.6810000, size.width * 0.4423333, size.height * 0.6930000)
      ..cubicTo(size.width * 0.4370000, size.height * 0.7053333, size.width * 0.4346667,
          size.height * 0.7160000, size.width * 0.4346667, size.height * 0.7253333)
      ..close()
      ..moveTo(size.width * 0.4836667, size.height * 0.5030000)
      ..cubicTo(size.width * 0.4836667, size.height * 0.5116667, size.width * 0.4870000,
          size.height * 0.5186667, size.width * 0.4933333, size.height * 0.5250000)
      ..cubicTo(size.width * 0.4996667, size.height * 0.5313333, size.width * 0.5073333,
          size.height * 0.5340000, size.width * 0.5166667, size.height * 0.5340000)
      ..cubicTo(size.width * 0.5253333, size.height * 0.5340000, size.width * 0.5323333,
          size.height * 0.5310000, size.width * 0.5386667, size.height * 0.5250000)
      ..cubicTo(size.width * 0.5446667, size.height * 0.5190000, size.width * 0.5476667,
          size.height * 0.5116667, size.width * 0.5476667, size.height * 0.5030000)
      ..cubicTo(size.width * 0.5476667, size.height * 0.4886667, size.width * 0.5373333,
          size.height * 0.4706667, size.width * 0.5166667, size.height * 0.4490000)
      ..lineTo(size.width * 0.5083333, size.height * 0.4580000)
      ..cubicTo(size.width * 0.5023333, size.height * 0.4646667, size.width * 0.4966667,
          size.height * 0.4723333, size.width * 0.4916667, size.height * 0.4813333)
      ..cubicTo(size.width * 0.4860000, size.height * 0.4903333, size.width * 0.4836667,
          size.height * 0.4976667, size.width * 0.4836667, size.height * 0.5030000)
      ..close()
      ..moveTo(size.width * 0.5853333, size.height * 0.2923333)
      ..cubicTo(size.width * 0.5970000, size.height * 0.2733333, size.width * 0.6120000,
          size.height * 0.2590000, size.width * 0.6300000, size.height * 0.2493333)
      ..cubicTo(size.width * 0.6480000, size.height * 0.2396667, size.width * 0.6673333,
          size.height * 0.2346667, size.width * 0.6873333, size.height * 0.2346667)
      ..cubicTo(size.width * 0.6913333, size.height * 0.2346667, size.width * 0.6943333,
          size.height * 0.2350000, size.width * 0.6963333, size.height * 0.2353333)
      ..lineTo(size.width * 0.6963333, size.height * 0.2453333)
      ..cubicTo(size.width * 0.6963333, size.height * 0.2773333, size.width * 0.7050000,
          size.height * 0.3076667, size.width * 0.7226667, size.height * 0.3366667)
      ..cubicTo(size.width * 0.7403333, size.height * 0.3656667, size.width * 0.7643333,
          size.height * 0.3873333, size.width * 0.7953333, size.height * 0.4023333)
      ..cubicTo(size.width * 0.7900000, size.height * 0.4150000, size.width * 0.7816667,
          size.height * 0.4263333, size.width * 0.7703333, size.height * 0.4366667)
      ..cubicTo(size.width * 0.7393333, size.height * 0.4113333, size.width * 0.7040000,
          size.height * 0.3986667, size.width * 0.6633333, size.height * 0.3986667)
      ..lineTo(size.width * 0.6523333, size.height * 0.3986667)
      ..cubicTo(size.width * 0.6423333, size.height * 0.3550000, size.width * 0.6200000,
          size.height * 0.3196667, size.width * 0.5853333, size.height * 0.2923333)
      ..close();
  }

  Path _nightStormShowersPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1363333, size.height * 0.5630000)
      ..cubicTo(size.width * 0.1363333, size.height * 0.6000000, size.width * 0.1473333,
          size.height * 0.6330000, size.width * 0.1693333, size.height * 0.6620000)
      ..cubicTo(size.width * 0.1913333, size.height * 0.6910000, size.width * 0.2200000,
          size.height * 0.7110000, size.width * 0.2553333, size.height * 0.7216667)
      ..lineTo(size.width * 0.2336667, size.height * 0.7783333)
      ..cubicTo(size.width * 0.2323333, size.height * 0.7830000, size.width * 0.2336667,
          size.height * 0.7853333, size.width * 0.2383333, size.height * 0.7853333)
      ..lineTo(size.width * 0.3090000, size.height * 0.7853333)
      ..lineTo(size.width * 0.2660000, size.height * 0.9246667)
      ..lineTo(size.width * 0.2753333, size.height * 0.9246667)
      ..lineTo(size.width * 0.4163333, size.height * 0.7373333)
      ..cubicTo(size.width * 0.4176667, size.height * 0.7360000, size.width * 0.4176667,
          size.height * 0.7343333, size.width * 0.4170000, size.height * 0.7326667)
      ..cubicTo(size.width * 0.4160000, size.height * 0.7310000, size.width * 0.4146667,
          size.height * 0.7303333, size.width * 0.4123333, size.height * 0.7303333)
      ..lineTo(size.width * 0.3396667, size.height * 0.7303333)
      ..lineTo(size.width * 0.4220000, size.height * 0.5756667)
      ..cubicTo(size.width * 0.4243333, size.height * 0.5710000, size.width * 0.4230000,
          size.height * 0.5683333, size.width * 0.4176667, size.height * 0.5683333)
      ..lineTo(size.width * 0.3190000, size.height * 0.5683333)
      ..cubicTo(size.width * 0.3160000, size.height * 0.5683333, size.width * 0.3136667,
          size.height * 0.5700000, size.width * 0.3116667, size.height * 0.5733333)
      ..lineTo(size.width * 0.2760000, size.height * 0.6693333)
      ..cubicTo(size.width * 0.2523333, size.height * 0.6633333, size.width * 0.2326667,
          size.height * 0.6503333, size.width * 0.2166667, size.height * 0.6303333)
      ..cubicTo(size.width * 0.2006667, size.height * 0.6103333, size.width * 0.1930000,
          size.height * 0.5880000, size.width * 0.1930000, size.height * 0.5633333)
      ..cubicTo(size.width * 0.1930000, size.height * 0.5356667, size.width * 0.2023333,
          size.height * 0.5116667, size.width * 0.2213333, size.height * 0.4910000)
      ..cubicTo(size.width * 0.2403333, size.height * 0.4706667, size.width * 0.2636667,
          size.height * 0.4586667, size.width * 0.2913333, size.height * 0.4553333)
      ..lineTo(size.width * 0.3090000, size.height * 0.4530000)
      ..cubicTo(size.width * 0.3133333, size.height * 0.4530000, size.width * 0.3156667,
          size.height * 0.4510000, size.width * 0.3156667, size.height * 0.4470000)
      ..lineTo(size.width * 0.3180000, size.height * 0.4300000)
      ..cubicTo(size.width * 0.3216667, size.height * 0.3940000, size.width * 0.3366667,
          size.height * 0.3636667, size.width * 0.3636667, size.height * 0.3393333)
      ..cubicTo(size.width * 0.3906667, size.height * 0.3150000, size.width * 0.4223333,
          size.height * 0.3026667, size.width * 0.4586667, size.height * 0.3026667)
      ..cubicTo(size.width * 0.4950000, size.height * 0.3026667, size.width * 0.5266667,
          size.height * 0.3150000, size.width * 0.5540000, size.height * 0.3393333)
      ..cubicTo(size.width * 0.5813333, size.height * 0.3636667, size.width * 0.5966667,
          size.height * 0.3940000, size.width * 0.6006667, size.height * 0.4296667)
      ..lineTo(size.width * 0.6030000, size.height * 0.4486667)
      ..cubicTo(size.width * 0.6030000, size.height * 0.4526667, size.width * 0.6050000,
          size.height * 0.4550000, size.width * 0.6086667, size.height * 0.4550000)
      ..lineTo(size.width * 0.6626667, size.height * 0.4550000)
      ..cubicTo(size.width * 0.6930000, size.height * 0.4550000, size.width * 0.7186667,
          size.height * 0.4656667, size.width * 0.7403333, size.height * 0.4866667)
      ..cubicTo(size.width * 0.7620000, size.height * 0.5076667, size.width * 0.7726667,
          size.height * 0.5333333, size.width * 0.7726667, size.height * 0.5626667)
      ..cubicTo(size.width * 0.7726667, size.height * 0.5910000, size.width * 0.7626667,
          size.height * 0.6156667, size.width * 0.7426667, size.height * 0.6363333)
      ..cubicTo(size.width * 0.7226667, size.height * 0.6570000, size.width * 0.6983333,
          size.height * 0.6686667, size.width * 0.6693333, size.height * 0.6706667)
      ..cubicTo(size.width * 0.6653333, size.height * 0.6706667, size.width * 0.6630000,
          size.height * 0.6726667, size.width * 0.6630000, size.height * 0.6770000)
      ..lineTo(size.width * 0.6630000, size.height * 0.7223333)
      ..cubicTo(size.width * 0.6630000, size.height * 0.7263333, size.width * 0.6650000,
          size.height * 0.7283333, size.width * 0.6693333, size.height * 0.7283333)
      ..cubicTo(size.width * 0.7136667, size.height * 0.7270000, size.width * 0.7513333,
          size.height * 0.7100000, size.width * 0.7823333, size.height * 0.6780000)
      ..cubicTo(size.width * 0.8133333, size.height * 0.6456667, size.width * 0.8286667,
          size.height * 0.6073333, size.width * 0.8286667, size.height * 0.5630000)
      ..cubicTo(size.width * 0.8286667, size.height * 0.5340000, size.width * 0.8213333,
          size.height * 0.5070000, size.width * 0.8066667, size.height * 0.4813333)
      ..cubicTo(size.width * 0.8320000, size.height * 0.4566667, size.width * 0.8490000,
          size.height * 0.4276667, size.width * 0.8570000, size.height * 0.3940000)
      ..lineTo(size.width * 0.8633333, size.height * 0.3713333)
      ..cubicTo(size.width * 0.8636667, size.height * 0.3710000, size.width * 0.8636667,
          size.height * 0.3703333, size.width * 0.8636667, size.height * 0.3690000)
      ..cubicTo(size.width * 0.8636667, size.height * 0.3663333, size.width * 0.8620000,
          size.height * 0.3646667, size.width * 0.8586667, size.height * 0.3636667)
      ..lineTo(size.width * 0.8380000, size.height * 0.3580000)
      ..cubicTo(size.width * 0.8190000, size.height * 0.3523333, size.width * 0.8026667,
          size.height * 0.3430000, size.width * 0.7893333, size.height * 0.3300000)
      ..cubicTo(size.width * 0.7760000, size.height * 0.3170000, size.width * 0.7666667,
          size.height * 0.3033333, size.width * 0.7610000, size.height * 0.2893333)
      ..cubicTo(size.width * 0.7553333, size.height * 0.2753333, size.width * 0.7526667,
          size.height * 0.2613333, size.width * 0.7530000, size.height * 0.2473333)
      ..cubicTo(size.width * 0.7530000, size.height * 0.2380000, size.width * 0.7540000,
          size.height * 0.2286667, size.width * 0.7563333, size.height * 0.2190000)
      ..lineTo(size.width * 0.7600000, size.height * 0.1986667)
      ..cubicTo(size.width * 0.7606667, size.height * 0.1953333, size.width * 0.7593333,
          size.height * 0.1926667, size.width * 0.7553333, size.height * 0.1910000)
      ..lineTo(size.width * 0.7286667, size.height * 0.1830000)
      ..cubicTo(size.width * 0.7130000, size.height * 0.1800000, size.width * 0.6993333,
          size.height * 0.1783333, size.width * 0.6873333, size.height * 0.1783333)
      ..cubicTo(size.width * 0.6750000, size.height * 0.1780000, size.width * 0.6623333,
          size.height * 0.1793333, size.width * 0.6496667, size.height * 0.1823333)
      ..cubicTo(size.width * 0.6370000, size.height * 0.1850000, size.width * 0.6236667,
          size.height * 0.1896667, size.width * 0.6100000, size.height * 0.1956667)
      ..cubicTo(size.width * 0.5963333, size.height * 0.2016667, size.width * 0.5833333,
          size.height * 0.2106667, size.width * 0.5706667, size.height * 0.2220000)
      ..cubicTo(size.width * 0.5580000, size.height * 0.2333333, size.width * 0.5470000,
          size.height * 0.2466667, size.width * 0.5376667, size.height * 0.2620000)
      ..cubicTo(size.width * 0.5100000, size.height * 0.2516667, size.width * 0.4836667,
          size.height * 0.2466667, size.width * 0.4590000, size.height * 0.2466667)
      ..cubicTo(size.width * 0.4120000, size.height * 0.2466667, size.width * 0.3700000,
          size.height * 0.2613333, size.width * 0.3336667, size.height * 0.2906667)
      ..cubicTo(size.width * 0.2973333, size.height * 0.3200000, size.width * 0.2736667,
          size.height * 0.3573333, size.width * 0.2633333, size.height * 0.4026667)
      ..cubicTo(size.width * 0.2263333, size.height * 0.4113333, size.width * 0.1960000,
          size.height * 0.4306667, size.width * 0.1720000, size.height * 0.4606667)
      ..cubicTo(size.width * 0.1483333, size.height * 0.4903333, size.width * 0.1363333,
          size.height * 0.5246667, size.width * 0.1363333, size.height * 0.5630000)
      ..close()
      ..moveTo(size.width * 0.4086667, size.height * 0.8920000)
      ..cubicTo(size.width * 0.4086667, size.height * 0.8973333, size.width * 0.4103333,
          size.height * 0.9023333, size.width * 0.4136667, size.height * 0.9076667)
      ..cubicTo(size.width * 0.4170000, size.height * 0.9130000, size.width * 0.4220000,
          size.height * 0.9166667, size.width * 0.4286667, size.height * 0.9186667)
      ..cubicTo(size.width * 0.4340000, size.height * 0.9196667, size.width * 0.4370000,
          size.height * 0.9203333, size.width * 0.4376667, size.height * 0.9203333)
      ..cubicTo(size.width * 0.4406667, size.height * 0.9203333, size.width * 0.4450000,
          size.height * 0.9193333, size.width * 0.4500000, size.height * 0.9170000)
      ..cubicTo(size.width * 0.4570000, size.height * 0.9136667, size.width * 0.4616667,
          size.height * 0.9080000, size.width * 0.4640000, size.height * 0.8993333)
      ..lineTo(size.width * 0.4733333, size.height * 0.8643333)
      ..cubicTo(size.width * 0.4753333, size.height * 0.8570000, size.width * 0.4746667,
          size.height * 0.8500000, size.width * 0.4706667, size.height * 0.8433333)
      ..cubicTo(size.width * 0.4666667, size.height * 0.8366667, size.width * 0.4610000,
          size.height * 0.8320000, size.width * 0.4530000, size.height * 0.8296667)
      ..cubicTo(size.width * 0.4456667, size.height * 0.8276667, size.width * 0.4386667,
          size.height * 0.8286667, size.width * 0.4320000, size.height * 0.8323333)
      ..cubicTo(size.width * 0.4253333, size.height * 0.8363333, size.width * 0.4206667,
          size.height * 0.8423333, size.width * 0.4183333, size.height * 0.8500000)
      ..lineTo(size.width * 0.4093333, size.height * 0.8833333)
      ..lineTo(size.width * 0.4086667, size.height * 0.8920000)
      ..close()
      ..moveTo(size.width * 0.4533333, size.height * 0.7333333)
      ..cubicTo(size.width * 0.4533333, size.height * 0.7476667, size.width * 0.4600000,
          size.height * 0.7560000, size.width * 0.4736667, size.height * 0.7583333)
      ..cubicTo(size.width * 0.4783333, size.height * 0.7593333, size.width * 0.4813333,
          size.height * 0.7600000, size.width * 0.4826667, size.height * 0.7600000)
      ..cubicTo(size.width * 0.4953333, size.height * 0.7600000, size.width * 0.5036667,
          size.height * 0.7530000, size.width * 0.5083333, size.height * 0.7390000)
      ..lineTo(size.width * 0.5183333, size.height * 0.7050000)
      ..cubicTo(size.width * 0.5203333, size.height * 0.6976667, size.width * 0.5193333,
          size.height * 0.6906667, size.width * 0.5156667, size.height * 0.6840000)
      ..cubicTo(size.width * 0.5120000, size.height * 0.6773333, size.width * 0.5056667,
          size.height * 0.6726667, size.width * 0.4980000, size.height * 0.6703333)
      ..cubicTo(size.width * 0.4906667, size.height * 0.6680000, size.width * 0.4833333,
          size.height * 0.6686667, size.width * 0.4766667, size.height * 0.6726667)
      ..cubicTo(size.width * 0.4700000, size.height * 0.6766667, size.width * 0.4653333,
          size.height * 0.6823333, size.width * 0.4630000, size.height * 0.6903333)
      ..lineTo(size.width * 0.4546667, size.height * 0.7240000)
      ..cubicTo(size.width * 0.4536667, size.height * 0.7270000, size.width * 0.4533333,
          size.height * 0.7300000, size.width * 0.4533333, size.height * 0.7333333)
      ..close()
      ..moveTo(size.width * 0.5470000, size.height * 0.7890000)
      ..cubicTo(size.width * 0.5473333, size.height * 0.7946667, size.width * 0.5493333,
          size.height * 0.8000000, size.width * 0.5530000, size.height * 0.8050000)
      ..cubicTo(size.width * 0.5566667, size.height * 0.8100000, size.width * 0.5620000,
          size.height * 0.8140000, size.width * 0.5690000, size.height * 0.8163333)
      ..cubicTo(size.width * 0.5743333, size.height * 0.8176667, size.width * 0.5780000,
          size.height * 0.8183333, size.width * 0.5800000, size.height * 0.8183333)
      ..cubicTo(size.width * 0.5913333, size.height * 0.8183333, size.width * 0.5993333,
          size.height * 0.8106667, size.width * 0.6036667, size.height * 0.7956667)
      ..lineTo(size.width * 0.6116667, size.height * 0.7616667)
      ..cubicTo(size.width * 0.6140000, size.height * 0.7540000, size.width * 0.6133333,
          size.height * 0.7466667, size.width * 0.6096667, size.height * 0.7396667)
      ..cubicTo(size.width * 0.6060000, size.height * 0.7326667, size.width * 0.6003333,
          size.height * 0.7283333, size.width * 0.5930000, size.height * 0.7260000)
      ..cubicTo(size.width * 0.5846667, size.height * 0.7240000, size.width * 0.5770000,
          size.height * 0.7250000, size.width * 0.5703333, size.height * 0.7286667)
      ..cubicTo(size.width * 0.5636667, size.height * 0.7326667, size.width * 0.5593333,
          size.height * 0.7386667, size.width * 0.5580000, size.height * 0.7463333)
      ..lineTo(size.width * 0.5483333, size.height * 0.7806667)
      ..cubicTo(size.width * 0.5483333, size.height * 0.7813333, size.width * 0.5480000,
          size.height * 0.7826667, size.width * 0.5476667, size.height * 0.7846667)
      ..cubicTo(size.width * 0.5470000, size.height * 0.7870000, size.width * 0.5470000,
          size.height * 0.7883333, size.width * 0.5470000, size.height * 0.7890000)
      ..close()
      ..moveTo(size.width * 0.5863333, size.height * 0.2923333)
      ..cubicTo(size.width * 0.5973333, size.height * 0.2736667, size.width * 0.6123333,
          size.height * 0.2593333, size.width * 0.6310000, size.height * 0.2493333)
      ..cubicTo(size.width * 0.6496667, size.height * 0.2393333, size.width * 0.6693333,
          size.height * 0.2343333, size.width * 0.6896667, size.height * 0.2343333)
      ..lineTo(size.width * 0.6970000, size.height * 0.2343333)
      ..lineTo(size.width * 0.6970000, size.height * 0.2450000)
      ..cubicTo(size.width * 0.6970000, size.height * 0.2663333, size.width * 0.7006667,
          size.height * 0.2870000, size.width * 0.7083333, size.height * 0.3070000)
      ..cubicTo(size.width * 0.7160000, size.height * 0.3270000, size.width * 0.7270000,
          size.height * 0.3453333, size.width * 0.7423333, size.height * 0.3623333)
      ..cubicTo(size.width * 0.7573333, size.height * 0.3793333, size.width * 0.7753333,
          size.height * 0.3926667, size.width * 0.7960000, size.height * 0.4026667)
      ..cubicTo(size.width * 0.7903333, size.height * 0.4153333, size.width * 0.7820000,
          size.height * 0.4266667, size.width * 0.7706667, size.height * 0.4370000)
      ..cubicTo(size.width * 0.7403333, size.height * 0.4110000, size.width * 0.7046667,
          size.height * 0.3980000, size.width * 0.6633333, size.height * 0.3980000)
      ..lineTo(size.width * 0.6523333, size.height * 0.3980000)
      ..cubicTo(size.width * 0.6426667, size.height * 0.3560000, size.width * 0.6206667,
          size.height * 0.3206667, size.width * 0.5863333, size.height * 0.2923333)
      ..close()
      ..moveTo(size.width * 0.5926667, size.height * 0.6290000)
      ..cubicTo(size.width * 0.5926667, size.height * 0.6433333, size.width * 0.6000000,
          size.height * 0.6526667, size.width * 0.6143333, size.height * 0.6563333)
      ..cubicTo(size.width * 0.6190000, size.height * 0.6570000, size.width * 0.6223333,
          size.height * 0.6576667, size.width * 0.6243333, size.height * 0.6576667)
      ..cubicTo(size.width * 0.6363333, size.height * 0.6576667, size.width * 0.6446667,
          size.height * 0.6503333, size.width * 0.6490000, size.height * 0.6360000)
      ..lineTo(size.width * 0.6583333, size.height * 0.6013333)
      ..cubicTo(size.width * 0.6586667, size.height * 0.5996667, size.width * 0.6586667,
          size.height * 0.5973333, size.width * 0.6586667, size.height * 0.5940000)
      ..cubicTo(size.width * 0.6590000, size.height * 0.5883333, size.width * 0.6576667,
          size.height * 0.5830000, size.width * 0.6540000, size.height * 0.5776667)
      ..cubicTo(size.width * 0.6503333, size.height * 0.5723333, size.width * 0.6450000,
          size.height * 0.5686667, size.width * 0.6376667, size.height * 0.5666667)
      ..cubicTo(size.width * 0.6373333, size.height * 0.5666667, size.width * 0.6360000,
          size.height * 0.5666667, size.width * 0.6343333, size.height * 0.5663333)
      ..cubicTo(size.width * 0.6326667, size.height * 0.5660000, size.width * 0.6310000,
          size.height * 0.5660000, size.width * 0.6300000, size.height * 0.5660000)
      ..cubicTo(size.width * 0.6246667, size.height * 0.5660000, size.width * 0.6193333,
          size.height * 0.5676667, size.width * 0.6140000, size.height * 0.5710000)
      ..cubicTo(size.width * 0.6086667, size.height * 0.5743333, size.width * 0.6050000,
          size.height * 0.5796667, size.width * 0.6030000, size.height * 0.5866667)
      ..lineTo(size.width * 0.5933333, size.height * 0.6206667)
      ..cubicTo(size.width * 0.5933333, size.height * 0.6210000, size.width * 0.5933333,
          size.height * 0.6220000, size.width * 0.5930000, size.height * 0.6240000)
      ..cubicTo(size.width * 0.5930000, size.height * 0.6263333, size.width * 0.5926667,
          size.height * 0.6280000, size.width * 0.5926667, size.height * 0.6290000)
      ..close();
  }

  Path _nightThunderstormPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1360000, size.height * 0.5626667)
      ..cubicTo(size.width * 0.1360000, size.height * 0.5996667, size.width * 0.1470000,
          size.height * 0.6326667, size.width * 0.1690000, size.height * 0.6620000)
      ..cubicTo(size.width * 0.1910000, size.height * 0.6913333, size.width * 0.2196667,
          size.height * 0.7110000, size.width * 0.2550000, size.height * 0.7216667)
      ..lineTo(size.width * 0.2330000, size.height * 0.7780000)
      ..cubicTo(size.width * 0.2320000, size.height * 0.7826667, size.width * 0.2336667,
          size.height * 0.7850000, size.width * 0.2380000, size.height * 0.7850000)
      ..lineTo(size.width * 0.3086667, size.height * 0.7850000)
      ..lineTo(size.width * 0.2763333, size.height * 0.9020000)
      ..lineTo(size.width * 0.2860000, size.height * 0.9020000)
      ..lineTo(size.width * 0.4163333, size.height * 0.7373333)
      ..cubicTo(size.width * 0.4176667, size.height * 0.7356667, size.width * 0.4176667,
          size.height * 0.7340000, size.width * 0.4166667, size.height * 0.7323333)
      ..cubicTo(size.width * 0.4156667, size.height * 0.7306667, size.width * 0.4140000,
          size.height * 0.7300000, size.width * 0.4116667, size.height * 0.7300000)
      ..lineTo(size.width * 0.3390000, size.height * 0.7300000)
      ..lineTo(size.width * 0.4216667, size.height * 0.5756667)
      ..cubicTo(size.width * 0.4240000, size.height * 0.5710000, size.width * 0.4226667,
          size.height * 0.5683333, size.width * 0.4173333, size.height * 0.5683333)
      ..lineTo(size.width * 0.3186667, size.height * 0.5683333)
      ..cubicTo(size.width * 0.3156667, size.height * 0.5683333, size.width * 0.3133333,
          size.height * 0.5700000, size.width * 0.3110000, size.height * 0.5730000)
      ..lineTo(size.width * 0.2753333, size.height * 0.6690000)
      ..cubicTo(size.width * 0.2513333, size.height * 0.6630000, size.width * 0.2316667,
          size.height * 0.6500000, size.width * 0.2160000, size.height * 0.6300000)
      ..cubicTo(size.width * 0.2003333, size.height * 0.6100000, size.width * 0.1926667,
          size.height * 0.5876667, size.width * 0.1926667, size.height * 0.5630000)
      ..cubicTo(size.width * 0.1926667, size.height * 0.5353333, size.width * 0.2020000,
          size.height * 0.5113333, size.width * 0.2210000, size.height * 0.4906667)
      ..cubicTo(size.width * 0.2400000, size.height * 0.4700000, size.width * 0.2633333,
          size.height * 0.4583333, size.width * 0.2910000, size.height * 0.4550000)
      ..lineTo(size.width * 0.3083333, size.height * 0.4523333)
      ..cubicTo(size.width * 0.3126667, size.height * 0.4523333, size.width * 0.3150000,
          size.height * 0.4503333, size.width * 0.3150000, size.height * 0.4466667)
      ..lineTo(size.width * 0.3173333, size.height * 0.4293333)
      ..cubicTo(size.width * 0.3210000, size.height * 0.3933333, size.width * 0.3360000,
          size.height * 0.3630000, size.width * 0.3630000, size.height * 0.3386667)
      ..cubicTo(size.width * 0.3900000, size.height * 0.3143333, size.width * 0.4216667,
          size.height * 0.3020000, size.width * 0.4580000, size.height * 0.3020000)
      ..cubicTo(size.width * 0.4940000, size.height * 0.3020000, size.width * 0.5256667,
          size.height * 0.3143333, size.width * 0.5530000, size.height * 0.3386667)
      ..cubicTo(size.width * 0.5803333, size.height * 0.3630000, size.width * 0.5960000,
          size.height * 0.3933333, size.width * 0.6000000, size.height * 0.4290000)
      ..lineTo(size.width * 0.6023333, size.height * 0.4486667)
      ..cubicTo(size.width * 0.6023333, size.height * 0.4523333, size.width * 0.6043333,
          size.height * 0.4543333, size.width * 0.6083333, size.height * 0.4543333)
      ..lineTo(size.width * 0.6623333, size.height * 0.4543333)
      ..cubicTo(size.width * 0.6926667, size.height * 0.4543333, size.width * 0.7183333,
          size.height * 0.4650000, size.width * 0.7400000, size.height * 0.4860000)
      ..cubicTo(size.width * 0.7616667, size.height * 0.5070000, size.width * 0.7723333,
          size.height * 0.5326667, size.width * 0.7723333, size.height * 0.5623333)
      ..cubicTo(size.width * 0.7723333, size.height * 0.5906667, size.width * 0.7623333,
          size.height * 0.6153333, size.width * 0.7423333, size.height * 0.6360000)
      ..cubicTo(size.width * 0.7223333, size.height * 0.6566667, size.width * 0.6980000,
          size.height * 0.6683333, size.width * 0.6690000, size.height * 0.6706667)
      ..cubicTo(size.width * 0.6650000, size.height * 0.6706667, size.width * 0.6626667,
          size.height * 0.6726667, size.width * 0.6626667, size.height * 0.6763333)
      ..lineTo(size.width * 0.6626667, size.height * 0.7223333)
      ..cubicTo(size.width * 0.6626667, size.height * 0.7263333, size.width * 0.6646667,
          size.height * 0.7283333, size.width * 0.6690000, size.height * 0.7283333)
      ..cubicTo(size.width * 0.6983333, size.height * 0.7273333, size.width * 0.7250000,
          size.height * 0.7193333, size.width * 0.7493333, size.height * 0.7043333)
      ..cubicTo(size.width * 0.7736667, size.height * 0.6893333, size.width * 0.7930000,
          size.height * 0.6693333, size.width * 0.8070000, size.height * 0.6443333)
      ..cubicTo(size.width * 0.8210000, size.height * 0.6193333, size.width * 0.8280000,
          size.height * 0.5920000, size.width * 0.8280000, size.height * 0.5626667)
      ..cubicTo(size.width * 0.8280000, size.height * 0.5336667, size.width * 0.8206667,
          size.height * 0.5066667, size.width * 0.8060000, size.height * 0.4810000)
      ..cubicTo(size.width * 0.8323333, size.height * 0.4556667, size.width * 0.8496667,
          size.height * 0.4266667, size.width * 0.8580000, size.height * 0.3936667)
      ..lineTo(size.width * 0.8626667, size.height * 0.3696667)
      ..cubicTo(size.width * 0.8630000, size.height * 0.3693333, size.width * 0.8633333,
          size.height * 0.3683333, size.width * 0.8633333, size.height * 0.3673333)
      ..cubicTo(size.width * 0.8633333, size.height * 0.3650000, size.width * 0.8616667,
          size.height * 0.3633333, size.width * 0.8580000, size.height * 0.3623333)
      ..lineTo(size.width * 0.8393333, size.height * 0.3563333)
      ..cubicTo(size.width * 0.8203333, size.height * 0.3510000, size.width * 0.8040000,
          size.height * 0.3416667, size.width * 0.7906667, size.height * 0.3290000)
      ..cubicTo(size.width * 0.7770000, size.height * 0.3163333, size.width * 0.7673333,
          size.height * 0.3023333, size.width * 0.7616667, size.height * 0.2880000)
      ..cubicTo(size.width * 0.7560000, size.height * 0.2733333, size.width * 0.7530000,
          size.height * 0.2586667, size.width * 0.7530000, size.height * 0.2440000)
      ..cubicTo(size.width * 0.7530000, size.height * 0.2353333, size.width * 0.7540000,
          size.height * 0.2263333, size.width * 0.7556667, size.height * 0.2173333)
      ..lineTo(size.width * 0.7603333, size.height * 0.1970000)
      ..cubicTo(size.width * 0.7616667, size.height * 0.1936667, size.width * 0.7603333,
          size.height * 0.1910000, size.width * 0.7556667, size.height * 0.1893333)
      ..cubicTo(size.width * 0.7486667, size.height * 0.1863333, size.width * 0.7386667,
          size.height * 0.1836667, size.width * 0.7256667, size.height * 0.1806667)
      ..cubicTo(size.width * 0.7126667, size.height * 0.1776667, size.width * 0.7000000,
          size.height * 0.1763333, size.width * 0.6873333, size.height * 0.1763333)
      ..cubicTo(size.width * 0.6753333, size.height * 0.1763333, size.width * 0.6630000,
          size.height * 0.1776667, size.width * 0.6500000, size.height * 0.1806667)
      ..cubicTo(size.width * 0.6373333, size.height * 0.1836667, size.width * 0.6240000,
          size.height * 0.1880000, size.width * 0.6103333, size.height * 0.1943333)
      ..cubicTo(size.width * 0.5966667, size.height * 0.2003333, size.width * 0.5833333,
          size.height * 0.2093333, size.width * 0.5703333, size.height * 0.2210000)
      ..cubicTo(size.width * 0.5573333, size.height * 0.2326667, size.width * 0.5463333,
          size.height * 0.2460000, size.width * 0.5370000, size.height * 0.2616667)
      ..cubicTo(size.width * 0.5096667, size.height * 0.2516667, size.width * 0.4830000,
          size.height * 0.2466667, size.width * 0.4576667, size.height * 0.2466667)
      ..cubicTo(size.width * 0.4106667, size.height * 0.2466667, size.width * 0.3686667,
          size.height * 0.2613333, size.width * 0.3323333, size.height * 0.2903333)
      ..cubicTo(size.width * 0.2960000, size.height * 0.3193333, size.width * 0.2723333,
          size.height * 0.3566667, size.width * 0.2620000, size.height * 0.4023333)
      ..cubicTo(size.width * 0.2250000, size.height * 0.4110000, size.width * 0.1946667,
          size.height * 0.4303333, size.width * 0.1706667, size.height * 0.4603333)
      ..cubicTo(size.width * 0.1480000, size.height * 0.4896667, size.width * 0.1360000,
          size.height * 0.5240000, size.width * 0.1360000, size.height * 0.5626667)
      ..close()
      ..moveTo(size.width * 0.4060000, size.height * 0.8900000)
      ..cubicTo(size.width * 0.4060000, size.height * 0.8953333, size.width * 0.4076667,
          size.height * 0.9006667, size.width * 0.4110000, size.height * 0.9053333)
      ..cubicTo(size.width * 0.4143333, size.height * 0.9103333, size.width * 0.4193333,
          size.height * 0.9136667, size.width * 0.4260000, size.height * 0.9153333)
      ..cubicTo(size.width * 0.4296667, size.height * 0.9160000, size.width * 0.4330000,
          size.height * 0.9163333, size.width * 0.4360000, size.height * 0.9163333)
      ..cubicTo(size.width * 0.4496667, size.height * 0.9163333, size.width * 0.4580000,
          size.height * 0.9093333, size.width * 0.4613333, size.height * 0.8953333)
      ..lineTo(size.width * 0.5386667, size.height * 0.6023333)
      ..cubicTo(size.width * 0.5406667, size.height * 0.5943333, size.width * 0.5400000,
          size.height * 0.5873333, size.width * 0.5363333, size.height * 0.5806667)
      ..cubicTo(size.width * 0.5326667, size.height * 0.5740000, size.width * 0.5270000,
          size.height * 0.5696667, size.width * 0.5196667, size.height * 0.5676667)
      ..cubicTo(size.width * 0.5120000, size.height * 0.5653333, size.width * 0.5046667,
          size.height * 0.5660000, size.width * 0.4980000, size.height * 0.5696667)
      ..cubicTo(size.width * 0.4913333, size.height * 0.5733333, size.width * 0.4866667,
          size.height * 0.5786667, size.width * 0.4846667, size.height * 0.5860000)
      ..lineTo(size.width * 0.4073333, size.height * 0.8806667)
      ..cubicTo(size.width * 0.4063333, size.height * 0.8840000, size.width * 0.4060000,
          size.height * 0.8870000, size.width * 0.4060000, size.height * 0.8900000)
      ..close()
      ..moveTo(size.width * 0.5450000, size.height * 0.7893333)
      ..cubicTo(size.width * 0.5450000, size.height * 0.7946667, size.width * 0.5466667,
          size.height * 0.8000000, size.width * 0.5500000, size.height * 0.8046667)
      ..cubicTo(size.width * 0.5533333, size.height * 0.8093333, size.width * 0.5583333,
          size.height * 0.8130000, size.width * 0.5653333, size.height * 0.8150000)
      ..cubicTo(size.width * 0.5663333, size.height * 0.8150000, size.width * 0.5680000,
          size.height * 0.8150000, size.width * 0.5703333, size.height * 0.8153333)
      ..cubicTo(size.width * 0.5726667, size.height * 0.8156667, size.width * 0.5746667,
          size.height * 0.8156667, size.width * 0.5756667, size.height * 0.8156667)
      ..cubicTo(size.width * 0.5883333, size.height * 0.8156667, size.width * 0.5963333,
          size.height * 0.8086667, size.width * 0.5996667, size.height * 0.7946667)
      ..lineTo(size.width * 0.6496667, size.height * 0.6023333)
      ..cubicTo(size.width * 0.6516667, size.height * 0.5943333, size.width * 0.6510000,
          size.height * 0.5870000, size.width * 0.6470000, size.height * 0.5803333)
      ..cubicTo(size.width * 0.6433333, size.height * 0.5740000, size.width * 0.6376667,
          size.height * 0.5696667, size.width * 0.6300000, size.height * 0.5676667)
      ..cubicTo(size.width * 0.6223333, size.height * 0.5653333, size.width * 0.6150000,
          size.height * 0.5660000, size.width * 0.6083333, size.height * 0.5696667)
      ..cubicTo(size.width * 0.6016667, size.height * 0.5733333, size.width * 0.5973333,
          size.height * 0.5786667, size.width * 0.5953333, size.height * 0.5863333)
      ..lineTo(size.width * 0.5453333, size.height * 0.7803333)
      ..cubicTo(size.width * 0.5453333, size.height * 0.7836667, size.width * 0.5450000,
          size.height * 0.7866667, size.width * 0.5450000, size.height * 0.7893333)
      ..close()
      ..moveTo(size.width * 0.5863333, size.height * 0.2916667)
      ..cubicTo(size.width * 0.5973333, size.height * 0.2726667, size.width * 0.6120000,
          size.height * 0.2583333, size.width * 0.6306667, size.height * 0.2483333)
      ..cubicTo(size.width * 0.6490000, size.height * 0.2383333, size.width * 0.6686667,
          size.height * 0.2333333, size.width * 0.6893333, size.height * 0.2333333)
      ..cubicTo(size.width * 0.6933333, size.height * 0.2333333, size.width * 0.6966667,
          size.height * 0.2333333, size.width * 0.6983333, size.height * 0.2336667)
      ..lineTo(size.width * 0.6983333, size.height * 0.2443333)
      ..cubicTo(size.width * 0.6983333, size.height * 0.2763333, size.width * 0.7070000,
          size.height * 0.3066667, size.width * 0.7243333, size.height * 0.3353333)
      ..cubicTo(size.width * 0.7416667, size.height * 0.3640000, size.width * 0.7660000,
          size.height * 0.3856667, size.width * 0.7966667, size.height * 0.4010000)
      ..cubicTo(size.width * 0.7906667, size.height * 0.4150000, size.width * 0.7820000,
          size.height * 0.4266667, size.width * 0.7703333, size.height * 0.4366667)
      ..cubicTo(size.width * 0.7396667, size.height * 0.4103333, size.width * 0.7040000,
          size.height * 0.3973333, size.width * 0.6630000, size.height * 0.3973333)
      ..lineTo(size.width * 0.6523333, size.height * 0.3973333)
      ..cubicTo(size.width * 0.6430000, size.height * 0.3553333, size.width * 0.6210000,
          size.height * 0.3203333, size.width * 0.5863333, size.height * 0.2916667)
      ..close();
  }

  Path _nightClearPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.2636667, size.height * 0.4826667)
      ..cubicTo(size.width * 0.2636667, size.height * 0.4506667, size.width * 0.2700000,
          size.height * 0.4203333, size.width * 0.2823333, size.height * 0.3910000)
      ..cubicTo(size.width * 0.2946667, size.height * 0.3616667, size.width * 0.3116667,
          size.height * 0.3366667, size.width * 0.3326667, size.height * 0.3156667)
      ..cubicTo(size.width * 0.3536667, size.height * 0.2946667, size.width * 0.3790000,
          size.height * 0.2776667, size.width * 0.4083333, size.height * 0.2650000)
      ..cubicTo(size.width * 0.4376667, size.height * 0.2523333, size.width * 0.4683333,
          size.height * 0.2460000, size.width * 0.5000000, size.height * 0.2460000)
      ..lineTo(size.width * 0.5380000, size.height * 0.2460000)
      ..cubicTo(size.width * 0.5433333, size.height * 0.2473333, size.width * 0.5456667,
          size.height * 0.2506667, size.width * 0.5456667, size.height * 0.2553333)
      ..lineTo(size.width * 0.5473333, size.height * 0.2846667)
      ..cubicTo(size.width * 0.5486667, size.height * 0.3270000, size.width * 0.5636667,
          size.height * 0.3630000, size.width * 0.5930000, size.height * 0.3926667)
      ..cubicTo(size.width * 0.6223333, size.height * 0.4223333, size.width * 0.6576667,
          size.height * 0.4383333, size.width * 0.6993333, size.height * 0.4400000)
      ..lineTo(size.width * 0.7266667, size.height * 0.4423333)
      ..cubicTo(size.width * 0.7320000, size.height * 0.4423333, size.width * 0.7346667,
          size.height * 0.4450000, size.width * 0.7346667, size.height * 0.4500000)
      ..lineTo(size.width * 0.7346667, size.height * 0.4826667)
      ..cubicTo(size.width * 0.7350000, size.height * 0.5253333, size.width * 0.7246667,
          size.height * 0.5650000, size.width * 0.7036667, size.height * 0.6013333)
      ..cubicTo(size.width * 0.6826667, size.height * 0.6376667, size.width * 0.6543333,
          size.height * 0.6663333, size.width * 0.6180000, size.height * 0.6876667)
      ..cubicTo(size.width * 0.5820000, size.height * 0.7086667, size.width * 0.5423333,
          size.height * 0.7193333, size.width * 0.4996667, size.height * 0.7193333)
      ..cubicTo(size.width * 0.4673333, size.height * 0.7193333, size.width * 0.4363333,
          size.height * 0.7130000, size.width * 0.4070000, size.height * 0.7006667)
      ..cubicTo(size.width * 0.3776667, size.height * 0.6883333, size.width * 0.3526667,
          size.height * 0.6713333, size.width * 0.3316667, size.height * 0.6503333)
      ..cubicTo(size.width * 0.3106667, size.height * 0.6293333, size.width * 0.2940000,
          size.height * 0.6040000, size.width * 0.2816667, size.height * 0.5750000)
      ..cubicTo(size.width * 0.2700000, size.height * 0.5456667, size.width * 0.2636667,
          size.height * 0.5150000, size.width * 0.2636667, size.height * 0.4826667)
      ..close()
      ..moveTo(size.width * 0.3246667, size.height * 0.4826667)
      ..cubicTo(size.width * 0.3246667, size.height * 0.5080000, size.width * 0.3296667,
          size.height * 0.5320000, size.width * 0.3396667, size.height * 0.5546667)
      ..cubicTo(size.width * 0.3496667, size.height * 0.5770000, size.width * 0.3630000,
          size.height * 0.5960000, size.width * 0.3793333, size.height * 0.6113333)
      ..cubicTo(size.width * 0.3956667, size.height * 0.6266667, size.width * 0.4143333,
          size.height * 0.6386667, size.width * 0.4356667, size.height * 0.6473333)
      ..cubicTo(size.width * 0.4566667, size.height * 0.6563333, size.width * 0.4783333,
          size.height * 0.6606667, size.width * 0.5003333, size.height * 0.6606667)
      ..cubicTo(size.width * 0.5196667, size.height * 0.6606667, size.width * 0.5393333,
          size.height * 0.6570000, size.width * 0.5590000, size.height * 0.6493333)
      ..cubicTo(size.width * 0.5786667, size.height * 0.6416667, size.width * 0.5970000,
          size.height * 0.6310000, size.width * 0.6140000, size.height * 0.6173333)
      ..cubicTo(size.width * 0.6310000, size.height * 0.6036667, size.width * 0.6453333,
          size.height * 0.5863333, size.width * 0.6576667, size.height * 0.5650000)
      ..cubicTo(size.width * 0.6700000, size.height * 0.5436667, size.width * 0.6776667,
          size.height * 0.5206667, size.width * 0.6813333, size.height * 0.4953333)
      ..cubicTo(size.width * 0.6270000, size.height * 0.4840000, size.width * 0.5833333,
          size.height * 0.4606667, size.width * 0.5506667, size.height * 0.4253333)
      ..cubicTo(size.width * 0.5180000, size.height * 0.3900000, size.width * 0.4990000,
          size.height * 0.3486667, size.width * 0.4940000, size.height * 0.3006667)
      ..cubicTo(size.width * 0.4620000, size.height * 0.3026667, size.width * 0.4333333,
          size.height * 0.3123333, size.width * 0.4070000, size.height * 0.3300000)
      ..cubicTo(size.width * 0.3810000, size.height * 0.3476667, size.width * 0.3606667,
          size.height * 0.3700000, size.width * 0.3463333, size.height * 0.3973333)
      ..cubicTo(size.width * 0.3320000, size.height * 0.4246667, size.width * 0.3246667,
          size.height * 0.4530000, size.width * 0.3246667, size.height * 0.4826667)
      ..close();
  }

  Path _nightFogPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.08866667, size.height * 0.6973333)
      ..cubicTo(size.width * 0.08866667, size.height * 0.7050000, size.width * 0.09133333,
          size.height * 0.7113333, size.width * 0.09700000, size.height * 0.7163333)
      ..cubicTo(size.width * 0.1026667, size.height * 0.7216667, size.width * 0.1096667,
          size.height * 0.7240000, size.width * 0.1176667, size.height * 0.7240000)
      ..lineTo(size.width * 0.7380000, size.height * 0.7240000)
      ..cubicTo(size.width * 0.7460000, size.height * 0.7240000, size.width * 0.7526667,
          size.height * 0.7213333, size.width * 0.7580000, size.height * 0.7163333)
      ..cubicTo(size.width * 0.7636667, size.height * 0.7110000, size.width * 0.7663333,
          size.height * 0.7046667, size.width * 0.7663333, size.height * 0.6973333)
      ..cubicTo(size.width * 0.7663333, size.height * 0.6893333, size.width * 0.7636667,
          size.height * 0.6823333, size.width * 0.7583333, size.height * 0.6770000)
      ..cubicTo(size.width * 0.7530000, size.height * 0.6713333, size.width * 0.7460000,
          size.height * 0.6686667, size.width * 0.7380000, size.height * 0.6686667)
      ..lineTo(size.width * 0.1176667, size.height * 0.6686667)
      ..cubicTo(size.width * 0.1096667, size.height * 0.6686667, size.width * 0.1030000,
          size.height * 0.6713333, size.width * 0.09733333, size.height * 0.6770000)
      ..cubicTo(size.width * 0.09166667, size.height * 0.6826667, size.width * 0.08866667,
          size.height * 0.6896667, size.width * 0.08866667, size.height * 0.6973333)
      ..close()
      ..moveTo(size.width * 0.1756667, size.height * 0.5936667)
      ..cubicTo(size.width * 0.1756667, size.height * 0.6016667, size.width * 0.1786667,
          size.height * 0.6080000, size.width * 0.1843333, size.height * 0.6133333)
      ..cubicTo(size.width * 0.1890000, size.height * 0.6193333, size.width * 0.1953333,
          size.height * 0.6223333, size.width * 0.2040000, size.height * 0.6223333)
      ..lineTo(size.width * 0.8243333, size.height * 0.6223333)
      ..cubicTo(size.width * 0.8320000, size.height * 0.6223333, size.width * 0.8383333,
          size.height * 0.6196667, size.width * 0.8436667, size.height * 0.6140000)
      ..cubicTo(size.width * 0.8490000, size.height * 0.6083333, size.width * 0.8513333,
          size.height * 0.6016667, size.width * 0.8513333, size.height * 0.5936667)
      ..cubicTo(size.width * 0.8513333, size.height * 0.5860000, size.width * 0.8486667,
          size.height * 0.5793333, size.width * 0.8436667, size.height * 0.5743333)
      ..cubicTo(size.width * 0.8386667, size.height * 0.5693333, size.width * 0.8320000,
          size.height * 0.5666667, size.width * 0.8243333, size.height * 0.5666667)
      ..lineTo(size.width * 0.2040000, size.height * 0.5666667)
      ..cubicTo(size.width * 0.1960000, size.height * 0.5666667, size.width * 0.1893333,
          size.height * 0.5693333, size.width * 0.1840000, size.height * 0.5743333)
      ..cubicTo(size.width * 0.1783333, size.height * 0.5796667, size.width * 0.1756667,
          size.height * 0.5860000, size.width * 0.1756667, size.height * 0.5936667)
      ..close()
      ..moveTo(size.width * 0.1806667, size.height * 0.5130000)
      ..lineTo(size.width * 0.1806667, size.height * 0.5113333)
      ..cubicTo(size.width * 0.1793333, size.height * 0.5163333, size.width * 0.1806667,
          size.height * 0.5186667, size.width * 0.1846667, size.height * 0.5186667)
      ..lineTo(size.width * 0.2326667, size.height * 0.5186667)
      ..cubicTo(size.width * 0.2346667, size.height * 0.5186667, size.width * 0.2366667,
          size.height * 0.5170000, size.width * 0.2390000, size.height * 0.5136667)
      ..cubicTo(size.width * 0.2470000, size.height * 0.4963333, size.width * 0.2586667,
          size.height * 0.4823333, size.width * 0.2743333, size.height * 0.4713333)
      ..cubicTo(size.width * 0.2900000, size.height * 0.4603333, size.width * 0.3073333,
          size.height * 0.4540000, size.width * 0.3260000, size.height * 0.4526667)
      ..lineTo(size.width * 0.3436667, size.height * 0.4500000)
      ..cubicTo(size.width * 0.3476667, size.height * 0.4500000, size.width * 0.3500000,
          size.height * 0.4480000, size.width * 0.3500000, size.height * 0.4440000)
      ..lineTo(size.width * 0.3520000, size.height * 0.4273333)
      ..cubicTo(size.width * 0.3556667, size.height * 0.3913333, size.width * 0.3706667,
          size.height * 0.3616667, size.width * 0.3973333, size.height * 0.3373333)
      ..cubicTo(size.width * 0.4240000, size.height * 0.3133333, size.width * 0.4556667,
          size.height * 0.3013333, size.width * 0.4920000, size.height * 0.3013333)
      ..cubicTo(size.width * 0.5276667, size.height * 0.3013333, size.width * 0.5593333,
          size.height * 0.3133333, size.width * 0.5860000, size.height * 0.3370000)
      ..cubicTo(size.width * 0.6126667, size.height * 0.3606667, size.width * 0.6283333,
          size.height * 0.3903333, size.width * 0.6320000, size.height * 0.4260000)
      ..lineTo(size.width * 0.6343333, size.height * 0.4450000)
      ..cubicTo(size.width * 0.6343333, size.height * 0.4490000, size.width * 0.6366667,
          size.height * 0.4510000, size.width * 0.6413333, size.height * 0.4510000)
      ..lineTo(size.width * 0.6940000, size.height * 0.4510000)
      ..cubicTo(size.width * 0.7153333, size.height * 0.4510000, size.width * 0.7350000,
          size.height * 0.4566667, size.width * 0.7523333, size.height * 0.4683333)
      ..cubicTo(size.width * 0.7696667, size.height * 0.4796667, size.width * 0.7830000,
          size.height * 0.4950000, size.width * 0.7913333, size.height * 0.5136667)
      ..cubicTo(size.width * 0.7936667, size.height * 0.5170000, size.width * 0.7960000,
          size.height * 0.5186667, size.width * 0.7986667, size.height * 0.5186667)
      ..lineTo(size.width * 0.8460000, size.height * 0.5186667)
      ..cubicTo(size.width * 0.8500000, size.height * 0.5186667, size.width * 0.8516667,
          size.height * 0.5163333, size.width * 0.8510000, size.height * 0.5113333)
      ..cubicTo(size.width * 0.8436667, size.height * 0.4926667, size.width * 0.8386667,
          size.height * 0.4810000, size.width * 0.8356667, size.height * 0.4760000)
      ..cubicTo(size.width * 0.8596667, size.height * 0.4543333, size.width * 0.8766667,
          size.height * 0.4256667, size.width * 0.8856667, size.height * 0.3903333)
      ..lineTo(size.width * 0.8913333, size.height * 0.3683333)
      ..cubicTo(size.width * 0.8923333, size.height * 0.3663333, size.width * 0.8920000,
          size.height * 0.3643333, size.width * 0.8910000, size.height * 0.3630000)
      ..cubicTo(size.width * 0.8900000, size.height * 0.3616667, size.width * 0.8886667,
          size.height * 0.3606667, size.width * 0.8870000, size.height * 0.3606667)
      ..lineTo(size.width * 0.8663333, size.height * 0.3533333)
      ..cubicTo(size.width * 0.8366667, size.height * 0.3446667, size.width * 0.8140000,
          size.height * 0.3273333, size.width * 0.7983333, size.height * 0.3006667)
      ..cubicTo(size.width * 0.7826667, size.height * 0.2740000, size.width * 0.7786667,
          size.height * 0.2456667, size.width * 0.7860000, size.height * 0.2153333)
      ..lineTo(size.width * 0.7903333, size.height * 0.1960000)
      ..cubicTo(size.width * 0.7920000, size.height * 0.1930000, size.width * 0.7906667,
          size.height * 0.1903333, size.width * 0.7860000, size.height * 0.1883333)
      ..lineTo(size.width * 0.7580000, size.height * 0.1806667)
      ..cubicTo(size.width * 0.7216667, size.height * 0.1716667, size.width * 0.6856667,
          size.height * 0.1746667, size.width * 0.6506667, size.height * 0.1893333)
      ..cubicTo(size.width * 0.6156667, size.height * 0.2040000, size.width * 0.5883333,
          size.height * 0.2276667, size.width * 0.5683333, size.height * 0.2600000)
      ..cubicTo(size.width * 0.5420000, size.height * 0.2496667, size.width * 0.5163333,
          size.height * 0.2446667, size.width * 0.4920000, size.height * 0.2446667)
      ..cubicTo(size.width * 0.4456667, size.height * 0.2446667, size.width * 0.4046667,
          size.height * 0.2593333, size.width * 0.3683333, size.height * 0.2883333)
      ..cubicTo(size.width * 0.3320000, size.height * 0.3173333, size.width * 0.3090000,
          size.height * 0.3546667, size.width * 0.2983333, size.height * 0.4000000)
      ..cubicTo(size.width * 0.2703333, size.height * 0.4066667, size.width * 0.2456667,
          size.height * 0.4200000, size.width * 0.2243333, size.height * 0.4403333)
      ..cubicTo(size.width * 0.2030000, size.height * 0.4606667, size.width * 0.1890000,
          size.height * 0.4850000, size.width * 0.1806667, size.height * 0.5130000)
      ..close()
      ..moveTo(size.width * 0.2333333, size.height * 0.7990000)
      ..cubicTo(size.width * 0.2333333, size.height * 0.8070000, size.width * 0.2363333,
          size.height * 0.8133333, size.width * 0.2420000, size.height * 0.8186667)
      ..cubicTo(size.width * 0.2476667, size.height * 0.8246667, size.width * 0.2543333,
          size.height * 0.8276667, size.width * 0.2616667, size.height * 0.8276667)
      ..lineTo(size.width * 0.8833333, size.height * 0.8276667)
      ..cubicTo(size.width * 0.8910000, size.height * 0.8276667, size.width * 0.8976667,
          size.height * 0.8250000, size.width * 0.9030000, size.height * 0.8193333)
      ..cubicTo(size.width * 0.9083333, size.height * 0.8136667, size.width * 0.9110000,
          size.height * 0.8070000, size.width * 0.9110000, size.height * 0.7990000)
      ..cubicTo(size.width * 0.9110000, size.height * 0.7913333, size.width * 0.9083333,
          size.height * 0.7850000, size.width * 0.9030000, size.height * 0.7796667)
      ..cubicTo(size.width * 0.8976667, size.height * 0.7743333, size.width * 0.8910000,
          size.height * 0.7720000, size.width * 0.8833333, size.height * 0.7720000)
      ..lineTo(size.width * 0.2620000, size.height * 0.7720000)
      ..cubicTo(size.width * 0.2540000, size.height * 0.7720000, size.width * 0.2473333,
          size.height * 0.7746667, size.width * 0.2420000, size.height * 0.7796667)
      ..cubicTo(size.width * 0.2363333, size.height * 0.7850000, size.width * 0.2333333,
          size.height * 0.7913333, size.width * 0.2333333, size.height * 0.7990000)
      ..close()
      ..moveTo(size.width * 0.6170000, size.height * 0.2900000)
      ..cubicTo(size.width * 0.6286667, size.height * 0.2710000, size.width * 0.6443333,
          size.height * 0.2560000, size.width * 0.6640000, size.height * 0.2456667)
      ..cubicTo(size.width * 0.6836667, size.height * 0.2353333, size.width * 0.7043333,
          size.height * 0.2310000, size.width * 0.7263333, size.height * 0.2330000)
      ..cubicTo(size.width * 0.7240000, size.height * 0.2676667, size.width * 0.7320000,
          size.height * 0.3003333, size.width * 0.7496667, size.height * 0.3306667)
      ..cubicTo(size.width * 0.7676667, size.height * 0.3610000, size.width * 0.7923333,
          size.height * 0.3833333, size.width * 0.8236667, size.height * 0.3980000)
      ..cubicTo(size.width * 0.8186667, size.height * 0.4096667, size.width * 0.8103333,
          size.height * 0.4216667, size.width * 0.7986667, size.height * 0.4336667)
      ..cubicTo(size.width * 0.7680000, size.height * 0.4083333, size.width * 0.7330000,
          size.height * 0.3960000, size.width * 0.6940000, size.height * 0.3960000)
      ..lineTo(size.width * 0.6833333, size.height * 0.3960000)
      ..cubicTo(size.width * 0.6726667, size.height * 0.3523333, size.width * 0.6506667,
          size.height * 0.3170000, size.width * 0.6170000, size.height * 0.2900000)
      ..close();
  }

  Path _rainPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1546667, size.height * 0.5636667)
      ..cubicTo(size.width * 0.1546667, size.height * 0.5253333, size.width * 0.1666667,
          size.height * 0.4913333, size.width * 0.1906667, size.height * 0.4613333)
      ..cubicTo(size.width * 0.2146667, size.height * 0.4313333, size.width * 0.2450000,
          size.height * 0.4123333, size.width * 0.2816667, size.height * 0.4036667)
      ..cubicTo(size.width * 0.2920000, size.height * 0.3583333, size.width * 0.3156667,
          size.height * 0.3210000, size.width * 0.3520000, size.height * 0.2916667)
      ..cubicTo(size.width * 0.3883333, size.height * 0.2623333, size.width * 0.4300000,
          size.height * 0.2480000, size.width * 0.4770000, size.height * 0.2480000)
      ..cubicTo(size.width * 0.5230000, size.height * 0.2480000, size.width * 0.5636667,
          size.height * 0.2623333, size.width * 0.5996667, size.height * 0.2906667)
      ..cubicTo(size.width * 0.6356667, size.height * 0.3190000, size.width * 0.6590000,
          size.height * 0.3556667, size.width * 0.6696667, size.height * 0.4003333)
      ..lineTo(size.width * 0.6803333, size.height * 0.4003333)
      ..cubicTo(size.width * 0.7100000, size.height * 0.4003333, size.width * 0.7376667,
          size.height * 0.4076667, size.width * 0.7630000, size.height * 0.4220000)
      ..cubicTo(size.width * 0.7883333, size.height * 0.4363333, size.width * 0.8086667,
          size.height * 0.4563333, size.width * 0.8233333, size.height * 0.4813333)
      ..cubicTo(size.width * 0.8380000, size.height * 0.5063333, size.width * 0.8456667,
          size.height * 0.5340000, size.width * 0.8456667, size.height * 0.5636667)
      ..cubicTo(size.width * 0.8456667, size.height * 0.5930000, size.width * 0.8386667,
          size.height * 0.6200000, size.width * 0.8246667, size.height * 0.6450000)
      ..cubicTo(size.width * 0.8106667, size.height * 0.6700000, size.width * 0.7913333,
          size.height * 0.6900000, size.width * 0.7670000, size.height * 0.7050000)
      ..cubicTo(size.width * 0.7426667, size.height * 0.7200000, size.width * 0.7160000,
          size.height * 0.7280000, size.width * 0.6870000, size.height * 0.7286667)
      ..cubicTo(size.width * 0.6826667, size.height * 0.7286667, size.width * 0.6803333,
          size.height * 0.7266667, size.width * 0.6803333, size.height * 0.7230000)
      ..lineTo(size.width * 0.6803333, size.height * 0.6786667)
      ..cubicTo(size.width * 0.6803333, size.height * 0.6746667, size.width * 0.6826667,
          size.height * 0.6726667, size.width * 0.6870000, size.height * 0.6726667)
      ..cubicTo(size.width * 0.7153333, size.height * 0.6713333, size.width * 0.7396667,
          size.height * 0.6600000, size.width * 0.7596667, size.height * 0.6386667)
      ..cubicTo(size.width * 0.7796667, size.height * 0.6173333, size.width * 0.7896667,
          size.height * 0.5923333, size.width * 0.7896667, size.height * 0.5633333)
      ..cubicTo(size.width * 0.7896667, size.height * 0.5343333, size.width * 0.7786667,
          size.height * 0.5093333, size.width * 0.7570000, size.height * 0.4880000)
      ..cubicTo(size.width * 0.7353333, size.height * 0.4666667, size.width * 0.7096667,
          size.height * 0.4560000, size.width * 0.6800000, size.height * 0.4560000)
      ..lineTo(size.width * 0.6263333, size.height * 0.4560000)
      ..cubicTo(size.width * 0.6223333, size.height * 0.4560000, size.width * 0.6203333,
          size.height * 0.4540000, size.width * 0.6203333, size.height * 0.4503333)
      ..lineTo(size.width * 0.6176667, size.height * 0.4310000)
      ..cubicTo(size.width * 0.6140000, size.height * 0.3950000, size.width * 0.5983333,
          size.height * 0.3646667, size.width * 0.5713333, size.height * 0.3406667)
      ..cubicTo(size.width * 0.5440000, size.height * 0.3163333, size.width * 0.5126667,
          size.height * 0.3043333, size.width * 0.4763333, size.height * 0.3043333)
      ..cubicTo(size.width * 0.4400000, size.height * 0.3043333, size.width * 0.4080000,
          size.height * 0.3163333, size.width * 0.3813333, size.height * 0.3406667)
      ..cubicTo(size.width * 0.3543333, size.height * 0.3650000, size.width * 0.3393333,
          size.height * 0.3950000, size.width * 0.3360000, size.height * 0.4310000)
      ..lineTo(size.width * 0.3336667, size.height * 0.4486667)
      ..cubicTo(size.width * 0.3336667, size.height * 0.4526667, size.width * 0.3313333,
          size.height * 0.4550000, size.width * 0.3270000, size.height * 0.4550000)
      ..lineTo(size.width * 0.3093333, size.height * 0.4560000)
      ..cubicTo(size.width * 0.2816667, size.height * 0.4593333, size.width * 0.2583333,
          size.height * 0.4713333, size.width * 0.2393333, size.height * 0.4916667)
      ..cubicTo(size.width * 0.2203333, size.height * 0.5120000, size.width * 0.2110000,
          size.height * 0.5360000, size.width * 0.2110000, size.height * 0.5636667)
      ..cubicTo(size.width * 0.2110000, size.height * 0.5926667, size.width * 0.2210000,
          size.height * 0.6176667, size.width * 0.2410000, size.height * 0.6390000)
      ..cubicTo(size.width * 0.2610000, size.height * 0.6603333, size.width * 0.2853333,
          size.height * 0.6716667, size.width * 0.3136667, size.height * 0.6730000)
      ..cubicTo(size.width * 0.3173333, size.height * 0.6730000, size.width * 0.3193333,
          size.height * 0.6750000, size.width * 0.3193333, size.height * 0.6790000)
      ..lineTo(size.width * 0.3193333, size.height * 0.7233333)
      ..cubicTo(size.width * 0.3193333, size.height * 0.7270000, size.width * 0.3173333,
          size.height * 0.7290000, size.width * 0.3136667, size.height * 0.7290000)
      ..cubicTo(size.width * 0.2690000, size.height * 0.7270000, size.width * 0.2313333,
          size.height * 0.7100000, size.width * 0.2003333, size.height * 0.6780000)
      ..cubicTo(size.width * 0.1693333, size.height * 0.6460000, size.width * 0.1546667,
          size.height * 0.6080000, size.width * 0.1546667, size.height * 0.5636667)
      ..close()
      ..moveTo(size.width * 0.3330000, size.height * 0.7866667)
      ..cubicTo(size.width * 0.3330000, size.height * 0.7853333, size.width * 0.3333333,
          size.height * 0.7830000, size.width * 0.3343333, size.height * 0.7800000)
      ..lineTo(size.width * 0.3886667, size.height * 0.5876667)
      ..cubicTo(size.width * 0.3906667, size.height * 0.5813333, size.width * 0.3943333,
          size.height * 0.5763333, size.width * 0.3993333, size.height * 0.5730000)
      ..cubicTo(size.width * 0.4043333, size.height * 0.5696667, size.width * 0.4096667,
          size.height * 0.5680000, size.width * 0.4146667, size.height * 0.5680000)
      ..cubicTo(size.width * 0.4170000, size.height * 0.5680000, size.width * 0.4196667,
          size.height * 0.5683333, size.width * 0.4226667, size.height * 0.5690000)
      ..cubicTo(size.width * 0.4306667, size.height * 0.5703333, size.width * 0.4366667,
          size.height * 0.5746667, size.width * 0.4406667, size.height * 0.5813333)
      ..cubicTo(size.width * 0.4446667, size.height * 0.5880000, size.width * 0.4456667,
          size.height * 0.5953333, size.width * 0.4433333, size.height * 0.6036667)
      ..lineTo(size.width * 0.3890000, size.height * 0.7946667)
      ..cubicTo(size.width * 0.3850000, size.height * 0.8090000, size.width * 0.3756667,
          size.height * 0.8160000, size.width * 0.3616667, size.height * 0.8160000)
      ..cubicTo(size.width * 0.3603333, size.height * 0.8160000, size.width * 0.3593333,
          size.height * 0.8156667, size.width * 0.3580000, size.height * 0.8153333)
      ..cubicTo(size.width * 0.3560000, size.height * 0.8146667, size.width * 0.3550000,
          size.height * 0.8143333, size.width * 0.3546667, size.height * 0.8143333)
      ..cubicTo(size.width * 0.3473333, size.height * 0.8123333, size.width * 0.3420000,
          size.height * 0.8086667, size.width * 0.3383333, size.height * 0.8033333)
      ..cubicTo(size.width * 0.3346667, size.height * 0.7976667, size.width * 0.3330000,
          size.height * 0.7923333, size.width * 0.3330000, size.height * 0.7866667)
      ..close()
      ..moveTo(size.width * 0.4203333, size.height * 0.8803333)
      ..lineTo(size.width * 0.5016667, size.height * 0.5880000)
      ..cubicTo(size.width * 0.5030000, size.height * 0.5816667, size.width * 0.5063333,
          size.height * 0.5766667, size.width * 0.5116667, size.height * 0.5733333)
      ..cubicTo(size.width * 0.5170000, size.height * 0.5700000, size.width * 0.5223333,
          size.height * 0.5683333, size.width * 0.5280000, size.height * 0.5683333)
      ..cubicTo(size.width * 0.5310000, size.height * 0.5683333, size.width * 0.5340000,
          size.height * 0.5686667, size.width * 0.5370000, size.height * 0.5693333)
      ..cubicTo(size.width * 0.5443333, size.height * 0.5713333, size.width * 0.5496667,
          size.height * 0.5756667, size.width * 0.5533333, size.height * 0.5823333)
      ..cubicTo(size.width * 0.5570000, size.height * 0.5890000, size.width * 0.5576667,
          size.height * 0.5960000, size.width * 0.5556667, size.height * 0.6036667)
      ..lineTo(size.width * 0.4746667, size.height * 0.8963333)
      ..cubicTo(size.width * 0.4733333, size.height * 0.9020000, size.width * 0.4703333,
          size.height * 0.9066667, size.width * 0.4650000, size.height * 0.9106667)
      ..cubicTo(size.width * 0.4596667, size.height * 0.9146667, size.width * 0.4543333,
          size.height * 0.9166667, size.width * 0.4480000, size.height * 0.9166667)
      ..cubicTo(size.width * 0.4450000, size.height * 0.9166667, size.width * 0.4420000,
          size.height * 0.9160000, size.width * 0.4396667, size.height * 0.9150000)
      ..cubicTo(size.width * 0.4330000, size.height * 0.9133333, size.width * 0.4273333,
          size.height * 0.9090000, size.width * 0.4223333, size.height * 0.9020000)
      ..cubicTo(size.width * 0.4186667, size.height * 0.8960000, size.width * 0.4180000,
          size.height * 0.8890000, size.width * 0.4203333, size.height * 0.8803333)
      ..close()
      ..moveTo(size.width * 0.5580000, size.height * 0.7873333)
      ..cubicTo(size.width * 0.5580000, size.height * 0.7860000, size.width * 0.5583333,
          size.height * 0.7836667, size.width * 0.5593333, size.height * 0.7796667)
      ..lineTo(size.width * 0.6136667, size.height * 0.5873333)
      ..cubicTo(size.width * 0.6156667, size.height * 0.5810000, size.width * 0.6190000,
          size.height * 0.5760000, size.width * 0.6236667, size.height * 0.5726667)
      ..cubicTo(size.width * 0.6286667, size.height * 0.5693333, size.width * 0.6336667,
          size.height * 0.5676667, size.width * 0.6390000, size.height * 0.5676667)
      ..cubicTo(size.width * 0.6416667, size.height * 0.5676667, size.width * 0.6446667,
          size.height * 0.5680000, size.width * 0.6476667, size.height * 0.5686667)
      ..cubicTo(size.width * 0.6546667, size.height * 0.5706667, size.width * 0.6596667,
          size.height * 0.5740000, size.width * 0.6630000, size.height * 0.5790000)
      ..cubicTo(size.width * 0.6663333, size.height * 0.5840000, size.width * 0.6680000,
          size.height * 0.5893333, size.width * 0.6680000, size.height * 0.5946667)
      ..cubicTo(size.width * 0.6680000, size.height * 0.5956667, size.width * 0.6676667,
          size.height * 0.5973333, size.width * 0.6673333, size.height * 0.5993333)
      ..cubicTo(size.width * 0.6670000, size.height * 0.6013333, size.width * 0.6666667,
          size.height * 0.6026667, size.width * 0.6666667, size.height * 0.6033333)
      ..lineTo(size.width * 0.6123333, size.height * 0.7943333)
      ..cubicTo(size.width * 0.6110000, size.height * 0.8006667, size.width * 0.6080000,
          size.height * 0.8060000, size.width * 0.6030000, size.height * 0.8096667)
      ..cubicTo(size.width * 0.5980000, size.height * 0.8133333, size.width * 0.5923333,
          size.height * 0.8153333, size.width * 0.5860000, size.height * 0.8153333)
      ..lineTo(size.width * 0.5780000, size.height * 0.8136667)
      ..cubicTo(size.width * 0.5713333, size.height * 0.8116667, size.width * 0.5663333,
          size.height * 0.8083333, size.width * 0.5626667, size.height * 0.8030000)
      ..cubicTo(size.width * 0.5596667, size.height * 0.7980000, size.width * 0.5580000,
          size.height * 0.7926667, size.width * 0.5580000, size.height * 0.7873333)
      ..close();
  }

  Path _rainMixPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1550000, size.height * 0.5653333)
      ..cubicTo(size.width * 0.1550000, size.height * 0.6093333, size.width * 0.1706667,
          size.height * 0.6473333, size.width * 0.2016667, size.height * 0.6790000)
      ..cubicTo(size.width * 0.2326667, size.height * 0.7110000, size.width * 0.2703333,
          size.height * 0.7276667, size.width * 0.3143333, size.height * 0.7290000)
      ..cubicTo(size.width * 0.3183333, size.height * 0.7290000, size.width * 0.3203333,
          size.height * 0.7270000, size.width * 0.3203333, size.height * 0.7233333)
      ..lineTo(size.width * 0.3203333, size.height * 0.6790000)
      ..cubicTo(size.width * 0.3203333, size.height * 0.6750000, size.width * 0.3183333,
          size.height * 0.6730000, size.width * 0.3143333, size.height * 0.6730000)
      ..cubicTo(size.width * 0.2863333, size.height * 0.6716667, size.width * 0.2620000,
          size.height * 0.6603333, size.width * 0.2420000, size.height * 0.6390000)
      ..cubicTo(size.width * 0.2220000, size.height * 0.6176667, size.width * 0.2116667,
          size.height * 0.5933333, size.width * 0.2116667, size.height * 0.5650000)
      ..cubicTo(size.width * 0.2116667, size.height * 0.5370000, size.width * 0.2210000,
          size.height * 0.5126667, size.width * 0.2400000, size.height * 0.4920000)
      ..cubicTo(size.width * 0.2590000, size.height * 0.4713333, size.width * 0.2820000,
          size.height * 0.4596667, size.width * 0.3100000, size.height * 0.4573333)
      ..lineTo(size.width * 0.3276667, size.height * 0.4550000)
      ..cubicTo(size.width * 0.3316667, size.height * 0.4550000, size.width * 0.3340000,
          size.height * 0.4530000, size.width * 0.3340000, size.height * 0.4490000)
      ..lineTo(size.width * 0.3363333, size.height * 0.4323333)
      ..cubicTo(size.width * 0.3396667, size.height * 0.3960000, size.width * 0.3546667,
          size.height * 0.3653333, size.width * 0.3816667, size.height * 0.3406667)
      ..cubicTo(size.width * 0.4086667, size.height * 0.3160000, size.width * 0.4403333,
          size.height * 0.3036667, size.width * 0.4770000, size.height * 0.3036667)
      ..cubicTo(size.width * 0.5130000, size.height * 0.3036667, size.width * 0.5446667,
          size.height * 0.3160000, size.width * 0.5716667, size.height * 0.3403333)
      ..cubicTo(size.width * 0.5986667, size.height * 0.3646667, size.width * 0.6143333,
          size.height * 0.3946667, size.width * 0.6183333, size.height * 0.4306667)
      ..lineTo(size.width * 0.6206667, size.height * 0.4500000)
      ..cubicTo(size.width * 0.6206667, size.height * 0.4540000, size.width * 0.6226667,
          size.height * 0.4560000, size.width * 0.6270000, size.height * 0.4560000)
      ..lineTo(size.width * 0.6803333, size.height * 0.4560000)
      ..cubicTo(size.width * 0.7103333, size.height * 0.4560000, size.width * 0.7360000,
          size.height * 0.4666667, size.width * 0.7576667, size.height * 0.4883333)
      ..cubicTo(size.width * 0.7790000, size.height * 0.5096667, size.width * 0.7900000,
          size.height * 0.5353333, size.width * 0.7900000, size.height * 0.5650000)
      ..cubicTo(size.width * 0.7900000, size.height * 0.5930000, size.width * 0.7800000,
          size.height * 0.6176667, size.width * 0.7600000, size.height * 0.6390000)
      ..cubicTo(size.width * 0.7400000, size.height * 0.6600000, size.width * 0.7156667,
          size.height * 0.6713333, size.width * 0.6873333, size.height * 0.6730000)
      ..cubicTo(size.width * 0.6830000, size.height * 0.6730000, size.width * 0.6806667,
          size.height * 0.6750000, size.width * 0.6806667, size.height * 0.6790000)
      ..lineTo(size.width * 0.6806667, size.height * 0.7233333)
      ..cubicTo(size.width * 0.6806667, size.height * 0.7270000, size.width * 0.6830000,
          size.height * 0.7290000, size.width * 0.6873333, size.height * 0.7290000)
      ..cubicTo(size.width * 0.7316667, size.height * 0.7276667, size.width * 0.7693333,
          size.height * 0.7110000, size.width * 0.8000000, size.height * 0.6790000)
      ..cubicTo(size.width * 0.8306667, size.height * 0.6470000, size.width * 0.8460000,
          size.height * 0.6093333, size.width * 0.8460000, size.height * 0.5650000)
      ..cubicTo(size.width * 0.8460000, size.height * 0.5353333, size.width * 0.8386667,
          size.height * 0.5076667, size.width * 0.8236667, size.height * 0.4823333)
      ..cubicTo(size.width * 0.8090000, size.height * 0.4570000, size.width * 0.7886667,
          size.height * 0.4370000, size.width * 0.7633333, size.height * 0.4223333)
      ..cubicTo(size.width * 0.7380000, size.height * 0.4076667, size.width * 0.7103333,
          size.height * 0.4003333, size.width * 0.6806667, size.height * 0.4003333)
      ..lineTo(size.width * 0.6703333, size.height * 0.4003333)
      ..cubicTo(size.width * 0.6593333, size.height * 0.3556667, size.width * 0.6360000,
          size.height * 0.3193333, size.width * 0.6000000, size.height * 0.2906667)
      ..cubicTo(size.width * 0.5643333, size.height * 0.2623333, size.width * 0.5233333,
          size.height * 0.2480000, size.width * 0.4773333, size.height * 0.2480000)
      ..cubicTo(size.width * 0.4303333, size.height * 0.2480000, size.width * 0.3886667,
          size.height * 0.2626667, size.width * 0.3523333, size.height * 0.2916667)
      ..cubicTo(size.width * 0.3160000, size.height * 0.3206667, size.width * 0.2926667,
          size.height * 0.3580000, size.width * 0.2823333, size.height * 0.4033333)
      ..cubicTo(size.width * 0.2446667, size.height * 0.4130000, size.width * 0.2143333,
          size.height * 0.4326667, size.width * 0.1906667, size.height * 0.4623333)
      ..cubicTo(size.width * 0.1670000, size.height * 0.4920000, size.width * 0.1550000,
          size.height * 0.5266667, size.width * 0.1550000, size.height * 0.5653333)
      ..close()
      ..moveTo(size.width * 0.3350000, size.height * 0.7993333)
      ..cubicTo(size.width * 0.3350000, size.height * 0.8050000, size.width * 0.3366667,
          size.height * 0.8106667, size.width * 0.3403333, size.height * 0.8163333)
      ..cubicTo(size.width * 0.3440000, size.height * 0.8220000, size.width * 0.3493333,
          size.height * 0.8256667, size.width * 0.3560000, size.height * 0.8280000)
      ..cubicTo(size.width * 0.3636667, size.height * 0.8303333, size.width * 0.3706667,
          size.height * 0.8300000, size.width * 0.3773333, size.height * 0.8266667)
      ..cubicTo(size.width * 0.3836667, size.height * 0.8236667, size.width * 0.3883333,
          size.height * 0.8173333, size.width * 0.3903333, size.height * 0.8080000)
      ..lineTo(size.width * 0.3950000, size.height * 0.7876667)
      ..cubicTo(size.width * 0.3966667, size.height * 0.7800000, size.width * 0.3956667,
          size.height * 0.7730000, size.width * 0.3920000, size.height * 0.7666667)
      ..cubicTo(size.width * 0.3883333, size.height * 0.7603333, size.width * 0.3826667,
          size.height * 0.7556667, size.width * 0.3746667, size.height * 0.7533333)
      ..cubicTo(size.width * 0.3673333, size.height * 0.7510000, size.width * 0.3600000,
          size.height * 0.7520000, size.width * 0.3533333, size.height * 0.7560000)
      ..cubicTo(size.width * 0.3466667, size.height * 0.7600000, size.width * 0.3420000,
          size.height * 0.7660000, size.width * 0.3400000, size.height * 0.7736667)
      ..lineTo(size.width * 0.3353333, size.height * 0.7933333)
      ..cubicTo(size.width * 0.3353333, size.height * 0.7943333, size.width * 0.3350000,
          size.height * 0.7963333, size.width * 0.3350000, size.height * 0.7993333)
      ..close()
      ..moveTo(size.width * 0.3603333, size.height * 0.7026667)
      ..cubicTo(size.width * 0.3603333, size.height * 0.7096667, size.width * 0.3630000,
          size.height * 0.7160000, size.width * 0.3686667, size.height * 0.7216667)
      ..cubicTo(size.width * 0.3740000, size.height * 0.7273333, size.width * 0.3800000,
          size.height * 0.7300000, size.width * 0.3873333, size.height * 0.7300000)
      ..cubicTo(size.width * 0.3953333, size.height * 0.7300000, size.width * 0.4020000,
          size.height * 0.7273333, size.width * 0.4073333, size.height * 0.7220000)
      ..cubicTo(size.width * 0.4126667, size.height * 0.7166667, size.width * 0.4153333,
          size.height * 0.7103333, size.width * 0.4153333, size.height * 0.7023333)
      ..cubicTo(size.width * 0.4153333, size.height * 0.6946667, size.width * 0.4126667,
          size.height * 0.6880000, size.width * 0.4073333, size.height * 0.6826667)
      ..cubicTo(size.width * 0.4020000, size.height * 0.6773333, size.width * 0.3953333,
          size.height * 0.6746667, size.width * 0.3873333, size.height * 0.6746667)
      ..cubicTo(size.width * 0.3796667, size.height * 0.6746667, size.width * 0.3733333,
          size.height * 0.6773333, size.width * 0.3680000, size.height * 0.6823333)
      ..cubicTo(size.width * 0.3630000, size.height * 0.6883333, size.width * 0.3603333,
          size.height * 0.6950000, size.width * 0.3603333, size.height * 0.7026667)
      ..close()
      ..moveTo(size.width * 0.3806667, size.height * 0.6270000)
      ..cubicTo(size.width * 0.3803333, size.height * 0.6323333, size.width * 0.3816667,
          size.height * 0.6373333, size.width * 0.3853333, size.height * 0.6420000)
      ..cubicTo(size.width * 0.3886667, size.height * 0.6470000, size.width * 0.3940000,
          size.height * 0.6503333, size.width * 0.4013333, size.height * 0.6526667)
      ..cubicTo(size.width * 0.4083333, size.height * 0.6546667, size.width * 0.4150000,
          size.height * 0.6540000, size.width * 0.4220000, size.height * 0.6503333)
      ..cubicTo(size.width * 0.4290000, size.height * 0.6466667, size.width * 0.4333333,
          size.height * 0.6410000, size.width * 0.4356667, size.height * 0.6333333)
      ..lineTo(size.width * 0.4450000, size.height * 0.6033333)
      ..cubicTo(size.width * 0.4473333, size.height * 0.5953333, size.width * 0.4466667,
          size.height * 0.5880000, size.width * 0.4426667, size.height * 0.5816667)
      ..cubicTo(size.width * 0.4386667, size.height * 0.5753333, size.width * 0.4326667,
          size.height * 0.5710000, size.width * 0.4246667, size.height * 0.5686667)
      ..cubicTo(size.width * 0.4173333, size.height * 0.5663333, size.width * 0.4103333,
          size.height * 0.5670000, size.width * 0.4036667, size.height * 0.5710000)
      ..cubicTo(size.width * 0.3970000, size.height * 0.5746667, size.width * 0.3923333,
          size.height * 0.5803333, size.width * 0.3900000, size.height * 0.5876667)
      ..lineTo(size.width * 0.3820000, size.height * 0.6183333)
      ..cubicTo(size.width * 0.3820000, size.height * 0.6190000, size.width * 0.3816667,
          size.height * 0.6203333, size.width * 0.3813333, size.height * 0.6223333)
      ..cubicTo(size.width * 0.3810000, size.height * 0.6240000, size.width * 0.3806667,
          size.height * 0.6256667, size.width * 0.3806667, size.height * 0.6270000)
      ..close()
      ..moveTo(size.width * 0.4196667, size.height * 0.9033333)
      ..cubicTo(size.width * 0.4196667, size.height * 0.9093333, size.width * 0.4213333,
          size.height * 0.9146667, size.width * 0.4246667, size.height * 0.9200000)
      ..cubicTo(size.width * 0.4280000, size.height * 0.9253333, size.width * 0.4333333,
          size.height * 0.9290000, size.width * 0.4406667, size.height * 0.9310000)
      ..cubicTo(size.width * 0.4433333, size.height * 0.9316667, size.width * 0.4463333,
          size.height * 0.9320000, size.width * 0.4490000, size.height * 0.9320000)
      ..cubicTo(size.width * 0.4633333, size.height * 0.9320000, size.width * 0.4720000,
          size.height * 0.9253333, size.width * 0.4753333, size.height * 0.9116667)
      ..lineTo(size.width * 0.4800000, size.height * 0.8920000)
      ..cubicTo(size.width * 0.4820000, size.height * 0.8833333, size.width * 0.4810000,
          size.height * 0.8760000, size.width * 0.4773333, size.height * 0.8693333)
      ..cubicTo(size.width * 0.4733333, size.height * 0.8626667, size.width * 0.4676667,
          size.height * 0.8586667, size.width * 0.4600000, size.height * 0.8570000)
      ..cubicTo(size.width * 0.4530000, size.height * 0.8546667, size.width * 0.4460000,
          size.height * 0.8553333, size.width * 0.4390000, size.height * 0.8593333)
      ..cubicTo(size.width * 0.4320000, size.height * 0.8633333, size.width * 0.4276667,
          size.height * 0.8690000, size.width * 0.4253333, size.height * 0.8763333)
      ..lineTo(size.width * 0.4206667, size.height * 0.8960000)
      ..cubicTo(size.width * 0.4200000, size.height * 0.8990000, size.width * 0.4196667,
          size.height * 0.9013333, size.width * 0.4196667, size.height * 0.9033333)
      ..close()
      ..moveTo(size.width * 0.4453333, size.height * 0.8066667)
      ..cubicTo(size.width * 0.4453333, size.height * 0.8140000, size.width * 0.4480000,
          size.height * 0.8203333, size.width * 0.4536667, size.height * 0.8260000)
      ..cubicTo(size.width * 0.4590000, size.height * 0.8313333, size.width * 0.4653333,
          size.height * 0.8340000, size.width * 0.4726667, size.height * 0.8340000)
      ..cubicTo(size.width * 0.4806667, size.height * 0.8340000, size.width * 0.4870000,
          size.height * 0.8313333, size.width * 0.4923333, size.height * 0.8263333)
      ..cubicTo(size.width * 0.4976667, size.height * 0.8210000, size.width * 0.5000000,
          size.height * 0.8146667, size.width * 0.5000000, size.height * 0.8066667)
      ..cubicTo(size.width * 0.5000000, size.height * 0.7990000, size.width * 0.4973333,
          size.height * 0.7926667, size.width * 0.4923333, size.height * 0.7873333)
      ..cubicTo(size.width * 0.4870000, size.height * 0.7820000, size.width * 0.4806667,
          size.height * 0.7796667, size.width * 0.4726667, size.height * 0.7796667)
      ..cubicTo(size.width * 0.4646667, size.height * 0.7796667, size.width * 0.4583333,
          size.height * 0.7823333, size.width * 0.4530000, size.height * 0.7873333)
      ..cubicTo(size.width * 0.4476667, size.height * 0.7923333, size.width * 0.4453333,
          size.height * 0.7990000, size.width * 0.4453333, size.height * 0.8066667)
      ..close()
      ..moveTo(size.width * 0.4663333, size.height * 0.7310000)
      ..cubicTo(size.width * 0.4660000, size.height * 0.7360000, size.width * 0.4673333,
          size.height * 0.7413333, size.width * 0.4706667, size.height * 0.7466667)
      ..cubicTo(size.width * 0.4740000, size.height * 0.7520000, size.width * 0.4790000,
          size.height * 0.7553333, size.width * 0.4856667, size.height * 0.7566667)
      ..cubicTo(size.width * 0.4933333, size.height * 0.7586667, size.width * 0.5003333,
          size.height * 0.7580000, size.width * 0.5070000, size.height * 0.7546667)
      ..cubicTo(size.width * 0.5136667, size.height * 0.7513333, size.width * 0.5180000,
          size.height * 0.7450000, size.width * 0.5206667, size.height * 0.7360000)
      ..lineTo(size.width * 0.5296667, size.height * 0.7060000)
      ..cubicTo(size.width * 0.5320000, size.height * 0.6986667, size.width * 0.5313333,
          size.height * 0.6916667, size.width * 0.5273333, size.height * 0.6850000)
      ..cubicTo(size.width * 0.5233333, size.height * 0.6783333, size.width * 0.5176667,
          size.height * 0.6740000, size.width * 0.5096667, size.height * 0.6716667)
      ..cubicTo(size.width * 0.5023333, size.height * 0.6693333, size.width * 0.4953333,
          size.height * 0.6703333, size.width * 0.4883333, size.height * 0.6743333)
      ..cubicTo(size.width * 0.4813333, size.height * 0.6783333, size.width * 0.4770000,
          size.height * 0.6843333, size.width * 0.4746667, size.height * 0.6920000)
      ..lineTo(size.width * 0.4670000, size.height * 0.7220000)
      ..cubicTo(size.width * 0.4666667, size.height * 0.7246667, size.width * 0.4663333,
          size.height * 0.7276667, size.width * 0.4663333, size.height * 0.7310000)
      ..close()
      ..moveTo(size.width * 0.5583333, size.height * 0.8026667)
      ..cubicTo(size.width * 0.5583333, size.height * 0.8080000, size.width * 0.5600000,
          size.height * 0.8133333, size.width * 0.5633333, size.height * 0.8186667)
      ..cubicTo(size.width * 0.5666667, size.height * 0.8240000, size.width * 0.5720000,
          size.height * 0.8276667, size.width * 0.5786667, size.height * 0.8296667)
      ..cubicTo(size.width * 0.5796667, size.height * 0.8296667, size.width * 0.5813333,
          size.height * 0.8300000, size.width * 0.5833333, size.height * 0.8303333)
      ..cubicTo(size.width * 0.5853333, size.height * 0.8306667, size.width * 0.5866667,
          size.height * 0.8310000, size.width * 0.5880000, size.height * 0.8310000)
      ..cubicTo(size.width * 0.6016667, size.height * 0.8310000, size.width * 0.6100000,
          size.height * 0.8236667, size.width * 0.6133333, size.height * 0.8090000)
      ..lineTo(size.width * 0.6180000, size.height * 0.7890000)
      ..cubicTo(size.width * 0.6203333, size.height * 0.7820000, size.width * 0.6196667,
          size.height * 0.7750000, size.width * 0.6156667, size.height * 0.7680000)
      ..cubicTo(size.width * 0.6120000, size.height * 0.7610000, size.width * 0.6063333,
          size.height * 0.7566667, size.width * 0.5986667, size.height * 0.7543333)
      ..cubicTo(size.width * 0.5903333, size.height * 0.7523333, size.width * 0.5826667,
          size.height * 0.7530000, size.width * 0.5760000, size.height * 0.7570000)
      ..cubicTo(size.width * 0.5693333, size.height * 0.7610000, size.width * 0.5646667,
          size.height * 0.7666667, size.width * 0.5623333, size.height * 0.7746667)
      ..lineTo(size.width * 0.5593333, size.height * 0.7943333)
      ..cubicTo(size.width * 0.5593333, size.height * 0.7950000, size.width * 0.5590000,
          size.height * 0.7966667, size.width * 0.5586667, size.height * 0.7983333)
      ..cubicTo(size.width * 0.5583333, size.height * 0.8000000, size.width * 0.5583333,
          size.height * 0.8013333, size.width * 0.5583333, size.height * 0.8026667)
      ..close()
      ..moveTo(size.width * 0.5830000, size.height * 0.7040000)
      ..cubicTo(size.width * 0.5830000, size.height * 0.7113333, size.width * 0.5856667,
          size.height * 0.7180000, size.width * 0.5913333, size.height * 0.7230000)
      ..cubicTo(size.width * 0.5963333, size.height * 0.7283333, size.width * 0.6026667,
          size.height * 0.7310000, size.width * 0.6103333, size.height * 0.7310000)
      ..cubicTo(size.width * 0.6183333, size.height * 0.7310000, size.width * 0.6246667,
          size.height * 0.7283333, size.width * 0.6300000, size.height * 0.7233333)
      ..cubicTo(size.width * 0.6353333, size.height * 0.7183333, size.width * 0.6376667,
          size.height * 0.7116667, size.width * 0.6376667, size.height * 0.7040000)
      ..cubicTo(size.width * 0.6376667, size.height * 0.6960000, size.width * 0.6350000,
          size.height * 0.6896667, size.width * 0.6300000, size.height * 0.6843333)
      ..cubicTo(size.width * 0.6250000, size.height * 0.6790000, size.width * 0.6183333,
          size.height * 0.6766667, size.width * 0.6103333, size.height * 0.6766667)
      ..cubicTo(size.width * 0.6023333, size.height * 0.6766667, size.width * 0.5960000,
          size.height * 0.6793333, size.width * 0.5906667, size.height * 0.6843333)
      ..cubicTo(size.width * 0.5856667, size.height * 0.6896667, size.width * 0.5830000,
          size.height * 0.6960000, size.width * 0.5830000, size.height * 0.7040000)
      ..close()
      ..moveTo(size.width * 0.6033333, size.height * 0.6270000)
      ..cubicTo(size.width * 0.6033333, size.height * 0.6326667, size.width * 0.6050000,
          size.height * 0.6380000, size.width * 0.6086667, size.height * 0.6430000)
      ..cubicTo(size.width * 0.6123333, size.height * 0.6480000, size.width * 0.6176667,
          size.height * 0.6516667, size.width * 0.6250000, size.height * 0.6536667)
      ..cubicTo(size.width * 0.6256667, size.height * 0.6536667, size.width * 0.6270000,
          size.height * 0.6540000, size.width * 0.6290000, size.height * 0.6543333)
      ..cubicTo(size.width * 0.6310000, size.height * 0.6546667, size.width * 0.6326667,
          size.height * 0.6550000, size.width * 0.6336667, size.height * 0.6550000)
      ..cubicTo(size.width * 0.6370000, size.height * 0.6550000, size.width * 0.6410000,
          size.height * 0.6540000, size.width * 0.6456667, size.height * 0.6520000)
      ..cubicTo(size.width * 0.6526667, size.height * 0.6483333, size.width * 0.6573333,
          size.height * 0.6423333, size.width * 0.6593333, size.height * 0.6346667)
      ..lineTo(size.width * 0.6673333, size.height * 0.6046667)
      ..cubicTo(size.width * 0.6693333, size.height * 0.5970000, size.width * 0.6686667,
          size.height * 0.5900000, size.width * 0.6646667, size.height * 0.5836667)
      ..cubicTo(size.width * 0.6610000, size.height * 0.5770000, size.width * 0.6553333,
          size.height * 0.5726667, size.width * 0.6476667, size.height * 0.5703333)
      ..cubicTo(size.width * 0.6400000, size.height * 0.5680000, size.width * 0.6330000,
          size.height * 0.5686667, size.width * 0.6263333, size.height * 0.5723333)
      ..cubicTo(size.width * 0.6200000, size.height * 0.5760000, size.width * 0.6153333,
          size.height * 0.5813333, size.width * 0.6133333, size.height * 0.5893333)
      ..lineTo(size.width * 0.6040000, size.height * 0.6196667)
      ..cubicTo(size.width * 0.6040000, size.height * 0.6203333, size.width * 0.6036667,
          size.height * 0.6216667, size.width * 0.6033333, size.height * 0.6236667)
      ..cubicTo(size.width * 0.6033333, size.height * 0.6246667, size.width * 0.6033333,
          size.height * 0.6260000, size.width * 0.6033333, size.height * 0.6270000)
      ..close();
  }

  Path _showersPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1533333, size.height * 0.5643333)
      ..cubicTo(size.width * 0.1533333, size.height * 0.5256667, size.width * 0.1653333,
          size.height * 0.4916667, size.width * 0.1896667, size.height * 0.4616667)
      ..cubicTo(size.width * 0.2136667, size.height * 0.4316667, size.width * 0.2446667,
          size.height * 0.4123333, size.width * 0.2823333, size.height * 0.4040000)
      ..cubicTo(size.width * 0.2920000, size.height * 0.3580000, size.width * 0.3150000,
          size.height * 0.3206667, size.width * 0.3513333, size.height * 0.2910000)
      ..cubicTo(size.width * 0.3876667, size.height * 0.2613333, size.width * 0.4293333,
          size.height * 0.2466667, size.width * 0.4766667, size.height * 0.2466667)
      ..cubicTo(size.width * 0.5230000, size.height * 0.2466667, size.width * 0.5643333,
          size.height * 0.2610000, size.width * 0.6006667, size.height * 0.2893333)
      ..cubicTo(size.width * 0.6366667, size.height * 0.3176667, size.width * 0.6603333,
          size.height * 0.3543333, size.width * 0.6713333, size.height * 0.3993333)
      ..lineTo(size.width * 0.6826667, size.height * 0.3993333)
      ..cubicTo(size.width * 0.7126667, size.height * 0.3993333, size.width * 0.7403333,
          size.height * 0.4066667, size.width * 0.7653333, size.height * 0.4213333)
      ..cubicTo(size.width * 0.7906667, size.height * 0.4360000, size.width * 0.8103333,
          size.height * 0.4560000, size.width * 0.8250000, size.height * 0.4813333)
      ..cubicTo(size.width * 0.8393333, size.height * 0.5066667, size.width * 0.8466667,
          size.height * 0.5343333, size.width * 0.8466667, size.height * 0.5643333)
      ..cubicTo(size.width * 0.8466667, size.height * 0.6090000, size.width * 0.8313333,
          size.height * 0.6470000, size.width * 0.8010000, size.height * 0.6790000)
      ..cubicTo(size.width * 0.7703333, size.height * 0.7110000, size.width * 0.7330000,
          size.height * 0.7276667, size.width * 0.6886667, size.height * 0.7290000)
      ..cubicTo(size.width * 0.6846667, size.height * 0.7290000, size.width * 0.6826667,
          size.height * 0.7270000, size.width * 0.6826667, size.height * 0.7233333)
      ..lineTo(size.width * 0.6826667, size.height * 0.6786667)
      ..cubicTo(size.width * 0.6826667, size.height * 0.6750000, size.width * 0.6846667,
          size.height * 0.6730000, size.width * 0.6886667, size.height * 0.6730000)
      ..cubicTo(size.width * 0.7166667, size.height * 0.6706667, size.width * 0.7410000,
          size.height * 0.6590000, size.width * 0.7610000, size.height * 0.6380000)
      ..cubicTo(size.width * 0.7810000, size.height * 0.6170000, size.width * 0.7910000,
          size.height * 0.5923333, size.width * 0.7910000, size.height * 0.5640000)
      ..cubicTo(size.width * 0.7910000, size.height * 0.5343333, size.width * 0.7803333,
          size.height * 0.5086667, size.width * 0.7590000, size.height * 0.4870000)
      ..cubicTo(size.width * 0.7376667, size.height * 0.4656667, size.width * 0.7123333,
          size.height * 0.4546667, size.width * 0.6826667, size.height * 0.4546667)
      ..lineTo(size.width * 0.6283333, size.height * 0.4546667)
      ..cubicTo(size.width * 0.6243333, size.height * 0.4546667, size.width * 0.6220000,
          size.height * 0.4526667, size.width * 0.6210000, size.height * 0.4486667)
      ..lineTo(size.width * 0.6186667, size.height * 0.4296667)
      ..cubicTo(size.width * 0.6163333, size.height * 0.4060000, size.width * 0.6086667,
          size.height * 0.3843333, size.width * 0.5953333, size.height * 0.3650000)
      ..cubicTo(size.width * 0.5820000, size.height * 0.3456667, size.width * 0.5650000,
          size.height * 0.3306667, size.width * 0.5443333, size.height * 0.3196667)
      ..cubicTo(size.width * 0.5236667, size.height * 0.3086667, size.width * 0.5010000,
          size.height * 0.3033333, size.width * 0.4770000, size.height * 0.3033333)
      ..cubicTo(size.width * 0.4403333, size.height * 0.3033333, size.width * 0.4086667,
          size.height * 0.3153333, size.width * 0.3816667, size.height * 0.3396667)
      ..cubicTo(size.width * 0.3546667, size.height * 0.3640000, size.width * 0.3393333,
          size.height * 0.3943333, size.width * 0.3360000, size.height * 0.4303333)
      ..lineTo(size.width * 0.3336667, size.height * 0.4483333)
      ..cubicTo(size.width * 0.3336667, size.height * 0.4513333, size.width * 0.3320000,
          size.height * 0.4530000, size.width * 0.3283333, size.height * 0.4530000)
      ..lineTo(size.width * 0.3103333, size.height * 0.4566667)
      ..cubicTo(size.width * 0.2823333, size.height * 0.4590000, size.width * 0.2586667,
          size.height * 0.4703333, size.width * 0.2400000, size.height * 0.4910000)
      ..cubicTo(size.width * 0.2210000, size.height * 0.5116667, size.width * 0.2116667,
          size.height * 0.5360000, size.width * 0.2116667, size.height * 0.5643333)
      ..cubicTo(size.width * 0.2116667, size.height * 0.5933333, size.width * 0.2216667,
          size.height * 0.6183333, size.width * 0.2413333, size.height * 0.6393333)
      ..cubicTo(size.width * 0.2610000, size.height * 0.6603333, size.width * 0.2850000,
          size.height * 0.6716667, size.width * 0.3136667, size.height * 0.6733333)
      ..cubicTo(size.width * 0.3176667, size.height * 0.6733333, size.width * 0.3196667,
          size.height * 0.6753333, size.width * 0.3196667, size.height * 0.6790000)
      ..lineTo(size.width * 0.3196667, size.height * 0.7236667)
      ..cubicTo(size.width * 0.3196667, size.height * 0.7273333, size.width * 0.3176667,
          size.height * 0.7293333, size.width * 0.3136667, size.height * 0.7293333)
      ..cubicTo(size.width * 0.2916667, size.height * 0.7283333, size.width * 0.2710000,
          size.height * 0.7233333, size.width * 0.2510000, size.height * 0.7143333)
      ..cubicTo(size.width * 0.2310000, size.height * 0.7053333, size.width * 0.2140000,
          size.height * 0.6933333, size.width * 0.2000000, size.height * 0.6786667)
      ..cubicTo(size.width * 0.1856667, size.height * 0.6640000, size.width * 0.1743333,
          size.height * 0.6470000, size.width * 0.1660000, size.height * 0.6270000)
      ..cubicTo(size.width * 0.1576667, size.height * 0.6070000, size.width * 0.1533333,
          size.height * 0.5863333, size.width * 0.1533333, size.height * 0.5643333)
      ..close()
      ..moveTo(size.width * 0.3340000, size.height * 0.7900000)
      ..cubicTo(size.width * 0.3340000, size.height * 0.7890000, size.width * 0.3343333,
          size.height * 0.7873333, size.width * 0.3346667, size.height * 0.7856667)
      ..cubicTo(size.width * 0.3350000, size.height * 0.7840000, size.width * 0.3353333,
          size.height * 0.7826667, size.width * 0.3353333, size.height * 0.7820000)
      ..lineTo(size.width * 0.3443333, size.height * 0.7476667)
      ..cubicTo(size.width * 0.3466667, size.height * 0.7403333, size.width * 0.3510000,
          size.height * 0.7343333, size.width * 0.3576667, size.height * 0.7306667)
      ..cubicTo(size.width * 0.3643333, size.height * 0.7266667, size.width * 0.3713333,
          size.height * 0.7260000, size.width * 0.3790000, size.height * 0.7283333)
      ..cubicTo(size.width * 0.3866667, size.height * 0.7306667, size.width * 0.3923333,
          size.height * 0.7350000, size.width * 0.3963333, size.height * 0.7416667)
      ..cubicTo(size.width * 0.4003333, size.height * 0.7483333, size.width * 0.4010000,
          size.height * 0.7553333, size.width * 0.3986667, size.height * 0.7630000)
      ..lineTo(size.width * 0.3906667, size.height * 0.7966667)
      ..cubicTo(size.width * 0.3863333, size.height * 0.8113333, size.width * 0.3780000,
          size.height * 0.8186667, size.width * 0.3653333, size.height * 0.8186667)
      ..cubicTo(size.width * 0.3643333, size.height * 0.8186667, size.width * 0.3636667,
          size.height * 0.8186667, size.width * 0.3623333, size.height * 0.8186667)
      ..cubicTo(size.width * 0.3613333, size.height * 0.8186667, size.width * 0.3600000,
          size.height * 0.8183333, size.width * 0.3586667, size.height * 0.8183333)
      ..cubicTo(size.width * 0.3573333, size.height * 0.8180000, size.width * 0.3563333,
          size.height * 0.8180000, size.width * 0.3553333, size.height * 0.8180000)
      ..cubicTo(size.width * 0.3483333, size.height * 0.8160000, size.width * 0.3430000,
          size.height * 0.8120000, size.width * 0.3393333, size.height * 0.8066667)
      ..cubicTo(size.width * 0.3356667, size.height * 0.8013333, size.width * 0.3340000,
          size.height * 0.7953333, size.width * 0.3340000, size.height * 0.7900000)
      ..close()
      ..moveTo(size.width * 0.3780000, size.height * 0.6293333)
      ..cubicTo(size.width * 0.3780000, size.height * 0.6286667, size.width * 0.3780000,
          size.height * 0.6273333, size.width * 0.3783333, size.height * 0.6256667)
      ..cubicTo(size.width * 0.3786667, size.height * 0.6240000, size.width * 0.3786667,
          size.height * 0.6230000, size.width * 0.3786667, size.height * 0.6226667)
      ..lineTo(size.width * 0.3886667, size.height * 0.5876667)
      ..cubicTo(size.width * 0.3906667, size.height * 0.5813333, size.width * 0.3943333,
          size.height * 0.5763333, size.width * 0.3993333, size.height * 0.5726667)
      ..cubicTo(size.width * 0.4043333, size.height * 0.5693333, size.width * 0.4096667,
          size.height * 0.5676667, size.width * 0.4150000, size.height * 0.5676667)
      ..cubicTo(size.width * 0.4156667, size.height * 0.5676667, size.width * 0.4166667,
          size.height * 0.5676667, size.width * 0.4176667, size.height * 0.5676667)
      ..cubicTo(size.width * 0.4186667, size.height * 0.5676667, size.width * 0.4196667,
          size.height * 0.5680000, size.width * 0.4206667, size.height * 0.5680000)
      ..cubicTo(size.width * 0.4216667, size.height * 0.5683333, size.width * 0.4226667,
          size.height * 0.5683333, size.width * 0.4233333, size.height * 0.5683333)
      ..cubicTo(size.width * 0.4310000, size.height * 0.5706667, size.width * 0.4366667,
          size.height * 0.5750000, size.width * 0.4403333, size.height * 0.5816667)
      ..cubicTo(size.width * 0.4443333, size.height * 0.5883333, size.width * 0.4450000,
          size.height * 0.5953333, size.width * 0.4426667, size.height * 0.6030000)
      ..lineTo(size.width * 0.4346667, size.height * 0.6363333)
      ..cubicTo(size.width * 0.4323333, size.height * 0.6456667, size.width * 0.4280000,
          size.height * 0.6520000, size.width * 0.4213333, size.height * 0.6560000)
      ..cubicTo(size.width * 0.4146667, size.height * 0.6600000, size.width * 0.4073333,
          size.height * 0.6600000, size.width * 0.3996667, size.height * 0.6566667)
      ..cubicTo(size.width * 0.3923333, size.height * 0.6546667, size.width * 0.3870000,
          size.height * 0.6510000, size.width * 0.3833333, size.height * 0.6453333)
      ..cubicTo(size.width * 0.3796667, size.height * 0.6396667, size.width * 0.3780000,
          size.height * 0.6346667, size.width * 0.3780000, size.height * 0.6293333)
      ..close()
      ..moveTo(size.width * 0.4190000, size.height * 0.8943333)
      ..cubicTo(size.width * 0.4190000, size.height * 0.8933333, size.width * 0.4193333,
          size.height * 0.8920000, size.width * 0.4196667, size.height * 0.8900000)
      ..cubicTo(size.width * 0.4200000, size.height * 0.8880000, size.width * 0.4203333,
          size.height * 0.8870000, size.width * 0.4203333, size.height * 0.8860000)
      ..lineTo(size.width * 0.4300000, size.height * 0.8530000)
      ..cubicTo(size.width * 0.4320000, size.height * 0.8450000, size.width * 0.4366667,
          size.height * 0.8390000, size.width * 0.4433333, size.height * 0.8350000)
      ..cubicTo(size.width * 0.4500000, size.height * 0.8310000, size.width * 0.4573333,
          size.height * 0.8300000, size.width * 0.4650000, size.height * 0.8323333)
      ..cubicTo(size.width * 0.4726667, size.height * 0.8346667, size.width * 0.4780000,
          size.height * 0.8390000, size.width * 0.4820000, size.height * 0.8460000)
      ..cubicTo(size.width * 0.4860000, size.height * 0.8530000, size.width * 0.4863333,
          size.height * 0.8600000, size.width * 0.4843333, size.height * 0.8676667)
      ..lineTo(size.width * 0.4760000, size.height * 0.9023333)
      ..cubicTo(size.width * 0.4723333, size.height * 0.9160000, size.width * 0.4636667,
          size.height * 0.9226667, size.width * 0.4493333, size.height * 0.9226667)
      ..cubicTo(size.width * 0.4476667, size.height * 0.9226667, size.width * 0.4450000,
          size.height * 0.9223333, size.width * 0.4413333, size.height * 0.9213333)
      ..cubicTo(size.width * 0.4340000, size.height * 0.9200000, size.width * 0.4286667,
          size.height * 0.9166667, size.width * 0.4250000, size.height * 0.9113333)
      ..cubicTo(size.width * 0.4210000, size.height * 0.9060000, size.width * 0.4190000,
          size.height * 0.9003333, size.width * 0.4190000, size.height * 0.8943333)
      ..close()
      ..moveTo(size.width * 0.4636667, size.height * 0.7353333)
      ..cubicTo(size.width * 0.4636667, size.height * 0.7333333, size.width * 0.4640000,
          size.height * 0.7306667, size.width * 0.4650000, size.height * 0.7270000)
      ..lineTo(size.width * 0.4740000, size.height * 0.6926667)
      ..cubicTo(size.width * 0.4763333, size.height * 0.6850000, size.width * 0.4806667,
          size.height * 0.6793333, size.width * 0.4876667, size.height * 0.6756667)
      ..cubicTo(size.width * 0.4943333, size.height * 0.6716667, size.width * 0.5016667,
          size.height * 0.6710000, size.width * 0.5093333, size.height * 0.6733333)
      ..cubicTo(size.width * 0.5170000, size.height * 0.6753333, size.width * 0.5223333,
          size.height * 0.6796667, size.width * 0.5263333, size.height * 0.6863333)
      ..cubicTo(size.width * 0.5300000, size.height * 0.6930000, size.width * 0.5306667,
          size.height * 0.7000000, size.width * 0.5283333, size.height * 0.7080000)
      ..lineTo(size.width * 0.5203333, size.height * 0.7410000)
      ..cubicTo(size.width * 0.5160000, size.height * 0.7560000, size.width * 0.5080000,
          size.height * 0.7636667, size.width * 0.4963333, size.height * 0.7636667)
      ..cubicTo(size.width * 0.4950000, size.height * 0.7636667, size.width * 0.4913333,
          size.height * 0.7630000, size.width * 0.4860000, size.height * 0.7616667)
      ..cubicTo(size.width * 0.4786667, size.height * 0.7603333, size.width * 0.4733333,
          size.height * 0.7570000, size.width * 0.4696667, size.height * 0.7516667)
      ..cubicTo(size.width * 0.4656667, size.height * 0.7466667, size.width * 0.4636667,
          size.height * 0.7410000, size.width * 0.4636667, size.height * 0.7353333)
      ..close()
      ..moveTo(size.width * 0.5576667, size.height * 0.7913333)
      ..cubicTo(size.width * 0.5576667, size.height * 0.7890000, size.width * 0.5580000,
          size.height * 0.7863333, size.width * 0.5586667, size.height * 0.7833333)
      ..lineTo(size.width * 0.5680000, size.height * 0.7503333)
      ..cubicTo(size.width * 0.5703333, size.height * 0.7423333, size.width * 0.5746667,
          size.height * 0.7363333, size.width * 0.5816667, size.height * 0.7323333)
      ..cubicTo(size.width * 0.5886667, size.height * 0.7283333, size.width * 0.5953333,
          size.height * 0.7273333, size.width * 0.6026667, size.height * 0.7293333)
      ..cubicTo(size.width * 0.6103333, size.height * 0.7316667, size.width * 0.6163333,
          size.height * 0.7360000, size.width * 0.6203333, size.height * 0.7430000)
      ..cubicTo(size.width * 0.6243333, size.height * 0.7496667, size.width * 0.6253333,
          size.height * 0.7566667, size.width * 0.6233333, size.height * 0.7640000)
      ..lineTo(size.width * 0.6136667, size.height * 0.7993333)
      ..cubicTo(size.width * 0.6103333, size.height * 0.8130000, size.width * 0.6016667,
          size.height * 0.8196667, size.width * 0.5873333, size.height * 0.8196667)
      ..cubicTo(size.width * 0.5843333, size.height * 0.8196667, size.width * 0.5813333,
          size.height * 0.8193333, size.width * 0.5786667, size.height * 0.8186667)
      ..cubicTo(size.width * 0.5720000, size.height * 0.8173333, size.width * 0.5670000,
          size.height * 0.8140000, size.width * 0.5633333, size.height * 0.8086667)
      ..cubicTo(size.width * 0.5600000, size.height * 0.8026667, size.width * 0.5580000,
          size.height * 0.7970000, size.width * 0.5576667, size.height * 0.7913333)
      ..close()
      ..moveTo(size.width * 0.6036667, size.height * 0.6326667)
      ..cubicTo(size.width * 0.6036667, size.height * 0.6316667, size.width * 0.6043333,
          size.height * 0.6286667, size.width * 0.6053333, size.height * 0.6240000)
      ..lineTo(size.width * 0.6153333, size.height * 0.5896667)
      ..cubicTo(size.width * 0.6166667, size.height * 0.5826667, size.width * 0.6196667,
          size.height * 0.5773333, size.width * 0.6250000, size.height * 0.5740000)
      ..cubicTo(size.width * 0.6303333, size.height * 0.5706667, size.width * 0.6356667,
          size.height * 0.5690000, size.width * 0.6413333, size.height * 0.5693333)
      ..cubicTo(size.width * 0.6426667, size.height * 0.5690000, size.width * 0.6456667,
          size.height * 0.5693333, size.width * 0.6493333, size.height * 0.5703333)
      ..cubicTo(size.width * 0.6566667, size.height * 0.5720000, size.width * 0.6623333,
          size.height * 0.5763333, size.width * 0.6666667, size.height * 0.5830000)
      ..cubicTo(size.width * 0.6706667, size.height * 0.5886667, size.width * 0.6713333,
          size.height * 0.5956667, size.width * 0.6690000, size.height * 0.6046667)
      ..lineTo(size.width * 0.6610000, size.height * 0.6390000)
      ..cubicTo(size.width * 0.6566667, size.height * 0.6533333, size.width * 0.6483333,
          size.height * 0.6606667, size.width * 0.6356667, size.height * 0.6606667)
      ..cubicTo(size.width * 0.6336667, size.height * 0.6606667, size.width * 0.6300000,
          size.height * 0.6600000, size.width * 0.6243333, size.height * 0.6586667)
      ..cubicTo(size.width * 0.6173333, size.height * 0.6566667, size.width * 0.6123333,
          size.height * 0.6530000, size.width * 0.6090000, size.height * 0.6483333)
      ..cubicTo(size.width * 0.6053333, size.height * 0.6430000, size.width * 0.6036667,
          size.height * 0.6380000, size.width * 0.6036667, size.height * 0.6326667)
      ..close();
  }

  Path _sleetPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1363333, size.height * 0.5650000)
      ..cubicTo(size.width * 0.1363333, size.height * 0.5263333, size.width * 0.1483333,
          size.height * 0.4920000, size.width * 0.1723333, size.height * 0.4620000)
      ..cubicTo(size.width * 0.1963333, size.height * 0.4320000, size.width * 0.2270000,
          size.height * 0.4123333, size.width * 0.2636667, size.height * 0.4040000)
      ..cubicTo(size.width * 0.2740000, size.height * 0.3583333, size.width * 0.2973333,
          size.height * 0.3210000, size.width * 0.3336667, size.height * 0.2916667)
      ..cubicTo(size.width * 0.3700000, size.height * 0.2623333, size.width * 0.4120000,
          size.height * 0.2476667, size.width * 0.4593333, size.height * 0.2476667)
      ..cubicTo(size.width * 0.4863333, size.height * 0.2476667, size.width * 0.5110000,
          size.height * 0.2520000, size.width * 0.5326667, size.height * 0.2610000)
      ..cubicTo(size.width * 0.5326667, size.height * 0.2613333, size.width * 0.5326667,
          size.height * 0.2613333, size.width * 0.5330000, size.height * 0.2616667)
      ..cubicTo(size.width * 0.5610000, size.height * 0.2723333, size.width * 0.5856667,
          size.height * 0.2896667, size.width * 0.6066667, size.height * 0.3133333)
      ..lineTo(size.width * 0.6076667, size.height * 0.3133333)
      ..cubicTo(size.width * 0.6303333, size.height * 0.3376667, size.width * 0.6453333,
          size.height * 0.3666667, size.width * 0.6533333, size.height * 0.4006667)
      ..lineTo(size.width * 0.6636667, size.height * 0.4006667)
      ..cubicTo(size.width * 0.6996667, size.height * 0.4006667, size.width * 0.7310000,
          size.height * 0.4103333, size.width * 0.7580000, size.height * 0.4293333)
      ..lineTo(size.width * 0.7580000, size.height * 0.4290000)
      ..cubicTo(size.width * 0.7756667, size.height * 0.4410000, size.width * 0.7906667,
          size.height * 0.4556667, size.width * 0.8026667, size.height * 0.4733333)
      ..cubicTo(size.width * 0.8146667, size.height * 0.4910000, size.width * 0.8226667,
          size.height * 0.5103333, size.width * 0.8270000, size.height * 0.5313333)
      ..cubicTo(size.width * 0.8283333, size.height * 0.5383333, size.width * 0.8290000,
          size.height * 0.5440000, size.width * 0.8296667, size.height * 0.5486667)
      ..lineTo(size.width * 0.8296667, size.height * 0.5506667)
      ..cubicTo(size.width * 0.8296667, size.height * 0.5510000, size.width * 0.8296667,
          size.height * 0.5526667, size.width * 0.8300000, size.height * 0.5563333)
      ..cubicTo(size.width * 0.8303333, size.height * 0.5600000, size.width * 0.8303333,
          size.height * 0.5626667, size.width * 0.8303333, size.height * 0.5643333)
      ..lineTo(size.width * 0.8303333, size.height * 0.5653333)
      ..cubicTo(size.width * 0.8303333, size.height * 0.5946667, size.width * 0.8233333,
          size.height * 0.6220000, size.width * 0.8090000, size.height * 0.6470000)
      ..cubicTo(size.width * 0.7950000, size.height * 0.6720000, size.width * 0.7756667,
          size.height * 0.6923333, size.width * 0.7510000, size.height * 0.7073333)
      ..cubicTo(size.width * 0.7266667, size.height * 0.7223333, size.width * 0.6996667,
          size.height * 0.7303333, size.width * 0.6703333, size.height * 0.7313333)
      ..cubicTo(size.width * 0.6660000, size.height * 0.7313333, size.width * 0.6636667,
          size.height * 0.7293333, size.width * 0.6636667, size.height * 0.7256667)
      ..lineTo(size.width * 0.6636667, size.height * 0.6810000)
      ..cubicTo(size.width * 0.6636667, size.height * 0.6766667, size.width * 0.6660000,
          size.height * 0.6746667, size.width * 0.6703333, size.height * 0.6746667)
      ..cubicTo(size.width * 0.6990000, size.height * 0.6733333, size.width * 0.7230000,
          size.height * 0.6620000, size.width * 0.7430000, size.height * 0.6406667)
      ..cubicTo(size.width * 0.7630000, size.height * 0.6193333, size.width * 0.7730000,
          size.height * 0.5943333, size.width * 0.7730000, size.height * 0.5653333)
      ..cubicTo(size.width * 0.7730000, size.height * 0.5356667, size.width * 0.7623333,
          size.height * 0.5103333, size.width * 0.7406667, size.height * 0.4890000)
      ..cubicTo(size.width * 0.7193333, size.height * 0.4676667, size.width * 0.6936667,
          size.height * 0.4570000, size.width * 0.6636667, size.height * 0.4570000)
      ..lineTo(size.width * 0.6100000, size.height * 0.4570000)
      ..cubicTo(size.width * 0.6060000, size.height * 0.4570000, size.width * 0.6040000,
          size.height * 0.4550000, size.width * 0.6040000, size.height * 0.4513333)
      ..lineTo(size.width * 0.6013333, size.height * 0.4316667)
      ..cubicTo(size.width * 0.5980000, size.height * 0.3983333, size.width * 0.5840000,
          size.height * 0.3696667, size.width * 0.5590000, size.height * 0.3453333)
      ..cubicTo(size.width * 0.5586667, size.height * 0.3450000, size.width * 0.5586667,
          size.height * 0.3446667, size.width * 0.5583333, size.height * 0.3443333)
      ..cubicTo(size.width * 0.5580000, size.height * 0.3440000, size.width * 0.5576667,
          size.height * 0.3436667, size.width * 0.5576667, size.height * 0.3433333)
      ..cubicTo(size.width * 0.5573333, size.height * 0.3430000, size.width * 0.5570000,
          size.height * 0.3426667, size.width * 0.5563333, size.height * 0.3426667)
      ..cubicTo(size.width * 0.5563333, size.height * 0.3420000, size.width * 0.5560000,
          size.height * 0.3416667, size.width * 0.5556667, size.height * 0.3416667)
      ..cubicTo(size.width * 0.5313333, size.height * 0.3196667, size.width * 0.5030000,
          size.height * 0.3070000, size.width * 0.4703333, size.height * 0.3043333)
      ..cubicTo(size.width * 0.4680000, size.height * 0.3040000, size.width * 0.4643333,
          size.height * 0.3040000, size.width * 0.4590000, size.height * 0.3040000)
      ..cubicTo(size.width * 0.4223333, size.height * 0.3040000, size.width * 0.3906667,
          size.height * 0.3163333, size.width * 0.3636667, size.height * 0.3406667)
      ..cubicTo(size.width * 0.3366667, size.height * 0.3650000, size.width * 0.3213333,
          size.height * 0.3953333, size.width * 0.3180000, size.height * 0.4313333)
      ..lineTo(size.width * 0.3153333, size.height * 0.4510000)
      ..cubicTo(size.width * 0.3143333, size.height * 0.4540000, size.width * 0.3116667,
          size.height * 0.4556667, size.width * 0.3080000, size.height * 0.4556667)
      ..lineTo(size.width * 0.2916667, size.height * 0.4566667)
      ..cubicTo(size.width * 0.2636667, size.height * 0.4600000, size.width * 0.2400000,
          size.height * 0.4720000, size.width * 0.2213333, size.height * 0.4923333)
      ..cubicTo(size.width * 0.2026667, size.height * 0.5126667, size.width * 0.1933333,
          size.height * 0.5370000, size.width * 0.1933333, size.height * 0.5650000)
      ..lineTo(size.width * 0.1933333, size.height * 0.5663333)
      ..lineTo(size.width * 0.1943333, size.height * 0.5663333)
      ..cubicTo(size.width * 0.1946667, size.height * 0.5823333, size.width * 0.1980000,
          size.height * 0.5973333, size.width * 0.2043333, size.height * 0.6113333)
      ..cubicTo(size.width * 0.2110000, size.height * 0.6256667, size.width * 0.2196667,
          size.height * 0.6376667, size.width * 0.2310000, size.height * 0.6476667)
      ..cubicTo(size.width * 0.2380000, size.height * 0.6536667, size.width * 0.2460000,
          size.height * 0.6590000, size.width * 0.2556667, size.height * 0.6636667)
      ..lineTo(size.width * 0.2556667, size.height * 0.6640000)
      ..cubicTo(size.width * 0.2690000, size.height * 0.6703333, size.width * 0.2823333,
          size.height * 0.6740000, size.width * 0.2960000, size.height * 0.6746667)
      ..cubicTo(size.width * 0.2996667, size.height * 0.6746667, size.width * 0.3016667,
          size.height * 0.6766667, size.width * 0.3016667, size.height * 0.6806667)
      ..lineTo(size.width * 0.3016667, size.height * 0.7253333)
      ..cubicTo(size.width * 0.3016667, size.height * 0.7290000, size.width * 0.2996667,
          size.height * 0.7310000, size.width * 0.2960000, size.height * 0.7310000)
      ..cubicTo(size.width * 0.2786667, size.height * 0.7300000, size.width * 0.2623333,
          size.height * 0.7266667, size.width * 0.2466667, size.height * 0.7210000)
      ..lineTo(size.width * 0.2466667, size.height * 0.7213333)
      ..cubicTo(size.width * 0.2190000, size.height * 0.7116667, size.width * 0.1953333,
          size.height * 0.6956667, size.width * 0.1763333, size.height * 0.6736667)
      ..cubicTo(size.width * 0.1573333, size.height * 0.6516667, size.width * 0.1446667,
          size.height * 0.6256667, size.width * 0.1393333, size.height * 0.5966667)
      ..lineTo(size.width * 0.1393333, size.height * 0.5956667)
      ..cubicTo(size.width * 0.1390000, size.height * 0.5953333, size.width * 0.1390000,
          size.height * 0.5950000, size.width * 0.1390000, size.height * 0.5943333)
      ..cubicTo(size.width * 0.1370000, size.height * 0.5856667, size.width * 0.1363333,
          size.height * 0.5756667, size.width * 0.1363333, size.height * 0.5650000)
      ..close()
      ..moveTo(size.width * 0.3196667, size.height * 0.8040000)
      ..cubicTo(size.width * 0.3196667, size.height * 0.8030000, size.width * 0.3200000,
          size.height * 0.8016667, size.width * 0.3203333, size.height * 0.7996667)
      ..cubicTo(size.width * 0.3206667, size.height * 0.7980000, size.width * 0.3210000,
          size.height * 0.7966667, size.width * 0.3210000, size.height * 0.7956667)
      ..lineTo(size.width * 0.3240000, size.height * 0.7760000)
      ..cubicTo(size.width * 0.3263333, size.height * 0.7680000, size.width * 0.3306667,
          size.height * 0.7623333, size.width * 0.3376667, size.height * 0.7583333)
      ..cubicTo(size.width * 0.3446667, size.height * 0.7543333, size.width * 0.3520000,
          size.height * 0.7536667, size.width * 0.3603333, size.height * 0.7556667)
      ..cubicTo(size.width * 0.3680000, size.height * 0.7580000, size.width * 0.3733333,
          size.height * 0.7626667, size.width * 0.3773333, size.height * 0.7693333)
      ..cubicTo(size.width * 0.3810000, size.height * 0.7763333, size.width * 0.3816667,
          size.height * 0.7833333, size.width * 0.3796667, size.height * 0.7903333)
      ..lineTo(size.width * 0.3750000, size.height * 0.8103333)
      ..cubicTo(size.width * 0.3716667, size.height * 0.8250000, size.width * 0.3633333,
          size.height * 0.8323333, size.width * 0.3496667, size.height * 0.8323333)
      ..cubicTo(size.width * 0.3486667, size.height * 0.8323333, size.width * 0.3470000,
          size.height * 0.8320000, size.width * 0.3450000, size.height * 0.8316667)
      ..cubicTo(size.width * 0.3430000, size.height * 0.8313333, size.width * 0.3416667,
          size.height * 0.8310000, size.width * 0.3403333, size.height * 0.8310000)
      ..cubicTo(size.width * 0.3333333, size.height * 0.8290000, size.width * 0.3283333,
          size.height * 0.8253333, size.width * 0.3250000, size.height * 0.8200000)
      ..cubicTo(size.width * 0.3213333, size.height * 0.8150000, size.width * 0.3196667,
          size.height * 0.8096667, size.width * 0.3196667, size.height * 0.8040000)
      ..close()
      ..moveTo(size.width * 0.3443333, size.height * 0.7060000)
      ..cubicTo(size.width * 0.3443333, size.height * 0.6980000, size.width * 0.3470000,
          size.height * 0.6916667, size.width * 0.3520000, size.height * 0.6863333)
      ..cubicTo(size.width * 0.3570000, size.height * 0.6810000, size.width * 0.3636667,
          size.height * 0.6786667, size.width * 0.3716667, size.height * 0.6786667)
      ..cubicTo(size.width * 0.3796667, size.height * 0.6786667, size.width * 0.3860000,
          size.height * 0.6813333, size.width * 0.3913333, size.height * 0.6863333)
      ..cubicTo(size.width * 0.3966667, size.height * 0.6913333, size.width * 0.3990000,
          size.height * 0.6980000, size.width * 0.3990000, size.height * 0.7060000)
      ..cubicTo(size.width * 0.3990000, size.height * 0.7136667, size.width * 0.3963333,
          size.height * 0.7200000, size.width * 0.3913333, size.height * 0.7253333)
      ..cubicTo(size.width * 0.3863333, size.height * 0.7306667, size.width * 0.3796667,
          size.height * 0.7330000, size.width * 0.3716667, size.height * 0.7330000)
      ..cubicTo(size.width * 0.3640000, size.height * 0.7330000, size.width * 0.3576667,
          size.height * 0.7303333, size.width * 0.3526667, size.height * 0.7250000)
      ..cubicTo(size.width * 0.3473333, size.height * 0.7196667, size.width * 0.3443333,
          size.height * 0.7133333, size.width * 0.3443333, size.height * 0.7060000)
      ..close()
      ..moveTo(size.width * 0.3990000, size.height * 0.9056667)
      ..cubicTo(size.width * 0.3990000, size.height * 0.9043333, size.width * 0.3993333,
          size.height * 0.9020000, size.width * 0.4003333, size.height * 0.8980000)
      ..lineTo(size.width * 0.4046667, size.height * 0.8783333)
      ..cubicTo(size.width * 0.4070000, size.height * 0.8706667, size.width * 0.4116667,
          size.height * 0.8650000, size.width * 0.4183333, size.height * 0.8613333)
      ..cubicTo(size.width * 0.4253333, size.height * 0.8573333, size.width * 0.4323333,
          size.height * 0.8566667, size.width * 0.4393333, size.height * 0.8590000)
      ..cubicTo(size.width * 0.4470000, size.height * 0.8603333, size.width * 0.4530000,
          size.height * 0.8646667, size.width * 0.4570000, size.height * 0.8713333)
      ..cubicTo(size.width * 0.4610000, size.height * 0.8780000, size.width * 0.4620000,
          size.height * 0.8856667, size.width * 0.4596667, size.height * 0.8940000)
      ..lineTo(size.width * 0.4553333, size.height * 0.9136667)
      ..cubicTo(size.width * 0.4520000, size.height * 0.9273333, size.width * 0.4430000,
          size.height * 0.9340000, size.width * 0.4286667, size.height * 0.9340000)
      ..cubicTo(size.width * 0.4263333, size.height * 0.9340000, size.width * 0.4233333,
          size.height * 0.9336667, size.width * 0.4206667, size.height * 0.9330000)
      ..cubicTo(size.width * 0.4133333, size.height * 0.9310000, size.width * 0.4080000,
          size.height * 0.9273333, size.width * 0.4043333, size.height * 0.9220000)
      ..cubicTo(size.width * 0.4010000, size.height * 0.9166667, size.width * 0.3990000,
          size.height * 0.9113333, size.width * 0.3990000, size.height * 0.9056667)
      ..close()
      ..moveTo(size.width * 0.4253333, size.height * 0.8086667)
      ..cubicTo(size.width * 0.4253333, size.height * 0.8010000, size.width * 0.4280000,
          size.height * 0.7943333, size.width * 0.4330000, size.height * 0.7893333)
      ..cubicTo(size.width * 0.4383333, size.height * 0.7840000, size.width * 0.4446667,
          size.height * 0.7816667, size.width * 0.4526667, size.height * 0.7816667)
      ..cubicTo(size.width * 0.4606667, size.height * 0.7816667, size.width * 0.4670000,
          size.height * 0.7843333, size.width * 0.4723333, size.height * 0.7893333)
      ..cubicTo(size.width * 0.4776667, size.height * 0.7946667, size.width * 0.4800000,
          size.height * 0.8010000, size.width * 0.4800000, size.height * 0.8086667)
      ..cubicTo(size.width * 0.4800000, size.height * 0.8166667, size.width * 0.4773333,
          size.height * 0.8230000, size.width * 0.4723333, size.height * 0.8283333)
      ..cubicTo(size.width * 0.4670000, size.height * 0.8336667, size.width * 0.4606667,
          size.height * 0.8360000, size.width * 0.4526667, size.height * 0.8360000)
      ..cubicTo(size.width * 0.4450000, size.height * 0.8360000, size.width * 0.4386667,
          size.height * 0.8333333, size.width * 0.4333333, size.height * 0.8280000)
      ..cubicTo(size.width * 0.4280000, size.height * 0.8226667, size.width * 0.4253333,
          size.height * 0.8163333, size.width * 0.4253333, size.height * 0.8086667)
      ..close()
      ..moveTo(size.width * 0.4460000, size.height * 0.7330000)
      ..cubicTo(size.width * 0.4460000, size.height * 0.7296667, size.width * 0.4463333,
          size.height * 0.7266667, size.width * 0.4470000, size.height * 0.7240000)
      ..lineTo(size.width * 0.4546667, size.height * 0.6940000)
      ..cubicTo(size.width * 0.4570000, size.height * 0.6863333, size.width * 0.4616667,
          size.height * 0.6803333, size.width * 0.4683333, size.height * 0.6763333)
      ..cubicTo(size.width * 0.4753333, size.height * 0.6723333, size.width * 0.4823333,
          size.height * 0.6713333, size.width * 0.4896667, size.height * 0.6736667)
      ..cubicTo(size.width * 0.4976667, size.height * 0.6760000, size.width * 0.5033333,
          size.height * 0.6803333, size.width * 0.5073333, size.height * 0.6870000)
      ..cubicTo(size.width * 0.5113333, size.height * 0.6936667, size.width * 0.5120000,
          size.height * 0.7006667, size.width * 0.5096667, size.height * 0.7080000)
      ..lineTo(size.width * 0.5010000, size.height * 0.7380000)
      ..cubicTo(size.width * 0.4983333, size.height * 0.7473333, size.width * 0.4936667,
          size.height * 0.7533333, size.width * 0.4873333, size.height * 0.7566667)
      ..cubicTo(size.width * 0.4810000, size.height * 0.7600000, size.width * 0.4736667,
          size.height * 0.7606667, size.width * 0.4660000, size.height * 0.7586667)
      ..cubicTo(size.width * 0.4593333, size.height * 0.7573333, size.width * 0.4543333,
          size.height * 0.7540000, size.width * 0.4510000, size.height * 0.7486667)
      ..cubicTo(size.width * 0.4470000, size.height * 0.7433333, size.width * 0.4456667,
          size.height * 0.7380000, size.width * 0.4460000, size.height * 0.7330000)
      ..close()
      ..moveTo(size.width * 0.5380000, size.height * 0.8043333)
      ..cubicTo(size.width * 0.5380000, size.height * 0.8033333, size.width * 0.5380000,
          size.height * 0.8016667, size.width * 0.5383333, size.height * 0.8000000)
      ..cubicTo(size.width * 0.5386667, size.height * 0.7983333, size.width * 0.5386667,
          size.height * 0.7970000, size.width * 0.5386667, size.height * 0.7963333)
      ..lineTo(size.width * 0.5416667, size.height * 0.7766667)
      ..cubicTo(size.width * 0.5440000, size.height * 0.7686667, size.width * 0.5483333,
          size.height * 0.7630000, size.width * 0.5553333, size.height * 0.7590000)
      ..cubicTo(size.width * 0.5623333, size.height * 0.7550000, size.width * 0.5696667,
          size.height * 0.7543333, size.width * 0.5780000, size.height * 0.7563333)
      ..cubicTo(size.width * 0.5856667, size.height * 0.7586667, size.width * 0.5913333,
          size.height * 0.7633333, size.width * 0.5950000, size.height * 0.7700000)
      ..cubicTo(size.width * 0.5990000, size.height * 0.7770000, size.width * 0.5996667,
          size.height * 0.7840000, size.width * 0.5973333, size.height * 0.7910000)
      ..lineTo(size.width * 0.5926667, size.height * 0.8110000)
      ..cubicTo(size.width * 0.5893333, size.height * 0.8256667, size.width * 0.5810000,
          size.height * 0.8330000, size.width * 0.5673333, size.height * 0.8330000)
      ..cubicTo(size.width * 0.5663333, size.height * 0.8330000, size.width * 0.5646667,
          size.height * 0.8326667, size.width * 0.5626667, size.height * 0.8323333)
      ..cubicTo(size.width * 0.5606667, size.height * 0.8320000, size.width * 0.5590000,
          size.height * 0.8316667, size.width * 0.5580000, size.height * 0.8316667)
      ..cubicTo(size.width * 0.5513333, size.height * 0.8296667, size.width * 0.5463333,
          size.height * 0.8260000, size.width * 0.5430000, size.height * 0.8206667)
      ..cubicTo(size.width * 0.5400000, size.height * 0.8153333, size.width * 0.5380000,
          size.height * 0.8100000, size.width * 0.5380000, size.height * 0.8043333)
      ..close()
      ..moveTo(size.width * 0.5626667, size.height * 0.7063333)
      ..cubicTo(size.width * 0.5626667, size.height * 0.6983333, size.width * 0.5653333,
          size.height * 0.6920000, size.width * 0.5703333, size.height * 0.6866667)
      ..cubicTo(size.width * 0.5756667, size.height * 0.6813333, size.width * 0.5820000,
          size.height * 0.6790000, size.width * 0.5900000, size.height * 0.6790000)
      ..cubicTo(size.width * 0.5980000, size.height * 0.6790000, size.width * 0.6043333,
          size.height * 0.6816667, size.width * 0.6096667, size.height * 0.6866667)
      ..cubicTo(size.width * 0.6150000, size.height * 0.6920000, size.width * 0.6173333,
          size.height * 0.6983333, size.width * 0.6173333, size.height * 0.7063333)
      ..cubicTo(size.width * 0.6173333, size.height * 0.7140000, size.width * 0.6146667,
          size.height * 0.7206667, size.width * 0.6096667, size.height * 0.7256667)
      ..cubicTo(size.width * 0.6046667, size.height * 0.7306667, size.width * 0.5983333,
          size.height * 0.7333333, size.width * 0.5903333, size.height * 0.7333333)
      ..cubicTo(size.width * 0.5823333, size.height * 0.7333333, size.width * 0.5760000,
          size.height * 0.7306667, size.width * 0.5710000, size.height * 0.7253333)
      ..cubicTo(size.width * 0.5656667, size.height * 0.7203333, size.width * 0.5626667,
          size.height * 0.7140000, size.width * 0.5626667, size.height * 0.7063333)
      ..close();
  }

  Path _smokePath(Size size) {
    return Path()
      ..moveTo(size.width * 0.2113333, size.height * 0.4160000)
      ..cubicTo(size.width * 0.2113333, size.height * 0.3846667, size.width * 0.2213333,
          size.height * 0.3566667, size.width * 0.2410000, size.height * 0.3320000)
      ..cubicTo(size.width * 0.2606667, size.height * 0.3073333, size.width * 0.2856667,
          size.height * 0.2916667, size.width * 0.3160000, size.height * 0.2850000)
      ..cubicTo(size.width * 0.3243333, size.height * 0.2476667, size.width * 0.3433333,
          size.height * 0.2166667, size.width * 0.3733333, size.height * 0.1926667)
      ..cubicTo(size.width * 0.4033333, size.height * 0.1686667, size.width * 0.4373333,
          size.height * 0.1566667, size.width * 0.4760000, size.height * 0.1566667)
      ..cubicTo(size.width * 0.5133333, size.height * 0.1566667, size.width * 0.5470000,
          size.height * 0.1683333, size.width * 0.5766667, size.height * 0.1916667)
      ..cubicTo(size.width * 0.6063333, size.height * 0.2150000, size.width * 0.6253333,
          size.height * 0.2450000, size.width * 0.6343333, size.height * 0.2813333)
      ..lineTo(size.width * 0.6433333, size.height * 0.2813333)
      ..cubicTo(size.width * 0.6806667, size.height * 0.2813333, size.width * 0.7126667,
          size.height * 0.2943333, size.width * 0.7393333, size.height * 0.3206667)
      ..cubicTo(size.width * 0.7656667, size.height * 0.3466667, size.width * 0.7790000,
          size.height * 0.3786667, size.width * 0.7790000, size.height * 0.4156667)
      ..cubicTo(size.width * 0.7790000, size.height * 0.4356667, size.width * 0.7750000,
          size.height * 0.4546667, size.width * 0.7666667, size.height * 0.4723333)
      ..cubicTo(size.width * 0.7583333, size.height * 0.4900000, size.width * 0.7470000,
          size.height * 0.5053333, size.width * 0.7323333, size.height * 0.5180000)
      ..lineTo(size.width * 0.7323333, size.height * 0.5190000)
      ..cubicTo(size.width * 0.7323333, size.height * 0.5386667, size.width * 0.7260000,
          size.height * 0.5563333, size.width * 0.7136667, size.height * 0.5720000)
      ..cubicTo(size.width * 0.7013333, size.height * 0.5876667, size.width * 0.6856667,
          size.height * 0.5973333, size.width * 0.6670000, size.height * 0.6016667)
      ..cubicTo(size.width * 0.6623333, size.height * 0.6223333, size.width * 0.6520000,
          size.height * 0.6400000, size.width * 0.6366667, size.height * 0.6543333)
      ..cubicTo(size.width * 0.6213333, size.height * 0.6686667, size.width * 0.6030000,
          size.height * 0.6776667, size.width * 0.5823333, size.height * 0.6810000)
      ..cubicTo(size.width * 0.5920000, size.height * 0.6923333, size.width * 0.5966667,
          size.height * 0.7050000, size.width * 0.5966667, size.height * 0.7186667)
      ..cubicTo(size.width * 0.5966667, size.height * 0.7346667, size.width * 0.5910000,
          size.height * 0.7483333, size.width * 0.5796667, size.height * 0.7600000)
      ..cubicTo(size.width * 0.5683333, size.height * 0.7713333, size.width * 0.5546667,
          size.height * 0.7773333, size.width * 0.5386667, size.height * 0.7773333)
      ..cubicTo(size.width * 0.5226667, size.height * 0.7773333, size.width * 0.5090000,
          size.height * 0.7716667, size.width * 0.4976667, size.height * 0.7600000)
      ..cubicTo(size.width * 0.4863333, size.height * 0.7486667, size.width * 0.4806667,
          size.height * 0.7346667, size.width * 0.4806667, size.height * 0.7186667)
      ..cubicTo(size.width * 0.4806667, size.height * 0.7123333, size.width * 0.4816667,
          size.height * 0.7060000, size.width * 0.4840000, size.height * 0.6996667)
      ..lineTo(size.width * 0.4806667, size.height * 0.6996667)
      ..cubicTo(size.width * 0.4613333, size.height * 0.6996667, size.width * 0.4446667,
          size.height * 0.6926667, size.width * 0.4306667, size.height * 0.6786667)
      ..cubicTo(size.width * 0.4166667, size.height * 0.6646667, size.width * 0.4096667,
          size.height * 0.6480000, size.width * 0.4096667, size.height * 0.6286667)
      ..cubicTo(size.width * 0.4096667, size.height * 0.6153333, size.width * 0.4130000,
          size.height * 0.6033333, size.width * 0.4196667, size.height * 0.5930000)
      ..cubicTo(size.width * 0.4023333, size.height * 0.5833333, size.width * 0.3900000,
          size.height * 0.5696667, size.width * 0.3823333, size.height * 0.5513333)
      ..lineTo(size.width * 0.3396667, size.height * 0.5513333)
      ..lineTo(size.width * 0.3396667, size.height * 0.5510000)
      ..cubicTo(size.width * 0.3040000, size.height * 0.5486667, size.width * 0.2736667,
          size.height * 0.5346667, size.width * 0.2486667, size.height * 0.5086667)
      ..cubicTo(size.width * 0.2236667, size.height * 0.4826667, size.width * 0.2113333,
          size.height * 0.4520000, size.width * 0.2113333, size.height * 0.4160000)
      ..close()
      ..moveTo(size.width * 0.2580000, size.height * 0.4076667)
      ..cubicTo(size.width * 0.2580000, size.height * 0.4343333, size.width * 0.2673333,
          size.height * 0.4570000, size.width * 0.2860000, size.height * 0.4756667)
      ..cubicTo(size.width * 0.3046667, size.height * 0.4943333, size.width * 0.3273333,
          size.height * 0.5036667, size.width * 0.3536667, size.height * 0.5036667)
      ..cubicTo(size.width * 0.3700000, size.height * 0.5036667, size.width * 0.3853333,
          size.height * 0.5000000, size.width * 0.3993333, size.height * 0.4923333)
      ..cubicTo(size.width * 0.4033333, size.height * 0.5170000, size.width * 0.4150000,
          size.height * 0.5376667, size.width * 0.4340000, size.height * 0.5543333)
      ..cubicTo(size.width * 0.4530000, size.height * 0.5710000, size.width * 0.4756667,
          size.height * 0.5790000, size.width * 0.5013333, size.height * 0.5790000)
      ..cubicTo(size.width * 0.5303333, size.height * 0.5790000, size.width * 0.5550000,
          size.height * 0.5686667, size.width * 0.5753333, size.height * 0.5483333)
      ..cubicTo(size.width * 0.5890000, size.height * 0.5643333, size.width * 0.6060000,
          size.height * 0.5720000, size.width * 0.6266667, size.height * 0.5720000)
      ..cubicTo(size.width * 0.6456667, size.height * 0.5720000, size.width * 0.6616667,
          size.height * 0.5653333, size.width * 0.6753333, size.height * 0.5520000)
      ..cubicTo(size.width * 0.6886667, size.height * 0.5386667, size.width * 0.6953333,
          size.height * 0.5223333, size.width * 0.6953333, size.height * 0.5033333)
      ..cubicTo(size.width * 0.7086667, size.height * 0.4943333, size.width * 0.7193333,
          size.height * 0.4830000, size.width * 0.7270000, size.height * 0.4686667)
      ..cubicTo(size.width * 0.7346667, size.height * 0.4546667, size.width * 0.7386667,
          size.height * 0.4393333, size.width * 0.7386667, size.height * 0.4230000)
      ..cubicTo(size.width * 0.7386667, size.height * 0.3966667, size.width * 0.7293333,
          size.height * 0.3740000, size.width * 0.7103333, size.height * 0.3556667)
      ..cubicTo(size.width * 0.6913333, size.height * 0.3373333, size.width * 0.6686667,
          size.height * 0.3280000, size.width * 0.6420000, size.height * 0.3280000)
      ..cubicTo(size.width * 0.6233333, size.height * 0.3280000, size.width * 0.6063333,
          size.height * 0.3330000, size.width * 0.5910000, size.height * 0.3426667)
      ..cubicTo(size.width * 0.5930000, size.height * 0.3346667, size.width * 0.5936667,
          size.height * 0.3256667, size.width * 0.5936667, size.height * 0.3163333)
      ..cubicTo(size.width * 0.5936667, size.height * 0.2843333, size.width * 0.5823333,
          size.height * 0.2570000, size.width * 0.5593333, size.height * 0.2343333)
      ..cubicTo(size.width * 0.5363333, size.height * 0.2116667, size.width * 0.5086667,
          size.height * 0.2006667, size.width * 0.4763333, size.height * 0.2006667)
      ..cubicTo(size.width * 0.4450000, size.height * 0.2006667, size.width * 0.4180000,
          size.height * 0.2116667, size.width * 0.3953333, size.height * 0.2330000)
      ..cubicTo(size.width * 0.3726667, size.height * 0.2543333, size.width * 0.3606667,
          size.height * 0.2810000, size.width * 0.3596667, size.height * 0.3120000)
      ..cubicTo(size.width * 0.3590000, size.height * 0.3120000, size.width * 0.3580000,
          size.height * 0.3120000, size.width * 0.3570000, size.height * 0.3120000)
      ..cubicTo(size.width * 0.3556667, size.height * 0.3120000, size.width * 0.3546667,
          size.height * 0.3120000, size.width * 0.3540000, size.height * 0.3120000)
      ..cubicTo(size.width * 0.3276667, size.height * 0.3120000, size.width * 0.3053333,
          size.height * 0.3213333, size.width * 0.2863333, size.height * 0.3400000)
      ..cubicTo(size.width * 0.2673333, size.height * 0.3586667, size.width * 0.2580000,
          size.height * 0.3816667, size.width * 0.2580000, size.height * 0.4076667)
      ..close();
  }

  Path _snowPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1546667, size.height * 0.5650000)
      ..cubicTo(size.width * 0.1546667, size.height * 0.5263333, size.width * 0.1663333,
          size.height * 0.4923333, size.width * 0.1900000, size.height * 0.4623333)
      ..cubicTo(size.width * 0.2136667, size.height * 0.4323333, size.width * 0.2440000,
          size.height * 0.4130000, size.width * 0.2813333, size.height * 0.4036667)
      ..cubicTo(size.width * 0.2916667, size.height * 0.3583333, size.width * 0.3150000,
          size.height * 0.3210000, size.width * 0.3513333, size.height * 0.2916667)
      ..cubicTo(size.width * 0.3876667, size.height * 0.2623333, size.width * 0.4293333,
          size.height * 0.2480000, size.width * 0.4763333, size.height * 0.2480000)
      ..cubicTo(size.width * 0.5223333, size.height * 0.2480000, size.width * 0.5630000,
          size.height * 0.2623333, size.width * 0.5990000, size.height * 0.2906667)
      ..cubicTo(size.width * 0.6350000, size.height * 0.3190000, size.width * 0.6583333,
          size.height * 0.3556667, size.width * 0.6690000, size.height * 0.4003333)
      ..lineTo(size.width * 0.6796667, size.height * 0.4003333)
      ..cubicTo(size.width * 0.7093333, size.height * 0.4003333, size.width * 0.7370000,
          size.height * 0.4076667, size.width * 0.7623333, size.height * 0.4223333)
      ..cubicTo(size.width * 0.7876667, size.height * 0.4370000, size.width * 0.8080000,
          size.height * 0.4570000, size.width * 0.8226667, size.height * 0.4823333)
      ..cubicTo(size.width * 0.8373333, size.height * 0.5076667, size.width * 0.8450000,
          size.height * 0.5353333, size.width * 0.8450000, size.height * 0.5650000)
      ..cubicTo(size.width * 0.8450000, size.height * 0.6090000, size.width * 0.8296667,
          size.height * 0.6473333, size.width * 0.7986667, size.height * 0.6790000)
      ..cubicTo(size.width * 0.7680000, size.height * 0.7110000, size.width * 0.7303333,
          size.height * 0.7276667, size.width * 0.6860000, size.height * 0.7290000)
      ..cubicTo(size.width * 0.6816667, size.height * 0.7290000, size.width * 0.6793333,
          size.height * 0.7270000, size.width * 0.6793333, size.height * 0.7233333)
      ..lineTo(size.width * 0.6793333, size.height * 0.6790000)
      ..cubicTo(size.width * 0.6793333, size.height * 0.6750000, size.width * 0.6816667,
          size.height * 0.6730000, size.width * 0.6860000, size.height * 0.6730000)
      ..cubicTo(size.width * 0.7143333, size.height * 0.6716667, size.width * 0.7386667,
          size.height * 0.6603333, size.width * 0.7586667, size.height * 0.6390000)
      ..cubicTo(size.width * 0.7786667, size.height * 0.6176667, size.width * 0.7886667,
          size.height * 0.5930000, size.width * 0.7886667, size.height * 0.5646667)
      ..cubicTo(size.width * 0.7886667, size.height * 0.5350000, size.width * 0.7780000,
          size.height * 0.5096667, size.width * 0.7563333, size.height * 0.4880000)
      ..cubicTo(size.width * 0.7346667, size.height * 0.4663333, size.width * 0.7090000,
          size.height * 0.4556667, size.width * 0.6790000, size.height * 0.4556667)
      ..lineTo(size.width * 0.6253333, size.height * 0.4556667)
      ..cubicTo(size.width * 0.6213333, size.height * 0.4556667, size.width * 0.6193333,
          size.height * 0.4536667, size.width * 0.6193333, size.height * 0.4500000)
      ..lineTo(size.width * 0.6166667, size.height * 0.4306667)
      ..cubicTo(size.width * 0.6130000, size.height * 0.3946667, size.width * 0.5973333,
          size.height * 0.3643333, size.width * 0.5703333, size.height * 0.3400000)
      ..cubicTo(size.width * 0.5430000, size.height * 0.3156667, size.width * 0.5116667,
          size.height * 0.3033333, size.width * 0.4753333, size.height * 0.3033333)
      ..cubicTo(size.width * 0.4386667, size.height * 0.3033333, size.width * 0.4070000,
          size.height * 0.3156667, size.width * 0.3800000, size.height * 0.3403333)
      ..cubicTo(size.width * 0.3530000, size.height * 0.3650000, size.width * 0.3376667,
          size.height * 0.3953333, size.width * 0.3343333, size.height * 0.4320000)
      ..lineTo(size.width * 0.3323333, size.height * 0.4486667)
      ..cubicTo(size.width * 0.3323333, size.height * 0.4526667, size.width * 0.3300000,
          size.height * 0.4550000, size.width * 0.3256667, size.height * 0.4550000)
      ..lineTo(size.width * 0.3080000, size.height * 0.4573333)
      ..cubicTo(size.width * 0.2803333, size.height * 0.4596667, size.width * 0.2570000,
          size.height * 0.4710000, size.width * 0.2380000, size.height * 0.4920000)
      ..cubicTo(size.width * 0.2190000, size.height * 0.5130000, size.width * 0.2096667,
          size.height * 0.5370000, size.width * 0.2096667, size.height * 0.5650000)
      ..cubicTo(size.width * 0.2096667, size.height * 0.5933333, size.width * 0.2196667,
          size.height * 0.6180000, size.width * 0.2396667, size.height * 0.6393333)
      ..cubicTo(size.width * 0.2596667, size.height * 0.6606667, size.width * 0.2840000,
          size.height * 0.6716667, size.width * 0.3123333, size.height * 0.6733333)
      ..cubicTo(size.width * 0.3160000, size.height * 0.6733333, size.width * 0.3180000,
          size.height * 0.6753333, size.width * 0.3180000, size.height * 0.6793333)
      ..lineTo(size.width * 0.3180000, size.height * 0.7236667)
      ..cubicTo(size.width * 0.3180000, size.height * 0.7273333, size.width * 0.3160000,
          size.height * 0.7293333, size.width * 0.3123333, size.height * 0.7293333)
      ..cubicTo(size.width * 0.2676667, size.height * 0.7280000, size.width * 0.2300000,
          size.height * 0.7113333, size.width * 0.1990000, size.height * 0.6793333)
      ..cubicTo(size.width * 0.1700000, size.height * 0.6473333, size.width * 0.1546667,
          size.height * 0.6090000, size.width * 0.1546667, size.height * 0.5650000)
      ..close()
      ..moveTo(size.width * 0.3666667, size.height * 0.7006667)
      ..cubicTo(size.width * 0.3666667, size.height * 0.6933333, size.width * 0.3693333,
          size.height * 0.6866667, size.width * 0.3746667, size.height * 0.6813333)
      ..cubicTo(size.width * 0.3800000, size.height * 0.6760000, size.width * 0.3863333,
          size.height * 0.6733333, size.width * 0.3943333, size.height * 0.6733333)
      ..cubicTo(size.width * 0.4020000, size.height * 0.6733333, size.width * 0.4086667,
          size.height * 0.6760000, size.width * 0.4140000, size.height * 0.6813333)
      ..cubicTo(size.width * 0.4193333, size.height * 0.6866667, size.width * 0.4220000,
          size.height * 0.6933333, size.width * 0.4220000, size.height * 0.7006667)
      ..cubicTo(size.width * 0.4220000, size.height * 0.7086667, size.width * 0.4193333,
          size.height * 0.7153333, size.width * 0.4140000, size.height * 0.7206667)
      ..cubicTo(size.width * 0.4086667, size.height * 0.7263333, size.width * 0.4023333,
          size.height * 0.7290000, size.width * 0.3943333, size.height * 0.7290000)
      ..cubicTo(size.width * 0.3866667, size.height * 0.7290000, size.width * 0.3800000,
          size.height * 0.7263333, size.width * 0.3746667, size.height * 0.7206667)
      ..cubicTo(size.width * 0.3693333, size.height * 0.7153333, size.width * 0.3666667,
          size.height * 0.7086667, size.width * 0.3666667, size.height * 0.7006667)
      ..close()
      ..moveTo(size.width * 0.3666667, size.height * 0.8216667)
      ..cubicTo(size.width * 0.3666667, size.height * 0.8136667, size.width * 0.3693333,
          size.height * 0.8070000, size.width * 0.3746667, size.height * 0.8016667)
      ..cubicTo(size.width * 0.3800000, size.height * 0.7966667, size.width * 0.3863333,
          size.height * 0.7940000, size.width * 0.3940000, size.height * 0.7940000)
      ..cubicTo(size.width * 0.4016667, size.height * 0.7940000, size.width * 0.4083333,
          size.height * 0.7966667, size.width * 0.4136667, size.height * 0.8016667)
      ..cubicTo(size.width * 0.4190000, size.height * 0.8070000, size.width * 0.4216667,
          size.height * 0.8133333, size.width * 0.4216667, size.height * 0.8213333)
      ..cubicTo(size.width * 0.4216667, size.height * 0.8293333, size.width * 0.4190000,
          size.height * 0.8356667, size.width * 0.4136667, size.height * 0.8410000)
      ..cubicTo(size.width * 0.4083333, size.height * 0.8463333, size.width * 0.4020000,
          size.height * 0.8486667, size.width * 0.3940000, size.height * 0.8486667)
      ..cubicTo(size.width * 0.3863333, size.height * 0.8486667, size.width * 0.3796667,
          size.height * 0.8460000, size.width * 0.3743333, size.height * 0.8410000)
      ..cubicTo(size.width * 0.3693333, size.height * 0.8360000, size.width * 0.3666667,
          size.height * 0.8293333, size.width * 0.3666667, size.height * 0.8216667)
      ..close()
      ..moveTo(size.width * 0.4730000, size.height * 0.7650000)
      ..cubicTo(size.width * 0.4730000, size.height * 0.7573333, size.width * 0.4756667,
          size.height * 0.7503333, size.width * 0.4813333, size.height * 0.7443333)
      ..cubicTo(size.width * 0.4866667, size.height * 0.7390000, size.width * 0.4930000,
          size.height * 0.7363333, size.width * 0.5003333, size.height * 0.7363333)
      ..cubicTo(size.width * 0.5080000, size.height * 0.7363333, size.width * 0.5146667,
          size.height * 0.7393333, size.width * 0.5203333, size.height * 0.7450000)
      ..cubicTo(size.width * 0.5260000, size.height * 0.7506667, size.width * 0.5290000,
          size.height * 0.7573333, size.width * 0.5290000, size.height * 0.7650000)
      ..cubicTo(size.width * 0.5290000, size.height * 0.7726667, size.width * 0.5263333,
          size.height * 0.7793333, size.width * 0.5206667, size.height * 0.7850000)
      ..cubicTo(size.width * 0.5150000, size.height * 0.7906667, size.width * 0.5083333,
          size.height * 0.7933333, size.width * 0.5003333, size.height * 0.7933333)
      ..cubicTo(size.width * 0.4926667, size.height * 0.7933333, size.width * 0.4863333,
          size.height * 0.7906667, size.width * 0.4810000, size.height * 0.7850000)
      ..cubicTo(size.width * 0.4756667, size.height * 0.7793333, size.width * 0.4730000,
          size.height * 0.7726667, size.width * 0.4730000, size.height * 0.7650000)
      ..close()
      ..moveTo(size.width * 0.4730000, size.height * 0.6443333)
      ..cubicTo(size.width * 0.4730000, size.height * 0.6366667, size.width * 0.4756667,
          size.height * 0.6300000, size.width * 0.4813333, size.height * 0.6243333)
      ..cubicTo(size.width * 0.4873333, size.height * 0.6190000, size.width * 0.4936667,
          size.height * 0.6163333, size.width * 0.5003333, size.height * 0.6163333)
      ..cubicTo(size.width * 0.5083333, size.height * 0.6163333, size.width * 0.5150000,
          size.height * 0.6190000, size.width * 0.5206667, size.height * 0.6246667)
      ..cubicTo(size.width * 0.5263333, size.height * 0.6303333, size.width * 0.5290000,
          size.height * 0.6366667, size.width * 0.5290000, size.height * 0.6446667)
      ..cubicTo(size.width * 0.5290000, size.height * 0.6523333, size.width * 0.5263333,
          size.height * 0.6590000, size.width * 0.5206667, size.height * 0.6643333)
      ..cubicTo(size.width * 0.5150000, size.height * 0.6696667, size.width * 0.5083333,
          size.height * 0.6723333, size.width * 0.5003333, size.height * 0.6723333)
      ..cubicTo(size.width * 0.4926667, size.height * 0.6723333, size.width * 0.4863333,
          size.height * 0.6696667, size.width * 0.4810000, size.height * 0.6643333)
      ..cubicTo(size.width * 0.4756667, size.height * 0.6586667, size.width * 0.4730000,
          size.height * 0.6520000, size.width * 0.4730000, size.height * 0.6443333)
      ..close()
      ..moveTo(size.width * 0.4730000, size.height * 0.8870000)
      ..cubicTo(size.width * 0.4730000, size.height * 0.8793333, size.width * 0.4756667,
          size.height * 0.8726667, size.width * 0.4813333, size.height * 0.8666667)
      ..cubicTo(size.width * 0.4866667, size.height * 0.8613333, size.width * 0.4930000,
          size.height * 0.8586667, size.width * 0.5003333, size.height * 0.8586667)
      ..cubicTo(size.width * 0.5083333, size.height * 0.8586667, size.width * 0.5150000,
          size.height * 0.8613333, size.width * 0.5206667, size.height * 0.8670000)
      ..cubicTo(size.width * 0.5263333, size.height * 0.8726667, size.width * 0.5290000,
          size.height * 0.8793333, size.width * 0.5290000, size.height * 0.8870000)
      ..cubicTo(size.width * 0.5290000, size.height * 0.8946667, size.width * 0.5263333,
          size.height * 0.9013333, size.width * 0.5206667, size.height * 0.9066667)
      ..cubicTo(size.width * 0.5150000, size.height * 0.9120000, size.width * 0.5083333,
          size.height * 0.9146667, size.width * 0.5003333, size.height * 0.9146667)
      ..cubicTo(size.width * 0.4926667, size.height * 0.9146667, size.width * 0.4863333,
          size.height * 0.9120000, size.width * 0.4810000, size.height * 0.9066667)
      ..cubicTo(size.width * 0.4756667, size.height * 0.9010000, size.width * 0.4730000,
          size.height * 0.8946667, size.width * 0.4730000, size.height * 0.8870000)
      ..close()
      ..moveTo(size.width * 0.5803333, size.height * 0.7006667)
      ..cubicTo(size.width * 0.5803333, size.height * 0.6933333, size.width * 0.5830000,
          size.height * 0.6870000, size.width * 0.5886667, size.height * 0.6813333)
      ..cubicTo(size.width * 0.5943333, size.height * 0.6756667, size.width * 0.6010000,
          size.height * 0.6730000, size.width * 0.6086667, size.height * 0.6730000)
      ..cubicTo(size.width * 0.6163333, size.height * 0.6730000, size.width * 0.6230000,
          size.height * 0.6756667, size.width * 0.6283333, size.height * 0.6810000)
      ..cubicTo(size.width * 0.6336667, size.height * 0.6863333, size.width * 0.6363333,
          size.height * 0.6930000, size.width * 0.6363333, size.height * 0.7003333)
      ..cubicTo(size.width * 0.6363333, size.height * 0.7083333, size.width * 0.6336667,
          size.height * 0.7150000, size.width * 0.6283333, size.height * 0.7203333)
      ..cubicTo(size.width * 0.6230000, size.height * 0.7260000, size.width * 0.6166667,
          size.height * 0.7286667, size.width * 0.6086667, size.height * 0.7286667)
      ..cubicTo(size.width * 0.6006667, size.height * 0.7286667, size.width * 0.5940000,
          size.height * 0.7260000, size.width * 0.5886667, size.height * 0.7203333)
      ..cubicTo(size.width * 0.5833333, size.height * 0.7150000, size.width * 0.5803333,
          size.height * 0.7083333, size.width * 0.5803333, size.height * 0.7006667)
      ..close()
      ..moveTo(size.width * 0.5803333, size.height * 0.8216667)
      ..cubicTo(size.width * 0.5803333, size.height * 0.8143333, size.width * 0.5830000,
          size.height * 0.8076667, size.width * 0.5886667, size.height * 0.8016667)
      ..cubicTo(size.width * 0.5940000, size.height * 0.7966667, size.width * 0.6006667,
          size.height * 0.7940000, size.width * 0.6086667, size.height * 0.7940000)
      ..cubicTo(size.width * 0.6166667, size.height * 0.7940000, size.width * 0.6230000,
          size.height * 0.7966667, size.width * 0.6283333, size.height * 0.8016667)
      ..cubicTo(size.width * 0.6336667, size.height * 0.8066667, size.width * 0.6360000,
          size.height * 0.8133333, size.width * 0.6360000, size.height * 0.8213333)
      ..cubicTo(size.width * 0.6360000, size.height * 0.8293333, size.width * 0.6333333,
          size.height * 0.8356667, size.width * 0.6283333, size.height * 0.8410000)
      ..cubicTo(size.width * 0.6230000, size.height * 0.8463333, size.width * 0.6166667,
          size.height * 0.8486667, size.width * 0.6086667, size.height * 0.8486667)
      ..cubicTo(size.width * 0.6006667, size.height * 0.8486667, size.width * 0.5940000,
          size.height * 0.8460000, size.width * 0.5886667, size.height * 0.8406667)
      ..cubicTo(size.width * 0.5833333, size.height * 0.8356667, size.width * 0.5803333,
          size.height * 0.8293333, size.width * 0.5803333, size.height * 0.8216667)
      ..close();
  }

  Path _snowflakeColdPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.2486667, size.height * 0.4803333)
      ..cubicTo(size.width * 0.2486667, size.height * 0.4740000, size.width * 0.2510000,
          size.height * 0.4683333, size.width * 0.2553333, size.height * 0.4636667)
      ..cubicTo(size.width * 0.2596667, size.height * 0.4590000, size.width * 0.2650000,
          size.height * 0.4566667, size.width * 0.2713333, size.height * 0.4566667)
      ..cubicTo(size.width * 0.2776667, size.height * 0.4566667, size.width * 0.2833333,
          size.height * 0.4590000, size.width * 0.2876667, size.height * 0.4636667)
      ..cubicTo(size.width * 0.2920000, size.height * 0.4683333, size.width * 0.2943333,
          size.height * 0.4736667, size.width * 0.2943333, size.height * 0.4803333)
      ..cubicTo(size.width * 0.2943333, size.height * 0.4866667, size.width * 0.2920000,
          size.height * 0.4920000, size.width * 0.2876667, size.height * 0.4963333)
      ..cubicTo(size.width * 0.2833333, size.height * 0.5006667, size.width * 0.2776667,
          size.height * 0.5030000, size.width * 0.2716667, size.height * 0.5030000)
      ..cubicTo(size.width * 0.2656667, size.height * 0.5030000, size.width * 0.2600000,
          size.height * 0.5006667, size.width * 0.2556667, size.height * 0.4963333)
      ..cubicTo(size.width * 0.2506667, size.height * 0.4916667, size.width * 0.2486667,
          size.height * 0.4863333, size.width * 0.2486667, size.height * 0.4803333)
      ..close()
      ..moveTo(size.width * 0.3146667, size.height * 0.4803333)
      ..cubicTo(size.width * 0.3146667, size.height * 0.4740000, size.width * 0.3170000,
          size.height * 0.4683333, size.width * 0.3213333, size.height * 0.4636667)
      ..cubicTo(size.width * 0.3256667, size.height * 0.4590000, size.width * 0.3310000,
          size.height * 0.4566667, size.width * 0.3373333, size.height * 0.4566667)
      ..lineTo(size.width * 0.4450000, size.height * 0.4566667)
      ..lineTo(size.width * 0.3690000, size.height * 0.3806667)
      ..cubicTo(size.width * 0.3643333, size.height * 0.3766667, size.width * 0.3620000,
          size.height * 0.3713333, size.width * 0.3620000, size.height * 0.3650000)
      ..cubicTo(size.width * 0.3620000, size.height * 0.3586667, size.width * 0.3643333,
          size.height * 0.3533333, size.width * 0.3690000, size.height * 0.3486667)
      ..cubicTo(size.width * 0.3736667, size.height * 0.3440000, size.width * 0.3790000,
          size.height * 0.3416667, size.width * 0.3853333, size.height * 0.3416667)
      ..cubicTo(size.width * 0.3916667, size.height * 0.3416667, size.width * 0.3970000,
          size.height * 0.3440000, size.width * 0.4016667, size.height * 0.3486667)
      ..lineTo(size.width * 0.4773333, size.height * 0.4243333)
      ..lineTo(size.width * 0.4773333, size.height * 0.3173333)
      ..cubicTo(size.width * 0.4773333, size.height * 0.3110000, size.width * 0.4796667,
          size.height * 0.3053333, size.width * 0.4843333, size.height * 0.3006667)
      ..cubicTo(size.width * 0.4890000, size.height * 0.2960000, size.width * 0.4943333,
          size.height * 0.2936667, size.width * 0.5010000, size.height * 0.2936667)
      ..cubicTo(size.width * 0.5073333, size.height * 0.2936667, size.width * 0.5126667,
          size.height * 0.2960000, size.width * 0.5170000, size.height * 0.3006667)
      ..cubicTo(size.width * 0.5213333, size.height * 0.3053333, size.width * 0.5236667,
          size.height * 0.3106667, size.width * 0.5236667, size.height * 0.3173333)
      ..lineTo(size.width * 0.5236667, size.height * 0.4250000)
      ..lineTo(size.width * 0.6000000, size.height * 0.3483333)
      ..cubicTo(size.width * 0.6046667, size.height * 0.3436667, size.width * 0.6100000,
          size.height * 0.3413333, size.width * 0.6160000, size.height * 0.3413333)
      ..cubicTo(size.width * 0.6220000, size.height * 0.3413333, size.width * 0.6276667,
          size.height * 0.3436667, size.width * 0.6323333, size.height * 0.3483333)
      ..cubicTo(size.width * 0.6363333, size.height * 0.3530000, size.width * 0.6383333,
          size.height * 0.3583333, size.width * 0.6383333, size.height * 0.3646667)
      ..cubicTo(size.width * 0.6383333, size.height * 0.3710000, size.width * 0.6363333,
          size.height * 0.3763333, size.width * 0.6323333, size.height * 0.3803333)
      ..lineTo(size.width * 0.5563333, size.height * 0.4563333)
      ..lineTo(size.width * 0.6640000, size.height * 0.4563333)
      ..cubicTo(size.width * 0.6700000, size.height * 0.4563333, size.width * 0.6753333,
          size.height * 0.4586667, size.width * 0.6796667, size.height * 0.4633333)
      ..cubicTo(size.width * 0.6840000, size.height * 0.4680000, size.width * 0.6863333,
          size.height * 0.4733333, size.width * 0.6863333, size.height * 0.4800000)
      ..cubicTo(size.width * 0.6863333, size.height * 0.4860000, size.width * 0.6840000,
          size.height * 0.4913333, size.width * 0.6796667, size.height * 0.4956667)
      ..cubicTo(size.width * 0.6753333, size.height * 0.5000000, size.width * 0.6700000,
          size.height * 0.5023333, size.width * 0.6640000, size.height * 0.5023333)
      ..lineTo(size.width * 0.5563333, size.height * 0.5023333)
      ..lineTo(size.width * 0.6326667, size.height * 0.5786667)
      ..cubicTo(size.width * 0.6366667, size.height * 0.5826667, size.width * 0.6386667,
          size.height * 0.5880000, size.width * 0.6386667, size.height * 0.5943333)
      ..cubicTo(size.width * 0.6386667, size.height * 0.6006667, size.width * 0.6366667,
          size.height * 0.6060000, size.width * 0.6326667, size.height * 0.6106667)
      ..cubicTo(size.width * 0.6280000, size.height * 0.6153333, size.width * 0.6223333,
          size.height * 0.6176667, size.width * 0.6163333, size.height * 0.6176667)
      ..cubicTo(size.width * 0.6103333, size.height * 0.6176667, size.width * 0.6046667,
          size.height * 0.6153333, size.width * 0.6003333, size.height * 0.6106667)
      ..lineTo(size.width * 0.5240000, size.height * 0.5340000)
      ..lineTo(size.width * 0.5240000, size.height * 0.6420000)
      ..cubicTo(size.width * 0.5240000, size.height * 0.6483333, size.width * 0.5216667,
          size.height * 0.6540000, size.width * 0.5173333, size.height * 0.6583333)
      ..cubicTo(size.width * 0.5130000, size.height * 0.6626667, size.width * 0.5076667,
          size.height * 0.6650000, size.width * 0.5013333, size.height * 0.6650000)
      ..cubicTo(size.width * 0.4950000, size.height * 0.6650000, size.width * 0.4893333,
          size.height * 0.6626667, size.width * 0.4846667, size.height * 0.6583333)
      ..cubicTo(size.width * 0.4800000, size.height * 0.6540000, size.width * 0.4776667,
          size.height * 0.6483333, size.width * 0.4776667, size.height * 0.6420000)
      ..lineTo(size.width * 0.4776667, size.height * 0.5346667)
      ..lineTo(size.width * 0.4020000, size.height * 0.6103333)
      ..cubicTo(size.width * 0.3973333, size.height * 0.6150000, size.width * 0.3920000,
          size.height * 0.6173333, size.width * 0.3856667, size.height * 0.6173333)
      ..cubicTo(size.width * 0.3793333, size.height * 0.6173333, size.width * 0.3740000,
          size.height * 0.6150000, size.width * 0.3693333, size.height * 0.6103333)
      ..cubicTo(size.width * 0.3646667, size.height * 0.6056667, size.width * 0.3623333,
          size.height * 0.6003333, size.width * 0.3623333, size.height * 0.5940000)
      ..cubicTo(size.width * 0.3623333, size.height * 0.5876667, size.width * 0.3646667,
          size.height * 0.5826667, size.width * 0.3693333, size.height * 0.5783333)
      ..lineTo(size.width * 0.4460000, size.height * 0.5020000)
      ..lineTo(size.width * 0.3380000, size.height * 0.5020000)
      ..cubicTo(size.width * 0.3316667, size.height * 0.5020000, size.width * 0.3263333,
          size.height * 0.4996667, size.width * 0.3220000, size.height * 0.4953333)
      ..cubicTo(size.width * 0.3166667, size.height * 0.4916667, size.width * 0.3146667,
          size.height * 0.4863333, size.width * 0.3146667, size.height * 0.4803333)
      ..close()
      ..moveTo(size.width * 0.3150000, size.height * 0.6416667)
      ..cubicTo(size.width * 0.3150000, size.height * 0.6356667, size.width * 0.3173333,
          size.height * 0.6300000, size.width * 0.3220000, size.height * 0.6256667)
      ..cubicTo(size.width * 0.3260000, size.height * 0.6210000, size.width * 0.3313333,
          size.height * 0.6186667, size.width * 0.3376667, size.height * 0.6186667)
      ..cubicTo(size.width * 0.3440000, size.height * 0.6186667, size.width * 0.3493333,
          size.height * 0.6210000, size.width * 0.3540000, size.height * 0.6256667)
      ..cubicTo(size.width * 0.3586667, size.height * 0.6303333, size.width * 0.3610000,
          size.height * 0.6356667, size.width * 0.3610000, size.height * 0.6416667)
      ..cubicTo(size.width * 0.3610000, size.height * 0.6476667, size.width * 0.3586667,
          size.height * 0.6533333, size.width * 0.3540000, size.height * 0.6576667)
      ..cubicTo(size.width * 0.3493333, size.height * 0.6623333, size.width * 0.3440000,
          size.height * 0.6646667, size.width * 0.3376667, size.height * 0.6646667)
      ..cubicTo(size.width * 0.3313333, size.height * 0.6646667, size.width * 0.3260000,
          size.height * 0.6623333, size.width * 0.3220000, size.height * 0.6576667)
      ..cubicTo(size.width * 0.3173333, size.height * 0.6533333, size.width * 0.3150000,
          size.height * 0.6480000, size.width * 0.3150000, size.height * 0.6416667)
      ..close()
      ..moveTo(size.width * 0.3150000, size.height * 0.3180000)
      ..cubicTo(size.width * 0.3150000, size.height * 0.3120000, size.width * 0.3173333,
          size.height * 0.3063333, size.width * 0.3220000, size.height * 0.3020000)
      ..cubicTo(size.width * 0.3260000, size.height * 0.2973333, size.width * 0.3313333,
          size.height * 0.2950000, size.width * 0.3376667, size.height * 0.2950000)
      ..cubicTo(size.width * 0.3440000, size.height * 0.2950000, size.width * 0.3493333,
          size.height * 0.2973333, size.width * 0.3540000, size.height * 0.3020000)
      ..cubicTo(size.width * 0.3586667, size.height * 0.3066667, size.width * 0.3610000,
          size.height * 0.3120000, size.width * 0.3610000, size.height * 0.3180000)
      ..cubicTo(size.width * 0.3610000, size.height * 0.3240000, size.width * 0.3586667,
          size.height * 0.3296667, size.width * 0.3540000, size.height * 0.3343333)
      ..cubicTo(size.width * 0.3493333, size.height * 0.3390000, size.width * 0.3440000,
          size.height * 0.3413333, size.width * 0.3376667, size.height * 0.3413333)
      ..cubicTo(size.width * 0.3313333, size.height * 0.3413333, size.width * 0.3260000,
          size.height * 0.3390000, size.width * 0.3220000, size.height * 0.3343333)
      ..cubicTo(size.width * 0.3173333, size.height * 0.3296667, size.width * 0.3150000,
          size.height * 0.3240000, size.width * 0.3150000, size.height * 0.3180000)
      ..close()
      ..moveTo(size.width * 0.4766667, size.height * 0.7083333)
      ..cubicTo(size.width * 0.4766667, size.height * 0.7023333, size.width * 0.4790000,
          size.height * 0.6970000, size.width * 0.4836667, size.height * 0.6926667)
      ..cubicTo(size.width * 0.4883333, size.height * 0.6883333, size.width * 0.4936667,
          size.height * 0.6860000, size.width * 0.5003333, size.height * 0.6860000)
      ..cubicTo(size.width * 0.5066667, size.height * 0.6860000, size.width * 0.5120000,
          size.height * 0.6883333, size.width * 0.5163333, size.height * 0.6926667)
      ..cubicTo(size.width * 0.5206667, size.height * 0.6970000, size.width * 0.5230000,
          size.height * 0.7023333, size.width * 0.5230000, size.height * 0.7083333)
      ..cubicTo(size.width * 0.5230000, size.height * 0.7146667, size.width * 0.5206667,
          size.height * 0.7203333, size.width * 0.5163333, size.height * 0.7246667)
      ..cubicTo(size.width * 0.5120000, size.height * 0.7290000, size.width * 0.5066667,
          size.height * 0.7313333, size.width * 0.5003333, size.height * 0.7313333)
      ..cubicTo(size.width * 0.4940000, size.height * 0.7313333, size.width * 0.4883333,
          size.height * 0.7290000, size.width * 0.4836667, size.height * 0.7246667)
      ..cubicTo(size.width * 0.4790000, size.height * 0.7203333, size.width * 0.4766667,
          size.height * 0.7150000, size.width * 0.4766667, size.height * 0.7083333)
      ..close()
      ..moveTo(size.width * 0.4766667, size.height * 0.2513333)
      ..cubicTo(size.width * 0.4766667, size.height * 0.2450000, size.width * 0.4790000,
          size.height * 0.2393333, size.width * 0.4836667, size.height * 0.2350000)
      ..cubicTo(size.width * 0.4883333, size.height * 0.2306667, size.width * 0.4936667,
          size.height * 0.2283333, size.width * 0.5003333, size.height * 0.2283333)
      ..cubicTo(size.width * 0.5066667, size.height * 0.2283333, size.width * 0.5120000,
          size.height * 0.2306667, size.width * 0.5163333, size.height * 0.2350000)
      ..cubicTo(size.width * 0.5206667, size.height * 0.2393333, size.width * 0.5230000,
          size.height * 0.2450000, size.width * 0.5230000, size.height * 0.2513333)
      ..cubicTo(size.width * 0.5230000, size.height * 0.2573333, size.width * 0.5206667,
          size.height * 0.2626667, size.width * 0.5163333, size.height * 0.2670000)
      ..cubicTo(size.width * 0.5120000, size.height * 0.2713333, size.width * 0.5066667,
          size.height * 0.2736667, size.width * 0.5003333, size.height * 0.2736667)
      ..cubicTo(size.width * 0.4940000, size.height * 0.2736667, size.width * 0.4883333,
          size.height * 0.2713333, size.width * 0.4836667, size.height * 0.2670000)
      ..cubicTo(size.width * 0.4790000, size.height * 0.2626667, size.width * 0.4766667,
          size.height * 0.2573333, size.width * 0.4766667, size.height * 0.2513333)
      ..close()
      ..moveTo(size.width * 0.6390000, size.height * 0.6416667)
      ..cubicTo(size.width * 0.6390000, size.height * 0.6356667, size.width * 0.6413333,
          size.height * 0.6300000, size.width * 0.6460000, size.height * 0.6256667)
      ..cubicTo(size.width * 0.6500000, size.height * 0.6210000, size.width * 0.6553333,
          size.height * 0.6186667, size.width * 0.6616667, size.height * 0.6186667)
      ..cubicTo(size.width * 0.6680000, size.height * 0.6186667, size.width * 0.6733333,
          size.height * 0.6210000, size.width * 0.6780000, size.height * 0.6256667)
      ..cubicTo(size.width * 0.6826667, size.height * 0.6303333, size.width * 0.6850000,
          size.height * 0.6356667, size.width * 0.6850000, size.height * 0.6416667)
      ..cubicTo(size.width * 0.6850000, size.height * 0.6476667, size.width * 0.6826667,
          size.height * 0.6533333, size.width * 0.6780000, size.height * 0.6576667)
      ..cubicTo(size.width * 0.6733333, size.height * 0.6623333, size.width * 0.6680000,
          size.height * 0.6646667, size.width * 0.6616667, size.height * 0.6646667)
      ..cubicTo(size.width * 0.6553333, size.height * 0.6646667, size.width * 0.6500000,
          size.height * 0.6623333, size.width * 0.6460000, size.height * 0.6576667)
      ..cubicTo(size.width * 0.6413333, size.height * 0.6533333, size.width * 0.6390000,
          size.height * 0.6480000, size.width * 0.6390000, size.height * 0.6416667)
      ..close()
      ..moveTo(size.width * 0.6390000, size.height * 0.3180000)
      ..cubicTo(size.width * 0.6390000, size.height * 0.3120000, size.width * 0.6413333,
          size.height * 0.3063333, size.width * 0.6460000, size.height * 0.3020000)
      ..cubicTo(size.width * 0.6500000, size.height * 0.2973333, size.width * 0.6553333,
          size.height * 0.2950000, size.width * 0.6616667, size.height * 0.2950000)
      ..cubicTo(size.width * 0.6680000, size.height * 0.2950000, size.width * 0.6733333,
          size.height * 0.2973333, size.width * 0.6780000, size.height * 0.3020000)
      ..cubicTo(size.width * 0.6826667, size.height * 0.3066667, size.width * 0.6850000,
          size.height * 0.3120000, size.width * 0.6850000, size.height * 0.3180000)
      ..cubicTo(size.width * 0.6850000, size.height * 0.3240000, size.width * 0.6826667,
          size.height * 0.3296667, size.width * 0.6780000, size.height * 0.3343333)
      ..cubicTo(size.width * 0.6733333, size.height * 0.3390000, size.width * 0.6680000,
          size.height * 0.3413333, size.width * 0.6616667, size.height * 0.3413333)
      ..cubicTo(size.width * 0.6553333, size.height * 0.3413333, size.width * 0.6500000,
          size.height * 0.3390000, size.width * 0.6460000, size.height * 0.3343333)
      ..cubicTo(size.width * 0.6413333, size.height * 0.3296667, size.width * 0.6390000,
          size.height * 0.3240000, size.width * 0.6390000, size.height * 0.3180000)
      ..close()
      ..moveTo(size.width * 0.7056667, size.height * 0.4803333)
      ..cubicTo(size.width * 0.7056667, size.height * 0.4740000, size.width * 0.7080000,
          size.height * 0.4683333, size.width * 0.7123333, size.height * 0.4636667)
      ..cubicTo(size.width * 0.7166667, size.height * 0.4590000, size.width * 0.7223333,
          size.height * 0.4566667, size.width * 0.7286667, size.height * 0.4566667)
      ..cubicTo(size.width * 0.7346667, size.height * 0.4566667, size.width * 0.7400000,
          size.height * 0.4590000, size.width * 0.7443333, size.height * 0.4636667)
      ..cubicTo(size.width * 0.7486667, size.height * 0.4683333, size.width * 0.7510000,
          size.height * 0.4736667, size.width * 0.7510000, size.height * 0.4803333)
      ..cubicTo(size.width * 0.7510000, size.height * 0.4863333, size.width * 0.7486667,
          size.height * 0.4916667, size.width * 0.7443333, size.height * 0.4960000)
      ..cubicTo(size.width * 0.7400000, size.height * 0.5003333, size.width * 0.7346667,
          size.height * 0.5026667, size.width * 0.7286667, size.height * 0.5026667)
      ..cubicTo(size.width * 0.7223333, size.height * 0.5026667, size.width * 0.7166667,
          size.height * 0.5003333, size.width * 0.7123333, size.height * 0.4960000)
      ..cubicTo(size.width * 0.7080000, size.height * 0.4916667, size.width * 0.7056667,
          size.height * 0.4863333, size.width * 0.7056667, size.height * 0.4803333)
      ..close();
  }

  Path _sprinklePath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1546667, size.height * 0.5636667)
      ..cubicTo(size.width * 0.1546667, size.height * 0.5253333, size.width * 0.1666667,
          size.height * 0.4913333, size.width * 0.1906667, size.height * 0.4613333)
      ..cubicTo(size.width * 0.2146667, size.height * 0.4313333, size.width * 0.2450000,
          size.height * 0.4123333, size.width * 0.2816667, size.height * 0.4036667)
      ..cubicTo(size.width * 0.2920000, size.height * 0.3583333, size.width * 0.3153333,
          size.height * 0.3210000, size.width * 0.3516667, size.height * 0.2920000)
      ..cubicTo(size.width * 0.3880000, size.height * 0.2630000, size.width * 0.4300000,
          size.height * 0.2483333, size.width * 0.4770000, size.height * 0.2483333)
      ..cubicTo(size.width * 0.5230000, size.height * 0.2483333, size.width * 0.5636667,
          size.height * 0.2626667, size.width * 0.5996667, size.height * 0.2906667)
      ..cubicTo(size.width * 0.6353333, size.height * 0.3190000, size.width * 0.6590000,
          size.height * 0.3553333, size.width * 0.6700000, size.height * 0.4000000)
      ..lineTo(size.width * 0.6803333, size.height * 0.4000000)
      ..cubicTo(size.width * 0.7100000, size.height * 0.4000000, size.width * 0.7376667,
          size.height * 0.4073333, size.width * 0.7630000, size.height * 0.4216667)
      ..cubicTo(size.width * 0.7883333, size.height * 0.4360000, size.width * 0.8086667,
          size.height * 0.4560000, size.width * 0.8233333, size.height * 0.4810000)
      ..cubicTo(size.width * 0.8380000, size.height * 0.5060000, size.width * 0.8456667,
          size.height * 0.5336667, size.width * 0.8456667, size.height * 0.5633333)
      ..cubicTo(size.width * 0.8456667, size.height * 0.6080000, size.width * 0.8303333,
          size.height * 0.6463333, size.width * 0.7996667, size.height * 0.6783333)
      ..cubicTo(size.width * 0.7690000, size.height * 0.7103333, size.width * 0.7313333,
          size.height * 0.7273333, size.width * 0.6870000, size.height * 0.7286667)
      ..cubicTo(size.width * 0.6826667, size.height * 0.7286667, size.width * 0.6803333,
          size.height * 0.7266667, size.width * 0.6803333, size.height * 0.7230000)
      ..lineTo(size.width * 0.6803333, size.height * 0.6786667)
      ..cubicTo(size.width * 0.6803333, size.height * 0.6746667, size.width * 0.6826667,
          size.height * 0.6726667, size.width * 0.6870000, size.height * 0.6726667)
      ..cubicTo(size.width * 0.7156667, size.height * 0.6713333, size.width * 0.7396667,
          size.height * 0.6600000, size.width * 0.7596667, size.height * 0.6386667)
      ..cubicTo(size.width * 0.7796667, size.height * 0.6173333, size.width * 0.7896667,
          size.height * 0.5923333, size.width * 0.7896667, size.height * 0.5633333)
      ..cubicTo(size.width * 0.7896667, size.height * 0.5343333, size.width * 0.7790000,
          size.height * 0.5093333, size.width * 0.7570000, size.height * 0.4880000)
      ..cubicTo(size.width * 0.7353333, size.height * 0.4666667, size.width * 0.7096667,
          size.height * 0.4560000, size.width * 0.6800000, size.height * 0.4560000)
      ..lineTo(size.width * 0.6266667, size.height * 0.4560000)
      ..cubicTo(size.width * 0.6226667, size.height * 0.4560000, size.width * 0.6203333,
          size.height * 0.4540000, size.width * 0.6203333, size.height * 0.4503333)
      ..lineTo(size.width * 0.6180000, size.height * 0.4310000)
      ..cubicTo(size.width * 0.6143333, size.height * 0.3953333, size.width * 0.5990000,
          size.height * 0.3650000, size.width * 0.5720000, size.height * 0.3406667)
      ..cubicTo(size.width * 0.5446667, size.height * 0.3163333, size.width * 0.5130000,
          size.height * 0.3040000, size.width * 0.4770000, size.height * 0.3040000)
      ..cubicTo(size.width * 0.4406667, size.height * 0.3040000, size.width * 0.4086667,
          size.height * 0.3160000, size.width * 0.3816667, size.height * 0.3403333)
      ..cubicTo(size.width * 0.3546667, size.height * 0.3646667, size.width * 0.3393333,
          size.height * 0.3946667, size.width * 0.3356667, size.height * 0.4306667)
      ..lineTo(size.width * 0.3336667, size.height * 0.4486667)
      ..cubicTo(size.width * 0.3336667, size.height * 0.4526667, size.width * 0.3313333,
          size.height * 0.4546667, size.width * 0.3270000, size.height * 0.4546667)
      ..lineTo(size.width * 0.3093333, size.height * 0.4556667)
      ..cubicTo(size.width * 0.2820000, size.height * 0.4570000, size.width * 0.2590000,
          size.height * 0.4680000, size.width * 0.2396667, size.height * 0.4890000)
      ..cubicTo(size.width * 0.2203333, size.height * 0.5100000, size.width * 0.2110000,
          size.height * 0.5346667, size.width * 0.2110000, size.height * 0.5630000)
      ..cubicTo(size.width * 0.2110000, size.height * 0.5920000, size.width * 0.2210000,
          size.height * 0.6170000, size.width * 0.2410000, size.height * 0.6383333)
      ..cubicTo(size.width * 0.2610000, size.height * 0.6596667, size.width * 0.2853333,
          size.height * 0.6710000, size.width * 0.3136667, size.height * 0.6723333)
      ..cubicTo(size.width * 0.3173333, size.height * 0.6723333, size.width * 0.3193333,
          size.height * 0.6743333, size.width * 0.3193333, size.height * 0.6783333)
      ..lineTo(size.width * 0.3193333, size.height * 0.7226667)
      ..cubicTo(size.width * 0.3193333, size.height * 0.7263333, size.width * 0.3173333,
          size.height * 0.7283333, size.width * 0.3136667, size.height * 0.7283333)
      ..cubicTo(size.width * 0.2690000, size.height * 0.7263333, size.width * 0.2313333,
          size.height * 0.7093333, size.width * 0.2003333, size.height * 0.6773333)
      ..cubicTo(size.width * 0.1693333, size.height * 0.6453333, size.width * 0.1546667,
          size.height * 0.6080000, size.width * 0.1546667, size.height * 0.5636667)
      ..close()
      ..moveTo(size.width * 0.3523333, size.height * 0.5930000)
      ..cubicTo(size.width * 0.3523333, size.height * 0.5850000, size.width * 0.3563333,
          size.height * 0.5740000, size.width * 0.3646667, size.height * 0.5600000)
      ..cubicTo(size.width * 0.3726667, size.height * 0.5460000, size.width * 0.3803333,
          size.height * 0.5350000, size.width * 0.3873333, size.height * 0.5263333)
      ..cubicTo(size.width * 0.3943333, size.height * 0.5183333, size.width * 0.3986667,
          size.height * 0.5136667, size.width * 0.4000000, size.height * 0.5123333)
      ..lineTo(size.width * 0.4120000, size.height * 0.5256667)
      ..cubicTo(size.width * 0.4206667, size.height * 0.5350000, size.width * 0.4286667,
          size.height * 0.5460000, size.width * 0.4360000, size.height * 0.5596667)
      ..cubicTo(size.width * 0.4433333, size.height * 0.5730000, size.width * 0.4470000,
          size.height * 0.5843333, size.width * 0.4470000, size.height * 0.5930000)
      ..cubicTo(size.width * 0.4470000, size.height * 0.6060000, size.width * 0.4426667,
          size.height * 0.6170000, size.width * 0.4336667, size.height * 0.6256667)
      ..cubicTo(size.width * 0.4246667, size.height * 0.6343333, size.width * 0.4136667,
          size.height * 0.6386667, size.width * 0.4003333, size.height * 0.6386667)
      ..cubicTo(size.width * 0.3873333, size.height * 0.6386667, size.width * 0.3760000,
          size.height * 0.6343333, size.width * 0.3666667, size.height * 0.6253333)
      ..cubicTo(size.width * 0.3570000, size.height * 0.6166667, size.width * 0.3523333,
          size.height * 0.6056667, size.width * 0.3523333, size.height * 0.5930000)
      ..close()
      ..moveTo(size.width * 0.4516667, size.height * 0.7260000)
      ..cubicTo(size.width * 0.4516667, size.height * 0.7166667, size.width * 0.4543333,
          size.height * 0.7063333, size.width * 0.4596667, size.height * 0.6940000)
      ..cubicTo(size.width * 0.4650000, size.height * 0.6816667, size.width * 0.4713333,
          size.height * 0.6706667, size.width * 0.4793333, size.height * 0.6600000)
      ..cubicTo(size.width * 0.4853333, size.height * 0.6513333, size.width * 0.4926667,
          size.height * 0.6420000, size.width * 0.5016667, size.height * 0.6320000)
      ..cubicTo(size.width * 0.5103333, size.height * 0.6220000, size.width * 0.5170000,
          size.height * 0.6146667, size.width * 0.5216667, size.height * 0.6103333)
      ..cubicTo(size.width * 0.5240000, size.height * 0.6083333, size.width * 0.5266667,
          size.height * 0.6056667, size.width * 0.5296667, size.height * 0.6026667)
      ..lineTo(size.width * 0.5376667, size.height * 0.6103333)
      ..cubicTo(size.width * 0.5503333, size.height * 0.6213333, size.width * 0.5643333,
          size.height * 0.6376667, size.width * 0.5800000, size.height * 0.6590000)
      ..cubicTo(size.width * 0.5880000, size.height * 0.6700000, size.width * 0.5943333,
          size.height * 0.6816667, size.width * 0.5996667, size.height * 0.6936667)
      ..cubicTo(size.width * 0.6050000, size.height * 0.7056667, size.width * 0.6073333,
          size.height * 0.7163333, size.width * 0.6073333, size.height * 0.7260000)
      ..cubicTo(size.width * 0.6073333, size.height * 0.7473333, size.width * 0.5996667,
          size.height * 0.7656667, size.width * 0.5846667, size.height * 0.7810000)
      ..cubicTo(size.width * 0.5696667, size.height * 0.7963333, size.width * 0.5510000,
          size.height * 0.8036667, size.width * 0.5293333, size.height * 0.8036667)
      ..cubicTo(size.width * 0.5080000, size.height * 0.8036667, size.width * 0.4896667,
          size.height * 0.7960000, size.width * 0.4743333, size.height * 0.7813333)
      ..cubicTo(size.width * 0.4590000, size.height * 0.7660000, size.width * 0.4516667,
          size.height * 0.7476667, size.width * 0.4516667, size.height * 0.7260000)
      ..close()
      ..moveTo(size.width * 0.5006667, size.height * 0.5040000)
      ..cubicTo(size.width * 0.5006667, size.height * 0.4900000, size.width * 0.5113333,
          size.height * 0.4723333, size.width * 0.5330000, size.height * 0.4506667)
      ..lineTo(size.width * 0.5410000, size.height * 0.4590000)
      ..cubicTo(size.width * 0.5470000, size.height * 0.4660000, size.width * 0.5520000,
          size.height * 0.4740000, size.width * 0.5570000, size.height * 0.4826667)
      ..cubicTo(size.width * 0.5616667, size.height * 0.4913333, size.width * 0.5643333,
          size.height * 0.4983333, size.width * 0.5643333, size.height * 0.5040000)
      ..cubicTo(size.width * 0.5643333, size.height * 0.5126667, size.width * 0.5613333,
          size.height * 0.5200000, size.width * 0.5550000, size.height * 0.5260000)
      ..cubicTo(size.width * 0.5490000, size.height * 0.5320000, size.width * 0.5416667,
          size.height * 0.5353333, size.width * 0.5330000, size.height * 0.5353333)
      ..cubicTo(size.width * 0.5240000, size.height * 0.5353333, size.width * 0.5163333,
          size.height * 0.5323333, size.width * 0.5100000, size.height * 0.5260000)
      ..cubicTo(size.width * 0.5036667, size.height * 0.5200000, size.width * 0.5006667,
          size.height * 0.5126667, size.width * 0.5006667, size.height * 0.5040000)
      ..close();
  }

  Path _stormShowersPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1543333, size.height * 0.5636667)
      ..cubicTo(size.width * 0.1543333, size.height * 0.6006667, size.width * 0.1653333,
          size.height * 0.6336667, size.width * 0.1873333, size.height * 0.6626667)
      ..cubicTo(size.width * 0.2093333, size.height * 0.6916667, size.width * 0.2376667,
          size.height * 0.7116667, size.width * 0.2726667, size.height * 0.7223333)
      ..lineTo(size.width * 0.2510000, size.height * 0.7783333)
      ..cubicTo(size.width * 0.2500000, size.height * 0.7830000, size.width * 0.2516667,
          size.height * 0.7856667, size.width * 0.2556667, size.height * 0.7856667)
      ..lineTo(size.width * 0.3266667, size.height * 0.7856667)
      ..lineTo(size.width * 0.2920000, size.height * 0.9116667)
      ..lineTo(size.width * 0.3013333, size.height * 0.9116667)
      ..lineTo(size.width * 0.4336667, size.height * 0.7376667)
      ..cubicTo(size.width * 0.4350000, size.height * 0.7363333, size.width * 0.4350000,
          size.height * 0.7346667, size.width * 0.4343333, size.height * 0.7330000)
      ..cubicTo(size.width * 0.4336667, size.height * 0.7313333, size.width * 0.4320000,
          size.height * 0.7306667, size.width * 0.4296667, size.height * 0.7306667)
      ..lineTo(size.width * 0.3570000, size.height * 0.7306667)
      ..lineTo(size.width * 0.4396667, size.height * 0.5760000)
      ..cubicTo(size.width * 0.4416667, size.height * 0.5713333, size.width * 0.4403333,
          size.height * 0.5690000, size.width * 0.4350000, size.height * 0.5690000)
      ..lineTo(size.width * 0.3370000, size.height * 0.5690000)
      ..cubicTo(size.width * 0.3340000, size.height * 0.5690000, size.width * 0.3313333,
          size.height * 0.5706667, size.width * 0.3296667, size.height * 0.5736667)
      ..lineTo(size.width * 0.2933333, size.height * 0.6693333)
      ..cubicTo(size.width * 0.2696667, size.height * 0.6633333, size.width * 0.2500000,
          size.height * 0.6503333, size.width * 0.2343333, size.height * 0.6306667)
      ..cubicTo(size.width * 0.2186667, size.height * 0.6110000, size.width * 0.2110000,
          size.height * 0.5886667, size.width * 0.2110000, size.height * 0.5636667)
      ..cubicTo(size.width * 0.2110000, size.height * 0.5360000, size.width * 0.2203333,
          size.height * 0.5120000, size.width * 0.2390000, size.height * 0.4916667)
      ..cubicTo(size.width * 0.2576667, size.height * 0.4713333, size.width * 0.2810000,
          size.height * 0.4596667, size.width * 0.3090000, size.height * 0.4563333)
      ..lineTo(size.width * 0.3263333, size.height * 0.4540000)
      ..cubicTo(size.width * 0.3306667, size.height * 0.4540000, size.width * 0.3330000,
          size.height * 0.4520000, size.width * 0.3330000, size.height * 0.4483333)
      ..lineTo(size.width * 0.3353333, size.height * 0.4310000)
      ..cubicTo(size.width * 0.3386667, size.height * 0.3950000, size.width * 0.3536667,
          size.height * 0.3646667, size.width * 0.3806667, size.height * 0.3403333)
      ..cubicTo(size.width * 0.4076667, size.height * 0.3160000, size.width * 0.4393333,
          size.height * 0.3036667, size.width * 0.4756667, size.height * 0.3036667)
      ..cubicTo(size.width * 0.5120000, size.height * 0.3036667, size.width * 0.5436667,
          size.height * 0.3160000, size.width * 0.5706667, size.height * 0.3403333)
      ..cubicTo(size.width * 0.5980000, size.height * 0.3646667, size.width * 0.6133333,
          size.height * 0.3950000, size.width * 0.6173333, size.height * 0.4310000)
      ..lineTo(size.width * 0.6193333, size.height * 0.4503333)
      ..cubicTo(size.width * 0.6193333, size.height * 0.4543333, size.width * 0.6213333,
          size.height * 0.4563333, size.width * 0.6256667, size.height * 0.4563333)
      ..lineTo(size.width * 0.6793333, size.height * 0.4563333)
      ..cubicTo(size.width * 0.7096667, size.height * 0.4563333, size.width * 0.7353333,
          size.height * 0.4670000, size.width * 0.7566667, size.height * 0.4880000)
      ..cubicTo(size.width * 0.7780000, size.height * 0.5090000, size.width * 0.7886667,
          size.height * 0.5343333, size.width * 0.7886667, size.height * 0.5640000)
      ..cubicTo(size.width * 0.7886667, size.height * 0.5923333, size.width * 0.7786667,
          size.height * 0.6170000, size.width * 0.7590000, size.height * 0.6376667)
      ..cubicTo(size.width * 0.7393333, size.height * 0.6583333, size.width * 0.7150000,
          size.height * 0.6696667, size.width * 0.6860000, size.height * 0.6720000)
      ..cubicTo(size.width * 0.6816667, size.height * 0.6720000, size.width * 0.6793333,
          size.height * 0.6740000, size.width * 0.6793333, size.height * 0.6783333)
      ..lineTo(size.width * 0.6793333, size.height * 0.7240000)
      ..cubicTo(size.width * 0.6793333, size.height * 0.7276667, size.width * 0.6816667,
          size.height * 0.7296667, size.width * 0.6860000, size.height * 0.7296667)
      ..cubicTo(size.width * 0.7076667, size.height * 0.7290000, size.width * 0.7283333,
          size.height * 0.7240000, size.width * 0.7480000, size.height * 0.7150000)
      ..cubicTo(size.width * 0.7676667, size.height * 0.7060000, size.width * 0.7846667,
          size.height * 0.6940000, size.width * 0.7986667, size.height * 0.6793333)
      ..cubicTo(size.width * 0.8126667, size.height * 0.6646667, size.width * 0.8240000,
          size.height * 0.6473333, size.width * 0.8323333, size.height * 0.6270000)
      ..cubicTo(size.width * 0.8406667, size.height * 0.6070000, size.width * 0.8450000,
          size.height * 0.5860000, size.width * 0.8450000, size.height * 0.5643333)
      ..cubicTo(size.width * 0.8450000, size.height * 0.5343333, size.width * 0.8376667,
          size.height * 0.5066667, size.width * 0.8226667, size.height * 0.4813333)
      ..cubicTo(size.width * 0.8076667, size.height * 0.4560000, size.width * 0.7876667,
          size.height * 0.4360000, size.width * 0.7623333, size.height * 0.4213333)
      ..cubicTo(size.width * 0.7370000, size.height * 0.4066667, size.width * 0.7093333,
          size.height * 0.3993333, size.width * 0.6796667, size.height * 0.3993333)
      ..lineTo(size.width * 0.6690000, size.height * 0.3993333)
      ..cubicTo(size.width * 0.6580000, size.height * 0.3550000, size.width * 0.6346667,
          size.height * 0.3186667, size.width * 0.5986667, size.height * 0.2906667)
      ..cubicTo(size.width * 0.5626667, size.height * 0.2626667, size.width * 0.5220000,
          size.height * 0.2483333, size.width * 0.4760000, size.height * 0.2483333)
      ..cubicTo(size.width * 0.4290000, size.height * 0.2483333, size.width * 0.3870000,
          size.height * 0.2630000, size.width * 0.3506667, size.height * 0.2920000)
      ..cubicTo(size.width * 0.3143333, size.height * 0.3210000, size.width * 0.2910000,
          size.height * 0.3583333, size.width * 0.2806667, size.height * 0.4040000)
      ..cubicTo(size.width * 0.2440000, size.height * 0.4126667, size.width * 0.2136667,
          size.height * 0.4316667, size.width * 0.1896667, size.height * 0.4616667)
      ..cubicTo(size.width * 0.1656667, size.height * 0.4916667, size.width * 0.1543333,
          size.height * 0.5253333, size.width * 0.1543333, size.height * 0.5636667)
      ..close()
      ..moveTo(size.width * 0.4263333, size.height * 0.8923333)
      ..cubicTo(size.width * 0.4263333, size.height * 0.8976667, size.width * 0.4280000,
          size.height * 0.9026667, size.width * 0.4313333, size.height * 0.9076667)
      ..cubicTo(size.width * 0.4346667, size.height * 0.9126667, size.width * 0.4400000,
          size.height * 0.9163333, size.width * 0.4466667, size.height * 0.9183333)
      ..cubicTo(size.width * 0.4513333, size.height * 0.9193333, size.width * 0.4540000,
          size.height * 0.9200000, size.width * 0.4550000, size.height * 0.9200000)
      ..cubicTo(size.width * 0.4580000, size.height * 0.9200000, size.width * 0.4620000,
          size.height * 0.9190000, size.width * 0.4676667, size.height * 0.9166667)
      ..cubicTo(size.width * 0.4746667, size.height * 0.9136667, size.width * 0.4793333,
          size.height * 0.9076667, size.width * 0.4816667, size.height * 0.8993333)
      ..lineTo(size.width * 0.4910000, size.height * 0.8643333)
      ..cubicTo(size.width * 0.4930000, size.height * 0.8570000, size.width * 0.4923333,
          size.height * 0.8500000, size.width * 0.4883333, size.height * 0.8433333)
      ..cubicTo(size.width * 0.4843333, size.height * 0.8366667, size.width * 0.4786667,
          size.height * 0.8323333, size.width * 0.4706667, size.height * 0.8300000)
      ..cubicTo(size.width * 0.4633333, size.height * 0.8280000, size.width * 0.4563333,
          size.height * 0.8286667, size.width * 0.4496667, size.height * 0.8326667)
      ..cubicTo(size.width * 0.4430000, size.height * 0.8366667, size.width * 0.4383333,
          size.height * 0.8423333, size.width * 0.4360000, size.height * 0.8503333)
      ..lineTo(size.width * 0.4270000, size.height * 0.8836667)
      ..cubicTo(size.width * 0.4266667, size.height * 0.8893333, size.width * 0.4263333,
          size.height * 0.8923333, size.width * 0.4263333, size.height * 0.8923333)
      ..close()
      ..moveTo(size.width * 0.4710000, size.height * 0.7333333)
      ..cubicTo(size.width * 0.4710000, size.height * 0.7380000, size.width * 0.4726667,
          size.height * 0.7430000, size.width * 0.4760000, size.height * 0.7480000)
      ..cubicTo(size.width * 0.4793333, size.height * 0.7530000, size.width * 0.4843333,
          size.height * 0.7566667, size.width * 0.4910000, size.height * 0.7590000)
      ..cubicTo(size.width * 0.4983333, size.height * 0.7613333, size.width * 0.5056667,
          size.height * 0.7610000, size.width * 0.5123333, size.height * 0.7573333)
      ..cubicTo(size.width * 0.5190000, size.height * 0.7536667, size.width * 0.5233333,
          size.height * 0.7480000, size.width * 0.5256667, size.height * 0.7400000)
      ..lineTo(size.width * 0.5356667, size.height * 0.7053333)
      ..cubicTo(size.width * 0.5376667, size.height * 0.6980000, size.width * 0.5366667,
          size.height * 0.6910000, size.width * 0.5330000, size.height * 0.6843333)
      ..cubicTo(size.width * 0.5290000, size.height * 0.6776667, size.width * 0.5230000,
          size.height * 0.6730000, size.width * 0.5153333, size.height * 0.6706667)
      ..cubicTo(size.width * 0.5076667, size.height * 0.6686667, size.width * 0.5006667,
          size.height * 0.6693333, size.width * 0.4936667, size.height * 0.6733333)
      ..cubicTo(size.width * 0.4866667, size.height * 0.6773333, size.width * 0.4823333,
          size.height * 0.6830000, size.width * 0.4800000, size.height * 0.6906667)
      ..lineTo(size.width * 0.4720000, size.height * 0.7243333)
      ..cubicTo(size.width * 0.4713333, size.height * 0.7300000, size.width * 0.4710000,
          size.height * 0.7330000, size.width * 0.4710000, size.height * 0.7333333)
      ..close()
      ..moveTo(size.width * 0.5650000, size.height * 0.7883333)
      ..cubicTo(size.width * 0.5650000, size.height * 0.7940000, size.width * 0.5666667,
          size.height * 0.7996667, size.width * 0.5703333, size.height * 0.8053333)
      ..cubicTo(size.width * 0.5740000, size.height * 0.8110000, size.width * 0.5793333,
          size.height * 0.8146667, size.width * 0.5860000, size.height * 0.8170000)
      ..cubicTo(size.width * 0.5866667, size.height * 0.8170000, size.width * 0.5880000,
          size.height * 0.8173333, size.width * 0.5900000, size.height * 0.8176667)
      ..cubicTo(size.width * 0.5916667, size.height * 0.8180000, size.width * 0.5930000,
          size.height * 0.8183333, size.width * 0.5940000, size.height * 0.8183333)
      ..cubicTo(size.width * 0.5983333, size.height * 0.8183333, size.width * 0.6026667,
          size.height * 0.8176667, size.width * 0.6066667, size.height * 0.8156667)
      ..cubicTo(size.width * 0.6130000, size.height * 0.8133333, size.width * 0.6176667,
          size.height * 0.8070000, size.width * 0.6203333, size.height * 0.7966667)
      ..lineTo(size.width * 0.6286667, size.height * 0.7630000)
      ..cubicTo(size.width * 0.6310000, size.height * 0.7553333, size.width * 0.6303333,
          size.height * 0.7480000, size.width * 0.6266667, size.height * 0.7410000)
      ..cubicTo(size.width * 0.6230000, size.height * 0.7340000, size.width * 0.6173333,
          size.height * 0.7293333, size.width * 0.6100000, size.height * 0.7270000)
      ..cubicTo(size.width * 0.6016667, size.height * 0.7250000, size.width * 0.5940000,
          size.height * 0.7260000, size.width * 0.5873333, size.height * 0.7296667)
      ..cubicTo(size.width * 0.5806667, size.height * 0.7336667, size.width * 0.5763333,
          size.height * 0.7396667, size.width * 0.5750000, size.height * 0.7473333)
      ..lineTo(size.width * 0.5660000, size.height * 0.7816667)
      ..cubicTo(size.width * 0.5653333, size.height * 0.7836667, size.width * 0.5650000,
          size.height * 0.7860000, size.width * 0.5650000, size.height * 0.7883333)
      ..close()
      ..moveTo(size.width * 0.6103333, size.height * 0.6286667)
      ..cubicTo(size.width * 0.6100000, size.height * 0.6340000, size.width * 0.6116667,
          size.height * 0.6390000, size.width * 0.6153333, size.height * 0.6443333)
      ..cubicTo(size.width * 0.6190000, size.height * 0.6496667, size.width * 0.6243333,
          size.height * 0.6536667, size.width * 0.6316667, size.height * 0.6570000)
      ..cubicTo(size.width * 0.6343333, size.height * 0.6583333, size.width * 0.6370000,
          size.height * 0.6590000, size.width * 0.6403333, size.height * 0.6590000)
      ..cubicTo(size.width * 0.6440000, size.height * 0.6590000, size.width * 0.6476667,
          size.height * 0.6580000, size.width * 0.6516667, size.height * 0.6563333)
      ..cubicTo(size.width * 0.6586667, size.height * 0.6530000, size.width * 0.6633333,
          size.height * 0.6466667, size.width * 0.6663333, size.height * 0.6373333)
      ..lineTo(size.width * 0.6760000, size.height * 0.6030000)
      ..cubicTo(size.width * 0.6766667, size.height * 0.5986667, size.width * 0.6770000,
          size.height * 0.5963333, size.width * 0.6770000, size.height * 0.5956667)
      ..cubicTo(size.width * 0.6770000, size.height * 0.5900000, size.width * 0.6753333,
          size.height * 0.5846667, size.width * 0.6716667, size.height * 0.5793333)
      ..cubicTo(size.width * 0.6680000, size.height * 0.5740000, size.width * 0.6626667,
          size.height * 0.5703333, size.width * 0.6553333, size.height * 0.5683333)
      ..cubicTo(size.width * 0.6546667, size.height * 0.5683333, size.width * 0.6533333,
          size.height * 0.5680000, size.width * 0.6516667, size.height * 0.5676667)
      ..cubicTo(size.width * 0.6496667, size.height * 0.5666667, size.width * 0.6483333,
          size.height * 0.5666667, size.width * 0.6473333, size.height * 0.5666667)
      ..cubicTo(size.width * 0.6416667, size.height * 0.5666667, size.width * 0.6363333,
          size.height * 0.5683333, size.width * 0.6310000, size.height * 0.5716667)
      ..cubicTo(size.width * 0.6256667, size.height * 0.5750000, size.width * 0.6220000,
          size.height * 0.5803333, size.width * 0.6200000, size.height * 0.5876667)
      ..lineTo(size.width * 0.6110000, size.height * 0.6213333)
      ..cubicTo(size.width * 0.6106667, size.height * 0.6240000, size.width * 0.6103333,
          size.height * 0.6263333, size.width * 0.6103333, size.height * 0.6286667)
      ..close();
  }

  Path _strongWindPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1033333, size.height * 0.5656667)
      ..cubicTo(size.width * 0.1033333, size.height * 0.5736667, size.width * 0.1063333,
          size.height * 0.5806667, size.width * 0.1126667, size.height * 0.5863333)
      ..cubicTo(size.width * 0.1180000, size.height * 0.5926667, size.width * 0.1250000,
          size.height * 0.5956667, size.width * 0.1336667, size.height * 0.5956667)
      ..lineTo(size.width * 0.6233333, size.height * 0.5956667)
      ..cubicTo(size.width * 0.6330000, size.height * 0.5956667, size.width * 0.6410000,
          size.height * 0.5990000, size.width * 0.6476667, size.height * 0.6056667)
      ..cubicTo(size.width * 0.6543333, size.height * 0.6123333, size.width * 0.6576667,
          size.height * 0.6206667, size.width * 0.6576667, size.height * 0.6303333)
      ..cubicTo(size.width * 0.6576667, size.height * 0.6400000, size.width * 0.6543333,
          size.height * 0.6480000, size.width * 0.6476667, size.height * 0.6543333)
      ..cubicTo(size.width * 0.6410000, size.height * 0.6606667, size.width * 0.6330000,
          size.height * 0.6640000, size.width * 0.6230000, size.height * 0.6640000)
      ..cubicTo(size.width * 0.6133333, size.height * 0.6640000, size.width * 0.6050000,
          size.height * 0.6606667, size.width * 0.5986667, size.height * 0.6543333)
      ..cubicTo(size.width * 0.5933333, size.height * 0.6483333, size.width * 0.5866667,
          size.height * 0.6456667, size.width * 0.5786667, size.height * 0.6456667)
      ..cubicTo(size.width * 0.5703333, size.height * 0.6456667, size.width * 0.5633333,
          size.height * 0.6486667, size.width * 0.5573333, size.height * 0.6543333)
      ..cubicTo(size.width * 0.5513333, size.height * 0.6600000, size.width * 0.5483333,
          size.height * 0.6670000, size.width * 0.5483333, size.height * 0.6746667)
      ..cubicTo(size.width * 0.5483333, size.height * 0.6830000, size.width * 0.5513333,
          size.height * 0.6900000, size.width * 0.5576667, size.height * 0.6956667)
      ..cubicTo(size.width * 0.5763333, size.height * 0.7140000, size.width * 0.5983333,
          size.height * 0.7233333, size.width * 0.6230000, size.height * 0.7233333)
      ..cubicTo(size.width * 0.6490000, size.height * 0.7233333, size.width * 0.6713333,
          size.height * 0.7143333, size.width * 0.6900000, size.height * 0.6963333)
      ..cubicTo(size.width * 0.7086667, size.height * 0.6783333, size.width * 0.7176667,
          size.height * 0.6566667, size.width * 0.7176667, size.height * 0.6306667)
      ..cubicTo(size.width * 0.7176667, size.height * 0.6046667, size.width * 0.7083333,
          size.height * 0.5826667, size.width * 0.6896667, size.height * 0.5640000)
      ..cubicTo(size.width * 0.6710000, size.height * 0.5453333, size.width * 0.6486667,
          size.height * 0.5360000, size.width * 0.6230000, size.height * 0.5360000)
      ..lineTo(size.width * 0.1336667, size.height * 0.5360000)
      ..cubicTo(size.width * 0.1253333, size.height * 0.5360000, size.width * 0.1183333,
          size.height * 0.5390000, size.width * 0.1123333, size.height * 0.5446667)
      ..cubicTo(size.width * 0.1063333, size.height * 0.5503333, size.width * 0.1033333,
          size.height * 0.5573333, size.width * 0.1033333, size.height * 0.5656667)
      ..close()
      ..moveTo(size.width * 0.1033333, size.height * 0.4563333)
      ..cubicTo(size.width * 0.1033333, size.height * 0.4640000, size.width * 0.1063333,
          size.height * 0.4706667, size.width * 0.1126667, size.height * 0.4766667)
      ..cubicTo(size.width * 0.1183333, size.height * 0.4826667, size.width * 0.1253333,
          size.height * 0.4853333, size.width * 0.1336667, size.height * 0.4853333)
      ..lineTo(size.width * 0.8016667, size.height * 0.4853333)
      ..cubicTo(size.width * 0.8276667, size.height * 0.4853333, size.width * 0.8500000,
          size.height * 0.4763333, size.width * 0.8686667, size.height * 0.4580000)
      ..cubicTo(size.width * 0.8873333, size.height * 0.4400000, size.width * 0.8966667,
          size.height * 0.4180000, size.width * 0.8966667, size.height * 0.3923333)
      ..cubicTo(size.width * 0.8966667, size.height * 0.3666667, size.width * 0.8873333,
          size.height * 0.3443333, size.width * 0.8686667, size.height * 0.3260000)
      ..cubicTo(size.width * 0.8500000, size.height * 0.3076667, size.width * 0.8276667,
          size.height * 0.2983333, size.width * 0.8016667, size.height * 0.2983333)
      ..cubicTo(size.width * 0.7760000, size.height * 0.2983333, size.width * 0.7543333,
          size.height * 0.3073333, size.width * 0.7366667, size.height * 0.3250000)
      ..cubicTo(size.width * 0.7306667, size.height * 0.3303333, size.width * 0.7276667,
          size.height * 0.3376667, size.width * 0.7276667, size.height * 0.3473333)
      ..cubicTo(size.width * 0.7276667, size.height * 0.3560000, size.width * 0.7306667,
          size.height * 0.3630000, size.width * 0.7363333, size.height * 0.3683333)
      ..cubicTo(size.width * 0.7420000, size.height * 0.3736667, size.width * 0.7490000,
          size.height * 0.3763333, size.width * 0.7573333, size.height * 0.3763333)
      ..cubicTo(size.width * 0.7653333, size.height * 0.3763333, size.width * 0.7723333,
          size.height * 0.3736667, size.width * 0.7783333, size.height * 0.3683333)
      ..cubicTo(size.width * 0.7846667, size.height * 0.3613333, size.width * 0.7923333,
          size.height * 0.3580000, size.width * 0.8016667, size.height * 0.3580000)
      ..cubicTo(size.width * 0.8113333, size.height * 0.3580000, size.width * 0.8193333,
          size.height * 0.3613333, size.width * 0.8260000, size.height * 0.3680000)
      ..cubicTo(size.width * 0.8326667, size.height * 0.3746667, size.width * 0.8360000,
          size.height * 0.3826667, size.width * 0.8360000, size.height * 0.3923333)
      ..cubicTo(size.width * 0.8360000, size.height * 0.4020000, size.width * 0.8326667,
          size.height * 0.4100000, size.width * 0.8260000, size.height * 0.4163333)
      ..cubicTo(size.width * 0.8193333, size.height * 0.4226667, size.width * 0.8113333,
          size.height * 0.4260000, size.width * 0.8016667, size.height * 0.4260000)
      ..lineTo(size.width * 0.1336667, size.height * 0.4260000)
      ..cubicTo(size.width * 0.1253333, size.height * 0.4260000, size.width * 0.1183333,
          size.height * 0.4290000, size.width * 0.1123333, size.height * 0.4346667)
      ..cubicTo(size.width * 0.1063333, size.height * 0.4410000, size.width * 0.1033333,
          size.height * 0.4480000, size.width * 0.1033333, size.height * 0.4563333)
      ..close();
  }

  Path _thermometerPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.3303333, size.height * 0.6520000)
      ..cubicTo(size.width * 0.3303333, size.height * 0.6236667, size.width * 0.3370000,
          size.height * 0.5973333, size.width * 0.3500000, size.height * 0.5726667)
      ..cubicTo(size.width * 0.3630000, size.height * 0.5480000, size.width * 0.3813333,
          size.height * 0.5276667, size.width * 0.4050000, size.height * 0.5113333)
      ..lineTo(size.width * 0.4050000, size.height * 0.1806667)
      ..cubicTo(size.width * 0.4050000, size.height * 0.1540000, size.width * 0.4140000,
          size.height * 0.1313333, size.width * 0.4323333, size.height * 0.1130000)
      ..cubicTo(size.width * 0.4506667, size.height * 0.09466667, size.width * 0.4733333,
          size.height * 0.08500000, size.width * 0.5000000, size.height * 0.08500000)
      ..cubicTo(size.width * 0.5270000, size.height * 0.08500000, size.width * 0.5496667,
          size.height * 0.09433333, size.width * 0.5680000, size.height * 0.1126667)
      ..cubicTo(size.width * 0.5863333, size.height * 0.1313333, size.width * 0.5956667,
          size.height * 0.1536667, size.width * 0.5956667, size.height * 0.1803333)
      ..lineTo(size.width * 0.5956667, size.height * 0.5110000)
      ..cubicTo(size.width * 0.6193333, size.height * 0.5273333, size.width * 0.6373333,
          size.height * 0.5480000, size.width * 0.6503333, size.height * 0.5723333)
      ..cubicTo(size.width * 0.6633333, size.height * 0.5966667, size.width * 0.6696667,
          size.height * 0.6233333, size.width * 0.6696667, size.height * 0.6516667)
      ..cubicTo(size.width * 0.6696667, size.height * 0.6823333, size.width * 0.6620000,
          size.height * 0.7110000, size.width * 0.6470000, size.height * 0.7370000)
      ..cubicTo(size.width * 0.6320000, size.height * 0.7630000, size.width * 0.6113333,
          size.height * 0.7836667, size.width * 0.5853333, size.height * 0.7986667)
      ..cubicTo(size.width * 0.5593333, size.height * 0.8136667, size.width * 0.5310000,
          size.height * 0.8213333, size.width * 0.5000000, size.height * 0.8213333)
      ..cubicTo(size.width * 0.4693333, size.height * 0.8213333, size.width * 0.4410000,
          size.height * 0.8136667, size.width * 0.4150000, size.height * 0.7986667)
      ..cubicTo(size.width * 0.3890000, size.height * 0.7836667, size.width * 0.3683333,
          size.height * 0.7630000, size.width * 0.3530000, size.height * 0.7370000)
      ..cubicTo(size.width * 0.3376667, size.height * 0.7110000, size.width * 0.3303333,
          size.height * 0.6826667, size.width * 0.3303333, size.height * 0.6520000)
      ..close()
      ..moveTo(size.width * 0.3890000, size.height * 0.6520000)
      ..cubicTo(size.width * 0.3890000, size.height * 0.6830000, size.width * 0.4000000,
          size.height * 0.7096667, size.width * 0.4216667, size.height * 0.7316667)
      ..cubicTo(size.width * 0.4433333, size.height * 0.7536667, size.width * 0.4696667,
          size.height * 0.7646667, size.width * 0.5003333, size.height * 0.7646667)
      ..cubicTo(size.width * 0.5313333, size.height * 0.7646667, size.width * 0.5580000,
          size.height * 0.7536667, size.width * 0.5803333, size.height * 0.7313333)
      ..cubicTo(size.width * 0.6026667, size.height * 0.7090000, size.width * 0.6140000,
          size.height * 0.6826667, size.width * 0.6140000, size.height * 0.6523333)
      ..cubicTo(size.width * 0.6140000, size.height * 0.6316667, size.width * 0.6086667,
          size.height * 0.6123333, size.width * 0.5980000, size.height * 0.5946667)
      ..cubicTo(size.width * 0.5873333, size.height * 0.5770000, size.width * 0.5726667,
          size.height * 0.5633333, size.width * 0.5540000, size.height * 0.5536667)
      ..lineTo(size.width * 0.5446667, size.height * 0.5490000)
      ..cubicTo(size.width * 0.5413333, size.height * 0.5476667, size.width * 0.5396667,
          size.height * 0.5443333, size.width * 0.5396667, size.height * 0.5393333)
      ..lineTo(size.width * 0.5396667, size.height * 0.1806667)
      ..cubicTo(size.width * 0.5396667, size.height * 0.1700000, size.width * 0.5360000,
          size.height * 0.1610000, size.width * 0.5283333, size.height * 0.1536667)
      ..cubicTo(size.width * 0.5206667, size.height * 0.1466667, size.width * 0.5113333,
          size.height * 0.1430000, size.width * 0.5000000, size.height * 0.1430000)
      ..cubicTo(size.width * 0.4893333, size.height * 0.1430000, size.width * 0.4800000,
          size.height * 0.1466667, size.width * 0.4723333, size.height * 0.1536667)
      ..cubicTo(size.width * 0.4646667, size.height * 0.1606667, size.width * 0.4610000,
          size.height * 0.1696667, size.width * 0.4610000, size.height * 0.1806667)
      ..lineTo(size.width * 0.4610000, size.height * 0.5386667)
      ..cubicTo(size.width * 0.4610000, size.height * 0.5436667, size.width * 0.4593333,
          size.height * 0.5470000, size.width * 0.4563333, size.height * 0.5483333)
      ..lineTo(size.width * 0.4473333, size.height * 0.5530000)
      ..cubicTo(size.width * 0.4290000, size.height * 0.5626667, size.width * 0.4146667,
          size.height * 0.5763333, size.width * 0.4043333, size.height * 0.5940000)
      ..cubicTo(size.width * 0.3940000, size.height * 0.6116667, size.width * 0.3890000,
          size.height * 0.6306667, size.width * 0.3890000, size.height * 0.6520000)
      ..close()
      ..moveTo(size.width * 0.4150000, size.height * 0.6520000)
      ..cubicTo(size.width * 0.4150000, size.height * 0.6756667, size.width * 0.4230000,
          size.height * 0.6960000, size.width * 0.4393333, size.height * 0.7126667)
      ..cubicTo(size.width * 0.4556667, size.height * 0.7293333, size.width * 0.4750000,
          size.height * 0.7376667, size.width * 0.4980000, size.height * 0.7376667)
      ..cubicTo(size.width * 0.5210000, size.height * 0.7376667, size.width * 0.5406667,
          size.height * 0.7293333, size.width * 0.5576667, size.height * 0.7126667)
      ..cubicTo(size.width * 0.5746667, size.height * 0.6960000, size.width * 0.5830000,
          size.height * 0.6756667, size.width * 0.5830000, size.height * 0.6523333)
      ..cubicTo(size.width * 0.5830000, size.height * 0.6313333, size.width * 0.5756667,
          size.height * 0.6126667, size.width * 0.5613333, size.height * 0.5966667)
      ..cubicTo(size.width * 0.5470000, size.height * 0.5806667, size.width * 0.5293333,
          size.height * 0.5710000, size.width * 0.5086667, size.height * 0.5683333)
      ..lineTo(size.width * 0.5086667, size.height * 0.3230000)
      ..cubicTo(size.width * 0.5086667, size.height * 0.3210000, size.width * 0.5076667,
          size.height * 0.3186667, size.width * 0.5053333, size.height * 0.3166667)
      ..cubicTo(size.width * 0.5030000, size.height * 0.3143333, size.width * 0.5006667,
          size.height * 0.3133333, size.width * 0.4980000, size.height * 0.3133333)
      ..cubicTo(size.width * 0.4950000, size.height * 0.3133333, size.width * 0.4926667,
          size.height * 0.3143333, size.width * 0.4910000, size.height * 0.3160000)
      ..cubicTo(size.width * 0.4893333, size.height * 0.3180000, size.width * 0.4883333,
          size.height * 0.3200000, size.width * 0.4883333, size.height * 0.3230000)
      ..lineTo(size.width * 0.4883333, size.height * 0.5676667)
      ..cubicTo(size.width * 0.4680000, size.height * 0.5706667, size.width * 0.4506667,
          size.height * 0.5800000, size.width * 0.4363333, size.height * 0.5960000)
      ..cubicTo(size.width * 0.4220000, size.height * 0.6123333, size.width * 0.4150000,
          size.height * 0.6306667, size.width * 0.4150000, size.height * 0.6520000)
      ..close();
  }

  Path _thunderstormPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1543333, size.height * 0.5636667)
      ..cubicTo(size.width * 0.1543333, size.height * 0.6006667, size.width * 0.1653333,
          size.height * 0.6336667, size.width * 0.1873333, size.height * 0.6626667)
      ..cubicTo(size.width * 0.2093333, size.height * 0.6916667, size.width * 0.2380000,
          size.height * 0.7116667, size.width * 0.2733333, size.height * 0.7223333)
      ..lineTo(size.width * 0.2513333, size.height * 0.7783333)
      ..cubicTo(size.width * 0.2503333, size.height * 0.7830000, size.width * 0.2520000,
          size.height * 0.7856667, size.width * 0.2560000, size.height * 0.7856667)
      ..lineTo(size.width * 0.3270000, size.height * 0.7856667)
      ..lineTo(size.width * 0.2943333, size.height * 0.9290000)
      ..lineTo(size.width * 0.3036667, size.height * 0.9290000)
      ..lineTo(size.width * 0.4343333, size.height * 0.7373333)
      ..cubicTo(size.width * 0.4356667, size.height * 0.7360000, size.width * 0.4356667,
          size.height * 0.7343333, size.width * 0.4346667, size.height * 0.7326667)
      ..cubicTo(size.width * 0.4336667, size.height * 0.7310000, size.width * 0.4320000,
          size.height * 0.7303333, size.width * 0.4296667, size.height * 0.7303333)
      ..lineTo(size.width * 0.3570000, size.height * 0.7303333)
      ..lineTo(size.width * 0.4396667, size.height * 0.5756667)
      ..cubicTo(size.width * 0.4420000, size.height * 0.5710000, size.width * 0.4403333,
          size.height * 0.5683333, size.width * 0.4350000, size.height * 0.5683333)
      ..lineTo(size.width * 0.3370000, size.height * 0.5683333)
      ..cubicTo(size.width * 0.3340000, size.height * 0.5683333, size.width * 0.3313333,
          size.height * 0.5700000, size.width * 0.3293333, size.height * 0.5733333)
      ..lineTo(size.width * 0.2936667, size.height * 0.6690000)
      ..cubicTo(size.width * 0.2700000, size.height * 0.6630000, size.width * 0.2503333,
          size.height * 0.6500000, size.width * 0.2346667, size.height * 0.6303333)
      ..cubicTo(size.width * 0.2190000, size.height * 0.6106667, size.width * 0.2113333,
          size.height * 0.5883333, size.width * 0.2113333, size.height * 0.5633333)
      ..cubicTo(size.width * 0.2113333, size.height * 0.5356667, size.width * 0.2206667,
          size.height * 0.5116667, size.width * 0.2396667, size.height * 0.4910000)
      ..cubicTo(size.width * 0.2586667, size.height * 0.4706667, size.width * 0.2820000,
          size.height * 0.4586667, size.width * 0.3096667, size.height * 0.4553333)
      ..lineTo(size.width * 0.3273333, size.height * 0.4530000)
      ..cubicTo(size.width * 0.3316667, size.height * 0.4530000, size.width * 0.3340000,
          size.height * 0.4510000, size.width * 0.3340000, size.height * 0.4470000)
      ..lineTo(size.width * 0.3363333, size.height * 0.4300000)
      ..cubicTo(size.width * 0.3400000, size.height * 0.3940000, size.width * 0.3550000,
          size.height * 0.3636667, size.width * 0.3820000, size.height * 0.3393333)
      ..cubicTo(size.width * 0.4090000, size.height * 0.3150000, size.width * 0.4406667,
          size.height * 0.3026667, size.width * 0.4770000, size.height * 0.3026667)
      ..cubicTo(size.width * 0.5133333, size.height * 0.3026667, size.width * 0.5450000,
          size.height * 0.3150000, size.width * 0.5720000, size.height * 0.3393333)
      ..cubicTo(size.width * 0.5993333, size.height * 0.3636667, size.width * 0.6146667,
          size.height * 0.3940000, size.width * 0.6186667, size.height * 0.4300000)
      ..lineTo(size.width * 0.6210000, size.height * 0.4493333)
      ..cubicTo(size.width * 0.6210000, size.height * 0.4530000, size.width * 0.6230000,
          size.height * 0.4550000, size.width * 0.6270000, size.height * 0.4550000)
      ..lineTo(size.width * 0.6803333, size.height * 0.4550000)
      ..cubicTo(size.width * 0.7106667, size.height * 0.4550000, size.width * 0.7363333,
          size.height * 0.4656667, size.width * 0.7576667, size.height * 0.4866667)
      ..cubicTo(size.width * 0.7790000, size.height * 0.5076667, size.width * 0.7900000,
          size.height * 0.5333333, size.width * 0.7900000, size.height * 0.5626667)
      ..cubicTo(size.width * 0.7900000, size.height * 0.5910000, size.width * 0.7800000,
          size.height * 0.6156667, size.width * 0.7603333, size.height * 0.6363333)
      ..cubicTo(size.width * 0.7406667, size.height * 0.6570000, size.width * 0.7160000,
          size.height * 0.6686667, size.width * 0.6870000, size.height * 0.6710000)
      ..cubicTo(size.width * 0.6826667, size.height * 0.6710000, size.width * 0.6803333,
          size.height * 0.6730000, size.width * 0.6803333, size.height * 0.6770000)
      ..lineTo(size.width * 0.6803333, size.height * 0.7226667)
      ..cubicTo(size.width * 0.6803333, size.height * 0.7263333, size.width * 0.6826667,
          size.height * 0.7283333, size.width * 0.6870000, size.height * 0.7283333)
      ..cubicTo(size.width * 0.7313333, size.height * 0.7270000, size.width * 0.7690000,
          size.height * 0.7100000, size.width * 0.8000000, size.height * 0.6780000)
      ..cubicTo(size.width * 0.8310000, size.height * 0.6460000, size.width * 0.8463333,
          size.height * 0.6076667, size.width * 0.8463333, size.height * 0.5630000)
      ..cubicTo(size.width * 0.8463333, size.height * 0.5330000, size.width * 0.8390000,
          size.height * 0.5053333, size.width * 0.8240000, size.height * 0.4800000)
      ..cubicTo(size.width * 0.8093333, size.height * 0.4546667, size.width * 0.7890000,
          size.height * 0.4346667, size.width * 0.7636667, size.height * 0.4200000)
      ..cubicTo(size.width * 0.7380000, size.height * 0.4053333, size.width * 0.7103333,
          size.height * 0.3980000, size.width * 0.6803333, size.height * 0.3980000)
      ..lineTo(size.width * 0.6700000, size.height * 0.3980000)
      ..cubicTo(size.width * 0.6590000, size.height * 0.3536667, size.width * 0.6353333,
          size.height * 0.3173333, size.width * 0.5996667, size.height * 0.2893333)
      ..cubicTo(size.width * 0.5640000, size.height * 0.2613333, size.width * 0.5230000,
          size.height * 0.2470000, size.width * 0.4770000, size.height * 0.2470000)
      ..cubicTo(size.width * 0.4300000, size.height * 0.2470000, size.width * 0.3880000,
          size.height * 0.2616667, size.width * 0.3516667, size.height * 0.2906667)
      ..cubicTo(size.width * 0.3153333, size.height * 0.3196667, size.width * 0.2920000,
          size.height * 0.3570000, size.width * 0.2816667, size.height * 0.4026667)
      ..cubicTo(size.width * 0.2446667, size.height * 0.4113333, size.width * 0.2143333,
          size.height * 0.4303333, size.width * 0.1903333, size.height * 0.4603333)
      ..cubicTo(size.width * 0.1663333, size.height * 0.4903333, size.width * 0.1543333,
          size.height * 0.5253333, size.width * 0.1543333, size.height * 0.5636667)
      ..close()
      ..moveTo(size.width * 0.4256667, size.height * 0.8873333)
      ..cubicTo(size.width * 0.4256667, size.height * 0.9003333, size.width * 0.4320000,
          size.height * 0.9090000, size.width * 0.4450000, size.height * 0.9130000)
      ..cubicTo(size.width * 0.4453333, size.height * 0.9130000, size.width * 0.4466667,
          size.height * 0.9130000, size.width * 0.4486667, size.height * 0.9133333)
      ..cubicTo(size.width * 0.4506667, size.height * 0.9136667, size.width * 0.4523333,
          size.height * 0.9136667, size.width * 0.4533333, size.height * 0.9136667)
      ..cubicTo(size.width * 0.4590000, size.height * 0.9136667, size.width * 0.4643333,
          size.height * 0.9120000, size.width * 0.4696667, size.height * 0.9086667)
      ..cubicTo(size.width * 0.4750000, size.height * 0.9053333, size.width * 0.4786667,
          size.height * 0.9000000, size.width * 0.4803333, size.height * 0.8926667)
      ..lineTo(size.width * 0.5553333, size.height * 0.6030000)
      ..cubicTo(size.width * 0.5573333, size.height * 0.5950000, size.width * 0.5566667,
          size.height * 0.5880000, size.width * 0.5530000, size.height * 0.5813333)
      ..cubicTo(size.width * 0.5493333, size.height * 0.5750000, size.width * 0.5440000,
          size.height * 0.5706667, size.width * 0.5363333, size.height * 0.5683333)
      ..cubicTo(size.width * 0.5306667, size.height * 0.5676667, size.width * 0.5276667,
          size.height * 0.5673333, size.width * 0.5276667, size.height * 0.5673333)
      ..cubicTo(size.width * 0.5223333, size.height * 0.5673333, size.width * 0.5170000,
          size.height * 0.5690000, size.width * 0.5120000, size.height * 0.5723333)
      ..cubicTo(size.width * 0.5070000, size.height * 0.5756667, size.width * 0.5033333,
          size.height * 0.5806667, size.width * 0.5016667, size.height * 0.5873333)
      ..lineTo(size.width * 0.4263333, size.height * 0.8780000)
      ..cubicTo(size.width * 0.4260000, size.height * 0.8813333, size.width * 0.4256667,
          size.height * 0.8843333, size.width * 0.4256667, size.height * 0.8873333)
      ..close()
      ..moveTo(size.width * 0.5643333, size.height * 0.7853333)
      ..cubicTo(size.width * 0.5643333, size.height * 0.7896667, size.width * 0.5653333,
          size.height * 0.7940000, size.width * 0.5676667, size.height * 0.7980000)
      ..cubicTo(size.width * 0.5723333, size.height * 0.8053333, size.width * 0.5780000,
          size.height * 0.8103333, size.width * 0.5846667, size.height * 0.8126667)
      ..cubicTo(size.width * 0.5883333, size.height * 0.8136667, size.width * 0.5916667,
          size.height * 0.8143333, size.width * 0.5946667, size.height * 0.8143333)
      ..cubicTo(size.width * 0.5976667, size.height * 0.8143333, size.width * 0.6013333,
          size.height * 0.8136667, size.width * 0.6053333, size.height * 0.8116667)
      ..cubicTo(size.width * 0.6123333, size.height * 0.8086667, size.width * 0.6170000,
          size.height * 0.8023333, size.width * 0.6193333, size.height * 0.7926667)
      ..lineTo(size.width * 0.6673333, size.height * 0.6036667)
      ..cubicTo(size.width * 0.6683333, size.height * 0.5990000, size.width * 0.6690000,
          size.height * 0.5960000, size.width * 0.6690000, size.height * 0.5946667)
      ..cubicTo(size.width * 0.6690000, size.height * 0.5896667, size.width * 0.6673333,
          size.height * 0.5846667, size.width * 0.6636667, size.height * 0.5796667)
      ..cubicTo(size.width * 0.6600000, size.height * 0.5746667, size.width * 0.6550000,
          size.height * 0.5710000, size.width * 0.6483333, size.height * 0.5690000)
      ..cubicTo(size.width * 0.6426667, size.height * 0.5683333, size.width * 0.6396667,
          size.height * 0.5680000, size.width * 0.6396667, size.height * 0.5680000)
      ..cubicTo(size.width * 0.6340000, size.height * 0.5680000, size.width * 0.6286667,
          size.height * 0.5696667, size.width * 0.6240000, size.height * 0.5730000)
      ..cubicTo(size.width * 0.6193333, size.height * 0.5763333, size.width * 0.6160000,
          size.height * 0.5813333, size.width * 0.6140000, size.height * 0.5880000)
      ..lineTo(size.width * 0.5653333, size.height * 0.7780000)
      ..cubicTo(size.width * 0.5653333, size.height * 0.7786667, size.width * 0.5653333,
          size.height * 0.7796667, size.width * 0.5650000, size.height * 0.7816667)
      ..cubicTo(size.width * 0.5643333, size.height * 0.7833333, size.width * 0.5643333,
          size.height * 0.7843333, size.width * 0.5643333, size.height * 0.7853333)
      ..close();
  }

  Path _tornadoPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1376667, size.height * 0.5063333)
      ..cubicTo(size.width * 0.1376667, size.height * 0.5293333, size.width * 0.1496667,
          size.height * 0.5490000, size.width * 0.1736667, size.height * 0.5653333)
      ..cubicTo(size.width * 0.2176667, size.height * 0.5963333, size.width * 0.2840000,
          size.height * 0.6116667, size.width * 0.3730000, size.height * 0.6116667)
      ..cubicTo(size.width * 0.4130000, size.height * 0.6116667, size.width * 0.4500000,
          size.height * 0.6083333, size.width * 0.4843333, size.height * 0.6013333)
      ..cubicTo(size.width * 0.5203333, size.height * 0.5936667, size.width * 0.5500000,
          size.height * 0.5813333, size.width * 0.5726667, size.height * 0.5646667)
      ..cubicTo(size.width * 0.5953333, size.height * 0.5480000, size.width * 0.6070000,
          size.height * 0.5286667, size.width * 0.6070000, size.height * 0.5060000)
      ..cubicTo(size.width * 0.6070000, size.height * 0.4990000, size.width * 0.6056667,
          size.height * 0.4923333, size.width * 0.6030000, size.height * 0.4853333)
      ..cubicTo(size.width * 0.6493333, size.height * 0.4740000, size.width * 0.6856667,
          size.height * 0.4586667, size.width * 0.7120000, size.height * 0.4393333)
      ..cubicTo(size.width * 0.7383333, size.height * 0.4200000, size.width * 0.7516667,
          size.height * 0.3976667, size.width * 0.7516667, size.height * 0.3726667)
      ..cubicTo(size.width * 0.7516667, size.height * 0.3663333, size.width * 0.7506667,
          size.height * 0.3596667, size.width * 0.7486667, size.height * 0.3526667)
      ..cubicTo(size.width * 0.8250000, size.height * 0.3256667, size.width * 0.8630000,
          size.height * 0.2893333, size.width * 0.8630000, size.height * 0.2433333)
      ..cubicTo(size.width * 0.8630000, size.height * 0.2140000, size.width * 0.8463333,
          size.height * 0.1880000, size.width * 0.8133333, size.height * 0.1653333)
      ..cubicTo(size.width * 0.7483333, size.height * 0.1220000, size.width * 0.6530000,
          size.height * 0.1003333, size.width * 0.5273333, size.height * 0.1003333)
      ..cubicTo(size.width * 0.4680000, size.height * 0.1003333, size.width * 0.4143333,
          size.height * 0.1056667, size.width * 0.3663333, size.height * 0.1160000)
      ..cubicTo(size.width * 0.3140000, size.height * 0.1266667, size.width * 0.2720000,
          size.height * 0.1433333, size.width * 0.2400000, size.height * 0.1660000)
      ..cubicTo(size.width * 0.2080000, size.height * 0.1886667, size.width * 0.1920000,
          size.height * 0.2146667, size.width * 0.1920000, size.height * 0.2436667)
      ..cubicTo(size.width * 0.1920000, size.height * 0.2610000, size.width * 0.1973333,
          size.height * 0.2766667, size.width * 0.2080000, size.height * 0.2910000)
      ..cubicTo(size.width * 0.1686667, size.height * 0.3133333, size.width * 0.1490000,
          size.height * 0.3406667, size.width * 0.1490000, size.height * 0.3730000)
      ..cubicTo(size.width * 0.1490000, size.height * 0.3980000, size.width * 0.1613333,
          size.height * 0.4200000, size.width * 0.1856667, size.height * 0.4390000)
      ..cubicTo(size.width * 0.1536667, size.height * 0.4576667, size.width * 0.1376667,
          size.height * 0.4800000, size.width * 0.1376667, size.height * 0.5063333)
      ..close()
      ..moveTo(size.width * 0.1576667, size.height * 0.6563333)
      ..cubicTo(size.width * 0.1576667, size.height * 0.6806667, size.width * 0.1726667,
          size.height * 0.7000000, size.width * 0.2026667, size.height * 0.7136667)
      ..cubicTo(size.width * 0.2326667, size.height * 0.7273333, size.width * 0.2706667,
          size.height * 0.7343333, size.width * 0.3163333, size.height * 0.7343333)
      ..cubicTo(size.width * 0.3626667, size.height * 0.7343333, size.width * 0.4006667,
          size.height * 0.7273333, size.width * 0.4310000, size.height * 0.7136667)
      ..cubicTo(size.width * 0.4613333, size.height * 0.7000000, size.width * 0.4763333,
          size.height * 0.6806667, size.width * 0.4763333, size.height * 0.6563333)
      ..cubicTo(size.width * 0.4763333, size.height * 0.6473333, size.width * 0.4733333,
          size.height * 0.6396667, size.width * 0.4676667, size.height * 0.6333333)
      ..cubicTo(size.width * 0.4620000, size.height * 0.6270000, size.width * 0.4543333,
          size.height * 0.6240000, size.width * 0.4453333, size.height * 0.6240000)
      ..cubicTo(size.width * 0.4380000, size.height * 0.6240000, size.width * 0.4313333,
          size.height * 0.6266667, size.width * 0.4253333, size.height * 0.6316667)
      ..cubicTo(size.width * 0.4193333, size.height * 0.6366667, size.width * 0.4156667,
          size.height * 0.6433333, size.width * 0.4140000, size.height * 0.6506667)
      ..cubicTo(size.width * 0.4073333, size.height * 0.6560000, size.width * 0.3953333,
          size.height * 0.6606667, size.width * 0.3773333, size.height * 0.6650000)
      ..cubicTo(size.width * 0.3593333, size.height * 0.6693333, size.width * 0.3390000,
          size.height * 0.6716667, size.width * 0.3163333, size.height * 0.6716667)
      ..cubicTo(size.width * 0.2796667, size.height * 0.6716667, size.width * 0.2496667,
          size.height * 0.6663333, size.width * 0.2270000, size.height * 0.6560000)
      ..cubicTo(size.width * 0.2323333, size.height * 0.6506667, size.width * 0.2350000,
          size.height * 0.6440000, size.width * 0.2356667, size.height * 0.6360000)
      ..cubicTo(size.width * 0.2363333, size.height * 0.6280000, size.width * 0.2343333,
          size.height * 0.6210000, size.width * 0.2306667, size.height * 0.6153333)
      ..cubicTo(size.width * 0.2253333, size.height * 0.6083333, size.width * 0.2186667,
          size.height * 0.6036667, size.width * 0.2103333, size.height * 0.6020000)
      ..cubicTo(size.width * 0.2020000, size.height * 0.6003333, size.width * 0.1943333,
          size.height * 0.6020000, size.width * 0.1870000, size.height * 0.6063333)
      ..cubicTo(size.width * 0.1673333, size.height * 0.6200000, size.width * 0.1576667,
          size.height * 0.6363333, size.width * 0.1576667, size.height * 0.6563333)
      ..close()
      ..moveTo(size.width * 0.2003333, size.height * 0.5063333)
      ..cubicTo(size.width * 0.2003333, size.height * 0.5060000, size.width * 0.2023333,
          size.height * 0.5040000, size.width * 0.2066667, size.height * 0.5003333)
      ..cubicTo(size.width * 0.2096667, size.height * 0.4973333, size.width * 0.2160000,
          size.height * 0.4936667, size.width * 0.2253333, size.height * 0.4890000)
      ..cubicTo(size.width * 0.2346667, size.height * 0.4843333, size.width * 0.2456667,
          size.height * 0.4806667, size.width * 0.2573333, size.height * 0.4773333)
      ..lineTo(size.width * 0.2613333, size.height * 0.4753333)
      ..cubicTo(size.width * 0.3153333, size.height * 0.4933333, size.width * 0.3783333,
          size.height * 0.5023333, size.width * 0.4503333, size.height * 0.5023333)
      ..cubicTo(size.width * 0.4820000, size.height * 0.5023333, size.width * 0.5106667,
          size.height * 0.5006667, size.width * 0.5363333, size.height * 0.4970000)
      ..lineTo(size.width * 0.5450000, size.height * 0.5046667)
      ..cubicTo(size.width * 0.5420000, size.height * 0.5100000, size.width * 0.5350000,
          size.height * 0.5153333, size.width * 0.5240000, size.height * 0.5213333)
      ..cubicTo(size.width * 0.5106667, size.height * 0.5283333, size.width * 0.4900000,
          size.height * 0.5350000, size.width * 0.4620000, size.height * 0.5403333)
      ..cubicTo(size.width * 0.4340000, size.height * 0.5456667, size.width * 0.4043333,
          size.height * 0.5486667, size.width * 0.3730000, size.height * 0.5486667)
      ..cubicTo(size.width * 0.3416667, size.height * 0.5486667, size.width * 0.3120000,
          size.height * 0.5460000, size.width * 0.2840000, size.height * 0.5403333)
      ..cubicTo(size.width * 0.2560000, size.height * 0.5346667, size.width * 0.2350000,
          size.height * 0.5283333, size.width * 0.2213333, size.height * 0.5213333)
      ..cubicTo(size.width * 0.2100000, size.height * 0.5166667, size.width * 0.2030000,
          size.height * 0.5116667, size.width * 0.2003333, size.height * 0.5063333)
      ..close()
      ..moveTo(size.width * 0.2040000, size.height * 0.7870000)
      ..cubicTo(size.width * 0.2040000, size.height * 0.8080000, size.width * 0.2160000,
          size.height * 0.8243333, size.width * 0.2400000, size.height * 0.8356667)
      ..cubicTo(size.width * 0.2640000, size.height * 0.8470000, size.width * 0.2936667,
          size.height * 0.8526667, size.width * 0.3290000, size.height * 0.8526667)
      ..cubicTo(size.width * 0.3650000, size.height * 0.8526667, size.width * 0.3953333,
          size.height * 0.8470000, size.width * 0.4196667, size.height * 0.8356667)
      ..cubicTo(size.width * 0.4440000, size.height * 0.8243333, size.width * 0.4563333,
          size.height * 0.8080000, size.width * 0.4563333, size.height * 0.7870000)
      ..cubicTo(size.width * 0.4563333, size.height * 0.7786667, size.width * 0.4533333,
          size.height * 0.7710000, size.width * 0.4470000, size.height * 0.7646667)
      ..cubicTo(size.width * 0.4406667, size.height * 0.7583333, size.width * 0.4333333,
          size.height * 0.7550000, size.width * 0.4250000, size.height * 0.7550000)
      ..cubicTo(size.width * 0.4093333, size.height * 0.7550000, size.width * 0.3990000,
          size.height * 0.7630000, size.width * 0.3943333, size.height * 0.7790000)
      ..cubicTo(size.width * 0.3813333, size.height * 0.7870000, size.width * 0.3596667,
          size.height * 0.7913333, size.width * 0.3290000, size.height * 0.7913333)
      ..cubicTo(size.width * 0.3023333, size.height * 0.7913333, size.width * 0.2810000,
          size.height * 0.7873333, size.width * 0.2650000, size.height * 0.7790000)
      ..cubicTo(size.width * 0.2600000, size.height * 0.7630000, size.width * 0.2500000,
          size.height * 0.7550000, size.width * 0.2343333, size.height * 0.7550000)
      ..cubicTo(size.width * 0.2260000, size.height * 0.7550000, size.width * 0.2186667,
          size.height * 0.7580000, size.width * 0.2130000, size.height * 0.7643333)
      ..cubicTo(size.width * 0.2073333, size.height * 0.7706667, size.width * 0.2040000,
          size.height * 0.7780000, size.width * 0.2040000, size.height * 0.7870000)
      ..close()
      ..moveTo(size.width * 0.2110000, size.height * 0.3730000)
      ..cubicTo(size.width * 0.2110000, size.height * 0.3703333, size.width * 0.2126667,
          size.height * 0.3673333, size.width * 0.2160000, size.height * 0.3636667)
      ..cubicTo(size.width * 0.2240000, size.height * 0.3536667, size.width * 0.2400000,
          size.height * 0.3436667, size.width * 0.2633333, size.height * 0.3343333)
      ..cubicTo(size.width * 0.3273333, size.height * 0.3686667, size.width * 0.4153333,
          size.height * 0.3856667, size.width * 0.5270000, size.height * 0.3856667)
      ..cubicTo(size.width * 0.5840000, size.height * 0.3856667, size.width * 0.6376667,
          size.height * 0.3803333, size.width * 0.6876667, size.height * 0.3700000)
      ..lineTo(size.width * 0.6876667, size.height * 0.3730000)
      ..cubicTo(size.width * 0.6876667, size.height * 0.3780000, size.width * 0.6846667,
          size.height * 0.3830000, size.width * 0.6783333, size.height * 0.3880000)
      ..cubicTo(size.width * 0.6646667, size.height * 0.4000000, size.width * 0.6393333,
          size.height * 0.4113333, size.width * 0.6020000, size.height * 0.4223333)
      ..cubicTo(size.width * 0.5616667, size.height * 0.4343333, size.width * 0.5110000,
          size.height * 0.4403333, size.width * 0.4500000, size.height * 0.4403333)
      ..cubicTo(size.width * 0.3886667, size.height * 0.4403333, size.width * 0.3380000,
          size.height * 0.4343333, size.width * 0.2976667, size.height * 0.4223333)
      ..cubicTo(size.width * 0.2590000, size.height * 0.4116667, size.width * 0.2333333,
          size.height * 0.4003333, size.width * 0.2203333, size.height * 0.3883333)
      ..cubicTo(size.width * 0.2140000, size.height * 0.3833333, size.width * 0.2110000,
          size.height * 0.3783333, size.width * 0.2110000, size.height * 0.3730000)
      ..close()
      ..moveTo(size.width * 0.2543333, size.height * 0.2436667)
      ..cubicTo(size.width * 0.2543333, size.height * 0.2376667, size.width * 0.2583333,
          size.height * 0.2313333, size.width * 0.2660000, size.height * 0.2240000)
      ..cubicTo(size.width * 0.2810000, size.height * 0.2100000, size.width * 0.3110000,
          size.height * 0.1966667, size.width * 0.3553333, size.height * 0.1836667)
      ..cubicTo(size.width * 0.4030000, size.height * 0.1696667, size.width * 0.4600000,
          size.height * 0.1626667, size.width * 0.5266667, size.height * 0.1626667)
      ..cubicTo(size.width * 0.5936667, size.height * 0.1626667, size.width * 0.6513333,
          size.height * 0.1696667, size.width * 0.6996667, size.height * 0.1836667)
      ..cubicTo(size.width * 0.7446667, size.height * 0.1966667, size.width * 0.7743333,
          size.height * 0.2103333, size.width * 0.7890000, size.height * 0.2243333)
      ..cubicTo(size.width * 0.7963333, size.height * 0.2316667, size.width * 0.8003333,
          size.height * 0.2383333, size.width * 0.8003333, size.height * 0.2440000)
      ..cubicTo(size.width * 0.8003333, size.height * 0.2496667, size.width * 0.7966667,
          size.height * 0.2556667, size.width * 0.7890000, size.height * 0.2626667)
      ..cubicTo(size.width * 0.7743333, size.height * 0.2766667, size.width * 0.7446667,
          size.height * 0.2903333, size.width * 0.6996667, size.height * 0.3036667)
      ..cubicTo(size.width * 0.6513333, size.height * 0.3176667, size.width * 0.5940000,
          size.height * 0.3246667, size.width * 0.5266667, size.height * 0.3246667)
      ..cubicTo(size.width * 0.4600000, size.height * 0.3246667, size.width * 0.4026667,
          size.height * 0.3176667, size.width * 0.3553333, size.height * 0.3036667)
      ..cubicTo(size.width * 0.3106667, size.height * 0.2903333, size.width * 0.2806667,
          size.height * 0.2766667, size.width * 0.2660000, size.height * 0.2623333)
      ..cubicTo(size.width * 0.2583333, size.height * 0.2553333, size.width * 0.2543333,
          size.height * 0.2493333, size.width * 0.2543333, size.height * 0.2436667)
      ..close();
  }

  Path _windDegPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1246667, size.height * 0.4833333)
      ..cubicTo(size.width * 0.1246667, size.height * 0.4153333, size.width * 0.1416667,
          size.height * 0.3523333, size.width * 0.1753333, size.height * 0.2946667)
      ..cubicTo(size.width * 0.2090000, size.height * 0.2370000, size.width * 0.2546667,
          size.height * 0.1913333, size.width * 0.3123333, size.height * 0.1576667)
      ..cubicTo(size.width * 0.3700000, size.height * 0.1240000, size.width * 0.4326667,
          size.height * 0.1073333, size.width * 0.5003333, size.height * 0.1073333)
      ..cubicTo(size.width * 0.5510000, size.height * 0.1073333, size.width * 0.5996667,
          size.height * 0.1173333, size.width * 0.6460000, size.height * 0.1370000)
      ..cubicTo(size.width * 0.6923333, size.height * 0.1566667, size.width * 0.7320000,
          size.height * 0.1836667, size.width * 0.7656667, size.height * 0.2170000)
      ..cubicTo(size.width * 0.7993333, size.height * 0.2503333, size.width * 0.8260000,
          size.height * 0.2903333, size.width * 0.8456667, size.height * 0.3370000)
      ..cubicTo(size.width * 0.8653333, size.height * 0.3836667, size.width * 0.8753333,
          size.height * 0.4320000, size.width * 0.8753333, size.height * 0.4833333)
      ..cubicTo(size.width * 0.8753333, size.height * 0.5340000, size.width * 0.8653333,
          size.height * 0.5826667, size.width * 0.8456667, size.height * 0.6290000)
      ..cubicTo(size.width * 0.8260000, size.height * 0.6753333, size.width * 0.7990000,
          size.height * 0.7153333, size.width * 0.7656667, size.height * 0.7486667)
      ..cubicTo(size.width * 0.7323333, size.height * 0.7820000, size.width * 0.6923333,
          size.height * 0.8086667, size.width * 0.6460000, size.height * 0.8283333)
      ..cubicTo(size.width * 0.5996667, size.height * 0.8480000, size.width * 0.5513333,
          size.height * 0.8580000, size.width * 0.5003333, size.height * 0.8580000)
      ..cubicTo(size.width * 0.4493333, size.height * 0.8580000, size.width * 0.4003333,
          size.height * 0.8480000, size.width * 0.3540000, size.height * 0.8283333)
      ..cubicTo(size.width * 0.3076667, size.height * 0.8086667, size.width * 0.2676667,
          size.height * 0.7816667, size.width * 0.2340000, size.height * 0.7483333)
      ..cubicTo(size.width * 0.2003333, size.height * 0.7150000, size.width * 0.1740000,
          size.height * 0.6750000, size.width * 0.1540000, size.height * 0.6290000)
      ..cubicTo(size.width * 0.1340000, size.height * 0.5830000, size.width * 0.1246667,
          size.height * 0.5343333, size.width * 0.1246667, size.height * 0.4833333)
      ..close()
      ..moveTo(size.width * 0.2073333, size.height * 0.4833333)
      ..cubicTo(size.width * 0.2073333, size.height * 0.5623333, size.width * 0.2360000,
          size.height * 0.6310000, size.width * 0.2936667, size.height * 0.6893333)
      ..cubicTo(size.width * 0.3513333, size.height * 0.7470000, size.width * 0.4200000,
          size.height * 0.7756667, size.width * 0.5003333, size.height * 0.7756667)
      ..cubicTo(size.width * 0.5530000, size.height * 0.7756667, size.width * 0.6020000,
          size.height * 0.7626667, size.width * 0.6466667, size.height * 0.7363333)
      ..cubicTo(size.width * 0.6913333, size.height * 0.7100000, size.width * 0.7273333,
          size.height * 0.6746667, size.width * 0.7536667, size.height * 0.6296667)
      ..cubicTo(size.width * 0.7800000, size.height * 0.5846667, size.width * 0.7933333,
          size.height * 0.5360000, size.width * 0.7933333, size.height * 0.4833333)
      ..cubicTo(size.width * 0.7933333, size.height * 0.4306667, size.width * 0.7800000,
          size.height * 0.3816667, size.width * 0.7536667, size.height * 0.3366667)
      ..cubicTo(size.width * 0.7273333, size.height * 0.2916667, size.width * 0.6916667,
          size.height * 0.2560000, size.width * 0.6466667, size.height * 0.2296667)
      ..cubicTo(size.width * 0.6016667, size.height * 0.2033333, size.width * 0.5530000,
          size.height * 0.1903333, size.width * 0.5003333, size.height * 0.1903333)
      ..cubicTo(size.width * 0.4476667, size.height * 0.1903333, size.width * 0.3986667,
          size.height * 0.2033333, size.width * 0.3540000, size.height * 0.2296667)
      ..cubicTo(size.width * 0.3093333, size.height * 0.2560000, size.width * 0.2733333,
          size.height * 0.2916667, size.width * 0.2466667, size.height * 0.3366667)
      ..cubicTo(size.width * 0.2200000, size.height * 0.3816667, size.width * 0.2073333,
          size.height * 0.4306667, size.width * 0.2073333, size.height * 0.4833333)
      ..close()
      ..moveTo(size.width * 0.3703333, size.height * 0.6783333)
      ..lineTo(size.width * 0.4953333, size.height * 0.2413333)
      ..cubicTo(size.width * 0.4956667, size.height * 0.2380000, size.width * 0.4973333,
          size.height * 0.2363333, size.width * 0.5003333, size.height * 0.2363333)
      ..cubicTo(size.width * 0.5033333, size.height * 0.2363333, size.width * 0.5050000,
          size.height * 0.2380000, size.width * 0.5053333, size.height * 0.2413333)
      ..lineTo(size.width * 0.6300000, size.height * 0.6783333)
      ..cubicTo(size.width * 0.6313333, size.height * 0.6820000, size.width * 0.6310000,
          size.height * 0.6846667, size.width * 0.6293333, size.height * 0.6866667)
      ..cubicTo(size.width * 0.6276667, size.height * 0.6886667, size.width * 0.6250000,
          size.height * 0.6886667, size.width * 0.6213333, size.height * 0.6866667)
      ..lineTo(size.width * 0.5056667, size.height * 0.6433333)
      ..cubicTo(size.width * 0.5023333, size.height * 0.6420000, size.width * 0.4990000,
          size.height * 0.6420000, size.width * 0.4960000, size.height * 0.6433333)
      ..lineTo(size.width * 0.3793333, size.height * 0.6866667)
      ..cubicTo(size.width * 0.3760000, size.height * 0.6886667, size.width * 0.3736667,
          size.height * 0.6886667, size.width * 0.3723333, size.height * 0.6866667)
      ..cubicTo(size.width * 0.3710000, size.height * 0.6846667, size.width * 0.3696667,
          size.height * 0.6816667, size.width * 0.3703333, size.height * 0.6783333)
      ..close();
  }

  Path _windyPath(Size size) {
    return Path()
      ..moveTo(size.width * 0.1550000, size.height * 0.5166667)
      ..cubicTo(size.width * 0.1550000, size.height * 0.5093333, size.width * 0.1576667,
          size.height * 0.5030000, size.width * 0.1626667, size.height * 0.4980000)
      ..cubicTo(size.width * 0.1680000, size.height * 0.4930000, size.width * 0.1743333,
          size.height * 0.4906667, size.width * 0.1816667, size.height * 0.4906667)
      ..lineTo(size.width * 0.5843333, size.height * 0.4906667)
      ..cubicTo(size.width * 0.5916667, size.height * 0.4906667, size.width * 0.5976667,
          size.height * 0.4930000, size.width * 0.6023333, size.height * 0.4980000)
      ..cubicTo(size.width * 0.6070000, size.height * 0.5030000, size.width * 0.6096667,
          size.height * 0.5093333, size.width * 0.6096667, size.height * 0.5170000)
      ..cubicTo(size.width * 0.6096667, size.height * 0.5243333, size.width * 0.6073333,
          size.height * 0.5303333, size.width * 0.6023333, size.height * 0.5350000)
      ..cubicTo(size.width * 0.5976667, size.height * 0.5396667, size.width * 0.5916667,
          size.height * 0.5423333, size.width * 0.5843333, size.height * 0.5423333)
      ..lineTo(size.width * 0.1816667, size.height * 0.5423333)
      ..cubicTo(size.width * 0.1743333, size.height * 0.5423333, size.width * 0.1676667,
          size.height * 0.5400000, size.width * 0.1626667, size.height * 0.5350000)
      ..cubicTo(size.width * 0.1573333, size.height * 0.5300000, size.width * 0.1550000,
          size.height * 0.5240000, size.width * 0.1550000, size.height * 0.5166667)
      ..close()
      ..moveTo(size.width * 0.2353333, size.height * 0.4200000)
      ..cubicTo(size.width * 0.2353333, size.height * 0.4126667, size.width * 0.2380000,
          size.height * 0.4066667, size.width * 0.2430000, size.height * 0.4016667)
      ..cubicTo(size.width * 0.2480000, size.height * 0.3966667, size.width * 0.2543333,
          size.height * 0.3940000, size.width * 0.2616667, size.height * 0.3940000)
      ..lineTo(size.width * 0.6646667, size.height * 0.3940000)
      ..cubicTo(size.width * 0.6716667, size.height * 0.3940000, size.width * 0.6776667,
          size.height * 0.3966667, size.width * 0.6826667, size.height * 0.4016667)
      ..cubicTo(size.width * 0.6876667, size.height * 0.4066667, size.width * 0.6900000,
          size.height * 0.4126667, size.width * 0.6900000, size.height * 0.4200000)
      ..cubicTo(size.width * 0.6900000, size.height * 0.4273333, size.width * 0.6876667,
          size.height * 0.4333333, size.width * 0.6826667, size.height * 0.4386667)
      ..cubicTo(size.width * 0.6776667, size.height * 0.4436667, size.width * 0.6716667,
          size.height * 0.4463333, size.width * 0.6646667, size.height * 0.4463333)
      ..lineTo(size.width * 0.2620000, size.height * 0.4463333)
      ..cubicTo(size.width * 0.2546667, size.height * 0.4463333, size.width * 0.2483333,
          size.height * 0.4436667, size.width * 0.2433333, size.height * 0.4386667)
      ..cubicTo(size.width * 0.2383333, size.height * 0.4336667, size.width * 0.2353333,
          size.height * 0.4273333, size.width * 0.2353333, size.height * 0.4200000)
      ..close()
      ..moveTo(size.width * 0.2893333, size.height * 0.6113333)
      ..cubicTo(size.width * 0.2893333, size.height * 0.6043333, size.width * 0.2920000,
          size.height * 0.5983333, size.width * 0.2973333, size.height * 0.5933333)
      ..cubicTo(size.width * 0.3020000, size.height * 0.5886667, size.width * 0.3080000,
          size.height * 0.5860000, size.width * 0.3153333, size.height * 0.5860000)
      ..lineTo(size.width * 0.7186667, size.height * 0.5860000)
      ..cubicTo(size.width * 0.7260000, size.height * 0.5860000, size.width * 0.7323333,
          size.height * 0.5883333, size.width * 0.7373333, size.height * 0.5933333)
      ..cubicTo(size.width * 0.7423333, size.height * 0.5980000, size.width * 0.7446667,
          size.height * 0.6040000, size.width * 0.7446667, size.height * 0.6113333)
      ..cubicTo(size.width * 0.7446667, size.height * 0.6186667, size.width * 0.7420000,
          size.height * 0.6250000, size.width * 0.7370000, size.height * 0.6300000)
      ..cubicTo(size.width * 0.7320000, size.height * 0.6350000, size.width * 0.7256667,
          size.height * 0.6376667, size.width * 0.7183333, size.height * 0.6376667)
      ..lineTo(size.width * 0.3153333, size.height * 0.6376667)
      ..cubicTo(size.width * 0.3080000, size.height * 0.6376667, size.width * 0.3020000,
          size.height * 0.6350000, size.width * 0.2966667, size.height * 0.6300000)
      ..cubicTo(size.width * 0.2913333, size.height * 0.6250000, size.width * 0.2893333,
          size.height * 0.6186667, size.width * 0.2893333, size.height * 0.6113333)
      ..close()
      ..moveTo(size.width * 0.6420000, size.height * 0.5166667)
      ..cubicTo(size.width * 0.6420000, size.height * 0.5090000, size.width * 0.6443333,
          size.height * 0.5026667, size.width * 0.6493333, size.height * 0.4976667)
      ..cubicTo(size.width * 0.6543333, size.height * 0.4926667, size.width * 0.6606667,
          size.height * 0.4903333, size.width * 0.6683333, size.height * 0.4903333)
      ..lineTo(size.width * 0.8190000, size.height * 0.4903333)
      ..cubicTo(size.width * 0.8266667, size.height * 0.4903333, size.width * 0.8330000,
          size.height * 0.4926667, size.width * 0.8380000, size.height * 0.4976667)
      ..cubicTo(size.width * 0.8430000, size.height * 0.5026667, size.width * 0.8453333,
          size.height * 0.5090000, size.width * 0.8453333, size.height * 0.5163333)
      ..cubicTo(size.width * 0.8453333, size.height * 0.5236667, size.width * 0.8430000,
          size.height * 0.5296667, size.width * 0.8380000, size.height * 0.5343333)
      ..cubicTo(size.width * 0.8330000, size.height * 0.5390000, size.width * 0.8266667,
          size.height * 0.5416667, size.width * 0.8193333, size.height * 0.5416667)
      ..lineTo(size.width * 0.6686667, size.height * 0.5416667)
      ..cubicTo(size.width * 0.6610000, size.height * 0.5416667, size.width * 0.6546667,
          size.height * 0.5393333, size.width * 0.6496667, size.height * 0.5343333)
      ..cubicTo(size.width * 0.6443333, size.height * 0.5300000, size.width * 0.6420000,
          size.height * 0.5240000, size.width * 0.6420000, size.height * 0.5166667)
      ..close();
  }
}
