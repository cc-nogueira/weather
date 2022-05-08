import 'package:flutter/material.dart';

typedef PathBuilder = Path Function(Size s);
typedef WeatherIconBuilder = CustomPaint Function(double size, Color color);

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

  static late final WeatherIcons instance = WeatherIcons._();
  static late final WeatherIcons _i = instance;

  static CustomPaint forOpenWeather({
    required int openWeatherCode,
    required double size,
    required bool? isDayTime,
    required Color color,
  }) {
    final idx = isDayTime == null ? 0 : (isDayTime ? 1 : 2);
    final builder = _openWeatherToBuilderMap[openWeatherCode]?.elementAt(idx) ?? _i.na;
    return builder(size, color);
  }

  static late final Map<int, List<WeatherIconBuilder>> _openWeatherToBuilderMap = {
    200: [_i.thunderstorm, _i.dayThunderstorm, _i.nightThunderstorm],
    201: [_i.thunderstorm, _i.dayThunderstorm, _i.nightThunderstorm],
    202: [_i.thunderstorm, _i.dayThunderstorm, _i.nightThunderstorm],
    210: [_i.lightning, _i.dayLightning, _i.nightLightning],
    211: [_i.lightning, _i.dayLightning, _i.nightLightning],
    212: [_i.lightning, _i.dayLightning, _i.nightLightning],
    221: [_i.lightning, _i.dayLightning, _i.nightLightning],
    230: [_i.thunderstorm, _i.dayThunderstorm, _i.nightThunderstorm],
    231: [_i.thunderstorm, _i.dayThunderstorm, _i.nightThunderstorm],
    232: [_i.thunderstorm, _i.dayThunderstorm, _i.nightThunderstorm],
    300: [_i.sprinkle, _i.daySprinkle, _i.nightSprinkle],
    301: [_i.sprinkle, _i.daySprinkle, _i.nightSprinkle],
    302: [_i.rain, _i.dayRain, _i.nightRain],
    310: [_i.rainMix, _i.dayRainMix, _i.nightRainMix],
    311: [_i.rain, _i.dayRain, _i.nightRain],
    312: [_i.rain, _i.dayRain, _i.nightRain],
    313: [_i.showers, _i.dayRain, _i.nightRain],
    314: [_i.rain, _i.dayRain, _i.nightRain],
    321: [_i.sprinkle, _i.daySprinkle, _i.nightSprinkle],
    500: [_i.sprinkle, _i.daySprinkle, _i.nightSprinkle],
    501: [_i.rain, _i.dayRain, _i.nightRain],
    502: [_i.rain, _i.dayRain, _i.nightRain],
    503: [_i.rain, _i.dayRain, _i.nightRain],
    504: [_i.rain, _i.dayRain, _i.nightRain],
    511: [_i.rainMix, _i.dayRainMix, _i.nightRainMix],
    520: [_i.showers, _i.dayShowers, _i.nightShowers],
    521: [_i.showers, _i.dayShowers, _i.nightShowers],
    522: [_i.showers, _i.dayShowers, _i.nightShowers],
    531: [_i.stormShowers, _i.dayStormShowers, _i.nightStormShowers],
    600: [_i.snow, _i.daySnow, _i.nightSnow],
    601: [_i.sleet, _i.daySleet, _i.nightSleet],
    602: [_i.snow, _i.daySnow, _i.nightSnow],
    611: [_i.rainMix, _i.dayRainMix, _i.nightRainMix],
    612: [_i.rainMix, _i.dayRainMix, _i.nightRainMix],
    615: [_i.rainMix, _i.dayRainMix, _i.nightRainMix],
    616: [_i.rainMix, _i.dayRainMix, _i.nightRainMix],
    620: [_i.rainMix, _i.dayRainMix, _i.nightRainMix],
    621: [_i.snow, _i.daySnow, _i.nightSnow],
    622: [_i.snow, _i.daySnow, _i.nightSnow],
    701: [_i.showers, _i.dayShowers, _i.nightShowers],
    711: [_i.smoke, _i.smoke, _i.smoke],
    721: [_i.dayHaze, _i.dayHaze, _i.dayHaze],
    731: [_i.dust, _i.dust, _i.dust],
    741: [_i.fog, _i.dayFog, _i.nightFog],
    751: [_i.cloudyGusts, _i.dayCloudyGusts, _i.nightCloudyGusts],
    761: [_i.dust, _i.dust, _i.dust],
    762: [_i.dust, _i.dust, _i.dust],
    771: [_i.cloudyGusts, _i.dayCloudyGusts, _i.nightCloudyGusts],
    781: [_i.tornado, _i.tornado, _i.tornado],
    800: [_i.daySunny, _i.daySunny, _i.nightClear],
    801: [_i.cloudyGusts, _i.dayCloudyGusts, _i.nightCloudyGusts],
    802: [_i.cloudyGusts, _i.dayCloudyGusts, _i.nightCloudyGusts],
    803: [_i.cloudyGusts, _i.dayCloudyGusts, _i.nightCloudyGusts],
    804: [_i.cloudy, _i.daySunnyOvercast, _i.nightCloudy],
    900: [_i.tornado, _i.tornado, _i.tornado],
    901: [_i.stormShowers, _i.dayStormShowers, _i.nightStormShowers],
    902: [_i.hurricane, _i.hurricane, _i.hurricane],
    903: [_i.snowflakeCold, _i.snowflakeCold, _i.snowflakeCold],
    904: [_i.hot, _i.hot, _i.hot],
    905: [_i.windy, _i.windy, _i.windy],
    906: [_i.hail, _i.dayHail, _i.nightHail],
    951: [_i.daySunny, _i.daySunny, _i.nightClear],
    952: [_i.cloudyGusts, _i.dayCloudyGusts, _i.nightCloudyGusts],
    953: [_i.cloudyGusts, _i.dayCloudyGusts, _i.nightCloudyGusts],
    954: [_i.cloudyGusts, _i.dayCloudyGusts, _i.nightCloudyGusts],
    955: [_i.cloudyGusts, _i.dayCloudyGusts, _i.nightCloudyGusts],
    956: [_i.cloudyGusts, _i.dayCloudyGusts, _i.nightCloudyGusts],
    957: [_i.strongWind, _i.strongWind, _i.strongWind],
    958: [_i.cloudyGusts, _i.dayCloudyGusts, _i.nightCloudyGusts],
    959: [_i.cloudyGusts, _i.dayCloudyGusts, _i.nightCloudyGusts],
    960: [_i.thunderstorm, _i.dayThunderstorm, _i.nightThunderstorm],
    961: [_i.thunderstorm, _i.dayThunderstorm, _i.nightThunderstorm],
    962: [_i.cloudyGusts, _i.dayCloudyGusts, _i.nightCloudyGusts],
  };

  CustomPaint cloudy(double size, Color color) => _paint(_cloudyPath, size, color);

  CustomPaint cloudyGusts(double size, Color color) => _paint(_cloudyGustsPath, size, color);

  CustomPaint dayCloudy(double size, Color color) => _paint(_dayCloudyPath, size, color);

  CustomPaint dayCloudyGusts(double size, Color color) => _paint(_dayCloudyGustsPath, size, color);

  CustomPaint dayFog(double size, Color color) => _paint(_dayFogPath, size, color);

  CustomPaint dayHail(double size, Color color) => _paint(_dayHailPath, size, color);

  CustomPaint dayHaze(double size, Color color) => _paint(_dayHazePath, size, color);

  CustomPaint dayLightning(double size, Color color) => _paint(_dayLightningPath, size, color);

  CustomPaint dayRain(double size, Color color) => _paint(_dayRainPath, size, color);

  CustomPaint dayRainMix(double size, Color color) => _paint(_dayRainMixPath, size, color);

  CustomPaint dayShowers(double size, Color color) => _paint(_dayShowersPath, size, color);

  CustomPaint daySleet(double size, Color color) => _paint(_daySleetPath, size, color);

  CustomPaint daySnow(double size, Color color) => _paint(_daySnowPath, size, color);

  CustomPaint daySprinkle(double size, Color color) => _paint(_daySprinklePath, size, color);

  CustomPaint dayStormShowers(double size, Color color) =>
      _paint(_dayStormShowersPath, size, color);

  CustomPaint daySunny(double size, Color color) => _paint(_daySunnyPath, size, color);

  CustomPaint daySunnyOvercast(double size, Color color) =>
      _paint(_daySunnyOvercastPath, size, color);

  CustomPaint dayThunderstorm(double size, Color color) =>
      _paint(_dayThunderstormPath, size, color);

  CustomPaint dust(double size, Color color) => _paint(_dustPath, size, color);

  CustomPaint fog(double size, Color color) => _paint(_fogPath, size, color);

  CustomPaint hail(double size, Color color) => _paint(_hailPath, size, color);

  CustomPaint hot(double size, Color color) => _paint(_hotPath, size, color);

  CustomPaint hurricane(double size, Color color) => _paint(_hurricanePath, size, color);

  CustomPaint lightning(double size, Color color) => _paint(_lightningPath, size, color);

  CustomPaint na(double size, Color color) => _paint(_naPath, size, color);

  CustomPaint nightCloudy(double size, Color color) => _paint(_nightCloudyPath, size, color);

  CustomPaint nightCloudyGusts(double size, Color color) =>
      _paint(_nightCloudyGustsPath, size, color);

  CustomPaint nightHail(double size, Color color) => _paint(_nightHailPath, size, color);

  CustomPaint nightLightning(double size, Color color) => _paint(_nightLightningPath, size, color);

  CustomPaint nightRain(double size, Color color) => _paint(_nightRainPath, size, color);

  CustomPaint nightRainMix(double size, Color color) => _paint(_nightRainMixPath, size, color);

  CustomPaint nightShowers(double size, Color color) => _paint(_nightShowersPath, size, color);

  CustomPaint nightSleet(double size, Color color) => _paint(_nightSleetPath, size, color);

  CustomPaint nightSnow(double size, Color color) => _paint(_nightSnowPath, size, color);

  CustomPaint nightSprinkle(double size, Color color) => _paint(_nightSprinklePath, size, color);

  CustomPaint nightStormShowers(double size, Color color) =>
      _paint(_nightStormShowersPath, size, color);

  CustomPaint nightThunderstorm(double size, Color color) =>
      _paint(_nightThunderstormPath, size, color);

  CustomPaint nightClear(double size, Color color) => _paint(_nightClearPath, size, color);

  CustomPaint nightFog(double size, Color color) => _paint(_nightFogPath, size, color);

  CustomPaint rain(double size, Color color) => _paint(_rainPath, size, color);

  CustomPaint rainMix(double size, Color color) => _paint(_rainMixPath, size, color);

  CustomPaint showers(double size, Color color) => _paint(_showersPath, size, color);

  CustomPaint sleet(double size, Color color) => _paint(_sleetPath, size, color);

  CustomPaint smoke(double size, Color color) => _paint(_smokePath, size, color);

  CustomPaint snow(double size, Color color) => _paint(_snowPath, size, color);

  CustomPaint snowflakeCold(double size, Color color) => _paint(_snowflakeColdPath, size, color);

  CustomPaint sprinkle(double size, Color color) => _paint(_sprinklePath, size, color);

  CustomPaint stormShowers(double size, Color color) => _paint(_stormShowersPath, size, color);

  CustomPaint strongWind(double size, Color color) => _paint(_strongWindPath, size, color);

  CustomPaint thermometer(double size, Color color) => _paint(_thermometerPath, size, color);

  CustomPaint thunderstorm(double size, Color color) => _paint(_thunderstormPath, size, color);

  CustomPaint tornado(double size, Color color) => _paint(_tornadoPath, size, color);

  CustomPaint windDeg(double size, Color color) => _paint(_windDegPath, size, color);

  CustomPaint windy(double size, Color color) => _paint(_windyPath, size, color);

// ------------------------

  CustomPaint _paint(PathBuilder builder, double size, Color color) =>
      CustomPaint(size: Size(size, size), painter: PathPainter(builder: builder, color: color));

  Path _cloudyPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1296667, h * 0.5866667)
      ..cubicTo(
          w * 0.1296667, h * 0.5536667, w * 0.1400000, h * 0.5240000, w * 0.1606667, h * 0.4983333)
      ..cubicTo(
          w * 0.1813333, h * 0.4726667, w * 0.2076667, h * 0.4560000, w * 0.2400000, h * 0.4486667)
      ..cubicTo(
          w * 0.2486667, h * 0.4096667, w * 0.2683333, h * 0.3773333, w * 0.2993333, h * 0.3526667)
      ..cubicTo(
          w * 0.3303333, h * 0.3276667, w * 0.3660000, h * 0.3153333, w * 0.4066667, h * 0.3153333)
      ..cubicTo(
          w * 0.4460000, h * 0.3153333, w * 0.4813333, h * 0.3273333, w * 0.5120000, h * 0.3516667)
      ..cubicTo(
          w * 0.5430000, h * 0.3760000, w * 0.5630000, h * 0.4070000, w * 0.5720000, h * 0.4450000)
      ..lineTo(w * 0.5810000, h * 0.4450000)
      ..cubicTo(
          w * 0.6203333, h * 0.4450000, w * 0.6536667, h * 0.4586667, w * 0.6813333, h * 0.4863333)
      ..cubicTo(
          w * 0.7090000, h * 0.5140000, w * 0.7230000, h * 0.5473333, w * 0.7230000, h * 0.5863333)
      ..cubicTo(
          w * 0.7230000, h * 0.6256667, w * 0.7090000, h * 0.6590000, w * 0.6813333, h * 0.6866667)
      ..cubicTo(
          w * 0.6536667, h * 0.7143333, w * 0.6203333, h * 0.7283333, w * 0.5810000, h * 0.7283333)
      ..lineTo(w * 0.2720000, h * 0.7283333)
      ..cubicTo(
          w * 0.2526667, h * 0.7283333, w * 0.2343333, h * 0.7246667, w * 0.2170000, h * 0.7170000)
      ..cubicTo(
          w * 0.1996667, h * 0.7093333, w * 0.1840000, h * 0.7000000, w * 0.1713333, h * 0.6873333)
      ..cubicTo(
          w * 0.1586667, h * 0.6746667, w * 0.1486667, h * 0.6593333, w * 0.1410000, h * 0.6420000)
      ..cubicTo(
          w * 0.1333333, h * 0.6246667, w * 0.1296667, h * 0.6056667, w * 0.1296667, h * 0.5866667)
      ..close()
      ..moveTo(w * 0.1780000, h * 0.5866667)
      ..cubicTo(
          w * 0.1780000, h * 0.6120000, w * 0.1873333, h * 0.6340000, w * 0.2053333, h * 0.6520000)
      ..cubicTo(
          w * 0.2233333, h * 0.6700000, w * 0.2456667, h * 0.6793333, w * 0.2716667, h * 0.6793333)
      ..lineTo(w * 0.5810000, h * 0.6793333)
      ..cubicTo(
          w * 0.6066667, h * 0.6793333, w * 0.6290000, h * 0.6703333, w * 0.6473333, h * 0.6520000)
      ..cubicTo(
          w * 0.6656667, h * 0.6336667, w * 0.6750000, h * 0.6120000, w * 0.6750000, h * 0.5866667)
      ..cubicTo(
          w * 0.6750000, h * 0.5613333, w * 0.6660000, h * 0.5393333, w * 0.6473333, h * 0.5213333)
      ..cubicTo(
          w * 0.6290000, h * 0.5033333, w * 0.6070000, h * 0.4940000, w * 0.5810000, h * 0.4940000)
      ..lineTo(w * 0.5346667, h * 0.4940000)
      ..cubicTo(
          w * 0.5313333, h * 0.4940000, w * 0.5296667, h * 0.4923333, w * 0.5296667, h * 0.4890000)
      ..lineTo(w * 0.5273333, h * 0.4726667)
      ..cubicTo(
          w * 0.5240000, h * 0.4413333, w * 0.5106667, h * 0.4150000, w * 0.4876667, h * 0.3943333)
      ..cubicTo(
          w * 0.4646667, h * 0.3736667, w * 0.4373333, h * 0.3633333, w * 0.4060000, h * 0.3633333)
      ..cubicTo(
          w * 0.3746667, h * 0.3633333, w * 0.3473333, h * 0.3736667, w * 0.3240000, h * 0.3946667)
      ..cubicTo(
          w * 0.3006667, h * 0.4153333, w * 0.2876667, h * 0.4416667, w * 0.2846667, h * 0.4726667)
      ..lineTo(w * 0.2823333, h * 0.4866667)
      ..cubicTo(
          w * 0.2823333, h * 0.4900000, w * 0.2806667, h * 0.4916667, w * 0.2770000, h * 0.4916667)
      ..lineTo(w * 0.2620000, h * 0.4940000)
      ..cubicTo(
          w * 0.2380000, h * 0.4960000, w * 0.2180000, h * 0.5060000, w * 0.2016667, h * 0.5236667)
      ..cubicTo(
          w * 0.1863333, h * 0.5413333, w * 0.1780000, h * 0.5623333, w * 0.1780000, h * 0.5866667)
      ..close()
      ..moveTo(w * 0.4730000, h * 0.2960000)
      ..cubicTo(
          w * 0.4696667, h * 0.2990000, w * 0.4703333, h * 0.3013333, w * 0.4753333, h * 0.3030000)
      ..cubicTo(
          w * 0.4896667, h * 0.3093333, w * 0.5016667, h * 0.3153333, w * 0.5113333, h * 0.3213333)
      ..cubicTo(
          w * 0.5150000, h * 0.3223333, w * 0.5176667, h * 0.3220000, w * 0.5186667, h * 0.3203333)
      ..cubicTo(
          w * 0.5390000, h * 0.3013333, w * 0.5623333, h * 0.2916667, w * 0.5893333, h * 0.2916667)
      ..cubicTo(
          w * 0.6163333, h * 0.2916667, w * 0.6393333, h * 0.3006667, w * 0.6593333, h * 0.3186667)
      ..cubicTo(
          w * 0.6790000, h * 0.3366667, w * 0.6900000, h * 0.3590000, w * 0.6923333, h * 0.3853333)
      ..lineTo(w * 0.6953333, h * 0.4066667)
      ..lineTo(w * 0.7426667, h * 0.4066667)
      ..cubicTo(
          w * 0.7643333, h * 0.4066667, w * 0.7830000, h * 0.4143333, w * 0.7986667, h * 0.4300000)
      ..cubicTo(
          w * 0.8143333, h * 0.4456667, w * 0.8220000, h * 0.4640000, w * 0.8220000, h * 0.4853333)
      ..cubicTo(
          w * 0.8220000, h * 0.5053333, w * 0.8150000, h * 0.5226667, w * 0.8013333, h * 0.5376667)
      ..cubicTo(
          w * 0.7876667, h * 0.5526667, w * 0.7706667, h * 0.5610000, w * 0.7503333, h * 0.5633333)
      ..cubicTo(
          w * 0.7470000, h * 0.5633333, w * 0.7453333, h * 0.5650000, w * 0.7453333, h * 0.5686667)
      ..lineTo(w * 0.7453333, h * 0.6063333)
      ..cubicTo(
          w * 0.7453333, h * 0.6100000, w * 0.7470000, h * 0.6116667, w * 0.7503333, h * 0.6116667)
      ..cubicTo(
          w * 0.7840000, h * 0.6096667, w * 0.8123333, h * 0.5963333, w * 0.8353333, h * 0.5720000)
      ..cubicTo(
          w * 0.8583333, h * 0.5476667, w * 0.8700000, h * 0.5186667, w * 0.8700000, h * 0.4853333)
      ..cubicTo(
          w * 0.8700000, h * 0.4500000, w * 0.8576667, h * 0.4200000, w * 0.8326667, h * 0.3953333)
      ..cubicTo(
          w * 0.8076667, h * 0.3703333, w * 0.7776667, h * 0.3580000, w * 0.7426667, h * 0.3580000)
      ..lineTo(w * 0.7376667, h * 0.3580000)
      ..cubicTo(
          w * 0.7290000, h * 0.3246667, w * 0.7106667, h * 0.2973333, w * 0.6826667, h * 0.2756667)
      ..cubicTo(
          w * 0.6550000, h * 0.2540000, w * 0.6236667, h * 0.2433333, w * 0.5893333, h * 0.2433333)
      ..cubicTo(
          w * 0.5426667, h * 0.2430000, w * 0.5036667, h * 0.2606667, w * 0.4730000, h * 0.2960000)
      ..close();
  }

  Path _cloudyGustsPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1206667, h * 0.7003333)
      ..cubicTo(
          w * 0.1206667, h * 0.6920000, w * 0.1233333, h * 0.6850000, w * 0.1290000, h * 0.6793333)
      ..cubicTo(
          w * 0.1346667, h * 0.6740000, w * 0.1413333, h * 0.6713333, w * 0.1490000, h * 0.6713333)
      ..lineTo(w * 0.3296667, h * 0.6713333)
      ..cubicTo(
          w * 0.3543333, h * 0.6713333, w * 0.3753333, h * 0.6800000, w * 0.3926667, h * 0.6976667)
      ..cubicTo(
          w * 0.4100000, h * 0.7153333, w * 0.4186667, h * 0.7363333, w * 0.4186667, h * 0.7610000)
      ..cubicTo(
          w * 0.4186667, h * 0.7856667, w * 0.4100000, h * 0.8070000, w * 0.3926667, h * 0.8243333)
      ..cubicTo(
          w * 0.3753333, h * 0.8416667, w * 0.3543333, h * 0.8503333, w * 0.3296667, h * 0.8503333)
      ..cubicTo(
          w * 0.3050000, h * 0.8503333, w * 0.2836667, h * 0.8416667, w * 0.2663333, h * 0.8240000)
      ..cubicTo(
          w * 0.2610000, h * 0.8186667, w * 0.2586667, h * 0.8120000, w * 0.2586667, h * 0.8040000)
      ..cubicTo(
          w * 0.2586667, h * 0.7960000, w * 0.2613333, h * 0.7890000, w * 0.2663333, h * 0.7840000)
      ..cubicTo(
          w * 0.2713333, h * 0.7786667, w * 0.2780000, h * 0.7760000, w * 0.2863333, h * 0.7760000)
      ..cubicTo(
          w * 0.2940000, h * 0.7760000, w * 0.3006667, h * 0.7786667, w * 0.3066667, h * 0.7840000)
      ..cubicTo(
          w * 0.3133333, h * 0.7903333, w * 0.3210000, h * 0.7936667, w * 0.3296667, h * 0.7936667)
      ..cubicTo(
          w * 0.3383333, h * 0.7936667, w * 0.3460000, h * 0.7903333, w * 0.3523333, h * 0.7840000)
      ..cubicTo(
          w * 0.3586667, h * 0.7776667, w * 0.3620000, h * 0.7700000, w * 0.3620000, h * 0.7606667)
      ..cubicTo(
          w * 0.3620000, h * 0.7520000, w * 0.3586667, h * 0.7443333, w * 0.3523333, h * 0.7380000)
      ..cubicTo(
          w * 0.3460000, h * 0.7316667, w * 0.3383333, h * 0.7283333, w * 0.3296667, h * 0.7283333)
      ..lineTo(w * 0.1490000, h * 0.7283333)
      ..cubicTo(
          w * 0.1413333, h * 0.7283333, w * 0.1346667, h * 0.7256667, w * 0.1290000, h * 0.7200000)
      ..cubicTo(
          w * 0.1233333, h * 0.7143333, w * 0.1206667, h * 0.7083333, w * 0.1206667, h * 0.7003333)
      ..close()
      ..moveTo(w * 0.1206667, h * 0.5990000)
      ..cubicTo(
          w * 0.1206667, h * 0.5910000, w * 0.1233333, h * 0.5840000, w * 0.1290000, h * 0.5783333)
      ..cubicTo(
          w * 0.1346667, h * 0.5730000, w * 0.1413333, h * 0.5703333, w * 0.1490000, h * 0.5703333)
      ..lineTo(w * 0.5006667, h * 0.5703333)
      ..cubicTo(
          w * 0.5093333, h * 0.5703333, w * 0.5170000, h * 0.5670000, w * 0.5233333, h * 0.5606667)
      ..cubicTo(
          w * 0.5296667, h * 0.5543333, w * 0.5330000, h * 0.5463333, w * 0.5330000, h * 0.5376667)
      ..cubicTo(
          w * 0.5330000, h * 0.5290000, w * 0.5296667, h * 0.5210000, w * 0.5233333, h * 0.5146667)
      ..cubicTo(
          w * 0.5170000, h * 0.5083333, w * 0.5093333, h * 0.5050000, w * 0.5006667, h * 0.5050000)
      ..cubicTo(
          w * 0.4913333, h * 0.5050000, w * 0.4840000, h * 0.5080000, w * 0.4780000, h * 0.5143333)
      ..cubicTo(
          w * 0.4720000, h * 0.5193333, w * 0.4650000, h * 0.5220000, w * 0.4566667, h * 0.5220000)
      ..cubicTo(
          w * 0.4486667, h * 0.5220000, w * 0.4420000, h * 0.5193333, w * 0.4366667, h * 0.5143333)
      ..cubicTo(
          w * 0.4316667, h * 0.5093333, w * 0.4290000, h * 0.5026667, w * 0.4290000, h * 0.4943333)
      ..cubicTo(
          w * 0.4290000, h * 0.4860000, w * 0.4313333, h * 0.4793333, w * 0.4366667, h * 0.4740000)
      ..cubicTo(
          w * 0.4536667, h * 0.4570000, w * 0.4750000, h * 0.4486667, w * 0.5006667, h * 0.4486667)
      ..cubicTo(
          w * 0.5253333, h * 0.4486667, w * 0.5466667, h * 0.4573333, w * 0.5640000, h * 0.4746667)
      ..cubicTo(
          w * 0.5813333, h * 0.4920000, w * 0.5900000, h * 0.5130000, w * 0.5900000, h * 0.5373333)
      ..cubicTo(
          w * 0.5900000, h * 0.5616667, w * 0.5813333, h * 0.5830000, w * 0.5640000, h * 0.6003333)
      ..cubicTo(
          w * 0.5466667, h * 0.6176667, w * 0.5256667, h * 0.6263333, w * 0.5006667, h * 0.6263333)
      ..lineTo(w * 0.1490000, h * 0.6263333)
      ..cubicTo(
          w * 0.1410000, h * 0.6263333, w * 0.1343333, h * 0.6236667, w * 0.1290000, h * 0.6183333)
      ..cubicTo(
          w * 0.1233333, h * 0.6133333, w * 0.1206667, h * 0.6066667, w * 0.1206667, h * 0.5990000)
      ..close()
      ..moveTo(w * 0.1923333, h * 0.5203333)
      ..cubicTo(
          w * 0.1923333, h * 0.5230000, w * 0.1940000, h * 0.5243333, w * 0.1976667, h * 0.5243333)
      ..lineTo(w * 0.2456667, h * 0.5243333)
      ..cubicTo(
          w * 0.2483333, h * 0.5243333, w * 0.2506667, h * 0.5226667, w * 0.2530000, h * 0.5193333)
      ..cubicTo(
          w * 0.2603333, h * 0.5013333, w * 0.2723333, h * 0.4863333, w * 0.2880000, h * 0.4743333)
      ..cubicTo(
          w * 0.3040000, h * 0.4623333, w * 0.3216667, h * 0.4556667, w * 0.3410000, h * 0.4543333)
      ..lineTo(w * 0.3586667, h * 0.4516667)
      ..cubicTo(
          w * 0.3630000, h * 0.4516667, w * 0.3653333, h * 0.4496667, w * 0.3653333, h * 0.4460000)
      ..lineTo(w * 0.3676667, h * 0.4286667)
      ..cubicTo(
          w * 0.3713333, h * 0.3926667, w * 0.3863333, h * 0.3623333, w * 0.4133333, h * 0.3380000)
      ..cubicTo(
          w * 0.4403333, h * 0.3136667, w * 0.4720000, h * 0.3013333, w * 0.5086667, h * 0.3013333)
      ..cubicTo(
          w * 0.5456667, h * 0.3013333, w * 0.5776667, h * 0.3133333, w * 0.6046667, h * 0.3376667)
      ..cubicTo(
          w * 0.6316667, h * 0.3620000, w * 0.6470000, h * 0.3923333, w * 0.6510000, h * 0.4286667)
      ..lineTo(w * 0.6533333, h * 0.4483333)
      ..cubicTo(
          w * 0.6533333, h * 0.4520000, w * 0.6553333, h * 0.4540000, w * 0.6590000, h * 0.4540000)
      ..lineTo(w * 0.7130000, h * 0.4540000)
      ..cubicTo(
          w * 0.7433333, h * 0.4540000, w * 0.7690000, h * 0.4646667, w * 0.7906667, h * 0.4860000)
      ..cubicTo(
          w * 0.8123333, h * 0.5073333, w * 0.8230000, h * 0.5326667, w * 0.8230000, h * 0.5626667)
      ..cubicTo(
          w * 0.8230000, h * 0.5923333, w * 0.8123333, h * 0.6180000, w * 0.7906667, h * 0.6393333)
      ..cubicTo(
          w * 0.7690000, h * 0.6606667, w * 0.7433333, h * 0.6713333, w * 0.7130000, h * 0.6713333)
      ..lineTo(w * 0.4826667, h * 0.6713333)
      ..cubicTo(
          w * 0.4786667, h * 0.6713333, w * 0.4763333, h * 0.6733333, w * 0.4763333, h * 0.6770000)
      ..lineTo(w * 0.4763333, h * 0.7233333)
      ..cubicTo(
          w * 0.4763333, h * 0.7270000, w * 0.4783333, h * 0.7290000, w * 0.4826667, h * 0.7290000)
      ..lineTo(w * 0.7130000, h * 0.7290000)
      ..cubicTo(
          w * 0.7433333, h * 0.7290000, w * 0.7710000, h * 0.7216667, w * 0.7966667, h * 0.7066667)
      ..cubicTo(
          w * 0.8223333, h * 0.6920000, w * 0.8423333, h * 0.6716667, w * 0.8573333, h * 0.6463333)
      ..cubicTo(
          w * 0.8723333, h * 0.6206667, w * 0.8796667, h * 0.5930000, w * 0.8796667, h * 0.5630000)
      ..cubicTo(
          w * 0.8796667, h * 0.5326667, w * 0.8723333, h * 0.5050000, w * 0.8573333, h * 0.4796667)
      ..cubicTo(
          w * 0.8423333, h * 0.4543333, w * 0.8223333, h * 0.4340000, w * 0.7966667, h * 0.4193333)
      ..cubicTo(
          w * 0.7710000, h * 0.4046667, w * 0.7433333, h * 0.3970000, w * 0.7130000, h * 0.3970000)
      ..lineTo(w * 0.7026667, h * 0.3970000)
      ..cubicTo(
          w * 0.6923333, h * 0.3526667, w * 0.6690000, h * 0.3163333, w * 0.6326667, h * 0.2880000)
      ..cubicTo(
          w * 0.5966667, h * 0.2596667, w * 0.5550000, h * 0.2456667, w * 0.5083333, h * 0.2456667)
      ..cubicTo(
          w * 0.4613333, h * 0.2456667, w * 0.4196667, h * 0.2603333, w * 0.3833333, h * 0.2896667)
      ..cubicTo(
          w * 0.3470000, h * 0.3190000, w * 0.3240000, h * 0.3563333, w * 0.3143333, h * 0.4020000)
      ..cubicTo(
          w * 0.2856667, h * 0.4086667, w * 0.2603333, h * 0.4223333, w * 0.2383333, h * 0.4430000)
      ..cubicTo(
          w * 0.2163333, h * 0.4636667, w * 0.2010000, h * 0.4883333, w * 0.1923333, h * 0.5166667)
      ..lineTo(w * 0.1923333, h * 0.5180000)
      ..cubicTo(
          w * 0.1923333, h * 0.5186667, w * 0.1923333, h * 0.5193333, w * 0.1923333, h * 0.5203333)
      ..close();
  }

  Path _dayCloudyPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.05200000, h * 0.5633333)
      ..cubicTo(w * 0.05200000, h * 0.5933333, w * 0.05933333, h * 0.6210000, w * 0.07400000,
          h * 0.6463333)
      ..cubicTo(
          w * 0.08866667, h * 0.6716667, w * 0.1086667, h * 0.6916667, w * 0.1340000, h * 0.7063333)
      ..cubicTo(
          w * 0.1593333, h * 0.7210000, w * 0.1866667, h * 0.7283333, w * 0.2163333, h * 0.7283333)
      ..lineTo(w * 0.5773333, h * 0.7283333)
      ..cubicTo(
          w * 0.6070000, h * 0.7283333, w * 0.6346667, h * 0.7210000, w * 0.6600000, h * 0.7063333)
      ..cubicTo(
          w * 0.6853333, h * 0.6916667, w * 0.7056667, h * 0.6716667, w * 0.7203333, h * 0.6463333)
      ..cubicTo(
          w * 0.7350000, h * 0.6210000, w * 0.7426667, h * 0.5933333, w * 0.7426667, h * 0.5633333)
      ..cubicTo(
          w * 0.7426667, h * 0.5413333, w * 0.7380000, h * 0.5190000, w * 0.7286667, h * 0.4966667)
      ..cubicTo(
          w * 0.7540000, h * 0.4660000, w * 0.7666667, h * 0.4290000, w * 0.7666667, h * 0.3866667)
      ..cubicTo(
          w * 0.7666667, h * 0.3630000, w * 0.7620000, h * 0.3403333, w * 0.7530000, h * 0.3186667)
      ..cubicTo(
          w * 0.7440000, h * 0.2970000, w * 0.7313333, h * 0.2786667, w * 0.7156667, h * 0.2630000)
      ..cubicTo(
          w * 0.7000000, h * 0.2473333, w * 0.6816667, h * 0.2346667, w * 0.6600000, h * 0.2256667)
      ..cubicTo(
          w * 0.6383333, h * 0.2163333, w * 0.6156667, h * 0.2120000, w * 0.5920000, h * 0.2120000)
      ..cubicTo(
          w * 0.5426667, h * 0.2120000, w * 0.4996667, h * 0.2313333, w * 0.4626667, h * 0.2700000)
      ..cubicTo(
          w * 0.4370000, h * 0.2553333, w * 0.4070000, h * 0.2480000, w * 0.3726667, h * 0.2480000)
      ..cubicTo(
          w * 0.3256667, h * 0.2480000, w * 0.2843333, h * 0.2626667, w * 0.2483333, h * 0.2916667)
      ..cubicTo(
          w * 0.2123333, h * 0.3206667, w * 0.1890000, h * 0.3580000, w * 0.1790000, h * 0.4033333)
      ..cubicTo(
          w * 0.1416667, h * 0.4120000, w * 0.1113333, h * 0.4310000, w * 0.08766667, h * 0.4610000)
      ..cubicTo(w * 0.06400000, h * 0.4910000, w * 0.05200000, h * 0.5250000, w * 0.05200000,
          h * 0.5633333)
      ..close()
      ..moveTo(w * 0.1090000, h * 0.5633333)
      ..cubicTo(
          w * 0.1090000, h * 0.5353333, w * 0.1183333, h * 0.5113333, w * 0.1370000, h * 0.4910000)
      ..cubicTo(
          w * 0.1556667, h * 0.4706667, w * 0.1790000, h * 0.4590000, w * 0.2070000, h * 0.4556667)
      ..lineTo(w * 0.2236667, h * 0.4546667)
      ..cubicTo(
          w * 0.2276667, h * 0.4546667, w * 0.2300000, h * 0.4526667, w * 0.2300000, h * 0.4486667)
      ..lineTo(w * 0.2323333, h * 0.4306667)
      ..cubicTo(
          w * 0.2370000, h * 0.3946667, w * 0.2526667, h * 0.3643333, w * 0.2793333, h * 0.3403333)
      ..cubicTo(
          w * 0.3060000, h * 0.3160000, w * 0.3373333, h * 0.3040000, w * 0.3730000, h * 0.3040000)
      ..cubicTo(
          w * 0.4096667, h * 0.3040000, w * 0.4416667, h * 0.3163333, w * 0.4686667, h * 0.3406667)
      ..cubicTo(
          w * 0.4960000, h * 0.3650000, w * 0.5110000, h * 0.3950000, w * 0.5143333, h * 0.4310000)
      ..lineTo(w * 0.5166667, h * 0.4503333)
      ..cubicTo(
          w * 0.5173333, h * 0.4540000, w * 0.5196667, h * 0.4560000, w * 0.5236667, h * 0.4560000)
      ..lineTo(w * 0.5773333, h * 0.4560000)
      ..cubicTo(
          w * 0.6066667, h * 0.4560000, w * 0.6320000, h * 0.4666667, w * 0.6533333, h * 0.4880000)
      ..cubicTo(
          w * 0.6746667, h * 0.5093333, w * 0.6853333, h * 0.5343333, w * 0.6853333, h * 0.5636667)
      ..cubicTo(
          w * 0.6853333, h * 0.5940000, w * 0.6746667, h * 0.6196667, w * 0.6536667, h * 0.6410000)
      ..cubicTo(
          w * 0.6326667, h * 0.6623333, w * 0.6070000, h * 0.6730000, w * 0.5776667, h * 0.6730000)
      ..lineTo(w * 0.2163333, h * 0.6730000)
      ..cubicTo(
          w * 0.1870000, h * 0.6730000, w * 0.1620000, h * 0.6623333, w * 0.1406667, h * 0.6406667)
      ..cubicTo(
          w * 0.1196667, h * 0.6190000, w * 0.1090000, h * 0.5933333, w * 0.1090000, h * 0.5633333)
      ..close()
      ..moveTo(w * 0.3323333, h * 0.1543333)
      ..cubicTo(
          w * 0.3323333, h * 0.1623333, w * 0.3350000, h * 0.1693333, w * 0.3403333, h * 0.1753333)
      ..lineTo(w * 0.3623333, h * 0.1966667)
      ..cubicTo(
          w * 0.3706667, h * 0.2030000, w * 0.3776667, h * 0.2056667, w * 0.3836667, h * 0.2050000)
      ..cubicTo(
          w * 0.3906667, h * 0.2050000, w * 0.3966667, h * 0.2020000, w * 0.4020000, h * 0.1963333)
      ..cubicTo(
          w * 0.4073333, h * 0.1906667, w * 0.4100000, h * 0.1836667, w * 0.4100000, h * 0.1756667)
      ..cubicTo(
          w * 0.4100000, h * 0.1676667, w * 0.4070000, h * 0.1610000, w * 0.4013333, h * 0.1560000)
      ..lineTo(w * 0.3816667, h * 0.1340000)
      ..cubicTo(
          w * 0.3756667, h * 0.1286667, w * 0.3690000, h * 0.1260000, w * 0.3613333, h * 0.1260000)
      ..cubicTo(
          w * 0.3533333, h * 0.1260000, w * 0.3463333, h * 0.1286667, w * 0.3406667, h * 0.1343333)
      ..cubicTo(
          w * 0.3350000, h * 0.1396667, w * 0.3323333, h * 0.1463333, w * 0.3323333, h * 0.1543333)
      ..close()
      ..moveTo(w * 0.5103333, h * 0.3020000)
      ..cubicTo(
          w * 0.5333333, h * 0.2796667, w * 0.5606667, h * 0.2686667, w * 0.5920000, h * 0.2686667)
      ..cubicTo(
          w * 0.6250000, h * 0.2686667, w * 0.6530000, h * 0.2800000, w * 0.6760000, h * 0.3030000)
      ..cubicTo(
          w * 0.6990000, h * 0.3260000, w * 0.7106667, h * 0.3536667, w * 0.7106667, h * 0.3866667)
      ..cubicTo(
          w * 0.7106667, h * 0.4073333, w * 0.7050000, h * 0.4280000, w * 0.6936667, h * 0.4480000)
      ..cubicTo(
          w * 0.6613333, h * 0.4160000, w * 0.6226667, h * 0.4000000, w * 0.5773333, h * 0.4000000)
      ..lineTo(w * 0.5666667, h * 0.4000000)
      ..cubicTo(
          w * 0.5583333, h * 0.3636667, w * 0.5396667, h * 0.3310000, w * 0.5103333, h * 0.3020000)
      ..close()
      ..moveTo(w * 0.5646667, h * 0.1260000)
      ..cubicTo(
          w * 0.5646667, h * 0.1346667, w * 0.5673333, h * 0.1413333, w * 0.5723333, h * 0.1466667)
      ..cubicTo(
          w * 0.5773333, h * 0.1520000, w * 0.5840000, h * 0.1543333, w * 0.5920000, h * 0.1543333)
      ..cubicTo(
          w * 0.6006667, h * 0.1543333, w * 0.6073333, h * 0.1516667, w * 0.6126667, h * 0.1466667)
      ..cubicTo(
          w * 0.6180000, h * 0.1413333, w * 0.6203333, h * 0.1346667, w * 0.6203333, h * 0.1260000)
      ..lineTo(w * 0.6203333, h * 0.05766667)
      ..cubicTo(w * 0.6203333, h * 0.04966667, w * 0.6176667, h * 0.04333333, w * 0.6123333,
          h * 0.03800000)
      ..cubicTo(w * 0.6070000, h * 0.03266667, w * 0.6003333, h * 0.03033333, w * 0.5920000,
          h * 0.03033333)
      ..cubicTo(w * 0.5840000, h * 0.03033333, w * 0.5776667, h * 0.03300000, w * 0.5723333,
          h * 0.03800000)
      ..cubicTo(w * 0.5670000, h * 0.04300000, w * 0.5646667, h * 0.04966667, w * 0.5646667,
          h * 0.05766667)
      ..lineTo(w * 0.5646667, h * 0.1260000)
      ..close()
      ..moveTo(w * 0.7486667, h * 0.2023333)
      ..cubicTo(
          w * 0.7486667, h * 0.2110000, w * 0.7510000, h * 0.2176667, w * 0.7560000, h * 0.2230000)
      ..cubicTo(
          w * 0.7630000, h * 0.2283333, w * 0.7700000, h * 0.2310000, w * 0.7766667, h * 0.2310000)
      ..cubicTo(
          w * 0.7826667, h * 0.2310000, w * 0.7893333, h * 0.2283333, w * 0.7963333, h * 0.2230000)
      ..lineTo(w * 0.8440000, h * 0.1753333)
      ..cubicTo(
          w * 0.8493333, h * 0.1693333, w * 0.8520000, h * 0.1623333, w * 0.8520000, h * 0.1540000)
      ..cubicTo(
          w * 0.8520000, h * 0.1460000, w * 0.8493333, h * 0.1393333, w * 0.8440000, h * 0.1340000)
      ..cubicTo(
          w * 0.8386667, h * 0.1286667, w * 0.8320000, h * 0.1260000, w * 0.8243333, h * 0.1260000)
      ..cubicTo(
          w * 0.8163333, h * 0.1260000, w * 0.8100000, h * 0.1286667, w * 0.8050000, h * 0.1340000)
      ..lineTo(w * 0.7560000, h * 0.1816667)
      ..cubicTo(
          w * 0.7510000, h * 0.1880000, w * 0.7486667, h * 0.1946667, w * 0.7486667, h * 0.2023333)
      ..close()
      ..moveTo(w * 0.7750000, h * 0.5970000)
      ..cubicTo(
          w * 0.7750000, h * 0.6050000, w * 0.7776667, h * 0.6120000, w * 0.7833333, h * 0.6180000)
      ..lineTo(w * 0.8050000, h * 0.6390000)
      ..cubicTo(
          w * 0.8100000, h * 0.6443333, w * 0.8163333, h * 0.6470000, w * 0.8243333, h * 0.6470000)
      ..cubicTo(
          w * 0.8323333, h * 0.6470000, w * 0.8390000, h * 0.6443333, w * 0.8443333, h * 0.6386667)
      ..cubicTo(
          w * 0.8496667, h * 0.6330000, w * 0.8523333, h * 0.6263333, w * 0.8523333, h * 0.6180000)
      ..cubicTo(
          w * 0.8523333, h * 0.6106667, w * 0.8496667, h * 0.6040000, w * 0.8443333, h * 0.5986667)
      ..lineTo(w * 0.8226667, h * 0.5770000)
      ..cubicTo(
          w * 0.8173333, h * 0.5716667, w * 0.8110000, h * 0.5690000, w * 0.8036667, h * 0.5690000)
      ..cubicTo(
          w * 0.7956667, h * 0.5690000, w * 0.7890000, h * 0.5716667, w * 0.7836667, h * 0.5770000)
      ..cubicTo(
          w * 0.7780000, h * 0.5823333, w * 0.7750000, h * 0.5890000, w * 0.7750000, h * 0.5970000)
      ..close()
      ..moveTo(w * 0.8240000, h * 0.3866667)
      ..cubicTo(
          w * 0.8240000, h * 0.3943333, w * 0.8270000, h * 0.4006667, w * 0.8326667, h * 0.4060000)
      ..cubicTo(
          w * 0.8380000, h * 0.4113333, w * 0.8450000, h * 0.4140000, w * 0.8530000, h * 0.4140000)
      ..lineTo(w * 0.9210000, h * 0.4140000)
      ..cubicTo(
          w * 0.9286667, h * 0.4140000, w * 0.9350000, h * 0.4113333, w * 0.9403333, h * 0.4063333)
      ..cubicTo(
          w * 0.9456667, h * 0.4013333, w * 0.9480000, h * 0.3946667, w * 0.9480000, h * 0.3866667)
      ..cubicTo(
          w * 0.9480000, h * 0.3786667, w * 0.9453333, h * 0.3720000, w * 0.9403333, h * 0.3666667)
      ..cubicTo(
          w * 0.9353333, h * 0.3613333, w * 0.9286667, h * 0.3583333, w * 0.9210000, h * 0.3583333)
      ..lineTo(w * 0.8530000, h * 0.3583333)
      ..cubicTo(
          w * 0.8450000, h * 0.3583333, w * 0.8383333, h * 0.3610000, w * 0.8326667, h * 0.3666667)
      ..cubicTo(
          w * 0.8266667, h * 0.3723333, w * 0.8240000, h * 0.3790000, w * 0.8240000, h * 0.3866667)
      ..close();
  }

  Path _dayCloudyGustsPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.01166667, h * 0.7003333)
      ..cubicTo(w * 0.01166667, h * 0.7083333, w * 0.01466667, h * 0.7150000, w * 0.02066667,
          h * 0.7203333)
      ..cubicTo(w * 0.02633333, h * 0.7260000, w * 0.03300000, h * 0.7286667, w * 0.04100000,
          h * 0.7286667)
      ..lineTo(w * 0.2370000, h * 0.7286667)
      ..cubicTo(
          w * 0.2456667, h * 0.7286667, w * 0.2530000, h * 0.7316667, w * 0.2596667, h * 0.7380000)
      ..cubicTo(
          w * 0.2663333, h * 0.7443333, w * 0.2696667, h * 0.7520000, w * 0.2696667, h * 0.7606667)
      ..cubicTo(
          w * 0.2696667, h * 0.7693333, w * 0.2663333, h * 0.7773333, w * 0.2596667, h * 0.7836667)
      ..cubicTo(
          w * 0.2530000, h * 0.7900000, w * 0.2456667, h * 0.7933333, w * 0.2370000, h * 0.7933333)
      ..cubicTo(
          w * 0.2283333, h * 0.7933333, w * 0.2210000, h * 0.7900000, w * 0.2143333, h * 0.7833333)
      ..cubicTo(
          w * 0.2083333, h * 0.7780000, w * 0.2016667, h * 0.7753333, w * 0.1940000, h * 0.7753333)
      ..cubicTo(
          w * 0.1860000, h * 0.7753333, w * 0.1793333, h * 0.7780000, w * 0.1740000, h * 0.7833333)
      ..cubicTo(
          w * 0.1686667, h * 0.7886667, w * 0.1660000, h * 0.7953333, w * 0.1660000, h * 0.8033333)
      ..cubicTo(
          w * 0.1660000, h * 0.8113333, w * 0.1686667, h * 0.8180000, w * 0.1740000, h * 0.8233333)
      ..cubicTo(
          w * 0.1916667, h * 0.8410000, w * 0.2126667, h * 0.8500000, w * 0.2370000, h * 0.8500000)
      ..cubicTo(
          w * 0.2616667, h * 0.8500000, w * 0.2826667, h * 0.8413333, w * 0.2996667, h * 0.8240000)
      ..cubicTo(
          w * 0.3170000, h * 0.8066667, w * 0.3256667, h * 0.7856667, w * 0.3256667, h * 0.7610000)
      ..cubicTo(
          w * 0.3256667, h * 0.7363333, w * 0.3170000, h * 0.7153333, w * 0.2996667, h * 0.6980000)
      ..cubicTo(
          w * 0.2823333, h * 0.6803333, w * 0.2613333, h * 0.6716667, w * 0.2370000, h * 0.6716667)
      ..lineTo(w * 0.04100000, h * 0.6716667)
      ..cubicTo(w * 0.03300000, h * 0.6716667, w * 0.02633333, h * 0.6746667, w * 0.02033333,
          h * 0.6803333)
      ..cubicTo(w * 0.01433333, h * 0.6860000, w * 0.01166667, h * 0.6926667, w * 0.01166667,
          h * 0.7003333)
      ..close()
      ..moveTo(w * 0.01166667, h * 0.6000000)
      ..cubicTo(w * 0.01166667, h * 0.6073333, w * 0.01466667, h * 0.6136667, w * 0.02066667,
          h * 0.6190000)
      ..cubicTo(w * 0.02633333, h * 0.6246667, w * 0.03300000, h * 0.6273333, w * 0.04100000,
          h * 0.6273333)
      ..lineTo(w * 0.4066667, h * 0.6273333)
      ..cubicTo(
          w * 0.4313333, h * 0.6273333, w * 0.4523333, h * 0.6186667, w * 0.4696667, h * 0.6013333)
      ..cubicTo(
          w * 0.4870000, h * 0.5840000, w * 0.4956667, h * 0.5630000, w * 0.4956667, h * 0.5383333)
      ..cubicTo(
          w * 0.4956667, h * 0.5136667, w * 0.4870000, h * 0.4930000, w * 0.4696667, h * 0.4756667)
      ..cubicTo(
          w * 0.4523333, h * 0.4586667, w * 0.4313333, h * 0.4500000, w * 0.4066667, h * 0.4500000)
      ..cubicTo(
          w * 0.3813333, h * 0.4500000, w * 0.3606667, h * 0.4583333, w * 0.3440000, h * 0.4753333)
      ..cubicTo(
          w * 0.3386667, h * 0.4806667, w * 0.3363333, h * 0.4876667, w * 0.3363333, h * 0.4956667)
      ..cubicTo(
          w * 0.3363333, h * 0.5036667, w * 0.3390000, h * 0.5103333, w * 0.3440000, h * 0.5156667)
      ..cubicTo(
          w * 0.3490000, h * 0.5206667, w * 0.3556667, h * 0.5233333, w * 0.3640000, h * 0.5233333)
      ..cubicTo(
          w * 0.3720000, h * 0.5233333, w * 0.3786667, h * 0.5206667, w * 0.3846667, h * 0.5156667)
      ..cubicTo(
          w * 0.3910000, h * 0.5093333, w * 0.3983333, h * 0.5063333, w * 0.4070000, h * 0.5063333)
      ..cubicTo(
          w * 0.4156667, h * 0.5063333, w * 0.4233333, h * 0.5093333, w * 0.4296667, h * 0.5156667)
      ..cubicTo(
          w * 0.4360000, h * 0.5220000, w * 0.4393333, h * 0.5296667, w * 0.4393333, h * 0.5383333)
      ..cubicTo(
          w * 0.4393333, h * 0.5473333, w * 0.4360000, h * 0.5550000, w * 0.4296667, h * 0.5613333)
      ..cubicTo(
          w * 0.4233333, h * 0.5676667, w * 0.4156667, h * 0.5710000, w * 0.4070000, h * 0.5710000)
      ..lineTo(w * 0.04100000, h * 0.5710000)
      ..cubicTo(w * 0.03300000, h * 0.5710000, w * 0.02633333, h * 0.5740000, w * 0.02033333,
          h * 0.5796667)
      ..cubicTo(w * 0.01433333, h * 0.5856667, w * 0.01166667, h * 0.5923333, w * 0.01166667,
          h * 0.6000000)
      ..close()
      ..moveTo(w * 0.1000000, h * 0.5216667)
      ..cubicTo(
          w * 0.1000000, h * 0.5243333, w * 0.1020000, h * 0.5256667, w * 0.1056667, h * 0.5256667)
      ..lineTo(w * 0.1533333, h * 0.5256667)
      ..cubicTo(
          w * 0.1556667, h * 0.5256667, w * 0.1576667, h * 0.5240000, w * 0.1600000, h * 0.5210000)
      ..cubicTo(
          w * 0.1673333, h * 0.5030000, w * 0.1790000, h * 0.4880000, w * 0.1950000, h * 0.4760000)
      ..cubicTo(
          w * 0.2106667, h * 0.4643333, w * 0.2283333, h * 0.4576667, w * 0.2483333, h * 0.4560000)
      ..lineTo(w * 0.2660000, h * 0.4536667)
      ..cubicTo(
          w * 0.2700000, h * 0.4536667, w * 0.2723333, h * 0.4516667, w * 0.2723333, h * 0.4480000)
      ..lineTo(w * 0.2746667, h * 0.4306667)
      ..cubicTo(
          w * 0.2783333, h * 0.3946667, w * 0.2933333, h * 0.3646667, w * 0.3203333, h * 0.3403333)
      ..cubicTo(
          w * 0.3473333, h * 0.3160000, w * 0.3790000, h * 0.3040000, w * 0.4153333, h * 0.3040000)
      ..cubicTo(
          w * 0.4520000, h * 0.3040000, w * 0.4836667, h * 0.3160000, w * 0.5106667, h * 0.3400000)
      ..cubicTo(
          w * 0.5376667, h * 0.3640000, w * 0.5530000, h * 0.3943333, w * 0.5566667, h * 0.4303333)
      ..lineTo(w * 0.5590000, h * 0.4496667)
      ..cubicTo(
          w * 0.5590000, h * 0.4536667, w * 0.5610000, h * 0.4556667, w * 0.5650000, h * 0.4556667)
      ..lineTo(w * 0.6193333, h * 0.4556667)
      ..cubicTo(
          w * 0.6493333, h * 0.4556667, w * 0.6750000, h * 0.4660000, w * 0.6960000, h * 0.4870000)
      ..cubicTo(
          w * 0.7170000, h * 0.5080000, w * 0.7276667, h * 0.5333333, w * 0.7276667, h * 0.5626667)
      ..cubicTo(
          w * 0.7276667, h * 0.5923333, w * 0.7170000, h * 0.6180000, w * 0.6960000, h * 0.6390000)
      ..cubicTo(
          w * 0.6750000, h * 0.6600000, w * 0.6493333, h * 0.6706667, w * 0.6193333, h * 0.6706667)
      ..lineTo(w * 0.3893333, h * 0.6706667)
      ..cubicTo(
          w * 0.3850000, h * 0.6706667, w * 0.3830000, h * 0.6726667, w * 0.3830000, h * 0.6766667)
      ..lineTo(w * 0.3830000, h * 0.7223333)
      ..cubicTo(
          w * 0.3830000, h * 0.7260000, w * 0.3850000, h * 0.7280000, w * 0.3893333, h * 0.7280000)
      ..lineTo(w * 0.6193333, h * 0.7280000)
      ..cubicTo(
          w * 0.6490000, h * 0.7280000, w * 0.6766667, h * 0.7206667, w * 0.7020000, h * 0.7056667)
      ..cubicTo(
          w * 0.7273333, h * 0.6910000, w * 0.7473333, h * 0.6706667, w * 0.7620000, h * 0.6453333)
      ..cubicTo(
          w * 0.7766667, h * 0.6200000, w * 0.7840000, h * 0.5923333, w * 0.7840000, h * 0.5626667)
      ..cubicTo(
          w * 0.7840000, h * 0.5380000, w * 0.7793333, h * 0.5156667, w * 0.7700000, h * 0.4950000)
      ..cubicTo(
          w * 0.7953333, h * 0.4620000, w * 0.8076667, h * 0.4250000, w * 0.8076667, h * 0.3846667)
      ..cubicTo(
          w * 0.8076667, h * 0.3533333, w * 0.7996667, h * 0.3243333, w * 0.7840000, h * 0.2973333)
      ..cubicTo(
          w * 0.7683333, h * 0.2703333, w * 0.7470000, h * 0.2490000, w * 0.7200000, h * 0.2333333)
      ..cubicTo(
          w * 0.6930000, h * 0.2176667, w * 0.6640000, h * 0.2096667, w * 0.6326667, h * 0.2096667)
      ..cubicTo(
          w * 0.5813333, h * 0.2096667, w * 0.5383333, h * 0.2290000, w * 0.5040000, h * 0.2673333)
      ..cubicTo(
          w * 0.4773333, h * 0.2536667, w * 0.4476667, h * 0.2470000, w * 0.4150000, h * 0.2470000)
      ..cubicTo(
          w * 0.3680000, h * 0.2470000, w * 0.3266667, h * 0.2616667, w * 0.2906667, h * 0.2906667)
      ..cubicTo(
          w * 0.2546667, h * 0.3196667, w * 0.2316667, h * 0.3570000, w * 0.2220000, h * 0.4020000)
      ..cubicTo(
          w * 0.1936667, h * 0.4086667, w * 0.1686667, h * 0.4223333, w * 0.1470000, h * 0.4430000)
      ..cubicTo(
          w * 0.1253333, h * 0.4636667, w * 0.1100000, h * 0.4880000, w * 0.1016667, h * 0.5160000)
      ..lineTo(w * 0.1016667, h * 0.5173333)
      ..cubicTo(
          w * 0.1003333, h * 0.5196667, w * 0.1000000, h * 0.5206667, w * 0.1000000, h * 0.5216667)
      ..close()
      ..moveTo(w * 0.3726667, h * 0.1540000)
      ..cubicTo(
          w * 0.3726667, h * 0.1616667, w * 0.3756667, h * 0.1683333, w * 0.3816667, h * 0.1740000)
      ..lineTo(w * 0.4020000, h * 0.1956667)
      ..cubicTo(
          w * 0.4073333, h * 0.2010000, w * 0.4143333, h * 0.2036667, w * 0.4223333, h * 0.2036667)
      ..cubicTo(
          w * 0.4306667, h * 0.2036667, w * 0.4373333, h * 0.2010000, w * 0.4426667, h * 0.1960000)
      ..cubicTo(
          w * 0.4480000, h * 0.1910000, w * 0.4506667, h * 0.1843333, w * 0.4506667, h * 0.1760000)
      ..cubicTo(
          w * 0.4506667, h * 0.1680000, w * 0.4483333, h * 0.1613333, w * 0.4430000, h * 0.1560000)
      ..lineTo(w * 0.4210000, h * 0.1343333)
      ..cubicTo(
          w * 0.4156667, h * 0.1286667, w * 0.4093333, h * 0.1256667, w * 0.4013333, h * 0.1256667)
      ..cubicTo(
          w * 0.3933333, h * 0.1256667, w * 0.3866667, h * 0.1283333, w * 0.3810000, h * 0.1340000)
      ..cubicTo(
          w * 0.3753333, h * 0.1396667, w * 0.3726667, h * 0.1463333, w * 0.3726667, h * 0.1540000)
      ..close()
      ..moveTo(w * 0.5500000, h * 0.3010000)
      ..cubicTo(
          w * 0.5740000, h * 0.2783333, w * 0.6013333, h * 0.2670000, w * 0.6326667, h * 0.2670000)
      ..cubicTo(
          w * 0.6650000, h * 0.2670000, w * 0.6926667, h * 0.2786667, w * 0.7163333, h * 0.3020000)
      ..cubicTo(
          w * 0.7396667, h * 0.3253333, w * 0.7513333, h * 0.3533333, w * 0.7513333, h * 0.3856667)
      ..cubicTo(
          w * 0.7513333, h * 0.4073333, w * 0.7456667, h * 0.4276667, w * 0.7340000, h * 0.4466667)
      ..cubicTo(
          w * 0.7020000, h * 0.4146667, w * 0.6636667, h * 0.3990000, w * 0.6186667, h * 0.3990000)
      ..lineTo(w * 0.6073333, h * 0.3990000)
      ..cubicTo(
          w * 0.5996667, h * 0.3626667, w * 0.5803333, h * 0.3300000, w * 0.5500000, h * 0.3010000)
      ..close()
      ..moveTo(w * 0.6040000, h * 0.1263333)
      ..cubicTo(
          w * 0.6040000, h * 0.1340000, w * 0.6066667, h * 0.1406667, w * 0.6123333, h * 0.1460000)
      ..cubicTo(
          w * 0.6180000, h * 0.1513333, w * 0.6246667, h * 0.1540000, w * 0.6323333, h * 0.1540000)
      ..cubicTo(
          w * 0.6403333, h * 0.1540000, w * 0.6470000, h * 0.1513333, w * 0.6526667, h * 0.1460000)
      ..cubicTo(
          w * 0.6583333, h * 0.1406667, w * 0.6610000, h * 0.1343333, w * 0.6610000, h * 0.1263333)
      ..lineTo(w * 0.6610000, h * 0.05800000)
      ..cubicTo(w * 0.6610000, h * 0.05000000, w * 0.6583333, h * 0.04333333, w * 0.6526667,
          h * 0.03766667)
      ..cubicTo(w * 0.6470000, h * 0.03200000, w * 0.6403333, h * 0.02933333, w * 0.6323333,
          h * 0.02933333)
      ..cubicTo(w * 0.6243333, h * 0.02933333, w * 0.6176667, h * 0.03200000, w * 0.6123333,
          h * 0.03766667)
      ..cubicTo(w * 0.6070000, h * 0.04333333, w * 0.6040000, h * 0.05000000, w * 0.6040000,
          h * 0.05800000)
      ..lineTo(w * 0.6040000, h * 0.1263333)
      ..close()
      ..moveTo(w * 0.7890000, h * 0.2020000)
      ..cubicTo(
          w * 0.7890000, h * 0.2100000, w * 0.7916667, h * 0.2166667, w * 0.7966667, h * 0.2220000)
      ..cubicTo(
          w * 0.8023333, h * 0.2276667, w * 0.8090000, h * 0.2303333, w * 0.8170000, h * 0.2306667)
      ..cubicTo(
          w * 0.8250000, h * 0.2310000, w * 0.8313333, h * 0.2280000, w * 0.8360000, h * 0.2220000)
      ..lineTo(w * 0.8846667, h * 0.1743333)
      ..cubicTo(
          w * 0.8903333, h * 0.1686667, w * 0.8930000, h * 0.1620000, w * 0.8930000, h * 0.1540000)
      ..cubicTo(
          w * 0.8930000, h * 0.1463333, w * 0.8903333, h * 0.1396667, w * 0.8846667, h * 0.1340000)
      ..cubicTo(
          w * 0.8790000, h * 0.1283333, w * 0.8723333, h * 0.1256667, w * 0.8643333, h * 0.1256667)
      ..cubicTo(
          w * 0.8563333, h * 0.1256667, w * 0.8496667, h * 0.1280000, w * 0.8443333, h * 0.1333333)
      ..lineTo(w * 0.7966667, h * 0.1823333)
      ..cubicTo(
          w * 0.7916667, h * 0.1876667, w * 0.7890000, h * 0.1940000, w * 0.7890000, h * 0.2020000)
      ..close()
      ..moveTo(w * 0.8146667, h * 0.5963333)
      ..cubicTo(
          w * 0.8146667, h * 0.6040000, w * 0.8173333, h * 0.6106667, w * 0.8230000, h * 0.6163333)
      ..lineTo(w * 0.8443333, h * 0.6380000)
      ..cubicTo(
          w * 0.8510000, h * 0.6433333, w * 0.8580000, h * 0.6460000, w * 0.8650000, h * 0.6460000)
      ..cubicTo(
          w * 0.8713333, h * 0.6460000, w * 0.8780000, h * 0.6433333, w * 0.8846667, h * 0.6380000)
      ..cubicTo(
          w * 0.8903333, h * 0.6323333, w * 0.8930000, h * 0.6256667, w * 0.8930000, h * 0.6180000)
      ..cubicTo(
          w * 0.8930000, h * 0.6106667, w * 0.8903333, h * 0.6040000, w * 0.8846667, h * 0.5976667)
      ..lineTo(w * 0.8633333, h * 0.5760000)
      ..cubicTo(
          w * 0.8580000, h * 0.5706667, w * 0.8513333, h * 0.5680000, w * 0.8440000, h * 0.5680000)
      ..cubicTo(
          w * 0.8356667, h * 0.5680000, w * 0.8286667, h * 0.5706667, w * 0.8230000, h * 0.5763333)
      ..cubicTo(
          w * 0.8173333, h * 0.5816667, w * 0.8146667, h * 0.5883333, w * 0.8146667, h * 0.5963333)
      ..close()
      ..moveTo(w * 0.8650000, h * 0.3856667)
      ..cubicTo(
          w * 0.8650000, h * 0.3936667, w * 0.8676667, h * 0.4000000, w * 0.8733333, h * 0.4053333)
      ..cubicTo(
          w * 0.8783333, h * 0.4113333, w * 0.8846667, h * 0.4140000, w * 0.8923333, h * 0.4140000)
      ..lineTo(w * 0.9596667, h * 0.4140000)
      ..cubicTo(
          w * 0.9676667, h * 0.4140000, w * 0.9743333, h * 0.4113333, w * 0.9800000, h * 0.4056667)
      ..cubicTo(
          w * 0.9856667, h * 0.4000000, w * 0.9883333, h * 0.3933333, w * 0.9883333, h * 0.3856667)
      ..cubicTo(
          w * 0.9883333, h * 0.3780000, w * 0.9853333, h * 0.3713333, w * 0.9796667, h * 0.3656667)
      ..cubicTo(
          w * 0.9740000, h * 0.3600000, w * 0.9673333, h * 0.3570000, w * 0.9596667, h * 0.3570000)
      ..lineTo(w * 0.8923333, h * 0.3570000)
      ..cubicTo(
          w * 0.8843333, h * 0.3570000, w * 0.8780000, h * 0.3596667, w * 0.8726667, h * 0.3653333)
      ..cubicTo(
          w * 0.8676667, h * 0.3710000, w * 0.8650000, h * 0.3776667, w * 0.8650000, h * 0.3856667)
      ..close();
  }

  Path _dayFogPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.01066667, h * 0.7020000)
      ..cubicTo(w * 0.01066667, h * 0.7096667, w * 0.01333333, h * 0.7163333, w * 0.01900000,
          h * 0.7216667)
      ..cubicTo(w * 0.02466667, h * 0.7270000, w * 0.03166667, h * 0.7296667, w * 0.04000000,
          h * 0.7296667)
      ..lineTo(w * 0.6636667, h * 0.7296667)
      ..cubicTo(
          w * 0.6716667, h * 0.7296667, w * 0.6783333, h * 0.7270000, w * 0.6840000, h * 0.7216667)
      ..cubicTo(
          w * 0.6896667, h * 0.7163333, w * 0.6923333, h * 0.7100000, w * 0.6923333, h * 0.7020000)
      ..cubicTo(
          w * 0.6923333, h * 0.6940000, w * 0.6896667, h * 0.6873333, w * 0.6840000, h * 0.6820000)
      ..cubicTo(
          w * 0.6783333, h * 0.6763333, w * 0.6716667, h * 0.6736667, w * 0.6636667, h * 0.6736667)
      ..lineTo(w * 0.04000000, h * 0.6736667)
      ..cubicTo(w * 0.03166667, h * 0.6736667, w * 0.02466667, h * 0.6763333, w * 0.01900000,
          h * 0.6820000)
      ..cubicTo(w * 0.01333333, h * 0.6876667, w * 0.01066667, h * 0.6940000, w * 0.01066667,
          h * 0.7020000)
      ..close()
      ..moveTo(w * 0.09800000, h * 0.5973333)
      ..cubicTo(
          w * 0.09800000, h * 0.6050000, w * 0.1006667, h * 0.6116667, w * 0.1063333, h * 0.6166667)
      ..cubicTo(
          w * 0.1120000, h * 0.6226667, w * 0.1186667, h * 0.6256667, w * 0.1263333, h * 0.6256667)
      ..lineTo(w * 0.7503333, h * 0.6256667)
      ..cubicTo(
          w * 0.7580000, h * 0.6256667, w * 0.7646667, h * 0.6230000, w * 0.7700000, h * 0.6173333)
      ..cubicTo(
          w * 0.7753333, h * 0.6116667, w * 0.7780000, h * 0.6050000, w * 0.7780000, h * 0.5973333)
      ..cubicTo(
          w * 0.7780000, h * 0.5896667, w * 0.7753333, h * 0.5830000, w * 0.7703333, h * 0.5776667)
      ..cubicTo(
          w * 0.7650000, h * 0.5723333, w * 0.7586667, h * 0.5696667, w * 0.7506667, h * 0.5696667)
      ..lineTo(w * 0.1266667, h * 0.5696667)
      ..cubicTo(
          w * 0.1186667, h * 0.5696667, w * 0.1120000, h * 0.5723333, w * 0.1066667, h * 0.5776667)
      ..cubicTo(w * 0.1010000, h * 0.5833333, w * 0.09800000, h * 0.5896667, w * 0.09800000,
          h * 0.5973333)
      ..close()
      ..moveTo(w * 0.1023333, h * 0.5173333)
      ..cubicTo(
          w * 0.1023333, h * 0.5203333, w * 0.1040000, h * 0.5216667, w * 0.1076667, h * 0.5216667)
      ..lineTo(w * 0.1553333, h * 0.5216667)
      ..cubicTo(
          w * 0.1576667, h * 0.5216667, w * 0.1600000, h * 0.5200000, w * 0.1623333, h * 0.5163333)
      ..cubicTo(
          w * 0.1703333, h * 0.4990000, w * 0.1820000, h * 0.4850000, w * 0.1976667, h * 0.4740000)
      ..cubicTo(
          w * 0.2133333, h * 0.4630000, w * 0.2306667, h * 0.4566667, w * 0.2496667, h * 0.4553333)
      ..lineTo(w * 0.2676667, h * 0.4530000)
      ..cubicTo(
          w * 0.2713333, h * 0.4530000, w * 0.2733333, h * 0.4510000, w * 0.2733333, h * 0.4470000)
      ..lineTo(w * 0.2756667, h * 0.4300000)
      ..cubicTo(
          w * 0.2793333, h * 0.3940000, w * 0.2943333, h * 0.3640000, w * 0.3213333, h * 0.3396667)
      ..cubicTo(
          w * 0.3483333, h * 0.3156667, w * 0.3800000, h * 0.3033333, w * 0.4166667, h * 0.3033333)
      ..cubicTo(
          w * 0.4526667, h * 0.3033333, w * 0.4843333, h * 0.3153333, w * 0.5113333, h * 0.3393333)
      ..cubicTo(
          w * 0.5383333, h * 0.3633333, w * 0.5536667, h * 0.3930000, w * 0.5573333, h * 0.4286667)
      ..lineTo(w * 0.5596667, h * 0.4480000)
      ..cubicTo(
          w * 0.5596667, h * 0.4516667, w * 0.5616667, h * 0.4536667, w * 0.5660000, h * 0.4536667)
      ..lineTo(w * 0.6196667, h * 0.4536667)
      ..cubicTo(
          w * 0.6410000, h * 0.4536667, w * 0.6606667, h * 0.4593333, w * 0.6783333, h * 0.4710000)
      ..cubicTo(
          w * 0.6960000, h * 0.4823333, w * 0.7090000, h * 0.4976667, w * 0.7176667, h * 0.5166667)
      ..cubicTo(
          w * 0.7200000, h * 0.5203333, w * 0.7220000, h * 0.5220000, w * 0.7243333, h * 0.5220000)
      ..lineTo(w * 0.7723333, h * 0.5220000)
      ..cubicTo(
          w * 0.7766667, h * 0.5220000, w * 0.7783333, h * 0.5196667, w * 0.7766667, h * 0.5143333)
      ..lineTo(w * 0.7700000, h * 0.4960000)
      ..cubicTo(
          w * 0.7953333, h * 0.4646667, w * 0.8076667, h * 0.4280000, w * 0.8076667, h * 0.3856667)
      ..cubicTo(
          w * 0.8076667, h * 0.3620000, w * 0.8030000, h * 0.3396667, w * 0.7940000, h * 0.3180000)
      ..cubicTo(
          w * 0.7850000, h * 0.2963333, w * 0.7726667, h * 0.2780000, w * 0.7570000, h * 0.2623333)
      ..cubicTo(
          w * 0.7416667, h * 0.2466667, w * 0.7230000, h * 0.2343333, w * 0.7013333, h * 0.2250000)
      ..cubicTo(
          w * 0.6796667, h * 0.2156667, w * 0.6573333, h * 0.2116667, w * 0.6333333, h * 0.2116667)
      ..cubicTo(
          w * 0.5820000, h * 0.2116667, w * 0.5393333, h * 0.2303333, w * 0.5060000, h * 0.2676667)
      ..cubicTo(
          w * 0.4776667, h * 0.2536667, w * 0.4480000, h * 0.2466667, w * 0.4166667, h * 0.2466667)
      ..cubicTo(
          w * 0.3700000, h * 0.2466667, w * 0.3283333, h * 0.2613333, w * 0.2920000, h * 0.2906667)
      ..cubicTo(
          w * 0.2556667, h * 0.3200000, w * 0.2323333, h * 0.3573333, w * 0.2220000, h * 0.4030000)
      ..cubicTo(
          w * 0.1626667, h * 0.4186667, w * 0.1226667, h * 0.4556667, w * 0.1026667, h * 0.5146667)
      ..cubicTo(
          w * 0.1023333, h * 0.5150000, w * 0.1023333, h * 0.5160000, w * 0.1023333, h * 0.5173333)
      ..close()
      ..moveTo(w * 0.1563333, h * 0.8043333)
      ..cubicTo(
          w * 0.1563333, h * 0.8123333, w * 0.1593333, h * 0.8190000, w * 0.1653333, h * 0.8243333)
      ..cubicTo(
          w * 0.1706667, h * 0.8300000, w * 0.1770000, h * 0.8330000, w * 0.1850000, h * 0.8330000)
      ..lineTo(w * 0.8096667, h * 0.8330000)
      ..cubicTo(
          w * 0.8173333, h * 0.8330000, w * 0.8240000, h * 0.8303333, w * 0.8296667, h * 0.8246667)
      ..cubicTo(
          w * 0.8353333, h * 0.8190000, w * 0.8380000, h * 0.8123333, w * 0.8380000, h * 0.8043333)
      ..cubicTo(
          w * 0.8380000, h * 0.7966667, w * 0.8353333, h * 0.7903333, w * 0.8296667, h * 0.7850000)
      ..cubicTo(
          w * 0.8240000, h * 0.7800000, w * 0.8173333, h * 0.7773333, w * 0.8096667, h * 0.7773333)
      ..lineTo(w * 0.1850000, h * 0.7773333)
      ..cubicTo(
          w * 0.1770000, h * 0.7773333, w * 0.1703333, h * 0.7800000, w * 0.1646667, h * 0.7850000)
      ..cubicTo(
          w * 0.1590000, h * 0.7903333, w * 0.1563333, h * 0.7966667, w * 0.1563333, h * 0.8043333)
      ..close()
      ..moveTo(w * 0.3753333, h * 0.1553333)
      ..cubicTo(
          w * 0.3753333, h * 0.1633333, w * 0.3780000, h * 0.1696667, w * 0.3830000, h * 0.1750000)
      ..lineTo(w * 0.4046667, h * 0.1963333)
      ..cubicTo(
          w * 0.4103333, h * 0.2023333, w * 0.4166667, h * 0.2053333, w * 0.4240000, h * 0.2053333)
      ..cubicTo(
          w * 0.4313333, h * 0.2053333, w * 0.4380000, h * 0.2026667, w * 0.4440000, h * 0.1970000)
      ..cubicTo(
          w * 0.4496667, h * 0.1913333, w * 0.4526667, h * 0.1846667, w * 0.4526667, h * 0.1766667)
      ..cubicTo(
          w * 0.4526667, h * 0.1686667, w * 0.4500000, h * 0.1616667, w * 0.4443333, h * 0.1556667)
      ..lineTo(w * 0.4230000, h * 0.1353333)
      ..cubicTo(
          w * 0.4176667, h * 0.1296667, w * 0.4110000, h * 0.1266667, w * 0.4030000, h * 0.1266667)
      ..cubicTo(
          w * 0.3950000, h * 0.1266667, w * 0.3883333, h * 0.1293333, w * 0.3830000, h * 0.1350000)
      ..cubicTo(
          w * 0.3780000, h * 0.1403333, w * 0.3753333, h * 0.1473333, w * 0.3753333, h * 0.1553333)
      ..close()
      ..moveTo(w * 0.5526667, h * 0.3013333)
      ..cubicTo(
          w * 0.5750000, h * 0.2786667, w * 0.6020000, h * 0.2676667, w * 0.6336667, h * 0.2676667)
      ..cubicTo(
          w * 0.6663333, h * 0.2676667, w * 0.6943333, h * 0.2793333, w * 0.7173333, h * 0.3023333)
      ..cubicTo(
          w * 0.7403333, h * 0.3253333, w * 0.7520000, h * 0.3533333, w * 0.7520000, h * 0.3856667)
      ..cubicTo(
          w * 0.7520000, h * 0.4073333, w * 0.7466667, h * 0.4273333, w * 0.7356667, h * 0.4456667)
      ..cubicTo(
          w * 0.7040000, h * 0.4140000, w * 0.6653333, h * 0.3983333, w * 0.6200000, h * 0.3983333)
      ..lineTo(w * 0.6086667, h * 0.3983333)
      ..cubicTo(
          w * 0.5990000, h * 0.3590000, w * 0.5803333, h * 0.3266667, w * 0.5526667, h * 0.3013333)
      ..close()
      ..moveTo(w * 0.6060000, h * 0.1270000)
      ..cubicTo(
          w * 0.6060000, h * 0.1346667, w * 0.6086667, h * 0.1413333, w * 0.6140000, h * 0.1466667)
      ..cubicTo(
          w * 0.6193333, h * 0.1520000, w * 0.6256667, h * 0.1546667, w * 0.6336667, h * 0.1546667)
      ..cubicTo(
          w * 0.6420000, h * 0.1546667, w * 0.6490000, h * 0.1520000, w * 0.6546667, h * 0.1466667)
      ..cubicTo(
          w * 0.6603333, h * 0.1413333, w * 0.6630000, h * 0.1350000, w * 0.6630000, h * 0.1270000)
      ..lineTo(w * 0.6630000, h * 0.05866667)
      ..cubicTo(w * 0.6630000, h * 0.05100000, w * 0.6600000, h * 0.04433333, w * 0.6543333,
          h * 0.03866667)
      ..cubicTo(w * 0.6483333, h * 0.03300000, w * 0.6413333, h * 0.03033333, w * 0.6333333,
          h * 0.03033333)
      ..cubicTo(w * 0.6256667, h * 0.03033333, w * 0.6190000, h * 0.03300000, w * 0.6136667,
          h * 0.03866667)
      ..cubicTo(w * 0.6083333, h * 0.04433333, w * 0.6056667, h * 0.05100000, w * 0.6056667,
          h * 0.05866667)
      ..lineTo(w * 0.6056667, h * 0.1270000)
      ..close()
      ..moveTo(w * 0.7890000, h * 0.2026667)
      ..cubicTo(
          w * 0.7890000, h * 0.2100000, w * 0.7916667, h * 0.2170000, w * 0.7970000, h * 0.2226667)
      ..cubicTo(
          w * 0.8093333, h * 0.2346667, w * 0.8230000, h * 0.2346667, w * 0.8380000, h * 0.2226667)
      ..lineTo(w * 0.8856667, h * 0.1750000)
      ..cubicTo(
          w * 0.8910000, h * 0.1690000, w * 0.8936667, h * 0.1620000, w * 0.8936667, h * 0.1536667)
      ..cubicTo(
          w * 0.8936667, h * 0.1460000, w * 0.8910000, h * 0.1393333, w * 0.8856667, h * 0.1340000)
      ..cubicTo(
          w * 0.8803333, h * 0.1286667, w * 0.8736667, h * 0.1260000, w * 0.8660000, h * 0.1260000)
      ..cubicTo(
          w * 0.8580000, h * 0.1260000, w * 0.8513333, h * 0.1286667, w * 0.8460000, h * 0.1340000)
      ..lineTo(w * 0.7973333, h * 0.1830000)
      ..cubicTo(
          w * 0.7916667, h * 0.1890000, w * 0.7890000, h * 0.1956667, w * 0.7890000, h * 0.2026667)
      ..close()
      ..moveTo(w * 0.8160000, h * 0.5960000)
      ..cubicTo(
          w * 0.8160000, h * 0.6040000, w * 0.8190000, h * 0.6106667, w * 0.8246667, h * 0.6160000)
      ..lineTo(w * 0.8460000, h * 0.6376667)
      ..cubicTo(
          w * 0.8513333, h * 0.6430000, w * 0.8580000, h * 0.6456667, w * 0.8653333, h * 0.6456667)
      ..cubicTo(
          w * 0.8723333, h * 0.6456667, w * 0.8790000, h * 0.6430000, w * 0.8856667, h * 0.6376667)
      ..cubicTo(
          w * 0.8910000, h * 0.6320000, w * 0.8936667, h * 0.6246667, w * 0.8936667, h * 0.6163333)
      ..cubicTo(
          w * 0.8936667, h * 0.6090000, w * 0.8910000, h * 0.6026667, w * 0.8856667, h * 0.5976667)
      ..lineTo(w * 0.8640000, h * 0.5756667)
      ..cubicTo(
          w * 0.8580000, h * 0.5703333, w * 0.8513333, h * 0.5676667, w * 0.8440000, h * 0.5676667)
      ..cubicTo(
          w * 0.8360000, h * 0.5676667, w * 0.8293333, h * 0.5703333, w * 0.8240000, h * 0.5760000)
      ..cubicTo(
          w * 0.8186667, h * 0.5813333, w * 0.8160000, h * 0.5880000, w * 0.8160000, h * 0.5960000)
      ..close()
      ..moveTo(w * 0.8653333, h * 0.3856667)
      ..cubicTo(
          w * 0.8653333, h * 0.3936667, w * 0.8683333, h * 0.4003333, w * 0.8740000, h * 0.4056667)
      ..cubicTo(
          w * 0.8790000, h * 0.4113333, w * 0.8856667, h * 0.4140000, w * 0.8936667, h * 0.4140000)
      ..lineTo(w * 0.9620000, h * 0.4140000)
      ..cubicTo(
          w * 0.9696667, h * 0.4140000, w * 0.9763333, h * 0.4113333, w * 0.9816667, h * 0.4056667)
      ..cubicTo(
          w * 0.9870000, h * 0.4000000, w * 0.9896667, h * 0.3933333, w * 0.9896667, h * 0.3856667)
      ..cubicTo(
          w * 0.9896667, h * 0.3776667, w * 0.9870000, h * 0.3710000, w * 0.9816667, h * 0.3656667)
      ..cubicTo(
          w * 0.9763333, h * 0.3603333, w * 0.9700000, h * 0.3576667, w * 0.9620000, h * 0.3576667)
      ..lineTo(w * 0.8936667, h * 0.3576667)
      ..cubicTo(
          w * 0.8856667, h * 0.3576667, w * 0.8790000, h * 0.3603333, w * 0.8736667, h * 0.3660000)
      ..cubicTo(
          w * 0.8680000, h * 0.3713333, w * 0.8653333, h * 0.3780000, w * 0.8653333, h * 0.3856667)
      ..close();
  }

  Path _dayHailPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.04933333, h * 0.5626667)
      ..cubicTo(w * 0.04933333, h * 0.6073333, w * 0.06500000, h * 0.6456667, w * 0.09600000,
          h * 0.6776667)
      ..cubicTo(
          w * 0.1270000, h * 0.7096667, w * 0.1650000, h * 0.7266667, w * 0.2093333, h * 0.7286667)
      ..cubicTo(
          w * 0.2133333, h * 0.7286667, w * 0.2153333, h * 0.7266667, w * 0.2153333, h * 0.7230000)
      ..lineTo(w * 0.2153333, h * 0.6783333)
      ..cubicTo(
          w * 0.2153333, h * 0.6743333, w * 0.2133333, h * 0.6723333, w * 0.2093333, h * 0.6723333)
      ..cubicTo(
          w * 0.1806667, h * 0.6710000, w * 0.1563333, h * 0.6593333, w * 0.1363333, h * 0.6380000)
      ..cubicTo(
          w * 0.1163333, h * 0.6166667, w * 0.1063333, h * 0.5913333, w * 0.1063333, h * 0.5626667)
      ..cubicTo(
          w * 0.1063333, h * 0.5350000, w * 0.1156667, h * 0.5110000, w * 0.1346667, h * 0.4903333)
      ..cubicTo(
          w * 0.1536667, h * 0.4696667, w * 0.1770000, h * 0.4580000, w * 0.2046667, h * 0.4546667)
      ..lineTo(w * 0.2223333, h * 0.4533333)
      ..cubicTo(
          w * 0.2266667, h * 0.4533333, w * 0.2290000, h * 0.4513333, w * 0.2290000, h * 0.4473333)
      ..lineTo(w * 0.2313333, h * 0.4290000)
      ..cubicTo(
          w * 0.2350000, h * 0.3930000, w * 0.2500000, h * 0.3626667, w * 0.2770000, h * 0.3386667)
      ..cubicTo(
          w * 0.3040000, h * 0.3143333, w * 0.3356667, h * 0.3023333, w * 0.3723333, h * 0.3023333)
      ..cubicTo(
          w * 0.4086667, h * 0.3023333, w * 0.4403333, h * 0.3143333, w * 0.4676667, h * 0.3386667)
      ..cubicTo(
          w * 0.4950000, h * 0.3630000, w * 0.5106667, h * 0.3930000, w * 0.5143333, h * 0.4290000)
      ..lineTo(w * 0.5166667, h * 0.4483333)
      ..cubicTo(
          w * 0.5166667, h * 0.4523333, w * 0.5186667, h * 0.4546667, w * 0.5223333, h * 0.4546667)
      ..lineTo(w * 0.5763333, h * 0.4546667)
      ..cubicTo(
          w * 0.6060000, h * 0.4546667, w * 0.6320000, h * 0.4653333, w * 0.6536667, h * 0.4866667)
      ..cubicTo(
          w * 0.6753333, h * 0.5080000, w * 0.6863333, h * 0.5333333, w * 0.6863333, h * 0.5623333)
      ..cubicTo(
          w * 0.6863333, h * 0.5913333, w * 0.6763333, h * 0.6163333, w * 0.6560000, h * 0.6376667)
      ..cubicTo(
          w * 0.6356667, h * 0.6590000, w * 0.6113333, h * 0.6703333, w * 0.5830000, h * 0.6720000)
      ..cubicTo(
          w * 0.5786667, h * 0.6720000, w * 0.5763333, h * 0.6740000, w * 0.5763333, h * 0.6780000)
      ..lineTo(w * 0.5763333, h * 0.7226667)
      ..cubicTo(
          w * 0.5763333, h * 0.7263333, w * 0.5786667, h * 0.7283333, w * 0.5830000, h * 0.7283333)
      ..cubicTo(
          w * 0.6276667, h * 0.7270000, w * 0.6653333, h * 0.7100000, w * 0.6960000, h * 0.6780000)
      ..cubicTo(
          w * 0.7270000, h * 0.6456667, w * 0.7423333, h * 0.6073333, w * 0.7423333, h * 0.5626667)
      ..cubicTo(
          w * 0.7423333, h * 0.5380000, w * 0.7376667, h * 0.5156667, w * 0.7286667, h * 0.4956667)
      ..cubicTo(
          w * 0.7550000, h * 0.4636667, w * 0.7680000, h * 0.4266667, w * 0.7680000, h * 0.3846667)
      ..cubicTo(
          w * 0.7680000, h * 0.3533333, w * 0.7600000, h * 0.3240000, w * 0.7443333, h * 0.2970000)
      ..cubicTo(
          w * 0.7283333, h * 0.2700000, w * 0.7070000, h * 0.2486667, w * 0.6800000, h * 0.2326667)
      ..cubicTo(
          w * 0.6530000, h * 0.2170000, w * 0.6236667, h * 0.2090000, w * 0.5923333, h * 0.2090000)
      ..cubicTo(
          w * 0.5403333, h * 0.2090000, w * 0.4970000, h * 0.2283333, w * 0.4623333, h * 0.2673333)
      ..cubicTo(
          w * 0.4356667, h * 0.2526667, w * 0.4056667, h * 0.2453333, w * 0.3720000, h * 0.2453333)
      ..cubicTo(
          w * 0.3250000, h * 0.2453333, w * 0.2830000, h * 0.2600000, w * 0.2466667, h * 0.2890000)
      ..cubicTo(
          w * 0.2103333, h * 0.3180000, w * 0.1866667, h * 0.3556667, w * 0.1763333, h * 0.4013333)
      ..cubicTo(
          w * 0.1393333, h * 0.4100000, w * 0.1090000, h * 0.4293333, w * 0.08500000, h * 0.4593333)
      ..cubicTo(w * 0.06133333, h * 0.4900000, w * 0.04933333, h * 0.5243333, w * 0.04933333,
          h * 0.5626667)
      ..close()
      ..moveTo(w * 0.2273333, h * 0.7980000)
      ..cubicTo(
          w * 0.2306667, h * 0.8053333, w * 0.2356667, h * 0.8103333, w * 0.2426667, h * 0.8130000)
      ..cubicTo(
          w * 0.2493333, h * 0.8163333, w * 0.2563333, h * 0.8166667, w * 0.2636667, h * 0.8136667)
      ..cubicTo(
          w * 0.2710000, h * 0.8110000, w * 0.2760000, h * 0.8060000, w * 0.2786667, h * 0.7986667)
      ..cubicTo(
          w * 0.2820000, h * 0.7913333, w * 0.2823333, h * 0.7843333, w * 0.2793333, h * 0.7770000)
      ..cubicTo(
          w * 0.2766667, h * 0.7700000, w * 0.2716667, h * 0.7650000, w * 0.2643333, h * 0.7623333)
      ..cubicTo(
          w * 0.2576667, h * 0.7586667, w * 0.2506667, h * 0.7583333, w * 0.2436667, h * 0.7613333)
      ..cubicTo(
          w * 0.2363333, h * 0.7643333, w * 0.2313333, h * 0.7693333, w * 0.2280000, h * 0.7770000)
      ..cubicTo(
          w * 0.2246667, h * 0.7830000, w * 0.2243333, h * 0.7900000, w * 0.2273333, h * 0.7980000)
      ..close()
      ..moveTo(w * 0.2486667, h * 0.7033333)
      ..cubicTo(
          w * 0.2486667, h * 0.7080000, w * 0.2496667, h * 0.7123333, w * 0.2516667, h * 0.7160000)
      ..cubicTo(
          w * 0.2580000, h * 0.7263333, w * 0.2680000, h * 0.7313333, w * 0.2813333, h * 0.7313333)
      ..cubicTo(
          w * 0.2920000, h * 0.7313333, w * 0.2996667, h * 0.7240000, w * 0.3043333, h * 0.7096667)
      ..lineTo(w * 0.3390000, h * 0.6023333)
      ..cubicTo(
          w * 0.3416667, h * 0.5943333, w * 0.3410000, h * 0.5866667, w * 0.3366667, h * 0.5800000)
      ..cubicTo(
          w * 0.3323333, h * 0.5733333, w * 0.3263333, h * 0.5690000, w * 0.3183333, h * 0.5676667)
      ..cubicTo(
          w * 0.3113333, h * 0.5660000, w * 0.3043333, h * 0.5666667, w * 0.2976667, h * 0.5700000)
      ..cubicTo(
          w * 0.2910000, h * 0.5736667, w * 0.2863333, h * 0.5793333, w * 0.2840000, h * 0.5866667)
      ..lineTo(w * 0.2496667, h * 0.6940000)
      ..cubicTo(
          w * 0.2490000, h * 0.6973333, w * 0.2486667, h * 0.7006667, w * 0.2486667, h * 0.7033333)
      ..close()
      ..moveTo(w * 0.3110000, h * 0.8906667)
      ..cubicTo(
          w * 0.3110000, h * 0.8950000, w * 0.3116667, h * 0.8983333, w * 0.3126667, h * 0.9003333)
      ..cubicTo(
          w * 0.3156667, h * 0.9076667, w * 0.3206667, h * 0.9126667, w * 0.3276667, h * 0.9153333)
      ..cubicTo(
          w * 0.3306667, h * 0.9170000, w * 0.3346667, h * 0.9176667, w * 0.3393333, h * 0.9176667)
      ..cubicTo(
          w * 0.3413333, h * 0.9176667, w * 0.3446667, h * 0.9170000, w * 0.3493333, h * 0.9156667)
      ..cubicTo(
          w * 0.3566667, h * 0.9130000, w * 0.3620000, h * 0.9080000, w * 0.3650000, h * 0.9006667)
      ..cubicTo(
          w * 0.3680000, h * 0.8933333, w * 0.3683333, h * 0.8860000, w * 0.3650000, h * 0.8786667)
      ..cubicTo(
          w * 0.3616667, h * 0.8713333, w * 0.3566667, h * 0.8663333, w * 0.3500000, h * 0.8636667)
      ..cubicTo(
          w * 0.3433333, h * 0.8610000, w * 0.3363333, h * 0.8610000, w * 0.3293333, h * 0.8636667)
      ..cubicTo(
          w * 0.3230000, h * 0.8660000, w * 0.3183333, h * 0.8700000, w * 0.3153333, h * 0.8753333)
      ..cubicTo(
          w * 0.3123333, h * 0.8806667, w * 0.3110000, h * 0.8860000, w * 0.3110000, h * 0.8906667)
      ..close()
      ..moveTo(w * 0.3313333, h * 0.1523333)
      ..cubicTo(
          w * 0.3313333, h * 0.1606667, w * 0.3340000, h * 0.1673333, w * 0.3393333, h * 0.1723333)
      ..lineTo(w * 0.3610000, h * 0.1940000)
      ..cubicTo(
          w * 0.3663333, h * 0.1993333, w * 0.3723333, h * 0.2023333, w * 0.3790000, h * 0.2030000)
      ..cubicTo(
          w * 0.3860000, h * 0.2040000, w * 0.3926667, h * 0.2013333, w * 0.3993333, h * 0.1953333)
      ..cubicTo(
          w * 0.4060000, h * 0.1893333, w * 0.4093333, h * 0.1820000, w * 0.4093333, h * 0.1740000)
      ..cubicTo(
          w * 0.4093333, h * 0.1660000, w * 0.4066667, h * 0.1593333, w * 0.4013333, h * 0.1540000)
      ..lineTo(w * 0.3800000, h * 0.1326667)
      ..cubicTo(
          w * 0.3736667, h * 0.1270000, w * 0.3670000, h * 0.1243333, w * 0.3593333, h * 0.1243333)
      ..cubicTo(
          w * 0.3513333, h * 0.1243333, w * 0.3443333, h * 0.1270000, w * 0.3390000, h * 0.1323333)
      ..cubicTo(
          w * 0.3340000, h * 0.1380000, w * 0.3313333, h * 0.1446667, w * 0.3313333, h * 0.1523333)
      ..close()
      ..moveTo(w * 0.3353333, h * 0.8010000)
      ..cubicTo(
          w * 0.3353333, h * 0.8063333, w * 0.3370000, h * 0.8116667, w * 0.3406667, h * 0.8170000)
      ..cubicTo(
          w * 0.3443333, h * 0.8223333, w * 0.3496667, h * 0.8260000, w * 0.3566667, h * 0.8280000)
      ..cubicTo(
          w * 0.3603333, h * 0.8286667, w * 0.3630000, h * 0.8293333, w * 0.3646667, h * 0.8293333)
      ..cubicTo(
          w * 0.3696667, h * 0.8293333, w * 0.3740000, h * 0.8283333, w * 0.3773333, h * 0.8266667)
      ..cubicTo(
          w * 0.3840000, h * 0.8240000, w * 0.3886667, h * 0.8176667, w * 0.3916667, h * 0.8076667)
      ..lineTo(w * 0.4516667, h * 0.6030000)
      ..cubicTo(
          w * 0.4540000, h * 0.5950000, w * 0.4533333, h * 0.5880000, w * 0.4496667, h * 0.5813333)
      ..cubicTo(
          w * 0.4460000, h * 0.5746667, w * 0.4406667, h * 0.5703333, w * 0.4330000, h * 0.5683333)
      ..cubicTo(
          w * 0.4250000, h * 0.5660000, w * 0.4176667, h * 0.5666667, w * 0.4110000, h * 0.5703333)
      ..cubicTo(
          w * 0.4043333, h * 0.5740000, w * 0.3996667, h * 0.5793333, w * 0.3973333, h * 0.5873333)
      ..lineTo(w * 0.3360000, h * 0.7936667)
      ..cubicTo(
          w * 0.3356667, h * 0.7973333, w * 0.3353333, h * 0.8000000, w * 0.3353333, h * 0.8010000)
      ..close()
      ..moveTo(w * 0.4503333, h * 0.7880000)
      ..cubicTo(
          w * 0.4503333, h * 0.7923333, w * 0.4510000, h * 0.7956667, w * 0.4526667, h * 0.7983333)
      ..cubicTo(
          w * 0.4556667, h * 0.8053333, w * 0.4606667, h * 0.8100000, w * 0.4676667, h * 0.8130000)
      ..cubicTo(
          w * 0.4713333, h * 0.8146667, w * 0.4750000, h * 0.8156667, w * 0.4793333, h * 0.8156667)
      ..cubicTo(
          w * 0.4813333, h * 0.8156667, w * 0.4846667, h * 0.8150000, w * 0.4893333, h * 0.8136667)
      ..cubicTo(
          w * 0.4970000, h * 0.8106667, w * 0.5020000, h * 0.8060000, w * 0.5046667, h * 0.7990000)
      ..cubicTo(
          w * 0.5073333, h * 0.7916667, w * 0.5073333, h * 0.7846667, w * 0.5046667, h * 0.7780000)
      ..cubicTo(
          w * 0.5020000, h * 0.7713333, w * 0.4973333, h * 0.7663333, w * 0.4906667, h * 0.7630000)
      ..cubicTo(
          w * 0.4830000, h * 0.7593333, w * 0.4760000, h * 0.7590000, w * 0.4686667, h * 0.7620000)
      ..cubicTo(
          w * 0.4616667, h * 0.7650000, w * 0.4563333, h * 0.7700000, w * 0.4526667, h * 0.7776667)
      ..cubicTo(
          w * 0.4510000, h * 0.7803333, w * 0.4503333, h * 0.7836667, w * 0.4503333, h * 0.7880000)
      ..close()
      ..moveTo(w * 0.4743333, h * 0.7026667)
      ..cubicTo(
          w * 0.4743333, h * 0.7080000, w * 0.4760000, h * 0.7130000, w * 0.4793333, h * 0.7176667)
      ..cubicTo(
          w * 0.4826667, h * 0.7226667, w * 0.4880000, h * 0.7260000, w * 0.4946667, h * 0.7280000)
      ..cubicTo(
          w * 0.4976667, h * 0.7286667, w * 0.5003333, h * 0.7290000, w * 0.5030000, h * 0.7290000)
      ..cubicTo(
          w * 0.5160000, h * 0.7290000, w * 0.5246667, h * 0.7223333, w * 0.5293333, h * 0.7086667)
      ..lineTo(w * 0.5636667, h * 0.6026667)
      ..cubicTo(
          w * 0.5663333, h * 0.5950000, w * 0.5653333, h * 0.5876667, w * 0.5613333, h * 0.5810000)
      ..cubicTo(
          w * 0.5573333, h * 0.5743333, w * 0.5516667, h * 0.5700000, w * 0.5440000, h * 0.5680000)
      ..cubicTo(
          w * 0.5360000, h * 0.5656667, w * 0.5290000, h * 0.5663333, w * 0.5226667, h * 0.5700000)
      ..cubicTo(
          w * 0.5163333, h * 0.5736667, w * 0.5120000, h * 0.5790000, w * 0.5093333, h * 0.5870000)
      ..lineTo(w * 0.4753333, h * 0.6936667)
      ..cubicTo(
          w * 0.4750000, h * 0.6980000, w * 0.4743333, h * 0.7010000, w * 0.4743333, h * 0.7026667)
      ..close()
      ..moveTo(w * 0.5100000, h * 0.3000000)
      ..cubicTo(
          w * 0.5323333, h * 0.2786667, w * 0.5600000, h * 0.2676667, w * 0.5926667, h * 0.2676667)
      ..cubicTo(
          w * 0.6253333, h * 0.2676667, w * 0.6530000, h * 0.2790000, w * 0.6760000, h * 0.3020000)
      ..cubicTo(
          w * 0.6990000, h * 0.3246667, w * 0.7106667, h * 0.3523333, w * 0.7106667, h * 0.3850000)
      ..cubicTo(
          w * 0.7106667, h * 0.4056667, w * 0.7050000, h * 0.4263333, w * 0.6933333, h * 0.4466667)
      ..cubicTo(
          w * 0.6613333, h * 0.4146667, w * 0.6226667, h * 0.3986667, w * 0.5763333, h * 0.3986667)
      ..lineTo(w * 0.5666667, h * 0.3986667)
      ..cubicTo(
          w * 0.5566667, h * 0.3600000, w * 0.5380000, h * 0.3270000, w * 0.5100000, h * 0.3000000)
      ..close()
      ..moveTo(w * 0.5640000, h * 0.1243333)
      ..cubicTo(
          w * 0.5640000, h * 0.1323333, w * 0.5666667, h * 0.1390000, w * 0.5723333, h * 0.1446667)
      ..cubicTo(
          w * 0.5780000, h * 0.1503333, w * 0.5846667, h * 0.1530000, w * 0.5926667, h * 0.1530000)
      ..cubicTo(
          w * 0.6003333, h * 0.1530000, w * 0.6070000, h * 0.1503333, w * 0.6123333, h * 0.1446667)
      ..cubicTo(
          w * 0.6176667, h * 0.1390000, w * 0.6203333, h * 0.1323333, w * 0.6203333, h * 0.1243333)
      ..lineTo(w * 0.6203333, h * 0.05566667)
      ..cubicTo(w * 0.6203333, h * 0.04766667, w * 0.6176667, h * 0.04100000, w * 0.6123333,
          h * 0.03533333)
      ..cubicTo(w * 0.6070000, h * 0.02966667, w * 0.6006667, h * 0.02700000, w * 0.5926667,
          h * 0.02700000)
      ..cubicTo(w * 0.5846667, h * 0.02700000, w * 0.5780000, h * 0.02966667, w * 0.5723333,
          h * 0.03533333)
      ..cubicTo(w * 0.5666667, h * 0.04100000, w * 0.5640000, h * 0.04766667, w * 0.5640000,
          h * 0.05566667)
      ..lineTo(w * 0.5640000, h * 0.1243333)
      ..close()
      ..moveTo(w * 0.7490000, h * 0.2006667)
      ..cubicTo(
          w * 0.7490000, h * 0.2086667, w * 0.7516667, h * 0.2153333, w * 0.7573333, h * 0.2206667)
      ..cubicTo(
          w * 0.7623333, h * 0.2263333, w * 0.7686667, h * 0.2293333, w * 0.7766667, h * 0.2293333)
      ..cubicTo(
          w * 0.7843333, h * 0.2293333, w * 0.7913333, h * 0.2263333, w * 0.7966667, h * 0.2206667)
      ..lineTo(w * 0.8446667, h * 0.1726667)
      ..cubicTo(
          w * 0.8506667, h * 0.1676667, w * 0.8536667, h * 0.1610000, w * 0.8536667, h * 0.1526667)
      ..cubicTo(
          w * 0.8536667, h * 0.1446667, w * 0.8506667, h * 0.1380000, w * 0.8450000, h * 0.1323333)
      ..cubicTo(
          w * 0.8393333, h * 0.1266667, w * 0.8323333, h * 0.1240000, w * 0.8246667, h * 0.1240000)
      ..cubicTo(
          w * 0.8173333, h * 0.1240000, w * 0.8110000, h * 0.1270000, w * 0.8056667, h * 0.1330000)
      ..lineTo(w * 0.7573333, h * 0.1806667)
      ..cubicTo(
          w * 0.7520000, h * 0.1856667, w * 0.7490000, h * 0.1926667, w * 0.7490000, h * 0.2006667)
      ..close()
      ..moveTo(w * 0.7760000, h * 0.5973333)
      ..cubicTo(
          w * 0.7760000, h * 0.6050000, w * 0.7786667, h * 0.6116667, w * 0.7840000, h * 0.6173333)
      ..lineTo(w * 0.8060000, h * 0.6383333)
      ..cubicTo(
          w * 0.8106667, h * 0.6443333, w * 0.8173333, h * 0.6473333, w * 0.8260000, h * 0.6473333)
      ..cubicTo(
          w * 0.8340000, h * 0.6473333, w * 0.8403333, h * 0.6443333, w * 0.8450000, h * 0.6383333)
      ..cubicTo(
          w * 0.8510000, h * 0.6330000, w * 0.8540000, h * 0.6263333, w * 0.8540000, h * 0.6183333)
      ..cubicTo(
          w * 0.8540000, h * 0.6103333, w * 0.8510000, h * 0.6036667, w * 0.8450000, h * 0.5980000)
      ..lineTo(w * 0.8233333, h * 0.5773333)
      ..cubicTo(
          w * 0.8180000, h * 0.5713333, w * 0.8116667, h * 0.5686667, w * 0.8040000, h * 0.5686667)
      ..cubicTo(
          w * 0.7963333, h * 0.5686667, w * 0.7896667, h * 0.5713333, w * 0.7840000, h * 0.5770000)
      ..cubicTo(
          w * 0.7786667, h * 0.5826667, w * 0.7760000, h * 0.5896667, w * 0.7760000, h * 0.5973333)
      ..close()
      ..moveTo(w * 0.8246667, h * 0.3850000)
      ..cubicTo(
          w * 0.8246667, h * 0.3930000, w * 0.8276667, h * 0.3996667, w * 0.8333333, h * 0.4050000)
      ..cubicTo(
          w * 0.8393333, h * 0.4110000, w * 0.8460000, h * 0.4136667, w * 0.8540000, h * 0.4136667)
      ..lineTo(w * 0.9216667, h * 0.4136667)
      ..cubicTo(
          w * 0.9296667, h * 0.4136667, w * 0.9363333, h * 0.4110000, w * 0.9420000, h * 0.4053333)
      ..cubicTo(
          w * 0.9476667, h * 0.3996667, w * 0.9506667, h * 0.3930000, w * 0.9506667, h * 0.3850000)
      ..cubicTo(
          w * 0.9506667, h * 0.3773333, w * 0.9480000, h * 0.3706667, w * 0.9423333, h * 0.3653333)
      ..cubicTo(
          w * 0.9366667, h * 0.3600000, w * 0.9296667, h * 0.3573333, w * 0.9216667, h * 0.3573333)
      ..lineTo(w * 0.8540000, h * 0.3573333)
      ..cubicTo(
          w * 0.8456667, h * 0.3573333, w * 0.8386667, h * 0.3600000, w * 0.8330000, h * 0.3653333)
      ..cubicTo(
          w * 0.8276667, h * 0.3706667, w * 0.8246667, h * 0.3773333, w * 0.8246667, h * 0.3850000)
      ..close();
  }

  Path _dayHazePath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1456667, h * 0.5206667)
      ..cubicTo(
          w * 0.1456667, h * 0.5126667, w * 0.1483333, h * 0.5060000, w * 0.1540000, h * 0.5003333)
      ..cubicTo(
          w * 0.1600000, h * 0.4946667, w * 0.1666667, h * 0.4920000, w * 0.1740000, h * 0.4920000)
      ..lineTo(w * 0.2420000, h * 0.4920000)
      ..cubicTo(
          w * 0.2496667, h * 0.4920000, w * 0.2560000, h * 0.4946667, w * 0.2613333, h * 0.5003333)
      ..cubicTo(
          w * 0.2663333, h * 0.5060000, w * 0.2690000, h * 0.5126667, w * 0.2690000, h * 0.5206667)
      ..cubicTo(
          w * 0.2690000, h * 0.5286667, w * 0.2663333, h * 0.5353333, w * 0.2613333, h * 0.5406667)
      ..cubicTo(
          w * 0.2563333, h * 0.5463333, w * 0.2496667, h * 0.5490000, w * 0.2420000, h * 0.5490000)
      ..lineTo(w * 0.1743333, h * 0.5490000)
      ..cubicTo(
          w * 0.1666667, h * 0.5490000, w * 0.1600000, h * 0.5463333, w * 0.1543333, h * 0.5406667)
      ..cubicTo(
          w * 0.1486667, h * 0.5350000, w * 0.1456667, h * 0.5283333, w * 0.1456667, h * 0.5206667)
      ..close()
      ..moveTo(w * 0.2410000, h * 0.2903333)
      ..cubicTo(
          w * 0.2410000, h * 0.2826667, w * 0.2436667, h * 0.2760000, w * 0.2486667, h * 0.2700000)
      ..cubicTo(
          w * 0.2553333, h * 0.2643333, w * 0.2623333, h * 0.2616667, w * 0.2700000, h * 0.2616667)
      ..cubicTo(
          w * 0.2770000, h * 0.2616667, w * 0.2836667, h * 0.2643333, w * 0.2896667, h * 0.2700000)
      ..lineTo(w * 0.3373333, h * 0.3186667)
      ..cubicTo(
          w * 0.3426667, h * 0.3236667, w * 0.3453333, h * 0.3303333, w * 0.3453333, h * 0.3383333)
      ..cubicTo(
          w * 0.3453333, h * 0.3463333, w * 0.3426667, h * 0.3530000, w * 0.3373333, h * 0.3583333)
      ..cubicTo(
          w * 0.3320000, h * 0.3636667, w * 0.3253333, h * 0.3663333, w * 0.3173333, h * 0.3663333)
      ..cubicTo(
          w * 0.3093333, h * 0.3663333, w * 0.3026667, h * 0.3636667, w * 0.2976667, h * 0.3583333)
      ..lineTo(w * 0.2490000, h * 0.3106667)
      ..cubicTo(
          w * 0.2436667, h * 0.3050000, w * 0.2410000, h * 0.2983333, w * 0.2410000, h * 0.2903333)
      ..close()
      ..moveTo(w * 0.2463333, h * 0.6006667)
      ..cubicTo(
          w * 0.2463333, h * 0.5933333, w * 0.2490000, h * 0.5870000, w * 0.2540000, h * 0.5823333)
      ..cubicTo(
          w * 0.2593333, h * 0.5776667, w * 0.2663333, h * 0.5750000, w * 0.2753333, h * 0.5750000)
      ..lineTo(w * 0.4656667, h * 0.5750000)
      ..cubicTo(
          w * 0.4746667, h * 0.5750000, w * 0.4816667, h * 0.5773333, w * 0.4870000, h * 0.5823333)
      ..cubicTo(
          w * 0.4923333, h * 0.5870000, w * 0.4950000, h * 0.5933333, w * 0.4950000, h * 0.6006667)
      ..cubicTo(
          w * 0.4950000, h * 0.6096667, w * 0.4923333, h * 0.6166667, w * 0.4873333, h * 0.6220000)
      ..cubicTo(
          w * 0.4820000, h * 0.6273333, w * 0.4750000, h * 0.6300000, w * 0.4656667, h * 0.6300000)
      ..lineTo(w * 0.2753333, h * 0.6300000)
      ..cubicTo(
          w * 0.2663333, h * 0.6300000, w * 0.2593333, h * 0.6273333, w * 0.2540000, h * 0.6223333)
      ..cubicTo(
          w * 0.2486667, h * 0.6173333, w * 0.2463333, h * 0.6096667, w * 0.2463333, h * 0.6006667)
      ..close()
      ..moveTo(w * 0.2793333, h * 0.6990000)
      ..cubicTo(
          w * 0.2793333, h * 0.6916667, w * 0.2823333, h * 0.6850000, w * 0.2886667, h * 0.6790000)
      ..cubicTo(
          w * 0.2946667, h * 0.6730000, w * 0.3016667, h * 0.6700000, w * 0.3086667, h * 0.6700000)
      ..cubicTo(
          w * 0.3173333, h * 0.6700000, w * 0.3243333, h * 0.6730000, w * 0.3296667, h * 0.6786667)
      ..cubicTo(
          w * 0.3350000, h * 0.6846667, w * 0.3376667, h * 0.6913333, w * 0.3376667, h * 0.6990000)
      ..cubicTo(
          w * 0.3376667, h * 0.7083333, w * 0.3350000, h * 0.7153333, w * 0.3300000, h * 0.7206667)
      ..cubicTo(
          w * 0.3250000, h * 0.7260000, w * 0.3176667, h * 0.7283333, w * 0.3086667, h * 0.7283333)
      ..cubicTo(
          w * 0.3010000, h * 0.7283333, w * 0.2940000, h * 0.7256667, w * 0.2883333, h * 0.7203333)
      ..cubicTo(
          w * 0.2823333, h * 0.7150000, w * 0.2793333, h * 0.7076667, w * 0.2793333, h * 0.6990000)
      ..close()
      ..moveTo(w * 0.3263333, h * 0.5303333)
      ..lineTo(w * 0.3263333, h * 0.5280000)
      ..cubicTo(
          w * 0.3273333, h * 0.4860000, w * 0.3420000, h * 0.4496667, w * 0.3700000, h * 0.4186667)
      ..cubicTo(
          w * 0.3980000, h * 0.3876667, w * 0.4323333, h * 0.3690000, w * 0.4733333, h * 0.3623333)
      ..lineTo(w * 0.4750000, h * 0.3623333)
      ..cubicTo(
          w * 0.4813333, h * 0.3610000, w * 0.4900000, h * 0.3603333, w * 0.5003333, h * 0.3603333)
      ..cubicTo(
          w * 0.5106667, h * 0.3603333, w * 0.5193333, h * 0.3610000, w * 0.5256667, h * 0.3623333)
      ..lineTo(w * 0.5270000, h * 0.3623333)
      ..cubicTo(
          w * 0.5676667, h * 0.3686667, w * 0.6023333, h * 0.3876667, w * 0.6303333, h * 0.4186667)
      ..cubicTo(
          w * 0.6583333, h * 0.4496667, w * 0.6730000, h * 0.4860000, w * 0.6740000, h * 0.5280000)
      ..lineTo(w * 0.6740000, h * 0.5303333)
      ..cubicTo(
          w * 0.6740000, h * 0.5356667, w * 0.6713333, h * 0.5383333, w * 0.6663333, h * 0.5383333)
      ..lineTo(w * 0.6286667, h * 0.5383333)
      ..cubicTo(
          w * 0.6246667, h * 0.5383333, w * 0.6220000, h * 0.5373333, w * 0.6203333, h * 0.5353333)
      ..cubicTo(
          w * 0.6186667, h * 0.5333333, w * 0.6180000, h * 0.5313333, w * 0.6180000, h * 0.5293333)
      ..cubicTo(
          w * 0.6166667, h * 0.4983333, w * 0.6046667, h * 0.4720000, w * 0.5820000, h * 0.4503333)
      ..cubicTo(
          w * 0.5593333, h * 0.4286667, w * 0.5323333, h * 0.4180000, w * 0.5006667, h * 0.4180000)
      ..cubicTo(
          w * 0.4690000, h * 0.4180000, w * 0.4420000, h * 0.4286667, w * 0.4193333, h * 0.4503333)
      ..cubicTo(
          w * 0.3966667, h * 0.4720000, w * 0.3846667, h * 0.4983333, w * 0.3833333, h * 0.5293333)
      ..cubicTo(
          w * 0.3833333, h * 0.5313333, w * 0.3823333, h * 0.5333333, w * 0.3806667, h * 0.5353333)
      ..cubicTo(
          w * 0.3790000, h * 0.5373333, w * 0.3760000, h * 0.5383333, w * 0.3720000, h * 0.5383333)
      ..lineTo(w * 0.3343333, h * 0.5383333)
      ..cubicTo(
          w * 0.3290000, h * 0.5383333, w * 0.3263333, h * 0.5356667, w * 0.3263333, h * 0.5303333)
      ..close()
      ..moveTo(w * 0.3600000, h * 0.6990000)
      ..cubicTo(
          w * 0.3600000, h * 0.6913333, w * 0.3626667, h * 0.6846667, w * 0.3680000, h * 0.6786667)
      ..cubicTo(
          w * 0.3733333, h * 0.6730000, w * 0.3803333, h * 0.6700000, w * 0.3890000, h * 0.6700000)
      ..lineTo(w * 0.5166667, h * 0.6700000)
      ..cubicTo(
          w * 0.5240000, h * 0.6700000, w * 0.5306667, h * 0.6730000, w * 0.5366667, h * 0.6790000)
      ..cubicTo(
          w * 0.5426667, h * 0.6850000, w * 0.5460000, h * 0.6916667, w * 0.5460000, h * 0.6990000)
      ..cubicTo(
          w * 0.5460000, h * 0.7076667, w * 0.5430000, h * 0.7150000, w * 0.5370000, h * 0.7203333)
      ..cubicTo(
          w * 0.5310000, h * 0.7256667, w * 0.5243333, h * 0.7283333, w * 0.5166667, h * 0.7283333)
      ..lineTo(w * 0.3890000, h * 0.7283333)
      ..cubicTo(
          w * 0.3800000, h * 0.7283333, w * 0.3730000, h * 0.7256667, w * 0.3676667, h * 0.7206667)
      ..cubicTo(
          w * 0.3623333, h * 0.7153333, w * 0.3600000, h * 0.7083333, w * 0.3600000, h * 0.6990000)
      ..close()
      ..moveTo(w * 0.4713333, h * 0.2630000)
      ..lineTo(w * 0.4713333, h * 0.1953333)
      ..cubicTo(
          w * 0.4713333, h * 0.1873333, w * 0.4740000, h * 0.1806667, w * 0.4796667, h * 0.1750000)
      ..cubicTo(
          w * 0.4853333, h * 0.1693333, w * 0.4920000, h * 0.1666667, w * 0.5000000, h * 0.1666667)
      ..cubicTo(
          w * 0.5080000, h * 0.1666667, w * 0.5143333, h * 0.1693333, w * 0.5200000, h * 0.1750000)
      ..cubicTo(
          w * 0.5256667, h * 0.1806667, w * 0.5283333, h * 0.1873333, w * 0.5283333, h * 0.1953333)
      ..lineTo(w * 0.5283333, h * 0.2630000)
      ..cubicTo(
          w * 0.5283333, h * 0.2706667, w * 0.5256667, h * 0.2773333, w * 0.5200000, h * 0.2823333)
      ..cubicTo(
          w * 0.5143333, h * 0.2873333, w * 0.5076667, h * 0.2903333, w * 0.5000000, h * 0.2903333)
      ..cubicTo(
          w * 0.4923333, h * 0.2903333, w * 0.4853333, h * 0.2876667, w * 0.4800000, h * 0.2826667)
      ..cubicTo(
          w * 0.4746667, h * 0.2776667, w * 0.4713333, h * 0.2706667, w * 0.4713333, h * 0.2630000)
      ..close()
      ..moveTo(w * 0.5166667, h * 0.6006667)
      ..cubicTo(
          w * 0.5166667, h * 0.5936667, w * 0.5196667, h * 0.5876667, w * 0.5256667, h * 0.5826667)
      ..cubicTo(
          w * 0.5316667, h * 0.5776667, w * 0.5383333, h * 0.5750000, w * 0.5460000, h * 0.5750000)
      ..cubicTo(
          w * 0.5536667, h * 0.5750000, w * 0.5603333, h * 0.5776667, w * 0.5663333, h * 0.5826667)
      ..cubicTo(
          w * 0.5723333, h * 0.5876667, w * 0.5753333, h * 0.5936667, w * 0.5753333, h * 0.6006667)
      ..cubicTo(
          w * 0.5753333, h * 0.6093333, w * 0.5723333, h * 0.6166667, w * 0.5663333, h * 0.6220000)
      ..cubicTo(
          w * 0.5603333, h * 0.6273333, w * 0.5536667, h * 0.6300000, w * 0.5460000, h * 0.6300000)
      ..cubicTo(
          w * 0.5383333, h * 0.6300000, w * 0.5313333, h * 0.6273333, w * 0.5256667, h * 0.6220000)
      ..cubicTo(
          w * 0.5196667, h * 0.6163333, w * 0.5166667, h * 0.6093333, w * 0.5166667, h * 0.6006667)
      ..close()
      ..moveTo(w * 0.5680000, h * 0.6990000)
      ..cubicTo(
          w * 0.5680000, h * 0.6913333, w * 0.5706667, h * 0.6846667, w * 0.5760000, h * 0.6786667)
      ..cubicTo(
          w * 0.5813333, h * 0.6730000, w * 0.5886667, h * 0.6700000, w * 0.5973333, h * 0.6700000)
      ..lineTo(w * 0.6593333, h * 0.6700000)
      ..cubicTo(
          w * 0.6680000, h * 0.6700000, w * 0.6750000, h * 0.6730000, w * 0.6803333, h * 0.6786667)
      ..cubicTo(
          w * 0.6856667, h * 0.6846667, w * 0.6883333, h * 0.6913333, w * 0.6883333, h * 0.6990000)
      ..cubicTo(
          w * 0.6883333, h * 0.7083333, w * 0.6856667, h * 0.7153333, w * 0.6806667, h * 0.7206667)
      ..cubicTo(
          w * 0.6756667, h * 0.7260000, w * 0.6683333, h * 0.7283333, w * 0.6593333, h * 0.7283333)
      ..lineTo(w * 0.5973333, h * 0.7283333)
      ..cubicTo(
          w * 0.5883333, h * 0.7283333, w * 0.5813333, h * 0.7256667, w * 0.5760000, h * 0.7206667)
      ..cubicTo(
          w * 0.5706667, h * 0.7153333, w * 0.5680000, h * 0.7083333, w * 0.5680000, h * 0.6990000)
      ..close()
      ..moveTo(w * 0.5973333, h * 0.6006667)
      ..cubicTo(
          w * 0.5973333, h * 0.5936667, w * 0.6003333, h * 0.5876667, w * 0.6063333, h * 0.5826667)
      ..cubicTo(
          w * 0.6123333, h * 0.5776667, w * 0.6190000, h * 0.5750000, w * 0.6263333, h * 0.5750000)
      ..lineTo(w * 0.7286667, h * 0.5750000)
      ..cubicTo(
          w * 0.7360000, h * 0.5750000, w * 0.7420000, h * 0.5773333, w * 0.7466667, h * 0.5823333)
      ..cubicTo(
          w * 0.7513333, h * 0.5873333, w * 0.7540000, h * 0.5933333, w * 0.7540000, h * 0.6006667)
      ..cubicTo(
          w * 0.7540000, h * 0.6096667, w * 0.7516667, h * 0.6166667, w * 0.7470000, h * 0.6220000)
      ..cubicTo(
          w * 0.7423333, h * 0.6273333, w * 0.7363333, h * 0.6300000, w * 0.7286667, h * 0.6300000)
      ..lineTo(w * 0.6263333, h * 0.6300000)
      ..cubicTo(
          w * 0.6186667, h * 0.6300000, w * 0.6120000, h * 0.6273333, w * 0.6060000, h * 0.6220000)
      ..cubicTo(
          w * 0.6003333, h * 0.6163333, w * 0.5973333, h * 0.6093333, w * 0.5973333, h * 0.6006667)
      ..close()
      ..moveTo(w * 0.6553333, h * 0.3383333)
      ..cubicTo(
          w * 0.6553333, h * 0.3300000, w * 0.6580000, h * 0.3233333, w * 0.6630000, h * 0.3186667)
      ..lineTo(w * 0.7103333, h * 0.2700000)
      ..cubicTo(
          w * 0.7163333, h * 0.2643333, w * 0.7230000, h * 0.2616667, w * 0.7300000, h * 0.2616667)
      ..cubicTo(
          w * 0.7376667, h * 0.2616667, w * 0.7443333, h * 0.2643333, w * 0.7500000, h * 0.2700000)
      ..cubicTo(
          w * 0.7556667, h * 0.2756667, w * 0.7583333, h * 0.2823333, w * 0.7583333, h * 0.2903333)
      ..cubicTo(
          w * 0.7583333, h * 0.2983333, w * 0.7556667, h * 0.3053333, w * 0.7503333, h * 0.3106667)
      ..lineTo(w * 0.7016667, h * 0.3580000)
      ..cubicTo(
          w * 0.6956667, h * 0.3633333, w * 0.6890000, h * 0.3660000, w * 0.6816667, h * 0.3660000)
      ..cubicTo(
          w * 0.6740000, h * 0.3660000, w * 0.6680000, h * 0.3633333, w * 0.6630000, h * 0.3580000)
      ..cubicTo(
          w * 0.6580000, h * 0.3530000, w * 0.6553333, h * 0.3463333, w * 0.6553333, h * 0.3383333)
      ..close()
      ..moveTo(w * 0.7306667, h * 0.5206667)
      ..cubicTo(
          w * 0.7306667, h * 0.5130000, w * 0.7333333, h * 0.5063333, w * 0.7386667, h * 0.5003333)
      ..cubicTo(
          w * 0.7443333, h * 0.4946667, w * 0.7506667, h * 0.4920000, w * 0.7576667, h * 0.4920000)
      ..lineTo(w * 0.8250000, h * 0.4920000)
      ..cubicTo(
          w * 0.8326667, h * 0.4920000, w * 0.8393333, h * 0.4950000, w * 0.8450000, h * 0.5006667)
      ..cubicTo(
          w * 0.8506667, h * 0.5063333, w * 0.8536667, h * 0.5130000, w * 0.8536667, h * 0.5206667)
      ..cubicTo(
          w * 0.8536667, h * 0.5283333, w * 0.8506667, h * 0.5350000, w * 0.8450000, h * 0.5406667)
      ..cubicTo(
          w * 0.8393333, h * 0.5463333, w * 0.8326667, h * 0.5490000, w * 0.8250000, h * 0.5490000)
      ..lineTo(w * 0.7576667, h * 0.5490000)
      ..cubicTo(
          w * 0.7500000, h * 0.5490000, w * 0.7433333, h * 0.5463333, w * 0.7383333, h * 0.5406667)
      ..cubicTo(
          w * 0.7333333, h * 0.5350000, w * 0.7306667, h * 0.5286667, w * 0.7306667, h * 0.5206667)
      ..close();
  }

  Path _dayLightningPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.05200000, h * 0.5633333)
      ..cubicTo(w * 0.05200000, h * 0.6076667, w * 0.06733333, h * 0.6456667, w * 0.09833333,
          h * 0.6776667)
      ..cubicTo(
          w * 0.1293333, h * 0.7096667, w * 0.1670000, h * 0.7266667, w * 0.2116667, h * 0.7286667)
      ..cubicTo(
          w * 0.2153333, h * 0.7286667, w * 0.2173333, h * 0.7266667, w * 0.2173333, h * 0.7230000)
      ..lineTo(w * 0.2173333, h * 0.6773333)
      ..cubicTo(
          w * 0.2173333, h * 0.6733333, w * 0.2153333, h * 0.6713333, w * 0.2116667, h * 0.6713333)
      ..cubicTo(
          w * 0.1826667, h * 0.6690000, w * 0.1583333, h * 0.6576667, w * 0.1386667, h * 0.6366667)
      ..cubicTo(
          w * 0.1190000, h * 0.6160000, w * 0.1090000, h * 0.5913333, w * 0.1090000, h * 0.5630000)
      ..cubicTo(
          w * 0.1090000, h * 0.5350000, w * 0.1183333, h * 0.5106667, w * 0.1373333, h * 0.4900000)
      ..cubicTo(
          w * 0.1563333, h * 0.4693333, w * 0.1793333, h * 0.4576667, w * 0.2073333, h * 0.4553333)
      ..lineTo(w * 0.2246667, h * 0.4526667)
      ..cubicTo(
          w * 0.2290000, h * 0.4526667, w * 0.2313333, h * 0.4506667, w * 0.2313333, h * 0.4470000)
      ..lineTo(w * 0.2333333, h * 0.4300000)
      ..cubicTo(
          w * 0.2370000, h * 0.3940000, w * 0.2520000, h * 0.3636667, w * 0.2790000, h * 0.3396667)
      ..cubicTo(
          w * 0.3060000, h * 0.3153333, w * 0.3376667, h * 0.3033333, w * 0.3743333, h * 0.3033333)
      ..cubicTo(
          w * 0.4106667, h * 0.3033333, w * 0.4423333, h * 0.3153333, w * 0.4693333, h * 0.3396667)
      ..cubicTo(
          w * 0.4963333, h * 0.3636667, w * 0.5116667, h * 0.3940000, w * 0.5156667, h * 0.4303333)
      ..lineTo(w * 0.5180000, h * 0.4496667)
      ..cubicTo(
          w * 0.5180000, h * 0.4533333, w * 0.5200000, h * 0.4553333, w * 0.5243333, h * 0.4553333)
      ..lineTo(w * 0.5776667, h * 0.4553333)
      ..cubicTo(
          w * 0.6080000, h * 0.4553333, w * 0.6336667, h * 0.4660000, w * 0.6550000, h * 0.4870000)
      ..cubicTo(
          w * 0.6763333, h * 0.5080000, w * 0.6870000, h * 0.5333333, w * 0.6870000, h * 0.5630000)
      ..cubicTo(
          w * 0.6870000, h * 0.5913333, w * 0.6770000, h * 0.6160000, w * 0.6573333, h * 0.6366667)
      ..cubicTo(
          w * 0.6376667, h * 0.6573333, w * 0.6133333, h * 0.6690000, w * 0.5843333, h * 0.6713333)
      ..cubicTo(
          w * 0.5800000, h * 0.6713333, w * 0.5776667, h * 0.6733333, w * 0.5776667, h * 0.6773333)
      ..lineTo(w * 0.5776667, h * 0.7230000)
      ..cubicTo(
          w * 0.5776667, h * 0.7266667, w * 0.5800000, h * 0.7286667, w * 0.5843333, h * 0.7286667)
      ..cubicTo(
          w * 0.6286667, h * 0.7273333, w * 0.6663333, h * 0.7103333, w * 0.6970000, h * 0.6783333)
      ..cubicTo(
          w * 0.7276667, h * 0.6463333, w * 0.7430000, h * 0.6080000, w * 0.7430000, h * 0.5633333)
      ..cubicTo(
          w * 0.7430000, h * 0.5406667, w * 0.7376667, h * 0.5176667, w * 0.7273333, h * 0.4943333)
      ..cubicTo(
          w * 0.7533333, h * 0.4630000, w * 0.7666667, h * 0.4266667, w * 0.7666667, h * 0.3853333)
      ..cubicTo(
          w * 0.7666667, h * 0.3616667, w * 0.7620000, h * 0.3390000, w * 0.7526667, h * 0.3173333)
      ..cubicTo(
          w * 0.7433333, h * 0.2956667, w * 0.7310000, h * 0.2773333, w * 0.7153333, h * 0.2616667)
      ..cubicTo(
          w * 0.6996667, h * 0.2460000, w * 0.6810000, h * 0.2336667, w * 0.6596667, h * 0.2243333)
      ..cubicTo(
          w * 0.6380000, h * 0.2153333, w * 0.6156667, h * 0.2106667, w * 0.5920000, h * 0.2106667)
      ..cubicTo(
          w * 0.5406667, h * 0.2106667, w * 0.4973333, h * 0.2300000, w * 0.4626667, h * 0.2683333)
      ..cubicTo(
          w * 0.4340000, h * 0.2546667, w * 0.4046667, h * 0.2476667, w * 0.3743333, h * 0.2476667)
      ..cubicTo(
          w * 0.3270000, h * 0.2476667, w * 0.2853333, h * 0.2620000, w * 0.2490000, h * 0.2910000)
      ..cubicTo(
          w * 0.2126667, h * 0.3200000, w * 0.1893333, h * 0.3573333, w * 0.1790000, h * 0.4033333)
      ..cubicTo(
          w * 0.1423333, h * 0.4120000, w * 0.1120000, h * 0.4310000, w * 0.08800000, h * 0.4610000)
      ..cubicTo(w * 0.06400000, h * 0.4910000, w * 0.05200000, h * 0.5250000, w * 0.05200000,
          h * 0.5633333)
      ..close()
      ..moveTo(w * 0.3020000, h * 0.9390000)
      ..lineTo(w * 0.3120000, h * 0.9390000)
      ..lineTo(w * 0.4893333, h * 0.6773333)
      ..cubicTo(
          w * 0.4906667, h * 0.6760000, w * 0.4910000, h * 0.6743333, w * 0.4900000, h * 0.6726667)
      ..cubicTo(
          w * 0.4890000, h * 0.6710000, w * 0.4876667, h * 0.6703333, w * 0.4853333, h * 0.6703333)
      ..lineTo(w * 0.4126667, h * 0.6703333)
      ..lineTo(w * 0.4893333, h * 0.5300000)
      ..cubicTo(
          w * 0.4916667, h * 0.5253333, w * 0.4903333, h * 0.5226667, w * 0.4846667, h * 0.5226667)
      ..lineTo(w * 0.3866667, h * 0.5226667)
      ..cubicTo(
          w * 0.3840000, h * 0.5226667, w * 0.3816667, h * 0.5243333, w * 0.3793333, h * 0.5273333)
      ..lineTo(w * 0.3073333, h * 0.7180000)
      ..cubicTo(
          w * 0.3066667, h * 0.7226667, w * 0.3080000, h * 0.7250000, w * 0.3120000, h * 0.7250000)
      ..lineTo(w * 0.3843333, h * 0.7250000)
      ..lineTo(w * 0.3020000, h * 0.9390000)
      ..close()
      ..moveTo(w * 0.3313333, h * 0.1530000)
      ..cubicTo(
          w * 0.3313333, h * 0.1613333, w * 0.3340000, h * 0.1683333, w * 0.3393333, h * 0.1736667)
      ..lineTo(w * 0.3613333, h * 0.1953333)
      ..cubicTo(
          w * 0.3753333, h * 0.2060000, w * 0.3886667, h * 0.2060000, w * 0.4016667, h * 0.1953333)
      ..cubicTo(
          w * 0.4070000, h * 0.1893333, w * 0.4096667, h * 0.1823333, w * 0.4096667, h * 0.1740000)
      ..cubicTo(
          w * 0.4096667, h * 0.1663333, w * 0.4070000, h * 0.1596667, w * 0.4016667, h * 0.1543333)
      ..lineTo(w * 0.3803333, h * 0.1326667)
      ..cubicTo(
          w * 0.3740000, h * 0.1270000, w * 0.3673333, h * 0.1243333, w * 0.3596667, h * 0.1243333)
      ..cubicTo(
          w * 0.3520000, h * 0.1243333, w * 0.3453333, h * 0.1270000, w * 0.3396667, h * 0.1326667)
      ..cubicTo(
          w * 0.3340000, h * 0.1383333, w * 0.3313333, h * 0.1453333, w * 0.3313333, h * 0.1530000)
      ..close()
      ..moveTo(w * 0.5093333, h * 0.3006667)
      ..cubicTo(
          w * 0.5320000, h * 0.2780000, w * 0.5596667, h * 0.2666667, w * 0.5920000, h * 0.2666667)
      ..cubicTo(
          w * 0.6246667, h * 0.2666667, w * 0.6523333, h * 0.2783333, w * 0.6750000, h * 0.3013333)
      ..cubicTo(
          w * 0.6980000, h * 0.3243333, w * 0.7093333, h * 0.3523333, w * 0.7093333, h * 0.3853333)
      ..cubicTo(
          w * 0.7093333, h * 0.4056667, w * 0.7036667, h * 0.4256667, w * 0.6923333, h * 0.4456667)
      ..cubicTo(
          w * 0.6596667, h * 0.4143333, w * 0.6213333, h * 0.3986667, w * 0.5770000, h * 0.3986667)
      ..lineTo(w * 0.5666667, h * 0.3986667)
      ..cubicTo(
          w * 0.5580000, h * 0.3606667, w * 0.5386667, h * 0.3280000, w * 0.5093333, h * 0.3006667)
      ..close()
      ..moveTo(w * 0.5633333, h * 0.1243333)
      ..cubicTo(
          w * 0.5633333, h * 0.1326667, w * 0.5660000, h * 0.1396667, w * 0.5713333, h * 0.1450000)
      ..cubicTo(
          w * 0.5766667, h * 0.1503333, w * 0.5833333, h * 0.1530000, w * 0.5916667, h * 0.1530000)
      ..cubicTo(
          w * 0.5996667, h * 0.1530000, w * 0.6060000, h * 0.1503333, w * 0.6113333, h * 0.1450000)
      ..cubicTo(
          w * 0.6166667, h * 0.1396667, w * 0.6190000, h * 0.1326667, w * 0.6190000, h * 0.1243333)
      ..lineTo(w * 0.6190000, h * 0.05633333)
      ..cubicTo(w * 0.6190000, h * 0.04833333, w * 0.6163333, h * 0.04200000, w * 0.6113333,
          h * 0.03666667)
      ..cubicTo(w * 0.6060000, h * 0.03133333, w * 0.5996667, h * 0.02900000, w * 0.5916667,
          h * 0.02900000)
      ..cubicTo(w * 0.5836667, h * 0.02900000, w * 0.5770000, h * 0.03166667, w * 0.5716667,
          h * 0.03666667)
      ..cubicTo(w * 0.5663333, h * 0.04166667, w * 0.5633333, h * 0.04833333, w * 0.5633333,
          h * 0.05633333)
      ..lineTo(w * 0.5633333, h * 0.1243333)
      ..close()
      ..moveTo(w * 0.7473333, h * 0.2016667)
      ..cubicTo(
          w * 0.7473333, h * 0.2093333, w * 0.7503333, h * 0.2160000, w * 0.7563333, h * 0.2216667)
      ..cubicTo(
          w * 0.7623333, h * 0.2273333, w * 0.7686667, h * 0.2300000, w * 0.7746667, h * 0.2300000)
      ..cubicTo(
          w * 0.7800000, h * 0.2300000, w * 0.7870000, h * 0.2273333, w * 0.7953333, h * 0.2216667)
      ..lineTo(w * 0.8433333, h * 0.1740000)
      ..cubicTo(
          w * 0.8490000, h * 0.1680000, w * 0.8516667, h * 0.1610000, w * 0.8516667, h * 0.1530000)
      ..cubicTo(
          w * 0.8516667, h * 0.1450000, w * 0.8490000, h * 0.1380000, w * 0.8433333, h * 0.1326667)
      ..cubicTo(
          w * 0.8376667, h * 0.1273333, w * 0.8310000, h * 0.1246667, w * 0.8233333, h * 0.1246667)
      ..cubicTo(
          w * 0.8160000, h * 0.1246667, w * 0.8096667, h * 0.1273333, w * 0.8040000, h * 0.1330000)
      ..lineTo(w * 0.7563333, h * 0.1806667)
      ..cubicTo(
          w * 0.7503333, h * 0.1870000, w * 0.7473333, h * 0.1940000, w * 0.7473333, h * 0.2016667)
      ..close()
      ..moveTo(w * 0.7743333, h * 0.5956667)
      ..cubicTo(
          w * 0.7743333, h * 0.6033333, w * 0.7770000, h * 0.6100000, w * 0.7823333, h * 0.6160000)
      ..lineTo(w * 0.8040000, h * 0.6380000)
      ..cubicTo(
          w * 0.8093333, h * 0.6433333, w * 0.8160000, h * 0.6460000, w * 0.8233333, h * 0.6460000)
      ..cubicTo(
          w * 0.8313333, h * 0.6460000, w * 0.8380000, h * 0.6433333, w * 0.8433333, h * 0.6376667)
      ..cubicTo(
          w * 0.8490000, h * 0.6320000, w * 0.8516667, h * 0.6250000, w * 0.8516667, h * 0.6166667)
      ..cubicTo(
          w * 0.8516667, h * 0.6090000, w * 0.8490000, h * 0.6026667, w * 0.8433333, h * 0.5976667)
      ..lineTo(w * 0.8226667, h * 0.5756667)
      ..cubicTo(
          w * 0.8163333, h * 0.5703333, w * 0.8096667, h * 0.5680000, w * 0.8020000, h * 0.5680000)
      ..cubicTo(
          w * 0.7943333, h * 0.5680000, w * 0.7876667, h * 0.5706667, w * 0.7823333, h * 0.5760000)
      ..cubicTo(
          w * 0.7770000, h * 0.5813333, w * 0.7743333, h * 0.5880000, w * 0.7743333, h * 0.5956667)
      ..close()
      ..moveTo(w * 0.8226667, h * 0.3853333)
      ..cubicTo(
          w * 0.8226667, h * 0.3926667, w * 0.8256667, h * 0.3990000, w * 0.8313333, h * 0.4043333)
      ..cubicTo(
          w * 0.8370000, h * 0.4100000, w * 0.8436667, h * 0.4126667, w * 0.8513333, h * 0.4126667)
      ..lineTo(w * 0.9193333, h * 0.4126667)
      ..cubicTo(
          w * 0.9273333, h * 0.4126667, w * 0.9340000, h * 0.4100000, w * 0.9396667, h * 0.4046667)
      ..cubicTo(
          w * 0.9453333, h * 0.3993333, w * 0.9480000, h * 0.3930000, w * 0.9480000, h * 0.3850000)
      ..cubicTo(
          w * 0.9480000, h * 0.3770000, w * 0.9450000, h * 0.3703333, w * 0.9393333, h * 0.3646667)
      ..cubicTo(
          w * 0.9336667, h * 0.3590000, w * 0.9270000, h * 0.3563333, w * 0.9193333, h * 0.3563333)
      ..lineTo(w * 0.8513333, h * 0.3563333)
      ..cubicTo(
          w * 0.8436667, h * 0.3563333, w * 0.8370000, h * 0.3590000, w * 0.8313333, h * 0.3646667)
      ..cubicTo(
          w * 0.8256667, h * 0.3706667, w * 0.8226667, h * 0.3773333, w * 0.8226667, h * 0.3853333)
      ..close();
  }

  Path _dayRainPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.05033333, h * 0.5630000)
      ..cubicTo(w * 0.05033333, h * 0.6073333, w * 0.06566667, h * 0.6456667, w * 0.09666667,
          h * 0.6776667)
      ..cubicTo(
          w * 0.1276667, h * 0.7096667, w * 0.1653333, h * 0.7266667, w * 0.2103333, h * 0.7286667)
      ..cubicTo(
          w * 0.2140000, h * 0.7286667, w * 0.2160000, h * 0.7266667, w * 0.2160000, h * 0.7230000)
      ..lineTo(w * 0.2160000, h * 0.6783333)
      ..cubicTo(
          w * 0.2160000, h * 0.6746667, w * 0.2140000, h * 0.6726667, w * 0.2103333, h * 0.6726667)
      ..cubicTo(
          w * 0.1816667, h * 0.6713333, w * 0.1573333, h * 0.6596667, w * 0.1373333, h * 0.6383333)
      ..cubicTo(
          w * 0.1173333, h * 0.6170000, w * 0.1073333, h * 0.5916667, w * 0.1073333, h * 0.5630000)
      ..cubicTo(
          w * 0.1073333, h * 0.5356667, w * 0.1166667, h * 0.5116667, w * 0.1356667, h * 0.4910000)
      ..cubicTo(
          w * 0.1546667, h * 0.4703333, w * 0.1780000, h * 0.4586667, w * 0.2056667, h * 0.4553333)
      ..lineTo(w * 0.2233333, h * 0.4536667)
      ..cubicTo(
          w * 0.2276667, h * 0.4536667, w * 0.2300000, h * 0.4516667, w * 0.2300000, h * 0.4480000)
      ..lineTo(w * 0.2323333, h * 0.4300000)
      ..cubicTo(
          w * 0.2360000, h * 0.3940000, w * 0.2510000, h * 0.3636667, w * 0.2780000, h * 0.3393333)
      ..cubicTo(
          w * 0.3050000, h * 0.3150000, w * 0.3366667, h * 0.3026667, w * 0.3730000, h * 0.3026667)
      ..cubicTo(
          w * 0.4093333, h * 0.3026667, w * 0.4410000, h * 0.3150000, w * 0.4683333, h * 0.3393333)
      ..cubicTo(
          w * 0.4956667, h * 0.3636667, w * 0.5110000, h * 0.3940000, w * 0.5150000, h * 0.4300000)
      ..lineTo(w * 0.5173333, h * 0.4490000)
      ..cubicTo(
          w * 0.5173333, h * 0.4530000, w * 0.5193333, h * 0.4553333, w * 0.5230000, h * 0.4553333)
      ..lineTo(w * 0.5770000, h * 0.4553333)
      ..cubicTo(
          w * 0.6066667, h * 0.4553333, w * 0.6320000, h * 0.4660000, w * 0.6536667, h * 0.4873333)
      ..cubicTo(
          w * 0.6753333, h * 0.5086667, w * 0.6860000, h * 0.5336667, w * 0.6860000, h * 0.5630000)
      ..cubicTo(
          w * 0.6860000, h * 0.5920000, w * 0.6760000, h * 0.6170000, w * 0.6560000, h * 0.6383333)
      ..cubicTo(
          w * 0.6360000, h * 0.6596667, w * 0.6116667, h * 0.6710000, w * 0.5833333, h * 0.6726667)
      ..cubicTo(
          w * 0.5793333, h * 0.6726667, w * 0.5770000, h * 0.6746667, w * 0.5770000, h * 0.6783333)
      ..lineTo(w * 0.5770000, h * 0.7230000)
      ..cubicTo(
          w * 0.5770000, h * 0.7266667, w * 0.5790000, h * 0.7286667, w * 0.5833333, h * 0.7286667)
      ..cubicTo(
          w * 0.6276667, h * 0.7273333, w * 0.6653333, h * 0.7103333, w * 0.6963333, h * 0.6783333)
      ..cubicTo(
          w * 0.7273333, h * 0.6460000, w * 0.7426667, h * 0.6076667, w * 0.7426667, h * 0.5633333)
      ..cubicTo(
          w * 0.7426667, h * 0.5393333, w * 0.7380000, h * 0.5170000, w * 0.7286667, h * 0.4963333)
      ..cubicTo(
          w * 0.7546667, h * 0.4640000, w * 0.7676667, h * 0.4273333, w * 0.7676667, h * 0.3860000)
      ..cubicTo(
          w * 0.7676667, h * 0.3543333, w * 0.7596667, h * 0.3250000, w * 0.7440000, h * 0.2980000)
      ..cubicTo(
          w * 0.7283333, h * 0.2710000, w * 0.7070000, h * 0.2496667, w * 0.6800000, h * 0.2340000)
      ..cubicTo(
          w * 0.6530000, h * 0.2183333, w * 0.6240000, h * 0.2106667, w * 0.5926667, h * 0.2106667)
      ..cubicTo(
          w * 0.5406667, h * 0.2106667, w * 0.4976667, h * 0.2300000, w * 0.4633333, h * 0.2686667)
      ..cubicTo(
          w * 0.4360000, h * 0.2540000, w * 0.4060000, h * 0.2466667, w * 0.3730000, h * 0.2466667)
      ..cubicTo(
          w * 0.3260000, h * 0.2466667, w * 0.2840000, h * 0.2613333, w * 0.2476667, h * 0.2906667)
      ..cubicTo(
          w * 0.2113333, h * 0.3200000, w * 0.1880000, h * 0.3573333, w * 0.1776667, h * 0.4026667)
      ..cubicTo(
          w * 0.1406667, h * 0.4113333, w * 0.1103333, h * 0.4306667, w * 0.08633333, h * 0.4606667)
      ..cubicTo(w * 0.06233333, h * 0.4906667, w * 0.05033333, h * 0.5246667, w * 0.05033333,
          h * 0.5630000)
      ..close()
      ..moveTo(w * 0.2303333, h * 0.7916667)
      ..cubicTo(
          w * 0.2303333, h * 0.7973333, w * 0.2320000, h * 0.8026667, w * 0.2356667, h * 0.8080000)
      ..cubicTo(
          w * 0.2393333, h * 0.8133333, w * 0.2446667, h * 0.8170000, w * 0.2520000, h * 0.8190000)
      ..cubicTo(
          w * 0.2556667, h * 0.8196667, w * 0.2586667, h * 0.8203333, w * 0.2610000, h * 0.8203333)
      ..cubicTo(
          w * 0.2740000, h * 0.8203333, w * 0.2826667, h * 0.8133333, w * 0.2866667, h * 0.7990000)
      ..lineTo(w * 0.3393333, h * 0.6030000)
      ..cubicTo(
          w * 0.3416667, h * 0.5950000, w * 0.3406667, h * 0.5876667, w * 0.3366667, h * 0.5806667)
      ..cubicTo(
          w * 0.3326667, h * 0.5736667, w * 0.3266667, h * 0.5696667, w * 0.3190000, h * 0.5680000)
      ..cubicTo(
          w * 0.3116667, h * 0.5656667, w * 0.3046667, h * 0.5663333, w * 0.2980000, h * 0.5703333)
      ..cubicTo(
          w * 0.2913333, h * 0.5740000, w * 0.2866667, h * 0.5796667, w * 0.2843333, h * 0.5873333)
      ..lineTo(w * 0.2316667, h * 0.7843333)
      ..cubicTo(
          w * 0.2310000, h * 0.7886667, w * 0.2303333, h * 0.7910000, w * 0.2303333, h * 0.7916667)
      ..close()
      ..moveTo(w * 0.3173333, h * 0.8943333)
      ..cubicTo(
          w * 0.3173333, h * 0.9006667, w * 0.3190000, h * 0.9063333, w * 0.3223333, h * 0.9116667)
      ..cubicTo(
          w * 0.3256667, h * 0.9170000, w * 0.3313333, h * 0.9203333, w * 0.3396667, h * 0.9216667)
      ..cubicTo(
          w * 0.3433333, h * 0.9223333, w * 0.3463333, h * 0.9230000, w * 0.3483333, h * 0.9230000)
      ..cubicTo(
          w * 0.3536667, h * 0.9230000, w * 0.3586667, h * 0.9210000, w * 0.3633333, h * 0.9173333)
      ..cubicTo(
          w * 0.3680000, h * 0.9133333, w * 0.3710000, h * 0.9080000, w * 0.3723333, h * 0.9013333)
      ..lineTo(w * 0.4523333, h * 0.6036667)
      ..cubicTo(
          w * 0.4543333, h * 0.5960000, w * 0.4536667, h * 0.5886667, w * 0.4500000, h * 0.5823333)
      ..cubicTo(
          w * 0.4463333, h * 0.5760000, w * 0.4406667, h * 0.5713333, w * 0.4333333, h * 0.5690000)
      ..cubicTo(
          w * 0.4256667, h * 0.5666667, w * 0.4183333, h * 0.5673333, w * 0.4116667, h * 0.5713333)
      ..cubicTo(
          w * 0.4050000, h * 0.5750000, w * 0.4003333, h * 0.5806667, w * 0.3983333, h * 0.5883333)
      ..lineTo(w * 0.3183333, h * 0.8860000)
      ..cubicTo(
          w * 0.3176667, h * 0.8910000, w * 0.3173333, h * 0.8940000, w * 0.3173333, h * 0.8943333)
      ..close()
      ..moveTo(w * 0.3313333, h * 0.1533333)
      ..cubicTo(
          w * 0.3313333, h * 0.1613333, w * 0.3340000, h * 0.1680000, w * 0.3396667, h * 0.1736667)
      ..lineTo(w * 0.3613333, h * 0.1956667)
      ..cubicTo(
          w * 0.3676667, h * 0.2006667, w * 0.3746667, h * 0.2030000, w * 0.3820000, h * 0.2030000)
      ..cubicTo(
          w * 0.3890000, h * 0.2030000, w * 0.3956667, h * 0.2003333, w * 0.4013333, h * 0.1953333)
      ..cubicTo(
          w * 0.4070000, h * 0.1900000, w * 0.4100000, h * 0.1836667, w * 0.4100000, h * 0.1756667)
      ..cubicTo(
          w * 0.4100000, h * 0.1676667, w * 0.4073333, h * 0.1603333, w * 0.4020000, h * 0.1543333)
      ..lineTo(w * 0.3806667, h * 0.1326667)
      ..cubicTo(
          w * 0.3746667, h * 0.1270000, w * 0.3680000, h * 0.1243333, w * 0.3606667, h * 0.1243333)
      ..cubicTo(
          w * 0.3526667, h * 0.1243333, w * 0.3456667, h * 0.1273333, w * 0.3400000, h * 0.1330000)
      ..cubicTo(
          w * 0.3343333, h * 0.1386667, w * 0.3313333, h * 0.1456667, w * 0.3313333, h * 0.1533333)
      ..close()
      ..moveTo(w * 0.4556667, h * 0.7923333)
      ..cubicTo(
          w * 0.4556667, h * 0.7976667, w * 0.4573333, h * 0.8030000, w * 0.4606667, h * 0.8080000)
      ..cubicTo(
          w * 0.4640000, h * 0.8130000, w * 0.4693333, h * 0.8166667, w * 0.4760000, h * 0.8186667)
      ..cubicTo(
          w * 0.4796667, h * 0.8193333, w * 0.4826667, h * 0.8200000, w * 0.4843333, h * 0.8200000)
      ..cubicTo(
          w * 0.4900000, h * 0.8200000, w * 0.4956667, h * 0.8183333, w * 0.5006667, h * 0.8150000)
      ..cubicTo(
          w * 0.5056667, h * 0.8116667, w * 0.5090000, h * 0.8063333, w * 0.5106667, h * 0.7986667)
      ..lineTo(w * 0.5633333, h * 0.6026667)
      ..cubicTo(
          w * 0.5653333, h * 0.5950000, w * 0.5646667, h * 0.5876667, w * 0.5610000, h * 0.5813333)
      ..cubicTo(
          w * 0.5573333, h * 0.5746667, w * 0.5516667, h * 0.5703333, w * 0.5443333, h * 0.5680000)
      ..cubicTo(
          w * 0.5363333, h * 0.5656667, w * 0.5293333, h * 0.5663333, w * 0.5226667, h * 0.5703333)
      ..cubicTo(
          w * 0.5160000, h * 0.5740000, w * 0.5116667, h * 0.5796667, w * 0.5096667, h * 0.5873333)
      ..lineTo(w * 0.4570000, h * 0.7843333)
      ..cubicTo(
          w * 0.4563333, h * 0.7893333, w * 0.4556667, h * 0.7920000, w * 0.4556667, h * 0.7923333)
      ..close()
      ..moveTo(w * 0.5100000, h * 0.3010000)
      ..cubicTo(
          w * 0.5336667, h * 0.2786667, w * 0.5610000, h * 0.2676667, w * 0.5926667, h * 0.2676667)
      ..cubicTo(
          w * 0.6253333, h * 0.2676667, w * 0.6533333, h * 0.2793333, w * 0.6760000, h * 0.3023333)
      ..cubicTo(
          w * 0.6990000, h * 0.3253333, w * 0.7103333, h * 0.3533333, w * 0.7103333, h * 0.3863333)
      ..cubicTo(
          w * 0.7103333, h * 0.4070000, w * 0.7046667, h * 0.4276667, w * 0.6930000, h * 0.4480000)
      ..cubicTo(
          w * 0.6606667, h * 0.4156667, w * 0.6220000, h * 0.3996667, w * 0.5766667, h * 0.3996667)
      ..lineTo(w * 0.5656667, h * 0.3996667)
      ..cubicTo(
          w * 0.5566667, h * 0.3603333, w * 0.5380000, h * 0.3276667, w * 0.5100000, h * 0.3010000)
      ..close()
      ..moveTo(w * 0.5640000, h * 0.1260000)
      ..cubicTo(
          w * 0.5640000, h * 0.1336667, w * 0.5666667, h * 0.1403333, w * 0.5723333, h * 0.1456667)
      ..cubicTo(
          w * 0.5780000, h * 0.1510000, w * 0.5846667, h * 0.1536667, w * 0.5926667, h * 0.1536667)
      ..cubicTo(
          w * 0.6003333, h * 0.1536667, w * 0.6070000, h * 0.1510000, w * 0.6123333, h * 0.1460000)
      ..cubicTo(
          w * 0.6176667, h * 0.1406667, w * 0.6203333, h * 0.1343333, w * 0.6203333, h * 0.1263333)
      ..lineTo(w * 0.6203333, h * 0.05766667)
      ..cubicTo(w * 0.6203333, h * 0.04900000, w * 0.6176667, h * 0.04200000, w * 0.6126667,
          h * 0.03666667)
      ..cubicTo(w * 0.6073333, h * 0.03133333, w * 0.6010000, h * 0.02866667, w * 0.5930000,
          h * 0.02866667)
      ..cubicTo(w * 0.5846667, h * 0.02866667, w * 0.5776667, h * 0.03133333, w * 0.5723333,
          h * 0.03700000)
      ..cubicTo(w * 0.5670000, h * 0.04266667, w * 0.5643333, h * 0.04933333, w * 0.5643333,
          h * 0.05766667)
      ..lineTo(w * 0.5643333, h * 0.1260000)
      ..close()
      ..moveTo(w * 0.7483333, h * 0.2020000)
      ..cubicTo(
          w * 0.7483333, h * 0.2100000, w * 0.7513333, h * 0.2166667, w * 0.7573333, h * 0.2216667)
      ..cubicTo(
          w * 0.7620000, h * 0.2270000, w * 0.7680000, h * 0.2296667, w * 0.7756667, h * 0.2303333)
      ..cubicTo(
          w * 0.7833333, h * 0.2310000, w * 0.7903333, h * 0.2280000, w * 0.7963333, h * 0.2216667)
      ..lineTo(w * 0.8443333, h * 0.1740000)
      ..cubicTo(
          w * 0.8503333, h * 0.1683333, w * 0.8530000, h * 0.1613333, w * 0.8530000, h * 0.1530000)
      ..cubicTo(
          w * 0.8530000, h * 0.1450000, w * 0.8503333, h * 0.1380000, w * 0.8446667, h * 0.1326667)
      ..cubicTo(
          w * 0.8390000, h * 0.1273333, w * 0.8323333, h * 0.1246667, w * 0.8243333, h * 0.1246667)
      ..cubicTo(
          w * 0.8173333, h * 0.1246667, w * 0.8110000, h * 0.1273333, w * 0.8050000, h * 0.1330000)
      ..lineTo(w * 0.7573333, h * 0.1810000)
      ..cubicTo(
          w * 0.7513333, h * 0.1866667, w * 0.7483333, h * 0.1936667, w * 0.7483333, h * 0.2020000)
      ..close()
      ..moveTo(w * 0.7753333, h * 0.5970000)
      ..cubicTo(
          w * 0.7753333, h * 0.6050000, w * 0.7780000, h * 0.6120000, w * 0.7833333, h * 0.6180000)
      ..lineTo(w * 0.8050000, h * 0.6390000)
      ..cubicTo(
          w * 0.8110000, h * 0.6436667, w * 0.8176667, h * 0.6460000, w * 0.8250000, h * 0.6460000)
      ..lineTo(w * 0.8256667, h * 0.6466667)
      ..cubicTo(
          w * 0.8333333, h * 0.6466667, w * 0.8396667, h * 0.6440000, w * 0.8450000, h * 0.6386667)
      ..cubicTo(
          w * 0.8503333, h * 0.6333333, w * 0.8530000, h * 0.6263333, w * 0.8530000, h * 0.6183333)
      ..cubicTo(
          w * 0.8530000, h * 0.6103333, w * 0.8500000, h * 0.6040000, w * 0.8443333, h * 0.5990000)
      ..lineTo(w * 0.8236667, h * 0.5770000)
      ..cubicTo(
          w * 0.8176667, h * 0.5716667, w * 0.8106667, h * 0.5690000, w * 0.8030000, h * 0.5690000)
      ..cubicTo(
          w * 0.7953333, h * 0.5690000, w * 0.7886667, h * 0.5716667, w * 0.7833333, h * 0.5773333)
      ..cubicTo(
          w * 0.7780000, h * 0.5830000, w * 0.7753333, h * 0.5890000, w * 0.7753333, h * 0.5970000)
      ..close()
      ..moveTo(w * 0.8240000, h * 0.3860000)
      ..cubicTo(
          w * 0.8240000, h * 0.3940000, w * 0.8270000, h * 0.4003333, w * 0.8326667, h * 0.4056667)
      ..cubicTo(
          w * 0.8386667, h * 0.4116667, w * 0.8453333, h * 0.4143333, w * 0.8533333, h * 0.4143333)
      ..lineTo(w * 0.9210000, h * 0.4143333)
      ..cubicTo(
          w * 0.9290000, h * 0.4143333, w * 0.9356667, h * 0.4116667, w * 0.9413333, h * 0.4060000)
      ..cubicTo(
          w * 0.9470000, h * 0.4003333, w * 0.9496667, h * 0.3936667, w * 0.9496667, h * 0.3860000)
      ..cubicTo(
          w * 0.9496667, h * 0.3780000, w * 0.9470000, h * 0.3713333, w * 0.9413333, h * 0.3656667)
      ..cubicTo(
          w * 0.9356667, h * 0.3600000, w * 0.9290000, h * 0.3570000, w * 0.9210000, h * 0.3570000)
      ..lineTo(w * 0.8533333, h * 0.3570000)
      ..cubicTo(
          w * 0.8453333, h * 0.3570000, w * 0.8386667, h * 0.3600000, w * 0.8326667, h * 0.3656667)
      ..cubicTo(
          w * 0.8266667, h * 0.3713333, w * 0.8240000, h * 0.3780000, w * 0.8240000, h * 0.3860000)
      ..close();
  }

  Path _dayRainMixPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.04933333, h * 0.5650000)
      ..cubicTo(w * 0.04933333, h * 0.6090000, w * 0.06466667, h * 0.6470000, w * 0.09500000,
          h * 0.6783333)
      ..cubicTo(
          w * 0.1253333, h * 0.7096667, w * 0.1630000, h * 0.7266667, w * 0.2076667, h * 0.7286667)
      ..cubicTo(
          w * 0.2116667, h * 0.7286667, w * 0.2136667, h * 0.7266667, w * 0.2136667, h * 0.7230000)
      ..lineTo(w * 0.2136667, h * 0.6786667)
      ..cubicTo(
          w * 0.2136667, h * 0.6746667, w * 0.2116667, h * 0.6726667, w * 0.2076667, h * 0.6726667)
      ..cubicTo(
          w * 0.1790000, h * 0.6713333, w * 0.1550000, h * 0.6600000, w * 0.1353333, h * 0.6393333)
      ..cubicTo(
          w * 0.1156667, h * 0.6186667, w * 0.1060000, h * 0.5936667, w * 0.1060000, h * 0.5646667)
      ..cubicTo(
          w * 0.1060000, h * 0.5366667, w * 0.1153333, h * 0.5120000, w * 0.1340000, h * 0.4916667)
      ..cubicTo(
          w * 0.1526667, h * 0.4710000, w * 0.1760000, h * 0.4596667, w * 0.2040000, h * 0.4573333)
      ..lineTo(w * 0.2216667, h * 0.4546667)
      ..cubicTo(
          w * 0.2253333, h * 0.4546667, w * 0.2270000, h * 0.4530000, w * 0.2270000, h * 0.4500000)
      ..lineTo(w * 0.2296667, h * 0.4316667)
      ..cubicTo(
          w * 0.2336667, h * 0.3953333, w * 0.2493333, h * 0.3650000, w * 0.2756667, h * 0.3410000)
      ..cubicTo(
          w * 0.3020000, h * 0.3170000, w * 0.3333333, h * 0.3053333, w * 0.3700000, h * 0.3053333)
      ..cubicTo(
          w * 0.4066667, h * 0.3053333, w * 0.4383333, h * 0.3173333, w * 0.4653333, h * 0.3413333)
      ..cubicTo(
          w * 0.4926667, h * 0.3653333, w * 0.5080000, h * 0.3953333, w * 0.5113333, h * 0.4310000)
      ..lineTo(w * 0.5136667, h * 0.4503333)
      ..cubicTo(
          w * 0.5143333, h * 0.4540000, w * 0.5170000, h * 0.4560000, w * 0.5210000, h * 0.4560000)
      ..lineTo(w * 0.5743333, h * 0.4560000)
      ..cubicTo(
          w * 0.6040000, h * 0.4560000, w * 0.6293333, h * 0.4666667, w * 0.6506667, h * 0.4880000)
      ..cubicTo(
          w * 0.6720000, h * 0.5093333, w * 0.6826667, h * 0.5350000, w * 0.6826667, h * 0.5650000)
      ..cubicTo(
          w * 0.6826667, h * 0.5940000, w * 0.6730000, h * 0.6186667, w * 0.6533333, h * 0.6396667)
      ..cubicTo(
          w * 0.6336667, h * 0.6606667, w * 0.6096667, h * 0.6713333, w * 0.5810000, h * 0.6730000)
      ..cubicTo(
          w * 0.5766667, h * 0.6730000, w * 0.5743333, h * 0.6750000, w * 0.5743333, h * 0.6790000)
      ..lineTo(w * 0.5743333, h * 0.7233333)
      ..cubicTo(
          w * 0.5743333, h * 0.7270000, w * 0.5766667, h * 0.7290000, w * 0.5810000, h * 0.7290000)
      ..cubicTo(
          w * 0.6253333, h * 0.7276667, w * 0.6626667, h * 0.7110000, w * 0.6933333, h * 0.6793333)
      ..cubicTo(
          w * 0.7236667, h * 0.6476667, w * 0.7390000, h * 0.6096667, w * 0.7390000, h * 0.5653333)
      ..cubicTo(
          w * 0.7390000, h * 0.5426667, w * 0.7346667, h * 0.5206667, w * 0.7263333, h * 0.4983333)
      ..cubicTo(
          w * 0.7523333, h * 0.4663333, w * 0.7650000, h * 0.4290000, w * 0.7650000, h * 0.3866667)
      ..cubicTo(
          w * 0.7650000, h * 0.3630000, w * 0.7603333, h * 0.3406667, w * 0.7513333, h * 0.3190000)
      ..cubicTo(
          w * 0.7423333, h * 0.2973333, w * 0.7296667, h * 0.2790000, w * 0.7140000, h * 0.2633333)
      ..cubicTo(
          w * 0.6983333, h * 0.2476667, w * 0.6796667, h * 0.2353333, w * 0.6583333, h * 0.2260000)
      ..cubicTo(
          w * 0.6370000, h * 0.2166667, w * 0.6140000, h * 0.2120000, w * 0.5903333, h * 0.2120000)
      ..cubicTo(
          w * 0.5390000, h * 0.2120000, w * 0.4960000, h * 0.2313333, w * 0.4616667, h * 0.2700000)
      ..cubicTo(
          w * 0.4320000, h * 0.2553333, w * 0.4013333, h * 0.2480000, w * 0.3703333, h * 0.2480000)
      ..cubicTo(
          w * 0.3233333, h * 0.2480000, w * 0.2816667, h * 0.2626667, w * 0.2456667, h * 0.2916667)
      ..cubicTo(
          w * 0.2096667, h * 0.3206667, w * 0.1866667, h * 0.3583333, w * 0.1763333, h * 0.4043333)
      ..cubicTo(
          w * 0.1390000, h * 0.4130000, w * 0.1083333, h * 0.4320000, w * 0.08466667, h * 0.4620000)
      ..cubicTo(w * 0.06100000, h * 0.4920000, w * 0.04933333, h * 0.5263333, w * 0.04933333,
          h * 0.5650000)
      ..close()
      ..moveTo(w * 0.2276667, h * 0.7993333)
      ..cubicTo(
          w * 0.2276667, h * 0.8050000, w * 0.2293333, h * 0.8106667, w * 0.2330000, h * 0.8163333)
      ..cubicTo(
          w * 0.2366667, h * 0.8220000, w * 0.2420000, h * 0.8256667, w * 0.2486667, h * 0.8280000)
      ..cubicTo(
          w * 0.2563333, h * 0.8303333, w * 0.2636667, h * 0.8300000, w * 0.2700000, h * 0.8266667)
      ..cubicTo(
          w * 0.2766667, h * 0.8236667, w * 0.2810000, h * 0.8173333, w * 0.2833333, h * 0.8080000)
      ..lineTo(w * 0.2880000, h * 0.7876667)
      ..cubicTo(
          w * 0.2896667, h * 0.7800000, w * 0.2886667, h * 0.7730000, w * 0.2846667, h * 0.7666667)
      ..cubicTo(
          w * 0.2806667, h * 0.7600000, w * 0.2750000, h * 0.7556667, w * 0.2673333, h * 0.7533333)
      ..cubicTo(
          w * 0.2596667, h * 0.7510000, w * 0.2526667, h * 0.7520000, w * 0.2460000, h * 0.7560000)
      ..cubicTo(
          w * 0.2393333, h * 0.7600000, w * 0.2353333, h * 0.7656667, w * 0.2333333, h * 0.7733333)
      ..lineTo(w * 0.2286667, h * 0.7930000)
      ..cubicTo(
          w * 0.2280000, h * 0.7950000, w * 0.2276667, h * 0.7970000, w * 0.2276667, h * 0.7993333)
      ..close()
      ..moveTo(w * 0.2533333, h * 0.7026667)
      ..cubicTo(
          w * 0.2533333, h * 0.7100000, w * 0.2560000, h * 0.7163333, w * 0.2613333, h * 0.7216667)
      ..cubicTo(
          w * 0.2666667, h * 0.7276667, w * 0.2730000, h * 0.7303333, w * 0.2800000, h * 0.7303333)
      ..cubicTo(
          w * 0.2880000, h * 0.7303333, w * 0.2946667, h * 0.7276667, w * 0.3000000, h * 0.7223333)
      ..cubicTo(
          w * 0.3056667, h * 0.7170000, w * 0.3083333, h * 0.7106667, w * 0.3083333, h * 0.7026667)
      ..cubicTo(
          w * 0.3083333, h * 0.6950000, w * 0.3056667, h * 0.6883333, w * 0.3000000, h * 0.6830000)
      ..cubicTo(
          w * 0.2943333, h * 0.6776667, w * 0.2876667, h * 0.6750000, w * 0.2800000, h * 0.6750000)
      ..cubicTo(
          w * 0.2723333, h * 0.6750000, w * 0.2660000, h * 0.6776667, w * 0.2606667, h * 0.6826667)
      ..cubicTo(
          w * 0.2553333, h * 0.6876667, w * 0.2533333, h * 0.6950000, w * 0.2533333, h * 0.7026667)
      ..close()
      ..moveTo(w * 0.2736667, h * 0.6270000)
      ..cubicTo(
          w * 0.2733333, h * 0.6323333, w * 0.2746667, h * 0.6373333, w * 0.2780000, h * 0.6420000)
      ..cubicTo(
          w * 0.2813333, h * 0.6470000, w * 0.2866667, h * 0.6503333, w * 0.2940000, h * 0.6526667)
      ..cubicTo(
          w * 0.3010000, h * 0.6546667, w * 0.3076667, h * 0.6540000, w * 0.3146667, h * 0.6503333)
      ..cubicTo(
          w * 0.3216667, h * 0.6466667, w * 0.3263333, h * 0.6410000, w * 0.3286667, h * 0.6333333)
      ..lineTo(w * 0.3376667, h * 0.6033333)
      ..cubicTo(
          w * 0.3400000, h * 0.5953333, w * 0.3393333, h * 0.5880000, w * 0.3353333, h * 0.5816667)
      ..cubicTo(
          w * 0.3313333, h * 0.5753333, w * 0.3253333, h * 0.5710000, w * 0.3173333, h * 0.5686667)
      ..cubicTo(
          w * 0.3100000, h * 0.5663333, w * 0.3030000, h * 0.5670000, w * 0.2963333, h * 0.5710000)
      ..cubicTo(
          w * 0.2896667, h * 0.5746667, w * 0.2850000, h * 0.5803333, w * 0.2826667, h * 0.5876667)
      ..lineTo(w * 0.2746667, h * 0.6183333)
      ..cubicTo(
          w * 0.2740000, h * 0.6236667, w * 0.2736667, h * 0.6266667, w * 0.2736667, h * 0.6270000)
      ..close()
      ..moveTo(w * 0.3120000, h * 0.9033333)
      ..cubicTo(
          w * 0.3120000, h * 0.9090000, w * 0.3136667, h * 0.9143333, w * 0.3173333, h * 0.9196667)
      ..cubicTo(
          w * 0.3210000, h * 0.9250000, w * 0.3263333, h * 0.9286667, w * 0.3336667, h * 0.9306667)
      ..cubicTo(
          w * 0.3366667, h * 0.9313333, w * 0.3393333, h * 0.9316667, w * 0.3416667, h * 0.9316667)
      ..cubicTo(
          w * 0.3560000, h * 0.9316667, w * 0.3650000, h * 0.9250000, w * 0.3683333, h * 0.9113333)
      ..lineTo(w * 0.3726667, h * 0.8916667)
      ..cubicTo(
          w * 0.3746667, h * 0.8830000, w * 0.3736667, h * 0.8756667, w * 0.3700000, h * 0.8690000)
      ..cubicTo(
          w * 0.3663333, h * 0.8623333, w * 0.3603333, h * 0.8583333, w * 0.3526667, h * 0.8566667)
      ..cubicTo(
          w * 0.3456667, h * 0.8543333, w * 0.3386667, h * 0.8550000, w * 0.3316667, h * 0.8590000)
      ..cubicTo(
          w * 0.3246667, h * 0.8630000, w * 0.3203333, h * 0.8686667, w * 0.3180000, h * 0.8760000)
      ..lineTo(w * 0.3133333, h * 0.8960000)
      ..cubicTo(
          w * 0.3123333, h * 0.8996667, w * 0.3120000, h * 0.9023333, w * 0.3120000, h * 0.9033333)
      ..close()
      ..moveTo(w * 0.3306667, h * 0.1553333)
      ..cubicTo(
          w * 0.3306667, h * 0.1633333, w * 0.3333333, h * 0.1700000, w * 0.3386667, h * 0.1753333)
      ..lineTo(w * 0.3606667, h * 0.1966667)
      ..cubicTo(
          w * 0.3653333, h * 0.2020000, w * 0.3713333, h * 0.2046667, w * 0.3786667, h * 0.2053333)
      ..cubicTo(
          w * 0.3860000, h * 0.2060000, w * 0.3930000, h * 0.2030000, w * 0.3993333, h * 0.1966667)
      ..cubicTo(
          w * 0.4046667, h * 0.1913333, w * 0.4073333, h * 0.1846667, w * 0.4073333, h * 0.1770000)
      ..cubicTo(
          w * 0.4073333, h * 0.1690000, w * 0.4046667, h * 0.1623333, w * 0.3993333, h * 0.1570000)
      ..lineTo(w * 0.3783333, h * 0.1353333)
      ..cubicTo(
          w * 0.3733333, h * 0.1300000, w * 0.3666667, h * 0.1273333, w * 0.3590000, h * 0.1266667)
      ..cubicTo(
          w * 0.3513333, h * 0.1266667, w * 0.3446667, h * 0.1293333, w * 0.3390000, h * 0.1350000)
      ..cubicTo(
          w * 0.3336667, h * 0.1406667, w * 0.3306667, h * 0.1473333, w * 0.3306667, h * 0.1553333)
      ..close()
      ..moveTo(w * 0.3383333, h * 0.8066667)
      ..cubicTo(
          w * 0.3383333, h * 0.8143333, w * 0.3410000, h * 0.8206667, w * 0.3463333, h * 0.8260000)
      ..cubicTo(
          w * 0.3516667, h * 0.8313333, w * 0.3583333, h * 0.8340000, w * 0.3656667, h * 0.8340000)
      ..cubicTo(
          w * 0.3736667, h * 0.8340000, w * 0.3800000, h * 0.8313333, w * 0.3853333, h * 0.8263333)
      ..cubicTo(
          w * 0.3906667, h * 0.8210000, w * 0.3930000, h * 0.8146667, w * 0.3930000, h * 0.8066667)
      ..cubicTo(
          w * 0.3930000, h * 0.7990000, w * 0.3903333, h * 0.7926667, w * 0.3853333, h * 0.7873333)
      ..cubicTo(
          w * 0.3800000, h * 0.7820000, w * 0.3736667, h * 0.7796667, w * 0.3656667, h * 0.7796667)
      ..cubicTo(
          w * 0.3576667, h * 0.7796667, w * 0.3513333, h * 0.7823333, w * 0.3460000, h * 0.7873333)
      ..cubicTo(
          w * 0.3406667, h * 0.7923333, w * 0.3383333, h * 0.7990000, w * 0.3383333, h * 0.8066667)
      ..close()
      ..moveTo(w * 0.3590000, h * 0.7310000)
      ..cubicTo(
          w * 0.3586667, h * 0.7360000, w * 0.3600000, h * 0.7413333, w * 0.3636667, h * 0.7466667)
      ..cubicTo(
          w * 0.3670000, h * 0.7520000, w * 0.3720000, h * 0.7553333, w * 0.3786667, h * 0.7566667)
      ..cubicTo(
          w * 0.3863333, h * 0.7586667, w * 0.3933333, h * 0.7580000, w * 0.4000000, h * 0.7546667)
      ..cubicTo(
          w * 0.4066667, h * 0.7513333, w * 0.4110000, h * 0.7450000, w * 0.4136667, h * 0.7360000)
      ..lineTo(w * 0.4223333, h * 0.7060000)
      ..cubicTo(
          w * 0.4246667, h * 0.6986667, w * 0.4240000, h * 0.6916667, w * 0.4200000, h * 0.6850000)
      ..cubicTo(
          w * 0.4160000, h * 0.6783333, w * 0.4103333, h * 0.6740000, w * 0.4023333, h * 0.6716667)
      ..cubicTo(
          w * 0.3950000, h * 0.6693333, w * 0.3880000, h * 0.6703333, w * 0.3810000, h * 0.6743333)
      ..cubicTo(
          w * 0.3740000, h * 0.6783333, w * 0.3696667, h * 0.6843333, w * 0.3673333, h * 0.6920000)
      ..lineTo(w * 0.3600000, h * 0.7220000)
      ..cubicTo(
          w * 0.3593333, h * 0.7246667, w * 0.3590000, h * 0.7276667, w * 0.3590000, h * 0.7310000)
      ..close()
      ..moveTo(w * 0.4510000, h * 0.8026667)
      ..cubicTo(
          w * 0.4510000, h * 0.8083333, w * 0.4526667, h * 0.8136667, w * 0.4560000, h * 0.8186667)
      ..cubicTo(
          w * 0.4593333, h * 0.8236667, w * 0.4643333, h * 0.8273333, w * 0.4713333, h * 0.8293333)
      ..cubicTo(
          w * 0.4723333, h * 0.8293333, w * 0.4740000, h * 0.8296667, w * 0.4760000, h * 0.8300000)
      ..cubicTo(
          w * 0.4780000, h * 0.8303333, w * 0.4796667, h * 0.8306667, w * 0.4806667, h * 0.8306667)
      ..cubicTo(
          w * 0.4943333, h * 0.8306667, w * 0.5026667, h * 0.8233333, w * 0.5060000, h * 0.8086667)
      ..lineTo(w * 0.5106667, h * 0.7886667)
      ..cubicTo(
          w * 0.5130000, h * 0.7816667, w * 0.5123333, h * 0.7746667, w * 0.5083333, h * 0.7676667)
      ..cubicTo(
          w * 0.5043333, h * 0.7606667, w * 0.4986667, h * 0.7563333, w * 0.4913333, h * 0.7540000)
      ..cubicTo(
          w * 0.4830000, h * 0.7520000, w * 0.4753333, h * 0.7526667, w * 0.4686667, h * 0.7566667)
      ..cubicTo(
          w * 0.4620000, h * 0.7606667, w * 0.4573333, h * 0.7663333, w * 0.4550000, h * 0.7743333)
      ..lineTo(w * 0.4520000, h * 0.7940000)
      ..cubicTo(
          w * 0.4520000, h * 0.7943333, w * 0.4520000, h * 0.7956667, w * 0.4516667, h * 0.7976667)
      ..cubicTo(
          w * 0.4513333, h * 0.8000000, w * 0.4510000, h * 0.8013333, w * 0.4510000, h * 0.8026667)
      ..close()
      ..moveTo(w * 0.4756667, h * 0.7040000)
      ..cubicTo(
          w * 0.4756667, h * 0.7116667, w * 0.4783333, h * 0.7180000, w * 0.4836667, h * 0.7230000)
      ..cubicTo(
          w * 0.4886667, h * 0.7283333, w * 0.4950000, h * 0.7310000, w * 0.5030000, h * 0.7310000)
      ..cubicTo(
          w * 0.5110000, h * 0.7310000, w * 0.5173333, h * 0.7283333, w * 0.5226667, h * 0.7233333)
      ..cubicTo(
          w * 0.5280000, h * 0.7180000, w * 0.5303333, h * 0.7116667, w * 0.5303333, h * 0.7040000)
      ..cubicTo(
          w * 0.5303333, h * 0.6960000, w * 0.5276667, h * 0.6896667, w * 0.5226667, h * 0.6843333)
      ..cubicTo(
          w * 0.5173333, h * 0.6790000, w * 0.5110000, h * 0.6766667, w * 0.5030000, h * 0.6766667)
      ..cubicTo(
          w * 0.4950000, h * 0.6766667, w * 0.4886667, h * 0.6793333, w * 0.4833333, h * 0.6843333)
      ..cubicTo(
          w * 0.4780000, h * 0.6893333, w * 0.4756667, h * 0.6960000, w * 0.4756667, h * 0.7040000)
      ..close()
      ..moveTo(w * 0.4960000, h * 0.6270000)
      ..cubicTo(
          w * 0.4960000, h * 0.6326667, w * 0.4976667, h * 0.6380000, w * 0.5013333, h * 0.6430000)
      ..cubicTo(
          w * 0.5050000, h * 0.6480000, w * 0.5103333, h * 0.6516667, w * 0.5176667, h * 0.6536667)
      ..cubicTo(
          w * 0.5183333, h * 0.6536667, w * 0.5196667, h * 0.6540000, w * 0.5216667, h * 0.6543333)
      ..cubicTo(
          w * 0.5236667, h * 0.6546667, w * 0.5253333, h * 0.6550000, w * 0.5263333, h * 0.6550000)
      ..cubicTo(
          w * 0.5300000, h * 0.6550000, w * 0.5340000, h * 0.6540000, w * 0.5386667, h * 0.6520000)
      ..cubicTo(
          w * 0.5456667, h * 0.6483333, w * 0.5500000, h * 0.6426667, w * 0.5520000, h * 0.6346667)
      ..lineTo(w * 0.5600000, h * 0.6046667)
      ..cubicTo(
          w * 0.5620000, h * 0.5970000, w * 0.5613333, h * 0.5900000, w * 0.5576667, h * 0.5836667)
      ..cubicTo(
          w * 0.5540000, h * 0.5773333, w * 0.5483333, h * 0.5726667, w * 0.5410000, h * 0.5703333)
      ..cubicTo(
          w * 0.5333333, h * 0.5680000, w * 0.5260000, h * 0.5686667, w * 0.5196667, h * 0.5723333)
      ..cubicTo(
          w * 0.5130000, h * 0.5760000, w * 0.5086667, h * 0.5813333, w * 0.5063333, h * 0.5893333)
      ..lineTo(w * 0.4970000, h * 0.6196667)
      ..cubicTo(
          w * 0.4970000, h * 0.6203333, w * 0.4970000, h * 0.6213333, w * 0.4966667, h * 0.6233333)
      ..cubicTo(
          w * 0.4963333, h * 0.6243333, w * 0.4960000, h * 0.6256667, w * 0.4960000, h * 0.6270000)
      ..close()
      ..moveTo(w * 0.5076667, h * 0.3030000)
      ..cubicTo(
          w * 0.5296667, h * 0.2810000, w * 0.5570000, h * 0.2700000, w * 0.5900000, h * 0.2700000)
      ..cubicTo(
          w * 0.6230000, h * 0.2700000, w * 0.6510000, h * 0.2813333, w * 0.6740000, h * 0.3040000)
      ..cubicTo(
          w * 0.6970000, h * 0.3266667, w * 0.7086667, h * 0.3540000, w * 0.7086667, h * 0.3866667)
      ..cubicTo(
          w * 0.7086667, h * 0.4086667, w * 0.7026667, h * 0.4296667, w * 0.6910000, h * 0.4493333)
      ..cubicTo(
          w * 0.6583333, h * 0.4166667, w * 0.6193333, h * 0.4003333, w * 0.5743333, h * 0.4003333)
      ..lineTo(w * 0.5640000, h * 0.4003333)
      ..cubicTo(
          w * 0.5546667, h * 0.3636667, w * 0.5356667, h * 0.3313333, w * 0.5076667, h * 0.3030000)
      ..close()
      ..moveTo(w * 0.5626667, h * 0.1276667)
      ..cubicTo(
          w * 0.5626667, h * 0.1353333, w * 0.5653333, h * 0.1416667, w * 0.5703333, h * 0.1470000)
      ..cubicTo(
          w * 0.5753333, h * 0.1520000, w * 0.5820000, h * 0.1546667, w * 0.5900000, h * 0.1546667)
      ..cubicTo(
          w * 0.5980000, h * 0.1546667, w * 0.6050000, h * 0.1520000, w * 0.6106667, h * 0.1470000)
      ..cubicTo(
          w * 0.6163333, h * 0.1420000, w * 0.6190000, h * 0.1353333, w * 0.6190000, h * 0.1276667)
      ..lineTo(w * 0.6190000, h * 0.05866667)
      ..cubicTo(w * 0.6190000, h * 0.05100000, w * 0.6160000, h * 0.04433333, w * 0.6103333,
          h * 0.03866667)
      ..cubicTo(w * 0.6046667, h * 0.03300000, w * 0.5976667, h * 0.03033333, w * 0.5900000,
          h * 0.03033333)
      ..cubicTo(w * 0.5823333, h * 0.03033333, w * 0.5756667, h * 0.03300000, w * 0.5706667,
          h * 0.03866667)
      ..cubicTo(w * 0.5653333, h * 0.04433333, w * 0.5630000, h * 0.05100000, w * 0.5630000,
          h * 0.05866667)
      ..lineTo(w * 0.5630000, h * 0.1276667)
      ..close()
      ..moveTo(w * 0.7466667, h * 0.2030000)
      ..cubicTo(
          w * 0.7466667, h * 0.2113333, w * 0.7493333, h * 0.2180000, w * 0.7543333, h * 0.2230000)
      ..cubicTo(
          w * 0.7663333, h * 0.2350000, w * 0.7796667, h * 0.2350000, w * 0.7946667, h * 0.2230000)
      ..lineTo(w * 0.8423333, h * 0.1753333)
      ..cubicTo(
          w * 0.8480000, h * 0.1696667, w * 0.8506667, h * 0.1626667, w * 0.8506667, h * 0.1543333)
      ..cubicTo(
          w * 0.8506667, h * 0.1463333, w * 0.8480000, h * 0.1396667, w * 0.8423333, h * 0.1343333)
      ..cubicTo(
          w * 0.8366667, h * 0.1286667, w * 0.8300000, h * 0.1260000, w * 0.8223333, h * 0.1260000)
      ..cubicTo(
          w * 0.8146667, h * 0.1260000, w * 0.8080000, h * 0.1286667, w * 0.8020000, h * 0.1340000)
      ..lineTo(w * 0.7543333, h * 0.1833333)
      ..cubicTo(
          w * 0.7493333, h * 0.1883333, w * 0.7466667, h * 0.1946667, w * 0.7466667, h * 0.2030000)
      ..close()
      ..moveTo(w * 0.7726667, h * 0.5980000)
      ..cubicTo(
          w * 0.7726667, h * 0.6056667, w * 0.7756667, h * 0.6123333, w * 0.7816667, h * 0.6176667)
      ..lineTo(w * 0.8020000, h * 0.6386667)
      ..cubicTo(
          w * 0.8086667, h * 0.6440000, w * 0.8153333, h * 0.6466667, w * 0.8223333, h * 0.6466667)
      ..cubicTo(
          w * 0.8290000, h * 0.6466667, w * 0.8356667, h * 0.6440000, w * 0.8423333, h * 0.6386667)
      ..cubicTo(
          w * 0.8480000, h * 0.6333333, w * 0.8506667, h * 0.6270000, w * 0.8506667, h * 0.6190000)
      ..cubicTo(
          w * 0.8506667, h * 0.6113333, w * 0.8480000, h * 0.6046667, w * 0.8423333, h * 0.5983333)
      ..lineTo(w * 0.8206667, h * 0.5780000)
      ..cubicTo(
          w * 0.8156667, h * 0.5723333, w * 0.8093333, h * 0.5696667, w * 0.8016667, h * 0.5696667)
      ..cubicTo(
          w * 0.7940000, h * 0.5696667, w * 0.7873333, h * 0.5723333, w * 0.7816667, h * 0.5780000)
      ..cubicTo(
          w * 0.7756667, h * 0.5836667, w * 0.7726667, h * 0.5903333, w * 0.7726667, h * 0.5980000)
      ..close()
      ..moveTo(w * 0.8220000, h * 0.3866667)
      ..cubicTo(
          w * 0.8220000, h * 0.3946667, w * 0.8250000, h * 0.4010000, w * 0.8306667, h * 0.4063333)
      ..cubicTo(
          w * 0.8366667, h * 0.4123333, w * 0.8436667, h * 0.4153333, w * 0.8513333, h * 0.4153333)
      ..lineTo(w * 0.9190000, h * 0.4153333)
      ..cubicTo(
          w * 0.9266667, h * 0.4153333, w * 0.9333333, h * 0.4126667, w * 0.9386667, h * 0.4070000)
      ..cubicTo(
          w * 0.9440000, h * 0.4013333, w * 0.9466667, h * 0.3946667, w * 0.9466667, h * 0.3866667)
      ..cubicTo(
          w * 0.9466667, h * 0.3786667, w * 0.9440000, h * 0.3720000, w * 0.9386667, h * 0.3666667)
      ..cubicTo(
          w * 0.9333333, h * 0.3610000, w * 0.9270000, h * 0.3583333, w * 0.9190000, h * 0.3583333)
      ..lineTo(w * 0.8513333, h * 0.3583333)
      ..cubicTo(
          w * 0.8433333, h * 0.3583333, w * 0.8366667, h * 0.3610000, w * 0.8306667, h * 0.3666667)
      ..cubicTo(
          w * 0.8246667, h * 0.3723333, w * 0.8220000, h * 0.3790000, w * 0.8220000, h * 0.3866667)
      ..close();
  }

  Path _dayShowersPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.05200000, h * 0.5626667)
      ..cubicTo(w * 0.05200000, h * 0.6070000, w * 0.06733333, h * 0.6450000, w * 0.09833333,
          h * 0.6770000)
      ..cubicTo(
          w * 0.1293333, h * 0.7090000, w * 0.1670000, h * 0.7256667, w * 0.2116667, h * 0.7280000)
      ..cubicTo(
          w * 0.2153333, h * 0.7280000, w * 0.2173333, h * 0.7260000, w * 0.2173333, h * 0.7223333)
      ..lineTo(w * 0.2173333, h * 0.6776667)
      ..cubicTo(
          w * 0.2173333, h * 0.6736667, w * 0.2153333, h * 0.6716667, w * 0.2116667, h * 0.6716667)
      ..cubicTo(
          w * 0.1833333, h * 0.6703333, w * 0.1593333, h * 0.6590000, w * 0.1393333, h * 0.6376667)
      ..cubicTo(
          w * 0.1193333, h * 0.6163333, w * 0.1096667, h * 0.5913333, w * 0.1096667, h * 0.5626667)
      ..cubicTo(
          w * 0.1096667, h * 0.5346667, w * 0.1190000, h * 0.5106667, w * 0.1376667, h * 0.4903333)
      ..cubicTo(
          w * 0.1563333, h * 0.4700000, w * 0.1796667, h * 0.4583333, w * 0.2076667, h * 0.4550000)
      ..lineTo(w * 0.2243333, h * 0.4536667)
      ..cubicTo(
          w * 0.2286667, h * 0.4536667, w * 0.2310000, h * 0.4516667, w * 0.2310000, h * 0.4476667)
      ..lineTo(w * 0.2330000, h * 0.4300000)
      ..cubicTo(
          w * 0.2366667, h * 0.3940000, w * 0.2516667, h * 0.3636667, w * 0.2786667, h * 0.3396667)
      ..cubicTo(
          w * 0.3056667, h * 0.3153333, w * 0.3373333, h * 0.3033333, w * 0.3740000, h * 0.3033333)
      ..cubicTo(
          w * 0.4103333, h * 0.3033333, w * 0.4423333, h * 0.3153333, w * 0.4693333, h * 0.3396667)
      ..cubicTo(
          w * 0.4963333, h * 0.3640000, w * 0.5116667, h * 0.3940000, w * 0.5150000, h * 0.4300000)
      ..lineTo(w * 0.5173333, h * 0.4490000)
      ..cubicTo(
          w * 0.5173333, h * 0.4530000, w * 0.5193333, h * 0.4550000, w * 0.5233333, h * 0.4550000)
      ..lineTo(w * 0.5790000, h * 0.4550000)
      ..cubicTo(
          w * 0.6083333, h * 0.4550000, w * 0.6333333, h * 0.4656667, w * 0.6546667, h * 0.4870000)
      ..cubicTo(
          w * 0.6760000, h * 0.5083333, w * 0.6866667, h * 0.5333333, w * 0.6866667, h * 0.5626667)
      ..cubicTo(
          w * 0.6866667, h * 0.5910000, w * 0.6766667, h * 0.6156667, w * 0.6566667, h * 0.6366667)
      ..cubicTo(
          w * 0.6366667, h * 0.6576667, w * 0.6126667, h * 0.6693333, w * 0.5846667, h * 0.6716667)
      ..cubicTo(
          w * 0.5810000, h * 0.6716667, w * 0.5790000, h * 0.6736667, w * 0.5790000, h * 0.6776667)
      ..lineTo(w * 0.5790000, h * 0.7223333)
      ..cubicTo(
          w * 0.5790000, h * 0.7260000, w * 0.5810000, h * 0.7280000, w * 0.5846667, h * 0.7280000)
      ..cubicTo(
          w * 0.6140000, h * 0.7273333, w * 0.6403333, h * 0.7193333, w * 0.6646667, h * 0.7040000)
      ..cubicTo(
          w * 0.6890000, h * 0.6886667, w * 0.7080000, h * 0.6690000, w * 0.7216667, h * 0.6440000)
      ..cubicTo(
          w * 0.7356667, h * 0.6190000, w * 0.7423333, h * 0.5920000, w * 0.7423333, h * 0.5626667)
      ..cubicTo(
          w * 0.7423333, h * 0.5390000, w * 0.7376667, h * 0.5170000, w * 0.7286667, h * 0.4973333)
      ..cubicTo(
          w * 0.7540000, h * 0.4660000, w * 0.7663333, h * 0.4296667, w * 0.7663333, h * 0.3880000)
      ..cubicTo(
          w * 0.7663333, h * 0.3643333, w * 0.7616667, h * 0.3416667, w * 0.7526667, h * 0.3200000)
      ..cubicTo(
          w * 0.7436667, h * 0.2983333, w * 0.7310000, h * 0.2800000, w * 0.7153333, h * 0.2643333)
      ..cubicTo(
          w * 0.7000000, h * 0.2486667, w * 0.6813333, h * 0.2363333, w * 0.6600000, h * 0.2273333)
      ..cubicTo(
          w * 0.6383333, h * 0.2180000, w * 0.6156667, h * 0.2136667, w * 0.5920000, h * 0.2136667)
      ..cubicTo(
          w * 0.5416667, h * 0.2136667, w * 0.4993333, h * 0.2320000, w * 0.4650000, h * 0.2690000)
      ..cubicTo(
          w * 0.4386667, h * 0.2546667, w * 0.4083333, h * 0.2476667, w * 0.3740000, h * 0.2476667)
      ..cubicTo(
          w * 0.3270000, h * 0.2476667, w * 0.2853333, h * 0.2623333, w * 0.2490000, h * 0.2913333)
      ..cubicTo(
          w * 0.2126667, h * 0.3203333, w * 0.1900000, h * 0.3576667, w * 0.1800000, h * 0.4030000)
      ..cubicTo(
          w * 0.1426667, h * 0.4116667, w * 0.1116667, h * 0.4306667, w * 0.08766667, h * 0.4603333)
      ..cubicTo(w * 0.06400000, h * 0.4900000, w * 0.05200000, h * 0.5243333, w * 0.05200000,
          h * 0.5626667)
      ..close()
      ..moveTo(w * 0.2323333, h * 0.7860000)
      ..cubicTo(
          w * 0.2323333, h * 0.7920000, w * 0.2340000, h * 0.7980000, w * 0.2376667, h * 0.8036667)
      ..cubicTo(
          w * 0.2413333, h * 0.8096667, w * 0.2463333, h * 0.8133333, w * 0.2526667, h * 0.8156667)
      ..cubicTo(
          w * 0.2590000, h * 0.8180000, w * 0.2660000, h * 0.8173333, w * 0.2730000, h * 0.8136667)
      ..cubicTo(
          w * 0.2803333, h * 0.8100000, w * 0.2850000, h * 0.8040000, w * 0.2876667, h * 0.7953333)
      ..lineTo(w * 0.2960000, h * 0.7603333)
      ..cubicTo(
          w * 0.2983333, h * 0.7533333, w * 0.2976667, h * 0.7466667, w * 0.2936667, h * 0.7396667)
      ..cubicTo(
          w * 0.2896667, h * 0.7326667, w * 0.2840000, h * 0.7280000, w * 0.2766667, h * 0.7256667)
      ..cubicTo(
          w * 0.2683333, h * 0.7236667, w * 0.2610000, h * 0.7246667, w * 0.2543333, h * 0.7283333)
      ..cubicTo(
          w * 0.2476667, h * 0.7320000, w * 0.2436667, h * 0.7383333, w * 0.2420000, h * 0.7460000)
      ..lineTo(w * 0.2326667, h * 0.7790000)
      ..cubicTo(
          w * 0.2326667, h * 0.7806667, w * 0.2323333, h * 0.7830000, w * 0.2323333, h * 0.7860000)
      ..close()
      ..moveTo(w * 0.2760000, h * 0.6286667)
      ..cubicTo(
          w * 0.2760000, h * 0.6413333, w * 0.2830000, h * 0.6500000, w * 0.2973333, h * 0.6550000)
      ..cubicTo(
          w * 0.3046667, h * 0.6576667, w * 0.3116667, h * 0.6570000, w * 0.3186667, h * 0.6533333)
      ..cubicTo(
          w * 0.3256667, h * 0.6496667, w * 0.3300000, h * 0.6436667, w * 0.3323333, h * 0.6356667)
      ..lineTo(w * 0.3403333, h * 0.6013333)
      ..cubicTo(
          w * 0.3426667, h * 0.5943333, w * 0.3420000, h * 0.5876667, w * 0.3380000, h * 0.5806667)
      ..cubicTo(
          w * 0.3343333, h * 0.5736667, w * 0.3286667, h * 0.5690000, w * 0.3210000, h * 0.5666667)
      ..cubicTo(
          w * 0.3130000, h * 0.5646667, w * 0.3053333, h * 0.5653333, w * 0.2986667, h * 0.5693333)
      ..cubicTo(
          w * 0.2920000, h * 0.5733333, w * 0.2880000, h * 0.5790000, w * 0.2863333, h * 0.5866667)
      ..lineTo(w * 0.2763333, h * 0.6206667)
      ..cubicTo(
          w * 0.2763333, h * 0.6233333, w * 0.2760000, h * 0.6260000, w * 0.2760000, h * 0.6286667)
      ..close()
      ..moveTo(w * 0.3166667, h * 0.8916667)
      ..cubicTo(
          w * 0.3166667, h * 0.8970000, w * 0.3186667, h * 0.9026667, w * 0.3223333, h * 0.9083333)
      ..cubicTo(
          w * 0.3260000, h * 0.9140000, w * 0.3316667, h * 0.9180000, w * 0.3386667, h * 0.9203333)
      ..cubicTo(
          w * 0.3390000, h * 0.9203333, w * 0.3400000, h * 0.9203333, w * 0.3420000, h * 0.9206667)
      ..cubicTo(
          w * 0.3440000, h * 0.9210000, w * 0.3456667, h * 0.9210000, w * 0.3470000, h * 0.9210000)
      ..cubicTo(
          w * 0.3516667, h * 0.9210000, w * 0.3556667, h * 0.9203333, w * 0.3593333, h * 0.9186667)
      ..cubicTo(
          w * 0.3656667, h * 0.9160000, w * 0.3703333, h * 0.9096667, w * 0.3730000, h * 0.8993333)
      ..lineTo(w * 0.3820000, h * 0.8663333)
      ..cubicTo(
          w * 0.3843333, h * 0.8586667, w * 0.3836667, h * 0.8513333, w * 0.3796667, h * 0.8446667)
      ..cubicTo(
          w * 0.3756667, h * 0.8380000, w * 0.3700000, h * 0.8333333, w * 0.3626667, h * 0.8313333)
      ..cubicTo(
          w * 0.3550000, h * 0.8290000, w * 0.3476667, h * 0.8296667, w * 0.3410000, h * 0.8336667)
      ..cubicTo(
          w * 0.3343333, h * 0.8376667, w * 0.3296667, h * 0.8433333, w * 0.3276667, h * 0.8506667)
      ..lineTo(w * 0.3183333, h * 0.8846667)
      ..cubicTo(
          w * 0.3170000, h * 0.8876667, w * 0.3166667, h * 0.8900000, w * 0.3166667, h * 0.8916667)
      ..close()
      ..moveTo(w * 0.3320000, h * 0.1560000)
      ..cubicTo(
          w * 0.3320000, h * 0.1643333, w * 0.3346667, h * 0.1713333, w * 0.3403333, h * 0.1766667)
      ..lineTo(w * 0.3623333, h * 0.1983333)
      ..cubicTo(
          w * 0.3736667, h * 0.2096667, w * 0.3866667, h * 0.2096667, w * 0.4013333, h * 0.1983333)
      ..cubicTo(
          w * 0.4066667, h * 0.1926667, w * 0.4093333, h * 0.1856667, w * 0.4093333, h * 0.1780000)
      ..cubicTo(
          w * 0.4093333, h * 0.1703333, w * 0.4066667, h * 0.1636667, w * 0.4013333, h * 0.1576667)
      ..lineTo(w * 0.3803333, h * 0.1356667)
      ..cubicTo(
          w * 0.3750000, h * 0.1303333, w * 0.3683333, h * 0.1276667, w * 0.3603333, h * 0.1276667)
      ..cubicTo(
          w * 0.3526667, h * 0.1276667, w * 0.3460000, h * 0.1303333, w * 0.3403333, h * 0.1360000)
      ..cubicTo(
          w * 0.3346667, h * 0.1413333, w * 0.3320000, h * 0.1480000, w * 0.3320000, h * 0.1560000)
      ..close()
      ..moveTo(w * 0.3616667, h * 0.7320000)
      ..cubicTo(
          w * 0.3616667, h * 0.7376667, w * 0.3633333, h * 0.7433333, w * 0.3670000, h * 0.7490000)
      ..cubicTo(
          w * 0.3706667, h * 0.7546667, w * 0.3756667, h * 0.7583333, w * 0.3826667, h * 0.7606667)
      ..cubicTo(
          w * 0.3903333, h * 0.7630000, w * 0.3973333, h * 0.7623333, w * 0.4040000, h * 0.7590000)
      ..cubicTo(
          w * 0.4103333, h * 0.7556667, w * 0.4150000, h * 0.7493333, w * 0.4173333, h * 0.7403333)
      ..lineTo(w * 0.4253333, h * 0.7066667)
      ..cubicTo(
          w * 0.4276667, h * 0.6990000, w * 0.4270000, h * 0.6916667, w * 0.4233333, h * 0.6850000)
      ..cubicTo(
          w * 0.4196667, h * 0.6783333, w * 0.4140000, h * 0.6736667, w * 0.4066667, h * 0.6713333)
      ..cubicTo(
          w * 0.3983333, h * 0.6690000, w * 0.3906667, h * 0.6700000, w * 0.3840000, h * 0.6740000)
      ..cubicTo(
          w * 0.3773333, h * 0.6780000, w * 0.3730000, h * 0.6840000, w * 0.3716667, h * 0.6916667)
      ..lineTo(w * 0.3623333, h * 0.7260000)
      ..cubicTo(
          w * 0.3616667, h * 0.7270000, w * 0.3616667, h * 0.7290000, w * 0.3616667, h * 0.7320000)
      ..close()
      ..moveTo(w * 0.4543333, h * 0.7893333)
      ..cubicTo(
          w * 0.4550000, h * 0.8020000, w * 0.4620000, h * 0.8110000, w * 0.4753333, h * 0.8170000)
      ..lineTo(w * 0.4836667, h * 0.8183333)
      ..cubicTo(
          w * 0.4890000, h * 0.8183333, w * 0.4943333, h * 0.8166667, w * 0.4993333, h * 0.8130000)
      ..cubicTo(
          w * 0.5043333, h * 0.8093333, w * 0.5080000, h * 0.8040000, w * 0.5100000, h * 0.7963333)
      ..lineTo(w * 0.5196667, h * 0.7626667)
      ..cubicTo(
          w * 0.5216667, h * 0.7546667, w * 0.5206667, h * 0.7473333, w * 0.5166667, h * 0.7406667)
      ..cubicTo(
          w * 0.5126667, h * 0.7340000, w * 0.5066667, h * 0.7296667, w * 0.4990000, h * 0.7283333)
      ..cubicTo(
          w * 0.4920000, h * 0.7260000, w * 0.4853333, h * 0.7266667, w * 0.4783333, h * 0.7306667)
      ..cubicTo(
          w * 0.4713333, h * 0.7346667, w * 0.4670000, h * 0.7403333, w * 0.4646667, h * 0.7476667)
      ..lineTo(w * 0.4556667, h * 0.7816667)
      ..cubicTo(
          w * 0.4553333, h * 0.7823333, w * 0.4553333, h * 0.7833333, w * 0.4550000, h * 0.7843333)
      ..cubicTo(
          w * 0.4546667, h * 0.7853333, w * 0.4546667, h * 0.7863333, w * 0.4543333, h * 0.7870000)
      ..cubicTo(
          w * 0.4540000, h * 0.7876667, w * 0.4543333, h * 0.7886667, w * 0.4543333, h * 0.7893333)
      ..close()
      ..moveTo(w * 0.5010000, h * 0.6306667)
      ..cubicTo(
          w * 0.5010000, h * 0.6360000, w * 0.5026667, h * 0.6413333, w * 0.5060000, h * 0.6466667)
      ..cubicTo(
          w * 0.5093333, h * 0.6520000, w * 0.5143333, h * 0.6556667, w * 0.5210000, h * 0.6573333)
      ..lineTo(w * 0.5293333, h * 0.6583333)
      ..cubicTo(
          w * 0.5356667, h * 0.6583333, w * 0.5416667, h * 0.6563333, w * 0.5466667, h * 0.6523333)
      ..cubicTo(
          w * 0.5516667, h * 0.6483333, w * 0.5546667, h * 0.6430000, w * 0.5560000, h * 0.6366667)
      ..lineTo(w * 0.5650000, h * 0.6036667)
      ..cubicTo(
          w * 0.5673333, h * 0.5956667, w * 0.5666667, h * 0.5886667, w * 0.5626667, h * 0.5820000)
      ..cubicTo(
          w * 0.5590000, h * 0.5753333, w * 0.5533333, h * 0.5710000, w * 0.5456667, h * 0.5690000)
      ..cubicTo(
          w * 0.5380000, h * 0.5666667, w * 0.5306667, h * 0.5673333, w * 0.5243333, h * 0.5710000)
      ..cubicTo(
          w * 0.5176667, h * 0.5746667, w * 0.5133333, h * 0.5803333, w * 0.5113333, h * 0.5876667)
      ..lineTo(w * 0.5013333, h * 0.6230000)
      ..cubicTo(
          w * 0.5013333, h * 0.6256667, w * 0.5010000, h * 0.6283333, w * 0.5010000, h * 0.6306667)
      ..close()
      ..moveTo(w * 0.5120000, h * 0.3020000)
      ..cubicTo(
          w * 0.5340000, h * 0.2806667, w * 0.5606667, h * 0.2700000, w * 0.5920000, h * 0.2700000)
      ..cubicTo(
          w * 0.6246667, h * 0.2700000, w * 0.6526667, h * 0.2816667, w * 0.6756667, h * 0.3046667)
      ..cubicTo(
          w * 0.6986667, h * 0.3276667, w * 0.7103333, h * 0.3556667, w * 0.7103333, h * 0.3883333)
      ..cubicTo(
          w * 0.7103333, h * 0.4070000, w * 0.7050000, h * 0.4266667, w * 0.6946667, h * 0.4470000)
      ..cubicTo(
          w * 0.6626667, h * 0.4150000, w * 0.6243333, h * 0.3993333, w * 0.5790000, h * 0.3993333)
      ..lineTo(w * 0.5676667, h * 0.3993333)
      ..cubicTo(
          w * 0.5590000, h * 0.3613333, w * 0.5403333, h * 0.3290000, w * 0.5120000, h * 0.3020000)
      ..close()
      ..moveTo(w * 0.5633333, h * 0.1276667)
      ..cubicTo(
          w * 0.5633333, h * 0.1360000, w * 0.5660000, h * 0.1426667, w * 0.5713333, h * 0.1480000)
      ..cubicTo(
          w * 0.5766667, h * 0.1533333, w * 0.5833333, h * 0.1560000, w * 0.5916667, h * 0.1560000)
      ..cubicTo(
          w * 0.6000000, h * 0.1560000, w * 0.6066667, h * 0.1533333, w * 0.6120000, h * 0.1480000)
      ..cubicTo(
          w * 0.6173333, h * 0.1426667, w * 0.6200000, h * 0.1360000, w * 0.6200000, h * 0.1276667)
      ..lineTo(w * 0.6200000, h * 0.06033333)
      ..cubicTo(w * 0.6200000, h * 0.05200000, w * 0.6173333, h * 0.04500000, w * 0.6120000,
          h * 0.03966667)
      ..cubicTo(w * 0.6066667, h * 0.03433333, w * 0.6000000, h * 0.03166667, w * 0.5916667,
          h * 0.03166667)
      ..cubicTo(w * 0.5833333, h * 0.03166667, w * 0.5766667, h * 0.03433333, w * 0.5713333,
          h * 0.03966667)
      ..cubicTo(w * 0.5660000, h * 0.04500000, w * 0.5633333, h * 0.05200000, w * 0.5633333,
          h * 0.06033333)
      ..lineTo(w * 0.5633333, h * 0.1276667)
      ..close()
      ..moveTo(w * 0.7483333, h * 0.2040000)
      ..cubicTo(
          w * 0.7483333, h * 0.2123333, w * 0.7510000, h * 0.2190000, w * 0.7560000, h * 0.2243333)
      ..cubicTo(
          w * 0.7630000, h * 0.2300000, w * 0.7696667, h * 0.2326667, w * 0.7766667, h * 0.2326667)
      ..cubicTo(
          w * 0.7830000, h * 0.2326667, w * 0.7893333, h * 0.2300000, w * 0.7963333, h * 0.2243333)
      ..lineTo(w * 0.8440000, h * 0.1766667)
      ..cubicTo(
          w * 0.8493333, h * 0.1706667, w * 0.8520000, h * 0.1636667, w * 0.8520000, h * 0.1556667)
      ..cubicTo(
          w * 0.8520000, h * 0.1476667, w * 0.8493333, h * 0.1410000, w * 0.8440000, h * 0.1356667)
      ..cubicTo(
          w * 0.8386667, h * 0.1303333, w * 0.8320000, h * 0.1276667, w * 0.8243333, h * 0.1276667)
      ..cubicTo(
          w * 0.8166667, h * 0.1276667, w * 0.8100000, h * 0.1303333, w * 0.8040000, h * 0.1356667)
      ..lineTo(w * 0.7560000, h * 0.1833333)
      ..cubicTo(
          w * 0.7510000, h * 0.1893333, w * 0.7483333, h * 0.1960000, w * 0.7483333, h * 0.2040000)
      ..close()
      ..moveTo(w * 0.7746667, h * 0.5983333)
      ..cubicTo(
          w * 0.7746667, h * 0.6060000, w * 0.7776667, h * 0.6130000, w * 0.7833333, h * 0.6193333)
      ..lineTo(w * 0.8040000, h * 0.6406667)
      ..cubicTo(
          w * 0.8110000, h * 0.6476667, w * 0.8176667, h * 0.6510000, w * 0.8246667, h * 0.6510000)
      ..cubicTo(
          w * 0.8310000, h * 0.6510000, w * 0.8376667, h * 0.6476667, w * 0.8440000, h * 0.6406667)
      ..cubicTo(
          w * 0.8500000, h * 0.6346667, w * 0.8530000, h * 0.6276667, w * 0.8526667, h * 0.6203333)
      ..cubicTo(
          w * 0.8523333, h * 0.6126667, w * 0.8496667, h * 0.6060000, w * 0.8440000, h * 0.6003333)
      ..lineTo(w * 0.8223333, h * 0.5783333)
      ..cubicTo(
          w * 0.8170000, h * 0.5730000, w * 0.8106667, h * 0.5703333, w * 0.8033333, h * 0.5703333)
      ..cubicTo(
          w * 0.7953333, h * 0.5703333, w * 0.7886667, h * 0.5730000, w * 0.7830000, h * 0.5786667)
      ..cubicTo(
          w * 0.7776667, h * 0.5840000, w * 0.7746667, h * 0.5906667, w * 0.7746667, h * 0.5983333)
      ..close()
      ..moveTo(w * 0.8236667, h * 0.3880000)
      ..cubicTo(
          w * 0.8236667, h * 0.3953333, w * 0.8263333, h * 0.4020000, w * 0.8316667, h * 0.4073333)
      ..cubicTo(
          w * 0.8370000, h * 0.4126667, w * 0.8436667, h * 0.4153333, w * 0.8510000, h * 0.4153333)
      ..lineTo(w * 0.9190000, h * 0.4153333)
      ..cubicTo(
          w * 0.9276667, h * 0.4153333, w * 0.9346667, h * 0.4126667, w * 0.9400000, h * 0.4076667)
      ..cubicTo(
          w * 0.9453333, h * 0.4023333, w * 0.9480000, h * 0.3960000, w * 0.9480000, h * 0.3880000)
      ..cubicTo(
          w * 0.9480000, h * 0.3796667, w * 0.9453333, h * 0.3726667, w * 0.9396667, h * 0.3673333)
      ..cubicTo(
          w * 0.9340000, h * 0.3620000, w * 0.9273333, h * 0.3593333, w * 0.9190000, h * 0.3593333)
      ..lineTo(w * 0.8510000, h * 0.3593333)
      ..cubicTo(
          w * 0.8433333, h * 0.3593333, w * 0.8366667, h * 0.3620000, w * 0.8313333, h * 0.3676667)
      ..cubicTo(
          w * 0.8263333, h * 0.3733333, w * 0.8236667, h * 0.3803333, w * 0.8236667, h * 0.3880000)
      ..close();
  }

  Path _daySleetPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.04966667, h * 0.5640000)
      ..lineTo(w * 0.04966667, h * 0.5640000)
      ..cubicTo(w * 0.04966667, h * 0.5250000, w * 0.06166667, h * 0.4910000, w * 0.08566667,
          h * 0.4610000)
      ..cubicTo(
          w * 0.1096667, h * 0.4310000, w * 0.1403333, h * 0.4116667, w * 0.1770000, h * 0.4030000)
      ..cubicTo(
          w * 0.1873333, h * 0.3573333, w * 0.2106667, h * 0.3200000, w * 0.2470000, h * 0.2903333)
      ..cubicTo(
          w * 0.2836667, h * 0.2610000, w * 0.3253333, h * 0.2463333, w * 0.3726667, h * 0.2463333)
      ..cubicTo(
          w * 0.4056667, h * 0.2463333, w * 0.4360000, h * 0.2536667, w * 0.4633333, h * 0.2683333)
      ..cubicTo(
          w * 0.4800000, h * 0.2506667, w * 0.4996667, h * 0.2366667, w * 0.5220000, h * 0.2266667)
      ..cubicTo(
          w * 0.5443333, h * 0.2166667, w * 0.5676667, h * 0.2116667, w * 0.5916667, h * 0.2116667)
      ..cubicTo(
          w * 0.6233333, h * 0.2116667, w * 0.6526667, h * 0.2196667, w * 0.6796667, h * 0.2353333)
      ..cubicTo(
          w * 0.7066667, h * 0.2510000, w * 0.7280000, h * 0.2723333, w * 0.7436667, h * 0.2993333)
      ..cubicTo(
          w * 0.7593333, h * 0.3263333, w * 0.7673333, h * 0.3556667, w * 0.7673333, h * 0.3873333)
      ..cubicTo(
          w * 0.7673333, h * 0.4283333, w * 0.7546667, h * 0.4650000, w * 0.7293333, h * 0.4970000)
      ..cubicTo(
          w * 0.7390000, h * 0.5173333, w * 0.7436667, h * 0.5396667, w * 0.7436667, h * 0.5643333)
      ..cubicTo(
          w * 0.7436667, h * 0.5936667, w * 0.7366667, h * 0.6210000, w * 0.7223333, h * 0.6460000)
      ..cubicTo(
          w * 0.7083333, h * 0.6710000, w * 0.6890000, h * 0.6913333, w * 0.6643333, h * 0.7063333)
      ..cubicTo(
          w * 0.6400000, h * 0.7216667, w * 0.6130000, h * 0.7296667, w * 0.5836667, h * 0.7303333)
      ..cubicTo(
          w * 0.5793333, h * 0.7303333, w * 0.5770000, h * 0.7283333, w * 0.5770000, h * 0.7243333)
      ..lineTo(w * 0.5770000, h * 0.6796667)
      ..cubicTo(
          w * 0.5770000, h * 0.6756667, w * 0.5793333, h * 0.6736667, w * 0.5836667, h * 0.6736667)
      ..cubicTo(
          w * 0.6123333, h * 0.6723333, w * 0.6363333, h * 0.6606667, w * 0.6563333, h * 0.6393333)
      ..cubicTo(
          w * 0.6763333, h * 0.6180000, w * 0.6863333, h * 0.5926667, w * 0.6863333, h * 0.5640000)
      ..cubicTo(
          w * 0.6863333, h * 0.5343333, w * 0.6756667, h * 0.5090000, w * 0.6540000, h * 0.4876667)
      ..cubicTo(
          w * 0.6323333, h * 0.4663333, w * 0.6070000, h * 0.4556667, w * 0.5770000, h * 0.4556667)
      ..lineTo(w * 0.5233333, h * 0.4556667)
      ..cubicTo(
          w * 0.5193333, h * 0.4556667, w * 0.5173333, h * 0.4536667, w * 0.5173333, h * 0.4500000)
      ..lineTo(w * 0.5146667, h * 0.4303333)
      ..cubicTo(
          w * 0.5110000, h * 0.3943333, w * 0.4953333, h * 0.3640000, w * 0.4680000, h * 0.3396667)
      ..cubicTo(
          w * 0.4406667, h * 0.3153333, w * 0.4086667, h * 0.3030000, w * 0.3726667, h * 0.3030000)
      ..cubicTo(
          w * 0.3360000, h * 0.3030000, w * 0.3043333, h * 0.3153333, w * 0.2773333, h * 0.3396667)
      ..cubicTo(
          w * 0.2503333, h * 0.3640000, w * 0.2350000, h * 0.3943333, w * 0.2316667, h * 0.4303333)
      ..lineTo(w * 0.2293333, h * 0.4500000)
      ..cubicTo(
          w * 0.2283333, h * 0.4530000, w * 0.2256667, h * 0.4543333, w * 0.2220000, h * 0.4543333)
      ..lineTo(w * 0.2050000, h * 0.4556667)
      ..cubicTo(
          w * 0.1770000, h * 0.4590000, w * 0.1533333, h * 0.4706667, w * 0.1346667, h * 0.4910000)
      ..cubicTo(
          w * 0.1160000, h * 0.5113333, w * 0.1066667, h * 0.5356667, w * 0.1066667, h * 0.5636667)
      ..lineTo(w * 0.1066667, h * 0.5653333)
      ..lineTo(w * 0.1076667, h * 0.5653333)
      ..cubicTo(
          w * 0.1080000, h * 0.5980000, w * 0.1203333, h * 0.6246667, w * 0.1446667, h * 0.6463333)
      ..cubicTo(
          w * 0.1520000, h * 0.6526667, w * 0.1603333, h * 0.6583333, w * 0.1693333, h * 0.6626667)
      ..lineTo(w * 0.1693333, h * 0.6633333)
      ..cubicTo(
          w * 0.1830000, h * 0.6696667, w * 0.1966667, h * 0.6730000, w * 0.2096667, h * 0.6736667)
      ..cubicTo(
          w * 0.2133333, h * 0.6736667, w * 0.2153333, h * 0.6756667, w * 0.2153333, h * 0.6793333)
      ..lineTo(w * 0.2153333, h * 0.7240000)
      ..cubicTo(
          w * 0.2153333, h * 0.7276667, w * 0.2133333, h * 0.7296667, w * 0.2096667, h * 0.7296667)
      ..cubicTo(
          w * 0.1923333, h * 0.7286667, w * 0.1760000, h * 0.7253333, w * 0.1603333, h * 0.7196667)
      ..lineTo(w * 0.1603333, h * 0.7203333)
      ..cubicTo(
          w * 0.1326667, h * 0.7106667, w * 0.1090000, h * 0.6946667, w * 0.09000000, h * 0.6726667)
      ..cubicTo(w * 0.07100000, h * 0.6506667, w * 0.05833333, h * 0.6246667, w * 0.05300000,
          h * 0.5956667)
      ..lineTo(w * 0.05300000, h * 0.5943333)
      ..cubicTo(w * 0.05266667, h * 0.5940000, w * 0.05266667, h * 0.5936667, w * 0.05266667,
          h * 0.5933333)
      ..cubicTo(w * 0.05033333, h * 0.5846667, w * 0.04966667, h * 0.5750000, w * 0.04966667,
          h * 0.5640000)
      ..close()
      ..moveTo(w * 0.2330000, h * 0.8030000)
      ..cubicTo(
          w * 0.2330000, h * 0.8020000, w * 0.2333333, h * 0.8006667, w * 0.2336667, h * 0.7986667)
      ..cubicTo(
          w * 0.2340000, h * 0.7970000, w * 0.2343333, h * 0.7956667, w * 0.2343333, h * 0.7946667)
      ..lineTo(w * 0.2373333, h * 0.7750000)
      ..cubicTo(
          w * 0.2396667, h * 0.7670000, w * 0.2440000, h * 0.7613333, w * 0.2510000, h * 0.7573333)
      ..cubicTo(
          w * 0.2576667, h * 0.7533333, w * 0.2653333, h * 0.7526667, w * 0.2736667, h * 0.7546667)
      ..cubicTo(
          w * 0.2813333, h * 0.7570000, w * 0.2866667, h * 0.7613333, w * 0.2906667, h * 0.7683333)
      ..cubicTo(
          w * 0.2943333, h * 0.7750000, w * 0.2950000, h * 0.7820000, w * 0.2930000, h * 0.7890000)
      ..lineTo(w * 0.2883333, h * 0.8090000)
      ..cubicTo(
          w * 0.2850000, h * 0.8236667, w * 0.2766667, h * 0.8310000, w * 0.2630000, h * 0.8310000)
      ..cubicTo(
          w * 0.2620000, h * 0.8310000, w * 0.2603333, h * 0.8310000, w * 0.2580000, h * 0.8306667)
      ..cubicTo(
          w * 0.2556667, h * 0.8303333, w * 0.2543333, h * 0.8303333, w * 0.2536667, h * 0.8303333)
      ..cubicTo(
          w * 0.2466667, h * 0.8283333, w * 0.2416667, h * 0.8246667, w * 0.2383333, h * 0.8193333)
      ..cubicTo(
          w * 0.2346667, h * 0.8143333, w * 0.2330000, h * 0.8086667, w * 0.2330000, h * 0.8030000)
      ..close()
      ..moveTo(w * 0.2576667, h * 0.7050000)
      ..cubicTo(
          w * 0.2576667, h * 0.6970000, w * 0.2603333, h * 0.6906667, w * 0.2653333, h * 0.6853333)
      ..cubicTo(
          w * 0.2706667, h * 0.6800000, w * 0.2770000, h * 0.6776667, w * 0.2850000, h * 0.6776667)
      ..cubicTo(
          w * 0.2930000, h * 0.6776667, w * 0.2993333, h * 0.6803333, w * 0.3046667, h * 0.6853333)
      ..cubicTo(
          w * 0.3100000, h * 0.6906667, w * 0.3123333, h * 0.6970000, w * 0.3123333, h * 0.7050000)
      ..cubicTo(
          w * 0.3123333, h * 0.7126667, w * 0.3096667, h * 0.7190000, w * 0.3046667, h * 0.7243333)
      ..cubicTo(
          w * 0.2996667, h * 0.7296667, w * 0.2930000, h * 0.7320000, w * 0.2850000, h * 0.7320000)
      ..cubicTo(
          w * 0.2773333, h * 0.7320000, w * 0.2710000, h * 0.7293333, w * 0.2660000, h * 0.7240000)
      ..cubicTo(
          w * 0.2603333, h * 0.7186667, w * 0.2576667, h * 0.7123333, w * 0.2576667, h * 0.7050000)
      ..close()
      ..moveTo(w * 0.3123333, h * 0.9043333)
      ..cubicTo(
          w * 0.3123333, h * 0.9030000, w * 0.3126667, h * 0.9006667, w * 0.3136667, h * 0.8966667)
      ..lineTo(w * 0.3180000, h * 0.8773333)
      ..cubicTo(
          w * 0.3203333, h * 0.8696667, w * 0.3250000, h * 0.8640000, w * 0.3316667, h * 0.8603333)
      ..cubicTo(
          w * 0.3386667, h * 0.8563333, w * 0.3456667, h * 0.8556667, w * 0.3526667, h * 0.8580000)
      ..cubicTo(
          w * 0.3603333, h * 0.8593333, w * 0.3663333, h * 0.8636667, w * 0.3703333, h * 0.8703333)
      ..cubicTo(
          w * 0.3743333, h * 0.8770000, w * 0.3753333, h * 0.8846667, w * 0.3730000, h * 0.8930000)
      ..lineTo(w * 0.3686667, h * 0.9126667)
      ..cubicTo(
          w * 0.3653333, h * 0.9263333, w * 0.3563333, h * 0.9330000, w * 0.3420000, h * 0.9330000)
      ..cubicTo(
          w * 0.3403333, h * 0.9330000, w * 0.3376667, h * 0.9326667, w * 0.3340000, h * 0.9316667)
      ..cubicTo(
          w * 0.3266667, h * 0.9296667, w * 0.3213333, h * 0.9260000, w * 0.3176667, h * 0.9206667)
      ..cubicTo(
          w * 0.3140000, h * 0.9153333, w * 0.3123333, h * 0.9100000, w * 0.3123333, h * 0.9043333)
      ..close()
      ..moveTo(w * 0.3300000, h * 0.1540000)
      ..cubicTo(
          w * 0.3300000, h * 0.1460000, w * 0.3326667, h * 0.1393333, w * 0.3383333, h * 0.1340000)
      ..cubicTo(
          w * 0.3440000, h * 0.1286667, w * 0.3510000, h * 0.1260000, w * 0.3593333, h * 0.1260000)
      ..cubicTo(
          w * 0.3673333, h * 0.1260000, w * 0.3740000, h * 0.1286667, w * 0.3793333, h * 0.1340000)
      ..lineTo(w * 0.4003333, h * 0.1560000)
      ..cubicTo(
          w * 0.4060000, h * 0.1616667, w * 0.4086667, h * 0.1683333, w * 0.4086667, h * 0.1760000)
      ..cubicTo(
          w * 0.4086667, h * 0.1840000, w * 0.4053333, h * 0.1913333, w * 0.3986667, h * 0.1973333)
      ..cubicTo(
          w * 0.3920000, h * 0.2033333, w * 0.3853333, h * 0.2060000, w * 0.3783333, h * 0.2050000)
      ..cubicTo(
          w * 0.3713333, h * 0.2043333, w * 0.3653333, h * 0.2013333, w * 0.3600000, h * 0.1960000)
      ..lineTo(w * 0.3383333, h * 0.1740000)
      ..cubicTo(
          w * 0.3330000, h * 0.1683333, w * 0.3300000, h * 0.1616667, w * 0.3300000, h * 0.1540000)
      ..close()
      ..moveTo(w * 0.3386667, h * 0.8076667)
      ..cubicTo(
          w * 0.3386667, h * 0.8000000, w * 0.3413333, h * 0.7933333, w * 0.3463333, h * 0.7883333)
      ..cubicTo(
          w * 0.3516667, h * 0.7830000, w * 0.3580000, h * 0.7806667, w * 0.3660000, h * 0.7806667)
      ..cubicTo(
          w * 0.3740000, h * 0.7806667, w * 0.3803333, h * 0.7833333, w * 0.3856667, h * 0.7883333)
      ..cubicTo(
          w * 0.3910000, h * 0.7936667, w * 0.3933333, h * 0.8000000, w * 0.3933333, h * 0.8076667)
      ..cubicTo(
          w * 0.3933333, h * 0.8156667, w * 0.3906667, h * 0.8220000, w * 0.3856667, h * 0.8273333)
      ..cubicTo(
          w * 0.3803333, h * 0.8326667, w * 0.3740000, h * 0.8350000, w * 0.3660000, h * 0.8350000)
      ..cubicTo(
          w * 0.3586667, h * 0.8350000, w * 0.3523333, h * 0.8323333, w * 0.3466667, h * 0.8266667)
      ..cubicTo(
          w * 0.3413333, h * 0.8213333, w * 0.3386667, h * 0.8150000, w * 0.3386667, h * 0.8076667)
      ..close()
      ..moveTo(w * 0.3593333, h * 0.7320000)
      ..cubicTo(
          w * 0.3593333, h * 0.7290000, w * 0.3596667, h * 0.7260000, w * 0.3603333, h * 0.7233333)
      ..lineTo(w * 0.3680000, h * 0.6933333)
      ..cubicTo(
          w * 0.3703333, h * 0.6856667, w * 0.3750000, h * 0.6796667, w * 0.3816667, h * 0.6756667)
      ..cubicTo(
          w * 0.3886667, h * 0.6716667, w * 0.3956667, h * 0.6706667, w * 0.4030000, h * 0.6730000)
      ..cubicTo(
          w * 0.4110000, h * 0.6753333, w * 0.4166667, h * 0.6796667, w * 0.4206667, h * 0.6863333)
      ..cubicTo(
          w * 0.4246667, h * 0.6930000, w * 0.4253333, h * 0.6996667, w * 0.4230000, h * 0.7070000)
      ..lineTo(w * 0.4143333, h * 0.7370000)
      ..cubicTo(
          w * 0.4116667, h * 0.7460000, w * 0.4070000, h * 0.7523333, w * 0.4006667, h * 0.7560000)
      ..cubicTo(
          w * 0.3943333, h * 0.7596667, w * 0.3870000, h * 0.7600000, w * 0.3793333, h * 0.7580000)
      ..cubicTo(
          w * 0.3726667, h * 0.7566667, w * 0.3676667, h * 0.7533333, w * 0.3643333, h * 0.7480000)
      ..cubicTo(
          w * 0.3603333, h * 0.7420000, w * 0.3586667, h * 0.7370000, w * 0.3593333, h * 0.7320000)
      ..close()
      ..moveTo(w * 0.4513333, h * 0.8033333)
      ..cubicTo(
          w * 0.4513333, h * 0.8023333, w * 0.4513333, h * 0.8010000, w * 0.4516667, h * 0.7990000)
      ..cubicTo(
          w * 0.4520000, h * 0.7970000, w * 0.4520000, h * 0.7960000, w * 0.4520000, h * 0.7953333)
      ..lineTo(w * 0.4550000, h * 0.7756667)
      ..cubicTo(
          w * 0.4573333, h * 0.7676667, w * 0.4616667, h * 0.7620000, w * 0.4686667, h * 0.7580000)
      ..cubicTo(
          w * 0.4753333, h * 0.7540000, w * 0.4830000, h * 0.7533333, w * 0.4913333, h * 0.7553333)
      ..cubicTo(
          w * 0.4990000, h * 0.7576667, w * 0.5046667, h * 0.7623333, w * 0.5083333, h * 0.7690000)
      ..cubicTo(
          w * 0.5123333, h * 0.7760000, w * 0.5130000, h * 0.7830000, w * 0.5106667, h * 0.7900000)
      ..lineTo(w * 0.5060000, h * 0.8100000)
      ..cubicTo(
          w * 0.5026667, h * 0.8243333, w * 0.4943333, h * 0.8316667, w * 0.4806667, h * 0.8316667)
      ..cubicTo(
          w * 0.4796667, h * 0.8316667, w * 0.4780000, h * 0.8316667, w * 0.4756667, h * 0.8313333)
      ..cubicTo(
          w * 0.4733333, h * 0.8310000, w * 0.4720000, h * 0.8310000, w * 0.4713333, h * 0.8310000)
      ..cubicTo(
          w * 0.4646667, h * 0.8290000, w * 0.4596667, h * 0.8253333, w * 0.4563333, h * 0.8200000)
      ..cubicTo(
          w * 0.4530000, h * 0.8143333, w * 0.4513333, h * 0.8090000, w * 0.4513333, h * 0.8033333)
      ..close()
      ..moveTo(w * 0.4760000, h * 0.7053333)
      ..cubicTo(
          w * 0.4760000, h * 0.6973333, w * 0.4786667, h * 0.6910000, w * 0.4836667, h * 0.6856667)
      ..cubicTo(
          w * 0.4890000, h * 0.6803333, w * 0.4953333, h * 0.6780000, w * 0.5033333, h * 0.6780000)
      ..cubicTo(
          w * 0.5113333, h * 0.6780000, w * 0.5176667, h * 0.6806667, w * 0.5230000, h * 0.6856667)
      ..cubicTo(
          w * 0.5283333, h * 0.6910000, w * 0.5306667, h * 0.6973333, w * 0.5306667, h * 0.7053333)
      ..cubicTo(
          w * 0.5306667, h * 0.7130000, w * 0.5280000, h * 0.7196667, w * 0.5230000, h * 0.7246667)
      ..cubicTo(
          w * 0.5176667, h * 0.7300000, w * 0.5113333, h * 0.7323333, w * 0.5033333, h * 0.7323333)
      ..cubicTo(
          w * 0.4956667, h * 0.7323333, w * 0.4890000, h * 0.7296667, w * 0.4840000, h * 0.7240000)
      ..cubicTo(
          w * 0.4786667, h * 0.7190000, w * 0.4760000, h * 0.7126667, w * 0.4760000, h * 0.7053333)
      ..close()
      ..moveTo(w * 0.5103333, h * 0.3016667)
      ..cubicTo(
          w * 0.5383333, h * 0.3270000, w * 0.5570000, h * 0.3596667, w * 0.5670000, h * 0.3993333)
      ..lineTo(w * 0.5773333, h * 0.3993333)
      ..cubicTo(
          w * 0.6233333, h * 0.3993333, w * 0.6623333, h * 0.4153333, w * 0.6946667, h * 0.4476667)
      ..cubicTo(
          w * 0.7050000, h * 0.4293333, w * 0.7103333, h * 0.4090000, w * 0.7103333, h * 0.3870000)
      ..cubicTo(
          w * 0.7103333, h * 0.3543333, w * 0.6986667, h * 0.3266667, w * 0.6756667, h * 0.3036667)
      ..cubicTo(
          w * 0.6526667, h * 0.2810000, w * 0.6246667, h * 0.2693333, w * 0.5920000, h * 0.2693333)
      ..cubicTo(
          w * 0.5600000, h * 0.2693333, w * 0.5326667, h * 0.2800000, w * 0.5103333, h * 0.3016667)
      ..close()
      ..moveTo(w * 0.5636667, h * 0.1260000)
      ..lineTo(w * 0.5636667, h * 0.05766667)
      ..cubicTo(w * 0.5636667, h * 0.04966667, w * 0.5663333, h * 0.04300000, w * 0.5720000,
          h * 0.03733333)
      ..cubicTo(w * 0.5776667, h * 0.03166667, w * 0.5843333, h * 0.02866667, w * 0.5920000,
          h * 0.02866667)
      ..cubicTo(w * 0.6000000, h * 0.02866667, w * 0.6066667, h * 0.03133333, w * 0.6120000,
          h * 0.03700000)
      ..cubicTo(w * 0.6173333, h * 0.04266667, w * 0.6200000, h * 0.04966667, w * 0.6200000,
          h * 0.05766667)
      ..lineTo(w * 0.6200000, h * 0.1260000)
      ..cubicTo(
          w * 0.6200000, h * 0.1340000, w * 0.6173333, h * 0.1410000, w * 0.6120000, h * 0.1466667)
      ..cubicTo(
          w * 0.6066667, h * 0.1523333, w * 0.6000000, h * 0.1550000, w * 0.5920000, h * 0.1550000)
      ..cubicTo(
          w * 0.5843333, h * 0.1550000, w * 0.5776667, h * 0.1520000, w * 0.5720000, h * 0.1463333)
      ..cubicTo(
          w * 0.5663333, h * 0.1406667, w * 0.5636667, h * 0.1340000, w * 0.5636667, h * 0.1260000)
      ..close()
      ..moveTo(w * 0.7496667, h * 0.2023333)
      ..cubicTo(
          w * 0.7496667, h * 0.1943333, w * 0.7523333, h * 0.1876667, w * 0.7573333, h * 0.1823333)
      ..lineTo(w * 0.8053333, h * 0.1340000)
      ..cubicTo(
          w * 0.8103333, h * 0.1283333, w * 0.8166667, h * 0.1256667, w * 0.8246667, h * 0.1256667)
      ..cubicTo(
          w * 0.8326667, h * 0.1256667, w * 0.8393333, h * 0.1283333, w * 0.8446667, h * 0.1340000)
      ..cubicTo(
          w * 0.8506667, h * 0.1393333, w * 0.8533333, h * 0.1460000, w * 0.8533333, h * 0.1540000)
      ..cubicTo(
          w * 0.8533333, h * 0.1620000, w * 0.8503333, h * 0.1686667, w * 0.8446667, h * 0.1740000)
      ..lineTo(w * 0.7966667, h * 0.2226667)
      ..cubicTo(
          w * 0.7903333, h * 0.2290000, w * 0.7833333, h * 0.2316667, w * 0.7756667, h * 0.2313333)
      ..cubicTo(
          w * 0.7680000, h * 0.2306667, w * 0.7620000, h * 0.2280000, w * 0.7573333, h * 0.2226667)
      ..cubicTo(
          w * 0.7520000, h * 0.2173333, w * 0.7496667, h * 0.2106667, w * 0.7496667, h * 0.2023333)
      ..close()
      ..moveTo(w * 0.7753333, h * 0.5993333)
      ..cubicTo(
          w * 0.7753333, h * 0.5913333, w * 0.7780000, h * 0.5846667, w * 0.7836667, h * 0.5790000)
      ..cubicTo(
          w * 0.7893333, h * 0.5733333, w * 0.7960000, h * 0.5706667, w * 0.8036667, h * 0.5706667)
      ..cubicTo(
          w * 0.8113333, h * 0.5706667, w * 0.8180000, h * 0.5736667, w * 0.8240000, h * 0.5793333)
      ..lineTo(w * 0.8446667, h * 0.6003333)
      ..cubicTo(
          w * 0.8506667, h * 0.6060000, w * 0.8533333, h * 0.6130000, w * 0.8533333, h * 0.6206667)
      ..cubicTo(
          w * 0.8533333, h * 0.6286667, w * 0.8503333, h * 0.6353333, w * 0.8446667, h * 0.6406667)
      ..cubicTo(
          w * 0.8400000, h * 0.6463333, w * 0.8340000, h * 0.6493333, w * 0.8266667, h * 0.6493333)
      ..lineTo(w * 0.8260000, h * 0.6486667)
      ..cubicTo(
          w * 0.8180000, h * 0.6486667, w * 0.8113333, h * 0.6460000, w * 0.8053333, h * 0.6406667)
      ..lineTo(w * 0.7836667, h * 0.6193333)
      ..cubicTo(
          w * 0.7783333, h * 0.6136667, w * 0.7753333, h * 0.6070000, w * 0.7753333, h * 0.5993333)
      ..close()
      ..moveTo(w * 0.8243333, h * 0.3870000)
      ..cubicTo(
          w * 0.8243333, h * 0.3790000, w * 0.8270000, h * 0.3723333, w * 0.8326667, h * 0.3670000)
      ..cubicTo(
          w * 0.8383333, h * 0.3616667, w * 0.8450000, h * 0.3590000, w * 0.8530000, h * 0.3590000)
      ..lineTo(w * 0.9216667, h * 0.3590000)
      ..cubicTo(
          w * 0.9296667, h * 0.3590000, w * 0.9366667, h * 0.3616667, w * 0.9420000, h * 0.3670000)
      ..cubicTo(
          w * 0.9473333, h * 0.3723333, w * 0.9503333, h * 0.3790000, w * 0.9503333, h * 0.3870000)
      ..cubicTo(
          w * 0.9503333, h * 0.3950000, w * 0.9476667, h * 0.4016667, w * 0.9420000, h * 0.4073333)
      ..cubicTo(
          w * 0.9363333, h * 0.4130000, w * 0.9296667, h * 0.4156667, w * 0.9216667, h * 0.4156667)
      ..lineTo(w * 0.8530000, h * 0.4156667)
      ..cubicTo(
          w * 0.8450000, h * 0.4156667, w * 0.8383333, h * 0.4126667, w * 0.8330000, h * 0.4066667)
      ..cubicTo(
          w * 0.8270000, h * 0.4016667, w * 0.8243333, h * 0.3950000, w * 0.8243333, h * 0.3870000)
      ..close();
  }

  Path _daySnowPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.05266667, h * 0.5643333)
      ..cubicTo(w * 0.05266667, h * 0.5930000, w * 0.05966667, h * 0.6200000, w * 0.07400000,
          h * 0.6446667)
      ..cubicTo(
          w * 0.08800000, h * 0.6693333, w * 0.1073333, h * 0.6893333, w * 0.1320000, h * 0.7043333)
      ..cubicTo(
          w * 0.1563333, h * 0.7193333, w * 0.1833333, h * 0.7273333, w * 0.2120000, h * 0.7280000)
      ..cubicTo(
          w * 0.2156667, h * 0.7280000, w * 0.2176667, h * 0.7260000, w * 0.2176667, h * 0.7223333)
      ..lineTo(w * 0.2176667, h * 0.6780000)
      ..cubicTo(
          w * 0.2176667, h * 0.6740000, w * 0.2156667, h * 0.6716667, w * 0.2120000, h * 0.6716667)
      ..cubicTo(
          w * 0.1836667, h * 0.6703333, w * 0.1593333, h * 0.6590000, w * 0.1393333, h * 0.6376667)
      ..cubicTo(
          w * 0.1193333, h * 0.6163333, w * 0.1093333, h * 0.5920000, w * 0.1093333, h * 0.5640000)
      ..cubicTo(
          w * 0.1093333, h * 0.5366667, w * 0.1186667, h * 0.5126667, w * 0.1376667, h * 0.4920000)
      ..cubicTo(
          w * 0.1566667, h * 0.4716667, w * 0.1796667, h * 0.4596667, w * 0.2076667, h * 0.4563333)
      ..lineTo(w * 0.2253333, h * 0.4543333)
      ..cubicTo(
          w * 0.2293333, h * 0.4543333, w * 0.2313333, h * 0.4523333, w * 0.2313333, h * 0.4480000)
      ..lineTo(w * 0.2340000, h * 0.4310000)
      ..cubicTo(
          w * 0.2376667, h * 0.3946667, w * 0.2526667, h * 0.3643333, w * 0.2793333, h * 0.3400000)
      ..cubicTo(
          w * 0.3060000, h * 0.3156667, w * 0.3376667, h * 0.3036667, w * 0.3743333, h * 0.3036667)
      ..cubicTo(
          w * 0.4106667, h * 0.3036667, w * 0.4423333, h * 0.3156667, w * 0.4693333, h * 0.3400000)
      ..cubicTo(
          w * 0.4966667, h * 0.3643333, w * 0.5120000, h * 0.3943333, w * 0.5153333, h * 0.4300000)
      ..lineTo(w * 0.5176667, h * 0.4493333)
      ..cubicTo(
          w * 0.5176667, h * 0.4530000, w * 0.5196667, h * 0.4550000, w * 0.5233333, h * 0.4550000)
      ..lineTo(w * 0.5770000, h * 0.4550000)
      ..cubicTo(
          w * 0.6070000, h * 0.4550000, w * 0.6326667, h * 0.4656667, w * 0.6540000, h * 0.4870000)
      ..cubicTo(
          w * 0.6753333, h * 0.5083333, w * 0.6860000, h * 0.5336667, w * 0.6860000, h * 0.5633333)
      ..cubicTo(
          w * 0.6860000, h * 0.5913333, w * 0.6760000, h * 0.6156667, w * 0.6560000, h * 0.6370000)
      ..cubicTo(
          w * 0.6360000, h * 0.6580000, w * 0.6116667, h * 0.6693333, w * 0.5836667, h * 0.6710000)
      ..cubicTo(
          w * 0.5796667, h * 0.6710000, w * 0.5773333, h * 0.6730000, w * 0.5773333, h * 0.6773333)
      ..lineTo(w * 0.5773333, h * 0.7216667)
      ..cubicTo(
          w * 0.5773333, h * 0.7253333, w * 0.5793333, h * 0.7273333, w * 0.5836667, h * 0.7273333)
      ..cubicTo(
          w * 0.6280000, h * 0.7260000, w * 0.6653333, h * 0.7093333, w * 0.6963333, h * 0.6773333)
      ..cubicTo(
          w * 0.7273333, h * 0.6453333, w * 0.7426667, h * 0.6076667, w * 0.7426667, h * 0.5636667)
      ..cubicTo(
          w * 0.7426667, h * 0.5383333, w * 0.7380000, h * 0.5160000, w * 0.7283333, h * 0.4960000)
      ..cubicTo(
          w * 0.7533333, h * 0.4650000, w * 0.7666667, h * 0.4283333, w * 0.7666667, h * 0.3866667)
      ..cubicTo(
          w * 0.7666667, h * 0.3553333, w * 0.7590000, h * 0.3263333, w * 0.7433333, h * 0.2996667)
      ..cubicTo(
          w * 0.7276667, h * 0.2730000, w * 0.7063333, h * 0.2516667, w * 0.6796667, h * 0.2360000)
      ..cubicTo(
          w * 0.6530000, h * 0.2203333, w * 0.6236667, h * 0.2126667, w * 0.5923333, h * 0.2126667)
      ..cubicTo(
          w * 0.5410000, h * 0.2126667, w * 0.4980000, h * 0.2320000, w * 0.4633333, h * 0.2703333)
      ..cubicTo(
          w * 0.4363333, h * 0.2556667, w * 0.4063333, h * 0.2483333, w * 0.3736667, h * 0.2483333)
      ..cubicTo(
          w * 0.3266667, h * 0.2483333, w * 0.2853333, h * 0.2630000, w * 0.2490000, h * 0.2920000)
      ..cubicTo(
          w * 0.2126667, h * 0.3210000, w * 0.1896667, h * 0.3583333, w * 0.1793333, h * 0.4033333)
      ..cubicTo(
          w * 0.1420000, h * 0.4126667, w * 0.1116667, h * 0.4320000, w * 0.08800000, h * 0.4616667)
      ..cubicTo(w * 0.06433333, h * 0.4916667, w * 0.05266667, h * 0.5256667, w * 0.05266667,
          h * 0.5643333)
      ..close()
      ..moveTo(w * 0.2640000, h * 0.6993333)
      ..cubicTo(
          w * 0.2640000, h * 0.7073333, w * 0.2666667, h * 0.7140000, w * 0.2720000, h * 0.7196667)
      ..cubicTo(
          w * 0.2773333, h * 0.7253333, w * 0.2836667, h * 0.7280000, w * 0.2916667, h * 0.7280000)
      ..cubicTo(
          w * 0.2993333, h * 0.7280000, w * 0.3060000, h * 0.7253333, w * 0.3113333, h * 0.7196667)
      ..cubicTo(
          w * 0.3166667, h * 0.7140000, w * 0.3193333, h * 0.7073333, w * 0.3193333, h * 0.6993333)
      ..cubicTo(
          w * 0.3193333, h * 0.6916667, w * 0.3166667, h * 0.6853333, w * 0.3113333, h * 0.6800000)
      ..cubicTo(
          w * 0.3060000, h * 0.6746667, w * 0.2996667, h * 0.6720000, w * 0.2916667, h * 0.6720000)
      ..cubicTo(
          w * 0.2840000, h * 0.6720000, w * 0.2773333, h * 0.6746667, w * 0.2720000, h * 0.6800000)
      ..cubicTo(
          w * 0.2666667, h * 0.6853333, w * 0.2640000, h * 0.6920000, w * 0.2640000, h * 0.6993333)
      ..close()
      ..moveTo(w * 0.2640000, h * 0.8203333)
      ..cubicTo(
          w * 0.2640000, h * 0.8273333, w * 0.2666667, h * 0.8336667, w * 0.2720000, h * 0.8393333)
      ..cubicTo(
          w * 0.2780000, h * 0.8446667, w * 0.2843333, h * 0.8473333, w * 0.2913333, h * 0.8473333)
      ..cubicTo(
          w * 0.2993333, h * 0.8473333, w * 0.3056667, h * 0.8446667, w * 0.3110000, h * 0.8396667)
      ..cubicTo(
          w * 0.3163333, h * 0.8343333, w * 0.3186667, h * 0.8280000, w * 0.3186667, h * 0.8203333)
      ..cubicTo(
          w * 0.3186667, h * 0.8123333, w * 0.3160000, h * 0.8060000, w * 0.3106667, h * 0.8006667)
      ..cubicTo(
          w * 0.3053333, h * 0.7953333, w * 0.2990000, h * 0.7930000, w * 0.2910000, h * 0.7930000)
      ..cubicTo(
          w * 0.2833333, h * 0.7930000, w * 0.2766667, h * 0.7956667, w * 0.2713333, h * 0.8006667)
      ..cubicTo(
          w * 0.2666667, h * 0.8056667, w * 0.2640000, h * 0.8123333, w * 0.2640000, h * 0.8203333)
      ..close()
      ..moveTo(w * 0.3323333, h * 0.1560000)
      ..cubicTo(
          w * 0.3323333, h * 0.1640000, w * 0.3350000, h * 0.1706667, w * 0.3403333, h * 0.1756667)
      ..lineTo(w * 0.3623333, h * 0.1976667)
      ..cubicTo(
          w * 0.3676667, h * 0.2030000, w * 0.3736667, h * 0.2060000, w * 0.3800000, h * 0.2060000)
      ..cubicTo(
          w * 0.3870000, h * 0.2070000, w * 0.3936667, h * 0.2046667, w * 0.4003333, h * 0.1986667)
      ..cubicTo(
          w * 0.4070000, h * 0.1926667, w * 0.4103333, h * 0.1856667, w * 0.4103333, h * 0.1776667)
      ..cubicTo(
          w * 0.4103333, h * 0.1696667, w * 0.4076667, h * 0.1623333, w * 0.4023333, h * 0.1563333)
      ..lineTo(w * 0.3810000, h * 0.1360000)
      ..cubicTo(
          w * 0.3760000, h * 0.1303333, w * 0.3696667, h * 0.1276667, w * 0.3616667, h * 0.1276667)
      ..cubicTo(
          w * 0.3533333, h * 0.1276667, w * 0.3463333, h * 0.1303333, w * 0.3406667, h * 0.1360000)
      ..cubicTo(
          w * 0.3350000, h * 0.1413333, w * 0.3323333, h * 0.1480000, w * 0.3323333, h * 0.1560000)
      ..close()
      ..moveTo(w * 0.3700000, h * 0.7633333)
      ..cubicTo(
          w * 0.3700000, h * 0.7706667, w * 0.3726667, h * 0.7773333, w * 0.3780000, h * 0.7833333)
      ..cubicTo(
          w * 0.3833333, h * 0.7886667, w * 0.3900000, h * 0.7913333, w * 0.3973333, h * 0.7913333)
      ..cubicTo(
          w * 0.4053333, h * 0.7913333, w * 0.4120000, h * 0.7886667, w * 0.4173333, h * 0.7833333)
      ..cubicTo(
          w * 0.4226667, h * 0.7780000, w * 0.4256667, h * 0.7713333, w * 0.4256667, h * 0.7633333)
      ..cubicTo(
          w * 0.4256667, h * 0.7556667, w * 0.4230000, h * 0.7490000, w * 0.4173333, h * 0.7433333)
      ..cubicTo(
          w * 0.4116667, h * 0.7376667, w * 0.4050000, h * 0.7350000, w * 0.3973333, h * 0.7350000)
      ..cubicTo(
          w * 0.3896667, h * 0.7350000, w * 0.3833333, h * 0.7376667, w * 0.3780000, h * 0.7433333)
      ..cubicTo(
          w * 0.3726667, h * 0.7490000, w * 0.3700000, h * 0.7556667, w * 0.3700000, h * 0.7633333)
      ..close()
      ..moveTo(w * 0.3700000, h * 0.6433333)
      ..cubicTo(
          w * 0.3700000, h * 0.6510000, w * 0.3726667, h * 0.6573333, w * 0.3780000, h * 0.6626667)
      ..cubicTo(
          w * 0.3833333, h * 0.6680000, w * 0.3900000, h * 0.6706667, w * 0.3973333, h * 0.6706667)
      ..cubicTo(
          w * 0.4053333, h * 0.6706667, w * 0.4120000, h * 0.6680000, w * 0.4173333, h * 0.6626667)
      ..cubicTo(
          w * 0.4230000, h * 0.6573333, w * 0.4256667, h * 0.6510000, w * 0.4256667, h * 0.6430000)
      ..cubicTo(
          w * 0.4256667, h * 0.6353333, w * 0.4230000, h * 0.6286667, w * 0.4173333, h * 0.6233333)
      ..cubicTo(
          w * 0.4116667, h * 0.6180000, w * 0.4050000, h * 0.6153333, w * 0.3973333, h * 0.6153333)
      ..cubicTo(
          w * 0.3896667, h * 0.6153333, w * 0.3833333, h * 0.6180000, w * 0.3780000, h * 0.6233333)
      ..cubicTo(
          w * 0.3726667, h * 0.6286667, w * 0.3700000, h * 0.6356667, w * 0.3700000, h * 0.6433333)
      ..close()
      ..moveTo(w * 0.3700000, h * 0.8853333)
      ..cubicTo(
          w * 0.3700000, h * 0.8926667, w * 0.3726667, h * 0.8990000, w * 0.3780000, h * 0.9043333)
      ..cubicTo(
          w * 0.3836667, h * 0.9100000, w * 0.3900000, h * 0.9126667, w * 0.3973333, h * 0.9126667)
      ..cubicTo(
          w * 0.4053333, h * 0.9126667, w * 0.4120000, h * 0.9100000, w * 0.4173333, h * 0.9050000)
      ..cubicTo(
          w * 0.4230000, h * 0.8996667, w * 0.4256667, h * 0.8933333, w * 0.4256667, h * 0.8853333)
      ..cubicTo(
          w * 0.4256667, h * 0.8773333, w * 0.4230000, h * 0.8706667, w * 0.4173333, h * 0.8653333)
      ..cubicTo(
          w * 0.4116667, h * 0.8596667, w * 0.4050000, h * 0.8570000, w * 0.3973333, h * 0.8570000)
      ..cubicTo(
          w * 0.3900000, h * 0.8570000, w * 0.3836667, h * 0.8596667, w * 0.3780000, h * 0.8653333)
      ..cubicTo(
          w * 0.3726667, h * 0.8710000, w * 0.3700000, h * 0.8776667, w * 0.3700000, h * 0.8853333)
      ..close()
      ..moveTo(w * 0.4773333, h * 0.6993333)
      ..cubicTo(
          w * 0.4773333, h * 0.7073333, w * 0.4800000, h * 0.7140000, w * 0.4853333, h * 0.7196667)
      ..cubicTo(
          w * 0.4906667, h * 0.7253333, w * 0.4973333, h * 0.7280000, w * 0.5050000, h * 0.7280000)
      ..cubicTo(
          w * 0.5126667, h * 0.7280000, w * 0.5193333, h * 0.7253333, w * 0.5246667, h * 0.7196667)
      ..cubicTo(
          w * 0.5300000, h * 0.7140000, w * 0.5326667, h * 0.7073333, w * 0.5326667, h * 0.6993333)
      ..cubicTo(
          w * 0.5326667, h * 0.6916667, w * 0.5300000, h * 0.6853333, w * 0.5246667, h * 0.6800000)
      ..cubicTo(
          w * 0.5193333, h * 0.6746667, w * 0.5130000, h * 0.6720000, w * 0.5050000, h * 0.6720000)
      ..cubicTo(
          w * 0.4970000, h * 0.6720000, w * 0.4906667, h * 0.6746667, w * 0.4853333, h * 0.6800000)
      ..cubicTo(
          w * 0.4800000, h * 0.6853333, w * 0.4773333, h * 0.6920000, w * 0.4773333, h * 0.6993333)
      ..close()
      ..moveTo(w * 0.4773333, h * 0.8203333)
      ..cubicTo(
          w * 0.4773333, h * 0.8273333, w * 0.4800000, h * 0.8336667, w * 0.4850000, h * 0.8393333)
      ..cubicTo(
          w * 0.4910000, h * 0.8446667, w * 0.4976667, h * 0.8473333, w * 0.5050000, h * 0.8473333)
      ..cubicTo(
          w * 0.5130000, h * 0.8473333, w * 0.5193333, h * 0.8446667, w * 0.5246667, h * 0.8396667)
      ..cubicTo(
          w * 0.5300000, h * 0.8343333, w * 0.5323333, h * 0.8280000, w * 0.5323333, h * 0.8203333)
      ..cubicTo(
          w * 0.5323333, h * 0.8123333, w * 0.5296667, h * 0.8060000, w * 0.5243333, h * 0.8006667)
      ..cubicTo(
          w * 0.5190000, h * 0.7953333, w * 0.5126667, h * 0.7930000, w * 0.5046667, h * 0.7930000)
      ..cubicTo(
          w * 0.4966667, h * 0.7930000, w * 0.4900000, h * 0.7956667, w * 0.4846667, h * 0.8010000)
      ..cubicTo(
          w * 0.4800000, h * 0.8060000, w * 0.4773333, h * 0.8126667, w * 0.4773333, h * 0.8203333)
      ..close()
      ..moveTo(w * 0.5100000, h * 0.3020000)
      ..cubicTo(
          w * 0.5330000, h * 0.2800000, w * 0.5603333, h * 0.2690000, w * 0.5923333, h * 0.2690000)
      ..cubicTo(
          w * 0.6246667, h * 0.2690000, w * 0.6523333, h * 0.2806667, w * 0.6750000, h * 0.3036667)
      ..cubicTo(
          w * 0.6980000, h * 0.3266667, w * 0.7093333, h * 0.3546667, w * 0.7093333, h * 0.3866667)
      ..cubicTo(
          w * 0.7093333, h * 0.4073333, w * 0.7036667, h * 0.4280000, w * 0.6923333, h * 0.4480000)
      ..cubicTo(
          w * 0.6606667, h * 0.4160000, w * 0.6220000, h * 0.4000000, w * 0.5766667, h * 0.4000000)
      ..lineTo(w * 0.5660000, h * 0.4000000)
      ..cubicTo(
          w * 0.5560000, h * 0.3610000, w * 0.5373333, h * 0.3283333, w * 0.5100000, h * 0.3020000)
      ..close()
      ..moveTo(w * 0.5633333, h * 0.1280000)
      ..cubicTo(
          w * 0.5633333, h * 0.1356667, w * 0.5660000, h * 0.1423333, w * 0.5716667, h * 0.1473333)
      ..cubicTo(
          w * 0.5773333, h * 0.1523333, w * 0.5840000, h * 0.1550000, w * 0.5920000, h * 0.1550000)
      ..cubicTo(
          w * 0.6000000, h * 0.1550000, w * 0.6063333, h * 0.1523333, w * 0.6116667, h * 0.1473333)
      ..cubicTo(
          w * 0.6170000, h * 0.1420000, w * 0.6193333, h * 0.1356667, w * 0.6193333, h * 0.1280000)
      ..lineTo(w * 0.6193333, h * 0.06000000)
      ..cubicTo(w * 0.6193333, h * 0.05200000, w * 0.6166667, h * 0.04533333, w * 0.6113333,
          h * 0.03966667)
      ..cubicTo(w * 0.6060000, h * 0.03400000, w * 0.6000000, h * 0.03133333, w * 0.5923333,
          h * 0.03133333)
      ..cubicTo(w * 0.5846667, h * 0.03133333, w * 0.5780000, h * 0.03433333, w * 0.5723333,
          h * 0.04000000)
      ..cubicTo(w * 0.5666667, h * 0.04566667, w * 0.5636667, h * 0.05233333, w * 0.5636667,
          h * 0.06000000)
      ..lineTo(w * 0.5636667, h * 0.1280000)
      ..close()
      ..moveTo(w * 0.7473333, h * 0.2036667)
      ..cubicTo(
          w * 0.7473333, h * 0.2113333, w * 0.7500000, h * 0.2180000, w * 0.7556667, h * 0.2233333)
      ..cubicTo(
          w * 0.7606667, h * 0.2286667, w * 0.7670000, h * 0.2313333, w * 0.7743333, h * 0.2320000)
      ..cubicTo(
          w * 0.7816667, h * 0.2326667, w * 0.7886667, h * 0.2296667, w * 0.7950000, h * 0.2233333)
      ..lineTo(w * 0.8426667, h * 0.1756667)
      ..cubicTo(
          w * 0.8486667, h * 0.1696667, w * 0.8513333, h * 0.1630000, w * 0.8513333, h * 0.1553333)
      ..cubicTo(
          w * 0.8513333, h * 0.1473333, w * 0.8483333, h * 0.1406667, w * 0.8426667, h * 0.1350000)
      ..cubicTo(
          w * 0.8370000, h * 0.1293333, w * 0.8303333, h * 0.1266667, w * 0.8226667, h * 0.1266667)
      ..cubicTo(
          w * 0.8153333, h * 0.1266667, w * 0.8090000, h * 0.1293333, w * 0.8033333, h * 0.1350000)
      ..lineTo(w * 0.7556667, h * 0.1836667)
      ..cubicTo(
          w * 0.7500000, h * 0.1890000, w * 0.7473333, h * 0.1956667, w * 0.7473333, h * 0.2036667)
      ..close()
      ..moveTo(w * 0.7740000, h * 0.5970000)
      ..cubicTo(
          w * 0.7740000, h * 0.6053333, w * 0.7766667, h * 0.6123333, w * 0.7820000, h * 0.6176667)
      ..lineTo(w * 0.8033333, h * 0.6386667)
      ..cubicTo(
          w * 0.8113333, h * 0.6440000, w * 0.8186667, h * 0.6466667, w * 0.8246667, h * 0.6466667)
      ..cubicTo(
          w * 0.8316667, h * 0.6466667, w * 0.8376667, h * 0.6436667, w * 0.8433333, h * 0.6380000)
      ..cubicTo(
          w * 0.8490000, h * 0.6323333, w * 0.8516667, h * 0.6253333, w * 0.8516667, h * 0.6176667)
      ..cubicTo(
          w * 0.8516667, h * 0.6100000, w * 0.8486667, h * 0.6036667, w * 0.8430000, h * 0.5983333)
      ..lineTo(w * 0.8223333, h * 0.5766667)
      ..cubicTo(
          w * 0.8163333, h * 0.5713333, w * 0.8096667, h * 0.5686667, w * 0.8020000, h * 0.5686667)
      ..cubicTo(
          w * 0.7943333, h * 0.5686667, w * 0.7876667, h * 0.5713333, w * 0.7823333, h * 0.5770000)
      ..cubicTo(
          w * 0.7766667, h * 0.5823333, w * 0.7740000, h * 0.5890000, w * 0.7740000, h * 0.5970000)
      ..close()
      ..moveTo(w * 0.8223333, h * 0.3866667)
      ..cubicTo(
          w * 0.8223333, h * 0.3946667, w * 0.8253333, h * 0.4010000, w * 0.8310000, h * 0.4063333)
      ..cubicTo(
          w * 0.8366667, h * 0.4123333, w * 0.8436667, h * 0.4153333, w * 0.8516667, h * 0.4153333)
      ..lineTo(w * 0.9190000, h * 0.4153333)
      ..cubicTo(
          w * 0.9266667, h * 0.4153333, w * 0.9333333, h * 0.4126667, w * 0.9390000, h * 0.4070000)
      ..cubicTo(
          w * 0.9446667, h * 0.4013333, w * 0.9473333, h * 0.3946667, w * 0.9473333, h * 0.3866667)
      ..cubicTo(
          w * 0.9473333, h * 0.3786667, w * 0.9446667, h * 0.3720000, w * 0.9390000, h * 0.3666667)
      ..cubicTo(
          w * 0.9333333, h * 0.3613333, w * 0.9266667, h * 0.3583333, w * 0.9190000, h * 0.3583333)
      ..lineTo(w * 0.8516667, h * 0.3583333)
      ..cubicTo(
          w * 0.8436667, h * 0.3583333, w * 0.8370000, h * 0.3610000, w * 0.8310000, h * 0.3666667)
      ..cubicTo(
          w * 0.8250000, h * 0.3723333, w * 0.8223333, h * 0.3790000, w * 0.8223333, h * 0.3866667)
      ..close();
  }

  Path _daySprinklePath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.05266667, h * 0.5630000)
      ..cubicTo(w * 0.05266667, h * 0.5920000, w * 0.05966667, h * 0.6190000, w * 0.07400000,
          h * 0.6436667)
      ..cubicTo(
          w * 0.08800000, h * 0.6686667, w * 0.1073333, h * 0.6886667, w * 0.1316667, h * 0.7036667)
      ..cubicTo(
          w * 0.1560000, h * 0.7186667, w * 0.1826667, h * 0.7266667, w * 0.2116667, h * 0.7280000)
      ..cubicTo(
          w * 0.2156667, h * 0.7280000, w * 0.2176667, h * 0.7260000, w * 0.2176667, h * 0.7223333)
      ..lineTo(w * 0.2176667, h * 0.6780000)
      ..cubicTo(
          w * 0.2176667, h * 0.6740000, w * 0.2156667, h * 0.6716667, w * 0.2116667, h * 0.6716667)
      ..cubicTo(
          w * 0.1833333, h * 0.6703333, w * 0.1590000, h * 0.6590000, w * 0.1390000, h * 0.6376667)
      ..cubicTo(
          w * 0.1190000, h * 0.6163333, w * 0.1090000, h * 0.5916667, w * 0.1090000, h * 0.5626667)
      ..cubicTo(
          w * 0.1090000, h * 0.5353333, w * 0.1183333, h * 0.5113333, w * 0.1370000, h * 0.4910000)
      ..cubicTo(
          w * 0.1556667, h * 0.4706667, w * 0.1790000, h * 0.4590000, w * 0.2066667, h * 0.4556667)
      ..lineTo(w * 0.2240000, h * 0.4546667)
      ..cubicTo(
          w * 0.2280000, h * 0.4546667, w * 0.2303333, h * 0.4526667, w * 0.2303333, h * 0.4486667)
      ..lineTo(w * 0.2330000, h * 0.4306667)
      ..cubicTo(
          w * 0.2366667, h * 0.3946667, w * 0.2516667, h * 0.3646667, w * 0.2783333, h * 0.3403333)
      ..cubicTo(
          w * 0.3050000, h * 0.3160000, w * 0.3366667, h * 0.3040000, w * 0.3733333, h * 0.3040000)
      ..cubicTo(
          w * 0.4090000, h * 0.3040000, w * 0.4406667, h * 0.3160000, w * 0.4680000, h * 0.3403333)
      ..cubicTo(
          w * 0.4953333, h * 0.3646667, w * 0.5106667, h * 0.3946667, w * 0.5146667, h * 0.4303333)
      ..lineTo(w * 0.5170000, h * 0.4496667)
      ..cubicTo(
          w * 0.5170000, h * 0.4533333, w * 0.5190000, h * 0.4553333, w * 0.5226667, h * 0.4553333)
      ..lineTo(w * 0.5766667, h * 0.4553333)
      ..cubicTo(
          w * 0.6060000, h * 0.4553333, w * 0.6316667, h * 0.4660000, w * 0.6530000, h * 0.4873333)
      ..cubicTo(
          w * 0.6746667, h * 0.5086667, w * 0.6853333, h * 0.5336667, w * 0.6853333, h * 0.5626667)
      ..cubicTo(
          w * 0.6853333, h * 0.5913333, w * 0.6753333, h * 0.6163333, w * 0.6553333, h * 0.6376667)
      ..cubicTo(
          w * 0.6353333, h * 0.6586667, w * 0.6110000, h * 0.6700000, w * 0.5826667, h * 0.6716667)
      ..cubicTo(
          w * 0.5786667, h * 0.6716667, w * 0.5766667, h * 0.6736667, w * 0.5766667, h * 0.6780000)
      ..lineTo(w * 0.5766667, h * 0.7223333)
      ..cubicTo(
          w * 0.5766667, h * 0.7260000, w * 0.5786667, h * 0.7280000, w * 0.5826667, h * 0.7280000)
      ..cubicTo(
          w * 0.6116667, h * 0.7273333, w * 0.6383333, h * 0.7193333, w * 0.6626667, h * 0.7040000)
      ..cubicTo(
          w * 0.6870000, h * 0.6886667, w * 0.7063333, h * 0.6690000, w * 0.7203333, h * 0.6440000)
      ..cubicTo(
          w * 0.7343333, h * 0.6190000, w * 0.7413333, h * 0.5920000, w * 0.7413333, h * 0.5630000)
      ..cubicTo(
          w * 0.7413333, h * 0.5383333, w * 0.7366667, h * 0.5163333, w * 0.7276667, h * 0.4963333)
      ..cubicTo(
          w * 0.7536667, h * 0.4646667, w * 0.7663333, h * 0.4280000, w * 0.7663333, h * 0.3863333)
      ..cubicTo(
          w * 0.7663333, h * 0.3550000, w * 0.7586667, h * 0.3256667, w * 0.7430000, h * 0.2990000)
      ..cubicTo(
          w * 0.7273333, h * 0.2723333, w * 0.7063333, h * 0.2510000, w * 0.6796667, h * 0.2356667)
      ..cubicTo(
          w * 0.6530000, h * 0.2200000, w * 0.6240000, h * 0.2123333, w * 0.5926667, h * 0.2123333)
      ..cubicTo(
          w * 0.5410000, h * 0.2123333, w * 0.4980000, h * 0.2316667, w * 0.4636667, h * 0.2700000)
      ..cubicTo(
          w * 0.4363333, h * 0.2553333, w * 0.4063333, h * 0.2480000, w * 0.3740000, h * 0.2480000)
      ..cubicTo(
          w * 0.3270000, h * 0.2480000, w * 0.2856667, h * 0.2626667, w * 0.2493333, h * 0.2916667)
      ..cubicTo(
          w * 0.2130000, h * 0.3206667, w * 0.1900000, h * 0.3580000, w * 0.1796667, h * 0.4030000)
      ..cubicTo(
          w * 0.1430000, h * 0.4116667, w * 0.1126667, h * 0.4310000, w * 0.08900000, h * 0.4606667)
      ..cubicTo(w * 0.06433333, h * 0.4910000, w * 0.05266667, h * 0.5250000, w * 0.05266667,
          h * 0.5630000)
      ..close()
      ..moveTo(w * 0.2493333, h * 0.5923333)
      ..cubicTo(
          w * 0.2493333, h * 0.6050000, w * 0.2540000, h * 0.6160000, w * 0.2633333, h * 0.6250000)
      ..cubicTo(
          w * 0.2726667, h * 0.6340000, w * 0.2840000, h * 0.6383333, w * 0.2970000, h * 0.6383333)
      ..cubicTo(
          w * 0.3103333, h * 0.6383333, w * 0.3213333, h * 0.6340000, w * 0.3303333, h * 0.6250000)
      ..cubicTo(
          w * 0.3393333, h * 0.6160000, w * 0.3436667, h * 0.6053333, w * 0.3436667, h * 0.5923333)
      ..cubicTo(
          w * 0.3436667, h * 0.5843333, w * 0.3396667, h * 0.5730000, w * 0.3320000, h * 0.5590000)
      ..cubicTo(
          w * 0.3243333, h * 0.5446667, w * 0.3170000, h * 0.5336667, w * 0.3103333, h * 0.5260000)
      ..cubicTo(
          w * 0.3033333, h * 0.5186667, w * 0.2986667, h * 0.5136667, w * 0.2970000, h * 0.5120000)
      ..lineTo(w * 0.2850000, h * 0.5253333)
      ..cubicTo(
          w * 0.2760000, h * 0.5350000, w * 0.2676667, h * 0.5463333, w * 0.2603333, h * 0.5596667)
      ..cubicTo(
          w * 0.2530000, h * 0.5730000, w * 0.2493333, h * 0.5840000, w * 0.2493333, h * 0.5923333)
      ..close()
      ..moveTo(w * 0.3323333, h * 0.1553333)
      ..cubicTo(
          w * 0.3323333, h * 0.1640000, w * 0.3350000, h * 0.1706667, w * 0.3403333, h * 0.1756667)
      ..lineTo(w * 0.3620000, h * 0.1976667)
      ..cubicTo(
          w * 0.3760000, h * 0.2080000, w * 0.3893333, h * 0.2080000, w * 0.4023333, h * 0.1976667)
      ..cubicTo(
          w * 0.4076667, h * 0.1913333, w * 0.4103333, h * 0.1840000, w * 0.4103333, h * 0.1763333)
      ..cubicTo(
          w * 0.4103333, h * 0.1686667, w * 0.4076667, h * 0.1620000, w * 0.4023333, h * 0.1566667)
      ..lineTo(w * 0.3810000, h * 0.1350000)
      ..cubicTo(
          w * 0.3746667, h * 0.1293333, w * 0.3680000, h * 0.1266667, w * 0.3606667, h * 0.1266667)
      ..cubicTo(
          w * 0.3526667, h * 0.1266667, w * 0.3456667, h * 0.1293333, w * 0.3403333, h * 0.1350000)
      ..cubicTo(
          w * 0.3350000, h * 0.1406667, w * 0.3323333, h * 0.1473333, w * 0.3323333, h * 0.1553333)
      ..close()
      ..moveTo(w * 0.3483333, h * 0.7243333)
      ..cubicTo(
          w * 0.3483333, h * 0.7463333, w * 0.3560000, h * 0.7646667, w * 0.3710000, h * 0.7793333)
      ..cubicTo(
          w * 0.3860000, h * 0.7940000, w * 0.4043333, h * 0.8016667, w * 0.4260000, h * 0.8016667)
      ..cubicTo(
          w * 0.4476667, h * 0.8016667, w * 0.4660000, h * 0.7940000, w * 0.4813333, h * 0.7790000)
      ..cubicTo(
          w * 0.4966667, h * 0.7636667, w * 0.5040000, h * 0.7456667, w * 0.5040000, h * 0.7243333)
      ..cubicTo(
          w * 0.5040000, h * 0.7063333, w * 0.4950000, h * 0.6846667, w * 0.4770000, h * 0.6586667)
      ..cubicTo(
          w * 0.4616667, h * 0.6383333, w * 0.4473333, h * 0.6220000, w * 0.4343333, h * 0.6090000)
      ..cubicTo(
          w * 0.4316667, h * 0.6070000, w * 0.4286667, h * 0.6046667, w * 0.4256667, h * 0.6013333)
      ..lineTo(w * 0.4180000, h * 0.6090000)
      ..cubicTo(
          w * 0.4060000, h * 0.6196667, w * 0.3920000, h * 0.6363333, w * 0.3756667, h * 0.6580000)
      ..cubicTo(
          w * 0.3576667, h * 0.6833333, w * 0.3483333, h * 0.7053333, w * 0.3483333, h * 0.7243333)
      ..close()
      ..moveTo(w * 0.3976667, h * 0.5036667)
      ..cubicTo(
          w * 0.3976667, h * 0.5120000, w * 0.4010000, h * 0.5193333, w * 0.4073333, h * 0.5253333)
      ..cubicTo(
          w * 0.4136667, h * 0.5313333, w * 0.4213333, h * 0.5343333, w * 0.4303333, h * 0.5343333)
      ..cubicTo(
          w * 0.4390000, h * 0.5343333, w * 0.4463333, h * 0.5313333, w * 0.4523333, h * 0.5253333)
      ..cubicTo(
          w * 0.4583333, h * 0.5193333, w * 0.4613333, h * 0.5120000, w * 0.4613333, h * 0.5036667)
      ..cubicTo(
          w * 0.4613333, h * 0.4900000, w * 0.4510000, h * 0.4720000, w * 0.4303333, h * 0.4503333)
      ..lineTo(w * 0.4223333, h * 0.4586667)
      ..cubicTo(
          w * 0.4163333, h * 0.4653333, w * 0.4106667, h * 0.4730000, w * 0.4056667, h * 0.4820000)
      ..cubicTo(
          w * 0.4000000, h * 0.4910000, w * 0.3976667, h * 0.4980000, w * 0.3976667, h * 0.5036667)
      ..close()
      ..moveTo(w * 0.5100000, h * 0.3020000)
      ..cubicTo(
          w * 0.5320000, h * 0.2800000, w * 0.5593333, h * 0.2690000, w * 0.5923333, h * 0.2690000)
      ..cubicTo(
          w * 0.6250000, h * 0.2690000, w * 0.6523333, h * 0.2803333, w * 0.6753333, h * 0.3033333)
      ..cubicTo(
          w * 0.6980000, h * 0.3263333, w * 0.7096667, h * 0.3540000, w * 0.7096667, h * 0.3866667)
      ..cubicTo(
          w * 0.7096667, h * 0.4063333, w * 0.7040000, h * 0.4266667, w * 0.6923333, h * 0.4480000)
      ..cubicTo(
          w * 0.6600000, h * 0.4160000, w * 0.6213333, h * 0.4000000, w * 0.5766667, h * 0.4000000)
      ..lineTo(w * 0.5656667, h * 0.4000000)
      ..cubicTo(
          w * 0.5560000, h * 0.3613333, w * 0.5373333, h * 0.3286667, w * 0.5100000, h * 0.3020000)
      ..close()
      ..moveTo(w * 0.5633333, h * 0.1266667)
      ..cubicTo(
          w * 0.5633333, h * 0.1346667, w * 0.5663333, h * 0.1413333, w * 0.5720000, h * 0.1470000)
      ..cubicTo(
          w * 0.5776667, h * 0.1526667, w * 0.5843333, h * 0.1553333, w * 0.5920000, h * 0.1553333)
      ..cubicTo(
          w * 0.5996667, h * 0.1553333, w * 0.6063333, h * 0.1526667, w * 0.6113333, h * 0.1470000)
      ..cubicTo(
          w * 0.6166667, h * 0.1413333, w * 0.6190000, h * 0.1346667, w * 0.6190000, h * 0.1266667)
      ..lineTo(w * 0.6190000, h * 0.05866667)
      ..cubicTo(w * 0.6190000, h * 0.05066667, w * 0.6163333, h * 0.04433333, w * 0.6113333,
          h * 0.03900000)
      ..cubicTo(w * 0.6063333, h * 0.03366667, w * 0.6000000, h * 0.03133333, w * 0.5923333,
          h * 0.03133333)
      ..cubicTo(w * 0.5846667, h * 0.03133333, w * 0.5776667, h * 0.03400000, w * 0.5720000,
          h * 0.03900000)
      ..cubicTo(w * 0.5663333, h * 0.04400000, w * 0.5633333, h * 0.05066667, w * 0.5633333,
          h * 0.05866667)
      ..lineTo(w * 0.5633333, h * 0.1266667)
      ..close()
      ..moveTo(w * 0.7473333, h * 0.2036667)
      ..cubicTo(
          w * 0.7473333, h * 0.2116667, w * 0.7500000, h * 0.2183333, w * 0.7556667, h * 0.2233333)
      ..cubicTo(
          w * 0.7613333, h * 0.2286667, w * 0.7676667, h * 0.2313333, w * 0.7743333, h * 0.2313333)
      ..cubicTo(
          w * 0.7800000, h * 0.2313333, w * 0.7870000, h * 0.2286667, w * 0.7946667, h * 0.2233333)
      ..lineTo(w * 0.8423333, h * 0.1756667)
      ..cubicTo(
          w * 0.8483333, h * 0.1696667, w * 0.8513333, h * 0.1626667, w * 0.8513333, h * 0.1550000)
      ..cubicTo(
          w * 0.8513333, h * 0.1470000, w * 0.8486667, h * 0.1400000, w * 0.8430000, h * 0.1346667)
      ..cubicTo(
          w * 0.8373333, h * 0.1293333, w * 0.8306667, h * 0.1266667, w * 0.8226667, h * 0.1266667)
      ..cubicTo(
          w * 0.8153333, h * 0.1266667, w * 0.8090000, h * 0.1293333, w * 0.8033333, h * 0.1350000)
      ..lineTo(w * 0.7556667, h * 0.1826667)
      ..cubicTo(
          w * 0.7500000, h * 0.1883333, w * 0.7473333, h * 0.1953333, w * 0.7473333, h * 0.2036667)
      ..close()
      ..moveTo(w * 0.7740000, h * 0.5963333)
      ..cubicTo(
          w * 0.7740000, h * 0.6046667, w * 0.7766667, h * 0.6116667, w * 0.7816667, h * 0.6176667)
      ..lineTo(w * 0.8033333, h * 0.6370000)
      ..cubicTo(
          w * 0.8080000, h * 0.6430000, w * 0.8146667, h * 0.6460000, w * 0.8230000, h * 0.6460000)
      ..cubicTo(
          w * 0.8310000, h * 0.6460000, w * 0.8376667, h * 0.6430000, w * 0.8423333, h * 0.6370000)
      ..cubicTo(
          w * 0.8483333, h * 0.6316667, w * 0.8513333, h * 0.6250000, w * 0.8513333, h * 0.6176667)
      ..cubicTo(
          w * 0.8513333, h * 0.6103333, w * 0.8483333, h * 0.6040000, w * 0.8423333, h * 0.5983333)
      ..lineTo(w * 0.8220000, h * 0.5766667)
      ..cubicTo(
          w * 0.8160000, h * 0.5713333, w * 0.8093333, h * 0.5686667, w * 0.8016667, h * 0.5686667)
      ..cubicTo(
          w * 0.7936667, h * 0.5686667, w * 0.7870000, h * 0.5713333, w * 0.7816667, h * 0.5766667)
      ..cubicTo(
          w * 0.7763333, h * 0.5820000, w * 0.7740000, h * 0.5886667, w * 0.7740000, h * 0.5963333)
      ..close()
      ..moveTo(w * 0.8223333, h * 0.3866667)
      ..cubicTo(
          w * 0.8223333, h * 0.3940000, w * 0.8250000, h * 0.4006667, w * 0.8306667, h * 0.4060000)
      ..cubicTo(
          w * 0.8363333, h * 0.4113333, w * 0.8433333, h * 0.4140000, w * 0.8516667, h * 0.4140000)
      ..lineTo(w * 0.9190000, h * 0.4140000)
      ..cubicTo(
          w * 0.9270000, h * 0.4140000, w * 0.9336667, h * 0.4113333, w * 0.9390000, h * 0.4060000)
      ..cubicTo(
          w * 0.9446667, h * 0.4006667, w * 0.9473333, h * 0.3943333, w * 0.9473333, h * 0.3863333)
      ..cubicTo(
          w * 0.9473333, h * 0.3783333, w * 0.9446667, h * 0.3716667, w * 0.9390000, h * 0.3663333)
      ..cubicTo(
          w * 0.9333333, h * 0.3610000, w * 0.9266667, h * 0.3580000, w * 0.9190000, h * 0.3580000)
      ..lineTo(w * 0.8516667, h * 0.3580000)
      ..cubicTo(
          w * 0.8436667, h * 0.3580000, w * 0.8370000, h * 0.3606667, w * 0.8310000, h * 0.3663333)
      ..cubicTo(
          w * 0.8250000, h * 0.3720000, w * 0.8223333, h * 0.3790000, w * 0.8223333, h * 0.3866667)
      ..close();
  }

  Path _dayStormShowersPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.04966667, h * 0.5626667)
      ..cubicTo(w * 0.04966667, h * 0.6000000, w * 0.06066667, h * 0.6333333, w * 0.08300000,
          h * 0.6626667)
      ..cubicTo(
          w * 0.1053333, h * 0.6920000, w * 0.1340000, h * 0.7116667, w * 0.1690000, h * 0.7213333)
      ..lineTo(w * 0.1470000, h * 0.7780000)
      ..cubicTo(
          w * 0.1453333, h * 0.7826667, w * 0.1470000, h * 0.7853333, w * 0.1516667, h * 0.7853333)
      ..lineTo(w * 0.2226667, h * 0.7853333)
      ..lineTo(w * 0.1750000, h * 0.9256667)
      ..lineTo(w * 0.1846667, h * 0.9256667)
      ..lineTo(w * 0.3300000, h * 0.7370000)
      ..cubicTo(
          w * 0.3313333, h * 0.7356667, w * 0.3313333, h * 0.7340000, w * 0.3306667, h * 0.7323333)
      ..cubicTo(
          w * 0.3300000, h * 0.7306667, w * 0.3283333, h * 0.7300000, w * 0.3260000, h * 0.7300000)
      ..lineTo(w * 0.2530000, h * 0.7300000)
      ..lineTo(w * 0.3360000, h * 0.5750000)
      ..cubicTo(
          w * 0.3383333, h * 0.5703333, w * 0.3370000, h * 0.5676667, w * 0.3313333, h * 0.5676667)
      ..lineTo(w * 0.2326667, h * 0.5676667)
      ..cubicTo(
          w * 0.2296667, h * 0.5676667, w * 0.2270000, h * 0.5693333, w * 0.2250000, h * 0.5726667)
      ..lineTo(w * 0.1893333, h * 0.6686667)
      ..cubicTo(
          w * 0.1653333, h * 0.6626667, w * 0.1453333, h * 0.6500000, w * 0.1300000, h * 0.6300000)
      ..cubicTo(
          w * 0.1143333, h * 0.6103333, w * 0.1066667, h * 0.5880000, w * 0.1066667, h * 0.5626667)
      ..cubicTo(
          w * 0.1066667, h * 0.5346667, w * 0.1160000, h * 0.5103333, w * 0.1346667, h * 0.4900000)
      ..cubicTo(
          w * 0.1533333, h * 0.4696667, w * 0.1770000, h * 0.4576667, w * 0.2050000, h * 0.4543333)
      ..lineTo(w * 0.2220000, h * 0.4533333)
      ..cubicTo(
          w * 0.2260000, h * 0.4533333, w * 0.2283333, h * 0.4516667, w * 0.2293333, h * 0.4486667)
      ..lineTo(w * 0.2316667, h * 0.4290000)
      ..cubicTo(
          w * 0.2353333, h * 0.3930000, w * 0.2503333, h * 0.3626667, w * 0.2773333, h * 0.3383333)
      ..cubicTo(
          w * 0.3043333, h * 0.3140000, w * 0.3360000, h * 0.3016667, w * 0.3726667, h * 0.3016667)
      ..cubicTo(
          w * 0.4090000, h * 0.3016667, w * 0.4406667, h * 0.3140000, w * 0.4680000, h * 0.3383333)
      ..cubicTo(
          w * 0.4953333, h * 0.3626667, w * 0.5110000, h * 0.3930000, w * 0.5146667, h * 0.4290000)
      ..lineTo(w * 0.5173333, h * 0.4486667)
      ..cubicTo(
          w * 0.5173333, h * 0.4523333, w * 0.5193333, h * 0.4543333, w * 0.5233333, h * 0.4543333)
      ..lineTo(w * 0.5770000, h * 0.4543333)
      ..cubicTo(
          w * 0.6066667, h * 0.4543333, w * 0.6323333, h * 0.4650000, w * 0.6540000, h * 0.4863333)
      ..cubicTo(
          w * 0.6756667, h * 0.5076667, w * 0.6863333, h * 0.5330000, w * 0.6863333, h * 0.5626667)
      ..cubicTo(
          w * 0.6863333, h * 0.5916667, w * 0.6763333, h * 0.6166667, w * 0.6563333, h * 0.6380000)
      ..cubicTo(
          w * 0.6363333, h * 0.6593333, w * 0.6123333, h * 0.6706667, w * 0.5836667, h * 0.6723333)
      ..cubicTo(
          w * 0.5793333, h * 0.6723333, w * 0.5770000, h * 0.6743333, w * 0.5770000, h * 0.6783333)
      ..lineTo(w * 0.5770000, h * 0.7230000)
      ..cubicTo(
          w * 0.5770000, h * 0.7266667, w * 0.5793333, h * 0.7286667, w * 0.5836667, h * 0.7286667)
      ..cubicTo(
          w * 0.6130000, h * 0.7280000, w * 0.6400000, h * 0.7200000, w * 0.6643333, h * 0.7046667)
      ..cubicTo(
          w * 0.6886667, h * 0.6896667, w * 0.7080000, h * 0.6693333, w * 0.7223333, h * 0.6443333)
      ..cubicTo(
          w * 0.7366667, h * 0.6193333, w * 0.7436667, h * 0.5920000, w * 0.7436667, h * 0.5626667)
      ..cubicTo(
          w * 0.7436667, h * 0.5383333, w * 0.7390000, h * 0.5160000, w * 0.7293333, h * 0.4953333)
      ..cubicTo(
          w * 0.7546667, h * 0.4633333, w * 0.7673333, h * 0.4266667, w * 0.7673333, h * 0.3856667)
      ..cubicTo(
          w * 0.7673333, h * 0.3540000, w * 0.7593333, h * 0.3246667, w * 0.7436667, h * 0.2976667)
      ..cubicTo(
          w * 0.7280000, h * 0.2706667, w * 0.7066667, h * 0.2493333, w * 0.6796667, h * 0.2336667)
      ..cubicTo(
          w * 0.6526667, h * 0.2180000, w * 0.6233333, h * 0.2100000, w * 0.5916667, h * 0.2100000)
      ..cubicTo(
          w * 0.5676667, h * 0.2100000, w * 0.5443333, h * 0.2150000, w * 0.5216667, h * 0.2250000)
      ..cubicTo(
          w * 0.4990000, h * 0.2350000, w * 0.4796667, h * 0.2490000, w * 0.4630000, h * 0.2666667)
      ..cubicTo(
          w * 0.4360000, h * 0.2523333, w * 0.4060000, h * 0.2450000, w * 0.3723333, h * 0.2450000)
      ..cubicTo(
          w * 0.3250000, h * 0.2450000, w * 0.2830000, h * 0.2596667, w * 0.2466667, h * 0.2890000)
      ..cubicTo(
          w * 0.2103333, h * 0.3183333, w * 0.1866667, h * 0.3556667, w * 0.1766667, h * 0.4013333)
      ..cubicTo(
          w * 0.1396667, h * 0.4100000, w * 0.1093333, h * 0.4293333, w * 0.08533333, h * 0.4593333)
      ..cubicTo(w * 0.06166667, h * 0.4900000, w * 0.04966667, h * 0.5243333, w * 0.04966667,
          h * 0.5626667)
      ..close()
      ..moveTo(w * 0.3223333, h * 0.8933333)
      ..cubicTo(
          w * 0.3223333, h * 0.8983333, w * 0.3240000, h * 0.9036667, w * 0.3276667, h * 0.9090000)
      ..cubicTo(
          w * 0.3313333, h * 0.9143333, w * 0.3363333, h * 0.9180000, w * 0.3430000, h * 0.9203333)
      ..cubicTo(
          w * 0.3466667, h * 0.9213333, w * 0.3496667, h * 0.9216667, w * 0.3513333, h * 0.9216667)
      ..cubicTo(
          w * 0.3563333, h * 0.9216667, w * 0.3606667, h * 0.9206667, w * 0.3640000, h * 0.9190000)
      ..cubicTo(
          w * 0.3710000, h * 0.9163333, w * 0.3760000, h * 0.9100000, w * 0.3783333, h * 0.9000000)
      ..lineTo(w * 0.3873333, h * 0.8656667)
      ..cubicTo(
          w * 0.3893333, h * 0.8573333, w * 0.3883333, h * 0.8500000, w * 0.3846667, h * 0.8433333)
      ..cubicTo(
          w * 0.3810000, h * 0.8366667, w * 0.3746667, h * 0.8326667, w * 0.3670000, h * 0.8310000)
      ..cubicTo(
          w * 0.3600000, h * 0.8286667, w * 0.3533333, h * 0.8296667, w * 0.3463333, h * 0.8333333)
      ..cubicTo(
          w * 0.3393333, h * 0.8373333, w * 0.3346667, h * 0.8430000, w * 0.3323333, h * 0.8506667)
      ..lineTo(w * 0.3240000, h * 0.8853333)
      ..cubicTo(
          w * 0.3230000, h * 0.8900000, w * 0.3223333, h * 0.8926667, w * 0.3223333, h * 0.8933333)
      ..close()
      ..moveTo(w * 0.3300000, h * 0.1530000)
      ..cubicTo(
          w * 0.3300000, h * 0.1606667, w * 0.3326667, h * 0.1673333, w * 0.3383333, h * 0.1730000)
      ..lineTo(w * 0.3600000, h * 0.1950000)
      ..cubicTo(
          w * 0.3653333, h * 0.2003333, w * 0.3713333, h * 0.2030000, w * 0.3783333, h * 0.2036667)
      ..cubicTo(
          w * 0.3853333, h * 0.2046667, w * 0.3920000, h * 0.2023333, w * 0.3986667, h * 0.1960000)
      ..cubicTo(
          w * 0.4053333, h * 0.1900000, w * 0.4086667, h * 0.1830000, w * 0.4086667, h * 0.1746667)
      ..cubicTo(
          w * 0.4086667, h * 0.1670000, w * 0.4060000, h * 0.1603333, w * 0.4003333, h * 0.1546667)
      ..lineTo(w * 0.3793333, h * 0.1326667)
      ..cubicTo(
          w * 0.3740000, h * 0.1273333, w * 0.3673333, h * 0.1246667, w * 0.3593333, h * 0.1246667)
      ..cubicTo(
          w * 0.3510000, h * 0.1246667, w * 0.3440000, h * 0.1273333, w * 0.3383333, h * 0.1326667)
      ..cubicTo(
          w * 0.3330000, h * 0.1386667, w * 0.3300000, h * 0.1453333, w * 0.3300000, h * 0.1530000)
      ..close()
      ..moveTo(w * 0.3670000, h * 0.7333333)
      ..cubicTo(
          w * 0.3666667, h * 0.7386667, w * 0.3683333, h * 0.7440000, w * 0.3716667, h * 0.7490000)
      ..cubicTo(
          w * 0.3750000, h * 0.7540000, w * 0.3803333, h * 0.7576667, w * 0.3876667, h * 0.7596667)
      ..cubicTo(
          w * 0.3946667, h * 0.7620000, w * 0.4016667, h * 0.7613333, w * 0.4083333, h * 0.7576667)
      ..cubicTo(
          w * 0.4150000, h * 0.7540000, w * 0.4196667, h * 0.7476667, w * 0.4223333, h * 0.7390000)
      ..lineTo(w * 0.4323333, h * 0.7046667)
      ..cubicTo(
          w * 0.4346667, h * 0.6973333, w * 0.4336667, h * 0.6903333, w * 0.4296667, h * 0.6836667)
      ..cubicTo(
          w * 0.4256667, h * 0.6770000, w * 0.4196667, h * 0.6723333, w * 0.4116667, h * 0.6700000)
      ..cubicTo(
          w * 0.4040000, h * 0.6676667, w * 0.3970000, h * 0.6683333, w * 0.3903333, h * 0.6723333)
      ..cubicTo(
          w * 0.3836667, h * 0.6763333, w * 0.3790000, h * 0.6820000, w * 0.3766667, h * 0.6900000)
      ..lineTo(w * 0.3686667, h * 0.7250000)
      ..cubicTo(
          w * 0.3676667, h * 0.7300000, w * 0.3670000, h * 0.7326667, w * 0.3670000, h * 0.7333333)
      ..close()
      ..moveTo(w * 0.4613333, h * 0.7893333)
      ..cubicTo(
          w * 0.4613333, h * 0.7940000, w * 0.4623333, h * 0.7986667, w * 0.4646667, h * 0.8023333)
      ..cubicTo(
          w * 0.4690000, h * 0.8093333, w * 0.4750000, h * 0.8143333, w * 0.4826667, h * 0.8166667)
      ..cubicTo(
          w * 0.4863333, h * 0.8180000, w * 0.4896667, h * 0.8186667, w * 0.4920000, h * 0.8186667)
      ..cubicTo(
          w * 0.4963333, h * 0.8186667, w * 0.4996667, h * 0.8180000, w * 0.5023333, h * 0.8160000)
      ..cubicTo(
          w * 0.5090000, h * 0.8136667, w * 0.5140000, h * 0.8070000, w * 0.5173333, h * 0.7960000)
      ..lineTo(w * 0.5256667, h * 0.7623333)
      ..cubicTo(
          w * 0.5280000, h * 0.7543333, w * 0.5273333, h * 0.7473333, w * 0.5233333, h * 0.7406667)
      ..cubicTo(
          w * 0.5196667, h * 0.7340000, w * 0.5140000, h * 0.7296667, w * 0.5063333, h * 0.7276667)
      ..cubicTo(
          w * 0.4986667, h * 0.7253333, w * 0.4913333, h * 0.7260000, w * 0.4846667, h * 0.7300000)
      ..cubicTo(
          w * 0.4780000, h * 0.7336667, w * 0.4733333, h * 0.7393333, w * 0.4710000, h * 0.7470000)
      ..lineTo(w * 0.4616667, h * 0.7816667)
      ..cubicTo(
          w * 0.4616667, h * 0.7843333, w * 0.4613333, h * 0.7870000, w * 0.4613333, h * 0.7893333)
      ..close()
      ..moveTo(w * 0.5070000, h * 0.6286667)
      ..cubicTo(
          w * 0.5070000, h * 0.6346667, w * 0.5086667, h * 0.6400000, w * 0.5123333, h * 0.6453333)
      ..cubicTo(
          w * 0.5160000, h * 0.6506667, w * 0.5213333, h * 0.6543333, w * 0.5286667, h * 0.6563333)
      ..cubicTo(
          w * 0.5343333, h * 0.6583333, w * 0.5410000, h * 0.6576667, w * 0.5490000, h * 0.6546667)
      ..cubicTo(
          w * 0.5556667, h * 0.6516667, w * 0.5603333, h * 0.6453333, w * 0.5633333, h * 0.6356667)
      ..lineTo(w * 0.5723333, h * 0.6023333)
      ..cubicTo(
          w * 0.5743333, h * 0.5940000, w * 0.5736667, h * 0.5866667, w * 0.5696667, h * 0.5800000)
      ..cubicTo(
          w * 0.5656667, h * 0.5733333, w * 0.5600000, h * 0.5693333, w * 0.5520000, h * 0.5676667)
      ..cubicTo(
          w * 0.5443333, h * 0.5653333, w * 0.5373333, h * 0.5660000, w * 0.5306667, h * 0.5696667)
      ..cubicTo(
          w * 0.5240000, h * 0.5733333, w * 0.5196667, h * 0.5790000, w * 0.5173333, h * 0.5863333)
      ..lineTo(w * 0.5076667, h * 0.6216667)
      ..cubicTo(
          w * 0.5073333, h * 0.6263333, w * 0.5070000, h * 0.6286667, w * 0.5070000, h * 0.6286667)
      ..close()
      ..moveTo(w * 0.5103333, h * 0.3006667)
      ..cubicTo(
          w * 0.5326667, h * 0.2793333, w * 0.5596667, h * 0.2683333, w * 0.5920000, h * 0.2683333)
      ..cubicTo(
          w * 0.6246667, h * 0.2683333, w * 0.6526667, h * 0.2796667, w * 0.6756667, h * 0.3026667)
      ..cubicTo(
          w * 0.6986667, h * 0.3253333, w * 0.7103333, h * 0.3533333, w * 0.7103333, h * 0.3860000)
      ..cubicTo(
          w * 0.7103333, h * 0.4080000, w * 0.7050000, h * 0.4280000, w * 0.6946667, h * 0.4463333)
      ..cubicTo(
          w * 0.6626667, h * 0.4143333, w * 0.6236667, h * 0.3983333, w * 0.5773333, h * 0.3983333)
      ..lineTo(w * 0.5670000, h * 0.3983333)
      ..cubicTo(
          w * 0.5573333, h * 0.3586667, w * 0.5383333, h * 0.3260000, w * 0.5103333, h * 0.3006667)
      ..close()
      ..moveTo(w * 0.5636667, h * 0.1250000)
      ..cubicTo(
          w * 0.5636667, h * 0.1330000, w * 0.5663333, h * 0.1396667, w * 0.5720000, h * 0.1453333)
      ..cubicTo(
          w * 0.5776667, h * 0.1510000, w * 0.5843333, h * 0.1536667, w * 0.5920000, h * 0.1536667)
      ..cubicTo(
          w * 0.6000000, h * 0.1536667, w * 0.6066667, h * 0.1510000, w * 0.6120000, h * 0.1453333)
      ..cubicTo(
          w * 0.6173333, h * 0.1396667, w * 0.6200000, h * 0.1330000, w * 0.6200000, h * 0.1250000)
      ..lineTo(w * 0.6200000, h * 0.05633333)
      ..cubicTo(w * 0.6200000, h * 0.04833333, w * 0.6173333, h * 0.04133333, w * 0.6120000,
          h * 0.03600000)
      ..cubicTo(w * 0.6066667, h * 0.03033333, w * 0.6000000, h * 0.02733333, w * 0.5920000,
          h * 0.02733333)
      ..cubicTo(w * 0.5840000, h * 0.02733333, w * 0.5773333, h * 0.03000000, w * 0.5720000,
          h * 0.03566667)
      ..cubicTo(w * 0.5666667, h * 0.04133333, w * 0.5636667, h * 0.04800000, w * 0.5636667,
          h * 0.05600000)
      ..lineTo(w * 0.5636667, h * 0.1250000)
      ..close()
      ..moveTo(w * 0.7496667, h * 0.2013333)
      ..cubicTo(
          w * 0.7496667, h * 0.2093333, w * 0.7523333, h * 0.2160000, w * 0.7573333, h * 0.2213333)
      ..cubicTo(
          w * 0.7620000, h * 0.2266667, w * 0.7680000, h * 0.2293333, w * 0.7756667, h * 0.2300000)
      ..cubicTo(
          w * 0.7833333, h * 0.2306667, w * 0.7903333, h * 0.2276667, w * 0.7966667, h * 0.2213333)
      ..lineTo(w * 0.8446667, h * 0.1733333)
      ..cubicTo(
          w * 0.8506667, h * 0.1680000, w * 0.8533333, h * 0.1613333, w * 0.8533333, h * 0.1533333)
      ..cubicTo(
          w * 0.8533333, h * 0.1453333, w * 0.8503333, h * 0.1386667, w * 0.8446667, h * 0.1333333)
      ..cubicTo(
          w * 0.8393333, h * 0.1273333, w * 0.8326667, h * 0.1246667, w * 0.8246667, h * 0.1246667)
      ..cubicTo(
          w * 0.8170000, h * 0.1246667, w * 0.8106667, h * 0.1276667, w * 0.8053333, h * 0.1333333)
      ..lineTo(w * 0.7573333, h * 0.1813333)
      ..cubicTo(
          w * 0.7520000, h * 0.1863333, w * 0.7496667, h * 0.1930000, w * 0.7496667, h * 0.2013333)
      ..close()
      ..moveTo(w * 0.7753333, h * 0.5983333)
      ..cubicTo(
          w * 0.7753333, h * 0.6060000, w * 0.7780000, h * 0.6126667, w * 0.7836667, h * 0.6183333)
      ..lineTo(w * 0.8053333, h * 0.6393333)
      ..cubicTo(
          w * 0.8113333, h * 0.6450000, w * 0.8183333, h * 0.6476667, w * 0.8260000, h * 0.6476667)
      ..lineTo(w * 0.8266667, h * 0.6483333)
      ..cubicTo(
          w * 0.8340000, h * 0.6483333, w * 0.8400000, h * 0.6453333, w * 0.8446667, h * 0.6393333)
      ..cubicTo(
          w * 0.8506667, h * 0.6340000, w * 0.8533333, h * 0.6273333, w * 0.8533333, h * 0.6193333)
      ..cubicTo(
          w * 0.8533333, h * 0.6116667, w * 0.8503333, h * 0.6050000, w * 0.8446667, h * 0.5990000)
      ..lineTo(w * 0.8240000, h * 0.5783333)
      ..cubicTo(
          w * 0.8180000, h * 0.5723333, w * 0.8113333, h * 0.5693333, w * 0.8036667, h * 0.5693333)
      ..cubicTo(
          w * 0.7956667, h * 0.5693333, w * 0.7890000, h * 0.5723333, w * 0.7836667, h * 0.5780000)
      ..cubicTo(
          w * 0.7783333, h * 0.5836667, w * 0.7753333, h * 0.5906667, w * 0.7753333, h * 0.5983333)
      ..close()
      ..moveTo(w * 0.8243333, h * 0.3860000)
      ..cubicTo(
          w * 0.8243333, h * 0.3940000, w * 0.8273333, h * 0.4006667, w * 0.8330000, h * 0.4056667)
      ..cubicTo(
          w * 0.8383333, h * 0.4116667, w * 0.8450000, h * 0.4143333, w * 0.8530000, h * 0.4143333)
      ..lineTo(w * 0.9216667, h * 0.4143333)
      ..cubicTo(
          w * 0.9296667, h * 0.4143333, w * 0.9363333, h * 0.4116667, w * 0.9420000, h * 0.4060000)
      ..cubicTo(
          w * 0.9476667, h * 0.4003333, w * 0.9503333, h * 0.3936667, w * 0.9503333, h * 0.3860000)
      ..cubicTo(
          w * 0.9503333, h * 0.3783333, w * 0.9476667, h * 0.3713333, w * 0.9420000, h * 0.3660000)
      ..cubicTo(
          w * 0.9363333, h * 0.3606667, w * 0.9296667, h * 0.3580000, w * 0.9216667, h * 0.3580000)
      ..lineTo(w * 0.8530000, h * 0.3580000)
      ..cubicTo(
          w * 0.8450000, h * 0.3580000, w * 0.8380000, h * 0.3606667, w * 0.8326667, h * 0.3660000)
      ..cubicTo(
          w * 0.8270000, h * 0.3713333, w * 0.8243333, h * 0.3780000, w * 0.8243333, h * 0.3860000)
      ..close();
  }

  Path _daySunnyPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1456667, h * 0.4873333)
      ..cubicTo(
          w * 0.1456667, h * 0.4793333, w * 0.1483333, h * 0.4723333, w * 0.1540000, h * 0.4666667)
      ..cubicTo(
          w * 0.1596667, h * 0.4613333, w * 0.1666667, h * 0.4586667, w * 0.1740000, h * 0.4586667)
      ..lineTo(w * 0.2420000, h * 0.4586667)
      ..cubicTo(
          w * 0.2496667, h * 0.4586667, w * 0.2560000, h * 0.4613333, w * 0.2613333, h * 0.4670000)
      ..cubicTo(
          w * 0.2663333, h * 0.4726667, w * 0.2690000, h * 0.4793333, w * 0.2690000, h * 0.4873333)
      ..cubicTo(
          w * 0.2690000, h * 0.4953333, w * 0.2666667, h * 0.5020000, w * 0.2616667, h * 0.5076667)
      ..cubicTo(
          w * 0.2566667, h * 0.5133333, w * 0.2500000, h * 0.5160000, w * 0.2423333, h * 0.5160000)
      ..lineTo(w * 0.1743333, h * 0.5160000)
      ..cubicTo(
          w * 0.1666667, h * 0.5160000, w * 0.1600000, h * 0.5133333, w * 0.1543333, h * 0.5076667)
      ..cubicTo(
          w * 0.1486667, h * 0.5020000, w * 0.1456667, h * 0.4953333, w * 0.1456667, h * 0.4873333)
      ..close()
      ..moveTo(w * 0.2410000, h * 0.7183333)
      ..cubicTo(
          w * 0.2410000, h * 0.7106667, w * 0.2436667, h * 0.7040000, w * 0.2486667, h * 0.6980000)
      ..lineTo(w * 0.2976667, h * 0.6503333)
      ..cubicTo(
          w * 0.3026667, h * 0.6450000, w * 0.3093333, h * 0.6426667, w * 0.3173333, h * 0.6426667)
      ..cubicTo(
          w * 0.3253333, h * 0.6426667, w * 0.3320000, h * 0.6453333, w * 0.3373333, h * 0.6503333)
      ..cubicTo(
          w * 0.3426667, h * 0.6553333, w * 0.3453333, h * 0.6616667, w * 0.3453333, h * 0.6693333)
      ..cubicTo(
          w * 0.3453333, h * 0.6773333, w * 0.3426667, h * 0.6846667, w * 0.3373333, h * 0.6906667)
      ..lineTo(w * 0.2900000, h * 0.7380000)
      ..cubicTo(
          w * 0.2763333, h * 0.7486667, w * 0.2626667, h * 0.7486667, w * 0.2490000, h * 0.7380000)
      ..cubicTo(
          w * 0.2436667, h * 0.7326667, w * 0.2410000, h * 0.7260000, w * 0.2410000, h * 0.7183333)
      ..close()
      ..moveTo(w * 0.2410000, h * 0.2570000)
      ..cubicTo(
          w * 0.2410000, h * 0.2493333, w * 0.2436667, h * 0.2426667, w * 0.2486667, h * 0.2366667)
      ..cubicTo(
          w * 0.2553333, h * 0.2310000, w * 0.2623333, h * 0.2283333, w * 0.2700000, h * 0.2283333)
      ..cubicTo(
          w * 0.2773333, h * 0.2283333, w * 0.2840000, h * 0.2310000, w * 0.2896667, h * 0.2363333)
      ..lineTo(w * 0.3373333, h * 0.2853333)
      ..cubicTo(
          w * 0.3426667, h * 0.2903333, w * 0.3453333, h * 0.2970000, w * 0.3453333, h * 0.3050000)
      ..cubicTo(
          w * 0.3453333, h * 0.3130000, w * 0.3426667, h * 0.3196667, w * 0.3373333, h * 0.3250000)
      ..cubicTo(
          w * 0.3320000, h * 0.3303333, w * 0.3253333, h * 0.3330000, w * 0.3173333, h * 0.3330000)
      ..cubicTo(
          w * 0.3093333, h * 0.3330000, w * 0.3026667, h * 0.3303333, w * 0.2976667, h * 0.3250000)
      ..lineTo(w * 0.2490000, h * 0.2773333)
      ..cubicTo(
          w * 0.2436667, h * 0.2720000, w * 0.2410000, h * 0.2650000, w * 0.2410000, h * 0.2570000)
      ..close()
      ..moveTo(w * 0.3260000, h * 0.4873333)
      ..cubicTo(
          w * 0.3260000, h * 0.4563333, w * 0.3336667, h * 0.4273333, w * 0.3493333, h * 0.4006667)
      ..cubicTo(
          w * 0.3650000, h * 0.3740000, w * 0.3860000, h * 0.3526667, w * 0.4130000, h * 0.3370000)
      ..cubicTo(
          w * 0.4400000, h * 0.3213333, w * 0.4686667, h * 0.3136667, w * 0.4996667, h * 0.3136667)
      ..cubicTo(
          w * 0.5230000, h * 0.3136667, w * 0.5453333, h * 0.3183333, w * 0.5670000, h * 0.3276667)
      ..cubicTo(
          w * 0.5883333, h * 0.3370000, w * 0.6070000, h * 0.3493333, w * 0.6223333, h * 0.3650000)
      ..cubicTo(
          w * 0.6380000, h * 0.3806667, w * 0.6503333, h * 0.3990000, w * 0.6593333, h * 0.4203333)
      ..cubicTo(
          w * 0.6683333, h * 0.4416667, w * 0.6730000, h * 0.4643333, w * 0.6730000, h * 0.4876667)
      ..cubicTo(
          w * 0.6730000, h * 0.5190000, w * 0.6653333, h * 0.5480000, w * 0.6496667, h * 0.5746667)
      ..cubicTo(
          w * 0.6340000, h * 0.6013333, w * 0.6130000, h * 0.6223333, w * 0.5863333, h * 0.6380000)
      ..cubicTo(
          w * 0.5596667, h * 0.6536667, w * 0.5306667, h * 0.6613333, w * 0.4993333, h * 0.6613333)
      ..cubicTo(
          w * 0.4680000, h * 0.6613333, w * 0.4390000, h * 0.6536667, w * 0.4123333, h * 0.6380000)
      ..cubicTo(
          w * 0.3856667, h * 0.6223333, w * 0.3646667, h * 0.6013333, w * 0.3490000, h * 0.5746667)
      ..cubicTo(
          w * 0.3340000, h * 0.5476667, w * 0.3260000, h * 0.5186667, w * 0.3260000, h * 0.4873333)
      ..close()
      ..moveTo(w * 0.3826667, h * 0.4873333)
      ..cubicTo(
          w * 0.3826667, h * 0.5200000, w * 0.3940000, h * 0.5476667, w * 0.4170000, h * 0.5706667)
      ..cubicTo(
          w * 0.4396667, h * 0.5936667, w * 0.4673333, h * 0.6053333, w * 0.5000000, h * 0.6053333)
      ..cubicTo(
          w * 0.5326667, h * 0.6053333, w * 0.5603333, h * 0.5936667, w * 0.5833333, h * 0.5706667)
      ..cubicTo(
          w * 0.6063333, h * 0.5476667, w * 0.6180000, h * 0.5200000, w * 0.6180000, h * 0.4873333)
      ..cubicTo(
          w * 0.6180000, h * 0.4553333, w * 0.6063333, h * 0.4280000, w * 0.5833333, h * 0.4050000)
      ..cubicTo(
          w * 0.5603333, h * 0.3823333, w * 0.5326667, h * 0.3710000, w * 0.5000000, h * 0.3710000)
      ..cubicTo(
          w * 0.4676667, h * 0.3710000, w * 0.4400000, h * 0.3823333, w * 0.4173333, h * 0.4050000)
      ..cubicTo(
          w * 0.3940000, h * 0.4280000, w * 0.3826667, h * 0.4553333, w * 0.3826667, h * 0.4873333)
      ..close()
      ..moveTo(w * 0.4713333, h * 0.7466667)
      ..cubicTo(
          w * 0.4713333, h * 0.7386667, w * 0.4740000, h * 0.7320000, w * 0.4796667, h * 0.7266667)
      ..cubicTo(
          w * 0.4853333, h * 0.7213333, w * 0.4920000, h * 0.7186667, w * 0.4996667, h * 0.7186667)
      ..cubicTo(
          w * 0.5076667, h * 0.7186667, w * 0.5146667, h * 0.7213333, w * 0.5200000, h * 0.7266667)
      ..cubicTo(
          w * 0.5253333, h * 0.7320000, w * 0.5280000, h * 0.7386667, w * 0.5280000, h * 0.7466667)
      ..lineTo(w * 0.5280000, h * 0.8130000)
      ..cubicTo(
          w * 0.5280000, h * 0.8210000, w * 0.5253333, h * 0.8280000, w * 0.5196667, h * 0.8336667)
      ..cubicTo(
          w * 0.5140000, h * 0.8393333, w * 0.5073333, h * 0.8420000, w * 0.4996667, h * 0.8420000)
      ..cubicTo(
          w * 0.4920000, h * 0.8420000, w * 0.4850000, h * 0.8393333, w * 0.4796667, h * 0.8336667)
      ..cubicTo(
          w * 0.4740000, h * 0.8280000, w * 0.4713333, h * 0.8210000, w * 0.4713333, h * 0.8130000)
      ..lineTo(w * 0.4713333, h * 0.7466667)
      ..close()
      ..moveTo(w * 0.4713333, h * 0.2300000)
      ..lineTo(w * 0.4713333, h * 0.1620000)
      ..cubicTo(
          w * 0.4713333, h * 0.1543333, w * 0.4740000, h * 0.1476667, w * 0.4796667, h * 0.1420000)
      ..cubicTo(
          w * 0.4853333, h * 0.1363333, w * 0.4920000, h * 0.1333333, w * 0.5000000, h * 0.1333333)
      ..cubicTo(
          w * 0.5080000, h * 0.1333333, w * 0.5143333, h * 0.1360000, w * 0.5200000, h * 0.1416667)
      ..cubicTo(
          w * 0.5256667, h * 0.1473333, w * 0.5283333, h * 0.1540000, w * 0.5283333, h * 0.1616667)
      ..lineTo(w * 0.5283333, h * 0.2300000)
      ..cubicTo(
          w * 0.5283333, h * 0.2376667, w * 0.5256667, h * 0.2440000, w * 0.5200000, h * 0.2493333)
      ..cubicTo(
          w * 0.5143333, h * 0.2546667, w * 0.5076667, h * 0.2570000, w * 0.5000000, h * 0.2570000)
      ..cubicTo(
          w * 0.4923333, h * 0.2570000, w * 0.4853333, h * 0.2543333, w * 0.4800000, h * 0.2493333)
      ..cubicTo(
          w * 0.4746667, h * 0.2443333, w * 0.4713333, h * 0.2376667, w * 0.4713333, h * 0.2300000)
      ..close()
      ..moveTo(w * 0.6553333, h * 0.6693333)
      ..cubicTo(
          w * 0.6553333, h * 0.6616667, w * 0.6580000, h * 0.6553333, w * 0.6630000, h * 0.6506667)
      ..cubicTo(
          w * 0.6680000, h * 0.6453333, w * 0.6743333, h * 0.6430000, w * 0.6816667, h * 0.6430000)
      ..cubicTo(
          w * 0.6896667, h * 0.6430000, w * 0.6963333, h * 0.6456667, w * 0.7016667, h * 0.6506667)
      ..lineTo(w * 0.7503333, h * 0.6983333)
      ..cubicTo(
          w * 0.7556667, h * 0.7040000, w * 0.7583333, h * 0.7110000, w * 0.7583333, h * 0.7186667)
      ..cubicTo(
          w * 0.7583333, h * 0.7263333, w * 0.7556667, h * 0.7330000, w * 0.7503333, h * 0.7383333)
      ..cubicTo(
          w * 0.7370000, h * 0.7486667, w * 0.7236667, h * 0.7486667, w * 0.7103333, h * 0.7383333)
      ..lineTo(w * 0.6630000, h * 0.6910000)
      ..cubicTo(
          w * 0.6580000, h * 0.6850000, w * 0.6553333, h * 0.6780000, w * 0.6553333, h * 0.6693333)
      ..close()
      ..moveTo(w * 0.6553333, h * 0.3053333)
      ..cubicTo(
          w * 0.6553333, h * 0.2970000, w * 0.6580000, h * 0.2903333, w * 0.6630000, h * 0.2856667)
      ..lineTo(w * 0.7103333, h * 0.2366667)
      ..cubicTo(
          w * 0.7160000, h * 0.2313333, w * 0.7226667, h * 0.2286667, w * 0.7300000, h * 0.2286667)
      ..cubicTo(
          w * 0.7380000, h * 0.2286667, w * 0.7446667, h * 0.2313333, w * 0.7500000, h * 0.2370000)
      ..cubicTo(
          w * 0.7556667, h * 0.2426667, w * 0.7583333, h * 0.2493333, w * 0.7583333, h * 0.2570000)
      ..cubicTo(
          w * 0.7583333, h * 0.2653333, w * 0.7556667, h * 0.2723333, w * 0.7503333, h * 0.2776667)
      ..lineTo(w * 0.7016667, h * 0.3253333)
      ..cubicTo(
          w * 0.6956667, h * 0.3306667, w * 0.6890000, h * 0.3333333, w * 0.6816667, h * 0.3333333)
      ..cubicTo(
          w * 0.6740000, h * 0.3333333, w * 0.6680000, h * 0.3306667, w * 0.6630000, h * 0.3253333)
      ..cubicTo(
          w * 0.6580000, h * 0.3200000, w * 0.6553333, h * 0.3133333, w * 0.6553333, h * 0.3053333)
      ..close()
      ..moveTo(w * 0.7306667, h * 0.4873333)
      ..cubicTo(
          w * 0.7306667, h * 0.4793333, w * 0.7333333, h * 0.4726667, w * 0.7386667, h * 0.4666667)
      ..cubicTo(
          w * 0.7440000, h * 0.4613333, w * 0.7503333, h * 0.4586667, w * 0.7576667, h * 0.4586667)
      ..lineTo(w * 0.8250000, h * 0.4586667)
      ..cubicTo(
          w * 0.8326667, h * 0.4586667, w * 0.8393333, h * 0.4616667, w * 0.8450000, h * 0.4673333)
      ..cubicTo(
          w * 0.8506667, h * 0.4730000, w * 0.8536667, h * 0.4796667, w * 0.8536667, h * 0.4873333)
      ..cubicTo(
          w * 0.8536667, h * 0.4950000, w * 0.8506667, h * 0.5016667, w * 0.8450000, h * 0.5073333)
      ..cubicTo(
          w * 0.8393333, h * 0.5130000, w * 0.8326667, h * 0.5156667, w * 0.8250000, h * 0.5156667)
      ..lineTo(w * 0.7576667, h * 0.5156667)
      ..cubicTo(
          w * 0.7500000, h * 0.5156667, w * 0.7433333, h * 0.5130000, w * 0.7383333, h * 0.5073333)
      ..cubicTo(
          w * 0.7333333, h * 0.5016667, w * 0.7306667, h * 0.4953333, w * 0.7306667, h * 0.4873333)
      ..close();
  }

  Path _daySunnyOvercastPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1030000, h * 0.4476667)
      ..cubicTo(
          w * 0.1030000, h * 0.4566667, w * 0.1060000, h * 0.4640000, w * 0.1123333, h * 0.4700000)
      ..cubicTo(
          w * 0.1186667, h * 0.4760000, w * 0.1266667, h * 0.4786667, w * 0.1363333, h * 0.4786667)
      ..lineTo(w * 0.1926667, h * 0.4786667)
      ..cubicTo(
          w * 0.2016667, h * 0.4786667, w * 0.2093333, h * 0.4756667, w * 0.2156667, h * 0.4696667)
      ..cubicTo(
          w * 0.2220000, h * 0.4636667, w * 0.2253333, h * 0.4563333, w * 0.2253333, h * 0.4476667)
      ..cubicTo(
          w * 0.2253333, h * 0.4380000, w * 0.2223333, h * 0.4300000, w * 0.2160000, h * 0.4240000)
      ..cubicTo(
          w * 0.2096667, h * 0.4180000, w * 0.2020000, h * 0.4146667, w * 0.1930000, h * 0.4146667)
      ..lineTo(w * 0.1363333, h * 0.4146667)
      ..cubicTo(
          w * 0.1266667, h * 0.4146667, w * 0.1186667, h * 0.4176667, w * 0.1123333, h * 0.4240000)
      ..cubicTo(
          w * 0.1060000, h * 0.4296667, w * 0.1030000, h * 0.4376667, w * 0.1030000, h * 0.4476667)
      ..close()
      ..moveTo(w * 0.1620000, h * 0.6536667)
      ..cubicTo(
          w * 0.1620000, h * 0.6860000, w * 0.1736667, h * 0.7140000, w * 0.1973333, h * 0.7376667)
      ..cubicTo(
          w * 0.2210000, h * 0.7613333, w * 0.2486667, h * 0.7730000, w * 0.2810000, h * 0.7730000)
      ..lineTo(w * 0.5096667, h * 0.7730000)
      ..cubicTo(
          w * 0.5420000, h * 0.7730000, w * 0.5696667, h * 0.7613333, w * 0.5926667, h * 0.7380000)
      ..cubicTo(
          w * 0.6156667, h * 0.7146667, w * 0.6273333, h * 0.6866667, w * 0.6273333, h * 0.6536667)
      ..cubicTo(
          w * 0.6273333, h * 0.6376667, w * 0.6250000, h * 0.6240000, w * 0.6203333, h * 0.6126667)
      ..cubicTo(
          w * 0.6480000, h * 0.5950000, w * 0.6700000, h * 0.5713333, w * 0.6860000, h * 0.5420000)
      ..cubicTo(
          w * 0.7020000, h * 0.5126667, w * 0.7103333, h * 0.4810000, w * 0.7103333, h * 0.4473333)
      ..cubicTo(
          w * 0.7103333, h * 0.4203333, w * 0.7050000, h * 0.3943333, w * 0.6943333, h * 0.3696667)
      ..cubicTo(
          w * 0.6836667, h * 0.3450000, w * 0.6693333, h * 0.3236667, w * 0.6516667, h * 0.3060000)
      ..cubicTo(
          w * 0.6340000, h * 0.2883333, w * 0.6126667, h * 0.2740000, w * 0.5880000, h * 0.2633333)
      ..cubicTo(
          w * 0.5633333, h * 0.2526667, w * 0.5376667, h * 0.2473333, w * 0.5106667, h * 0.2473333)
      ..cubicTo(
          w * 0.4743333, h * 0.2473333, w * 0.4406667, h * 0.2563333, w * 0.4100000, h * 0.2743333)
      ..cubicTo(
          w * 0.3793333, h * 0.2923333, w * 0.3550000, h * 0.3166667, w * 0.3373333, h * 0.3470000)
      ..cubicTo(
          w * 0.3196667, h * 0.3776667, w * 0.3110000, h * 0.4110000, w * 0.3110000, h * 0.4473333)
      ..lineTo(w * 0.3110000, h * 0.4586667)
      ..cubicTo(
          w * 0.2776667, h * 0.4776667, w * 0.2556667, h * 0.5053333, w * 0.2450000, h * 0.5416667)
      ..cubicTo(
          w * 0.2196667, h * 0.5496667, w * 0.1996667, h * 0.5636667, w * 0.1846667, h * 0.5840000)
      ..cubicTo(
          w * 0.1696667, h * 0.6043333, w * 0.1620000, h * 0.6276667, w * 0.1620000, h * 0.6536667)
      ..close()
      ..moveTo(w * 0.2140000, h * 0.1816667)
      ..cubicTo(
          w * 0.2140000, h * 0.1910000, w * 0.2170000, h * 0.1986667, w * 0.2226667, h * 0.2040000)
      ..lineTo(w * 0.2763333, h * 0.2603333)
      ..cubicTo(
          w * 0.2920000, h * 0.2723333, w * 0.3076667, h * 0.2723333, w * 0.3233333, h * 0.2603333)
      ..cubicTo(
          w * 0.3296667, h * 0.2540000, w * 0.3326667, h * 0.2463333, w * 0.3326667, h * 0.2370000)
      ..cubicTo(
          w * 0.3326667, h * 0.2280000, w * 0.3296667, h * 0.2203333, w * 0.3233333, h * 0.2136667)
      ..lineTo(w * 0.2683333, h * 0.1586667)
      ..cubicTo(
          w * 0.2613333, h * 0.1523333, w * 0.2533333, h * 0.1490000, w * 0.2450000, h * 0.1490000)
      ..cubicTo(
          w * 0.2356667, h * 0.1490000, w * 0.2280000, h * 0.1520000, w * 0.2223333, h * 0.1583333)
      ..cubicTo(
          w * 0.2166667, h * 0.1646667, w * 0.2140000, h * 0.1723333, w * 0.2140000, h * 0.1816667)
      ..close()
      ..moveTo(w * 0.2280000, h * 0.6536667)
      ..cubicTo(
          w * 0.2280000, h * 0.6396667, w * 0.2323333, h * 0.6276667, w * 0.2413333, h * 0.6176667)
      ..cubicTo(
          w * 0.2503333, h * 0.6076667, w * 0.2616667, h * 0.6020000, w * 0.2753333, h * 0.6006667)
      ..lineTo(w * 0.2960000, h * 0.5980000)
      ..cubicTo(
          w * 0.3003333, h * 0.5980000, w * 0.3026667, h * 0.5953333, w * 0.3026667, h * 0.5903333)
      ..lineTo(w * 0.3056667, h * 0.5716667)
      ..cubicTo(
          w * 0.3080000, h * 0.5523333, w * 0.3160000, h * 0.5363333, w * 0.3300000, h * 0.5236667)
      ..cubicTo(
          w * 0.3440000, h * 0.5106667, w * 0.3603333, h * 0.5043333, w * 0.3793333, h * 0.5043333)
      ..cubicTo(
          w * 0.3986667, h * 0.5043333, w * 0.4156667, h * 0.5106667, w * 0.4296667, h * 0.5236667)
      ..cubicTo(
          w * 0.4440000, h * 0.5366667, w * 0.4523333, h * 0.5526667, w * 0.4546667, h * 0.5716667)
      ..lineTo(w * 0.4573333, h * 0.5933333)
      ..cubicTo(
          w * 0.4593333, h * 0.5983333, w * 0.4620000, h * 0.6010000, w * 0.4653333, h * 0.6010000)
      ..lineTo(w * 0.5093333, h * 0.6010000)
      ..cubicTo(
          w * 0.5236667, h * 0.6010000, w * 0.5360000, h * 0.6063333, w * 0.5466667, h * 0.6166667)
      ..cubicTo(
          w * 0.5573333, h * 0.6270000, w * 0.5623333, h * 0.6393333, w * 0.5623333, h * 0.6540000)
      ..cubicTo(
          w * 0.5623333, h * 0.6690000, w * 0.5570000, h * 0.6816667, w * 0.5466667, h * 0.6923333)
      ..cubicTo(
          w * 0.5363333, h * 0.7030000, w * 0.5236667, h * 0.7083333, w * 0.5093333, h * 0.7083333)
      ..lineTo(w * 0.2810000, h * 0.7083333)
      ..cubicTo(
          w * 0.2660000, h * 0.7083333, w * 0.2533333, h * 0.7030000, w * 0.2433333, h * 0.6923333)
      ..cubicTo(
          w * 0.2330000, h * 0.6816667, w * 0.2280000, h * 0.6686667, w * 0.2280000, h * 0.6536667)
      ..close()
      ..moveTo(w * 0.3753333, h * 0.4406667)
      ..cubicTo(
          w * 0.3776667, h * 0.4043333, w * 0.3916667, h * 0.3736667, w * 0.4176667, h * 0.3486667)
      ..cubicTo(
          w * 0.4433333, h * 0.3240000, w * 0.4746667, h * 0.3113333, w * 0.5106667, h * 0.3113333)
      ..cubicTo(
          w * 0.5476667, h * 0.3113333, w * 0.5793333, h * 0.3246667, w * 0.6053333, h * 0.3510000)
      ..cubicTo(
          w * 0.6313333, h * 0.3773333, w * 0.6443333, h * 0.4096667, w * 0.6443333, h * 0.4473333)
      ..cubicTo(
          w * 0.6443333, h * 0.4706667, w * 0.6386667, h * 0.4923333, w * 0.6273333, h * 0.5123333)
      ..cubicTo(
          w * 0.6160000, h * 0.5323333, w * 0.6006667, h * 0.5483333, w * 0.5813333, h * 0.5606667)
      ..cubicTo(
          w * 0.5616667, h * 0.5443333, w * 0.5390000, h * 0.5363333, w * 0.5136667, h * 0.5363333)
      ..cubicTo(
          w * 0.5040000, h * 0.5070000, w * 0.4866667, h * 0.4840000, w * 0.4623333, h * 0.4666667)
      ..cubicTo(
          w * 0.4380000, h * 0.4493333, w * 0.4103333, h * 0.4406667, w * 0.3796667, h * 0.4406667)
      ..lineTo(w * 0.3753333, h * 0.4406667)
      ..close()
      ..moveTo(w * 0.4783333, h * 0.1490000)
      ..cubicTo(
          w * 0.4783333, h * 0.1580000, w * 0.4816667, h * 0.1660000, w * 0.4880000, h * 0.1723333)
      ..cubicTo(
          w * 0.4943333, h * 0.1786667, w * 0.5020000, h * 0.1820000, w * 0.5110000, h * 0.1820000)
      ..cubicTo(
          w * 0.5203333, h * 0.1820000, w * 0.5280000, h * 0.1786667, w * 0.5343333, h * 0.1723333)
      ..cubicTo(
          w * 0.5406667, h * 0.1660000, w * 0.5440000, h * 0.1583333, w * 0.5440000, h * 0.1490000)
      ..lineTo(w * 0.5440000, h * 0.07100000)
      ..cubicTo(w * 0.5440000, h * 0.06233333, w * 0.5406667, h * 0.05500000, w * 0.5343333,
          h * 0.04900000)
      ..cubicTo(w * 0.5280000, h * 0.04300000, w * 0.5203333, h * 0.04000000, w * 0.5110000,
          h * 0.04000000)
      ..cubicTo(w * 0.5020000, h * 0.04000000, w * 0.4943333, h * 0.04300000, w * 0.4880000,
          h * 0.04900000)
      ..cubicTo(w * 0.4816667, h * 0.05500000, w * 0.4783333, h * 0.06233333, w * 0.4783333,
          h * 0.07100000)
      ..lineTo(w * 0.4783333, h * 0.1490000)
      ..close()
      ..moveTo(w * 0.6890000, h * 0.6566667)
      ..cubicTo(
          w * 0.6890000, h * 0.6656667, w * 0.6920000, h * 0.6733333, w * 0.6980000, h * 0.6800000)
      ..lineTo(w * 0.7526667, h * 0.7340000)
      ..cubicTo(
          w * 0.7666667, h * 0.7480000, w * 0.7823333, h * 0.7480000, w * 0.7996667, h * 0.7340000)
      ..cubicTo(
          w * 0.8056667, h * 0.7283333, w * 0.8083333, h * 0.7210000, w * 0.8083333, h * 0.7113333)
      ..cubicTo(
          w * 0.8083333, h * 0.7023333, w * 0.8053333, h * 0.6950000, w * 0.7996667, h * 0.6890000)
      ..lineTo(w * 0.7433333, h * 0.6333333)
      ..cubicTo(
          w * 0.7373333, h * 0.6276667, w * 0.7296667, h * 0.6250000, w * 0.7206667, h * 0.6250000)
      ..cubicTo(
          w * 0.7113333, h * 0.6250000, w * 0.7040000, h * 0.6280000, w * 0.6980000, h * 0.6340000)
      ..cubicTo(
          w * 0.6920000, h * 0.6400000, w * 0.6890000, h * 0.6476667, w * 0.6890000, h * 0.6566667)
      ..close()
      ..moveTo(w * 0.6890000, h * 0.2363333)
      ..cubicTo(
          w * 0.6890000, h * 0.2456667, w * 0.6920000, h * 0.2536667, w * 0.6980000, h * 0.2603333)
      ..cubicTo(
          w * 0.7040000, h * 0.2663333, w * 0.7116667, h * 0.2693333, w * 0.7206667, h * 0.2693333)
      ..cubicTo(
          w * 0.7296667, h * 0.2693333, w * 0.7373333, h * 0.2663333, w * 0.7433333, h * 0.2603333)
      ..lineTo(w * 0.7996667, h * 0.2040000)
      ..cubicTo(
          w * 0.8056667, h * 0.1983333, w * 0.8083333, h * 0.1910000, w * 0.8083333, h * 0.1816667)
      ..cubicTo(
          w * 0.8083333, h * 0.1723333, w * 0.8050000, h * 0.1646667, w * 0.7986667, h * 0.1586667)
      ..cubicTo(
          w * 0.7923333, h * 0.1526667, w * 0.7846667, h * 0.1493333, w * 0.7753333, h * 0.1493333)
      ..cubicTo(
          w * 0.7666667, h * 0.1493333, w * 0.7590000, h * 0.1526667, w * 0.7526667, h * 0.1590000)
      ..lineTo(w * 0.6980000, h * 0.2133333)
      ..cubicTo(
          w * 0.6920000, h * 0.2193333, w * 0.6890000, h * 0.2270000, w * 0.6890000, h * 0.2363333)
      ..close()
      ..moveTo(w * 0.7750000, h * 0.4476667)
      ..cubicTo(
          w * 0.7750000, h * 0.4566667, w * 0.7780000, h * 0.4640000, w * 0.7843333, h * 0.4700000)
      ..cubicTo(
          w * 0.7906667, h * 0.4760000, w * 0.7986667, h * 0.4786667, w * 0.8083333, h * 0.4786667)
      ..lineTo(w * 0.8646667, h * 0.4786667)
      ..cubicTo(
          w * 0.8736667, h * 0.4786667, w * 0.8813333, h * 0.4756667, w * 0.8876667, h * 0.4696667)
      ..cubicTo(
          w * 0.8940000, h * 0.4636667, w * 0.8973333, h * 0.4563333, w * 0.8973333, h * 0.4476667)
      ..cubicTo(
          w * 0.8973333, h * 0.4380000, w * 0.8943333, h * 0.4300000, w * 0.8880000, h * 0.4240000)
      ..cubicTo(
          w * 0.8816667, h * 0.4180000, w * 0.8740000, h * 0.4146667, w * 0.8650000, h * 0.4146667)
      ..lineTo(w * 0.8086667, h * 0.4146667)
      ..cubicTo(
          w * 0.7990000, h * 0.4146667, w * 0.7910000, h * 0.4176667, w * 0.7846667, h * 0.4240000)
      ..cubicTo(
          w * 0.7783333, h * 0.4296667, w * 0.7750000, h * 0.4376667, w * 0.7750000, h * 0.4476667)
      ..close();
  }

  Path _dayThunderstormPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.05066667, h * 0.5633333)
      ..cubicTo(w * 0.05066667, h * 0.6003333, w * 0.06166667, h * 0.6330000, w * 0.08333333,
          h * 0.6620000)
      ..cubicTo(
          w * 0.1050000, h * 0.6910000, w * 0.1336667, h * 0.7106667, w * 0.1690000, h * 0.7213333)
      ..lineTo(w * 0.1476667, h * 0.7780000)
      ..cubicTo(
          w * 0.1463333, h * 0.7826667, w * 0.1476667, h * 0.7850000, w * 0.1523333, h * 0.7850000)
      ..lineTo(w * 0.2233333, h * 0.7850000)
      ..lineTo(w * 0.1816667, h * 0.9166667)
      ..lineTo(w * 0.1913333, h * 0.9166667)
      ..lineTo(w * 0.3303333, h * 0.7370000)
      ..cubicTo(
          w * 0.3316667, h * 0.7356667, w * 0.3316667, h * 0.7340000, w * 0.3306667, h * 0.7323333)
      ..cubicTo(
          w * 0.3300000, h * 0.7306667, w * 0.3283333, h * 0.7300000, w * 0.3260000, h * 0.7300000)
      ..lineTo(w * 0.2536667, h * 0.7300000)
      ..lineTo(w * 0.3360000, h * 0.5756667)
      ..cubicTo(
          w * 0.3383333, h * 0.5710000, w * 0.3366667, h * 0.5683333, w * 0.3313333, h * 0.5683333)
      ..lineTo(w * 0.2333333, h * 0.5683333)
      ..cubicTo(
          w * 0.2303333, h * 0.5683333, w * 0.2276667, h * 0.5700000, w * 0.2256667, h * 0.5730000)
      ..lineTo(w * 0.1900000, h * 0.6690000)
      ..cubicTo(
          w * 0.1663333, h * 0.6630000, w * 0.1466667, h * 0.6500000, w * 0.1310000, h * 0.6303333)
      ..cubicTo(
          w * 0.1153333, h * 0.6106667, w * 0.1076667, h * 0.5883333, w * 0.1076667, h * 0.5633333)
      ..cubicTo(
          w * 0.1076667, h * 0.5356667, w * 0.1170000, h * 0.5116667, w * 0.1360000, h * 0.4910000)
      ..cubicTo(
          w * 0.1550000, h * 0.4703333, w * 0.1783333, h * 0.4586667, w * 0.2060000, h * 0.4553333)
      ..lineTo(w * 0.2233333, h * 0.4533333)
      ..cubicTo(
          w * 0.2276667, h * 0.4533333, w * 0.2300000, h * 0.4513333, w * 0.2300000, h * 0.4473333)
      ..lineTo(w * 0.2320000, h * 0.4303333)
      ..cubicTo(
          w * 0.2356667, h * 0.3943333, w * 0.2510000, h * 0.3640000, w * 0.2780000, h * 0.3396667)
      ..cubicTo(
          w * 0.3050000, h * 0.3153333, w * 0.3370000, h * 0.3030000, w * 0.3733333, h * 0.3030000)
      ..cubicTo(
          w * 0.4096667, h * 0.3030000, w * 0.4413333, h * 0.3153333, w * 0.4683333, h * 0.3396667)
      ..cubicTo(
          w * 0.4953333, h * 0.3640000, w * 0.5110000, h * 0.3943333, w * 0.5150000, h * 0.4303333)
      ..lineTo(w * 0.5170000, h * 0.4496667)
      ..cubicTo(
          w * 0.5170000, h * 0.4533333, w * 0.5190000, h * 0.4553333, w * 0.5230000, h * 0.4553333)
      ..lineTo(w * 0.5766667, h * 0.4553333)
      ..cubicTo(
          w * 0.6070000, h * 0.4553333, w * 0.6326667, h * 0.4660000, w * 0.6540000, h * 0.4870000)
      ..cubicTo(
          w * 0.6753333, h * 0.5080000, w * 0.6860000, h * 0.5333333, w * 0.6860000, h * 0.5633333)
      ..cubicTo(
          w * 0.6860000, h * 0.5916667, w * 0.6760000, h * 0.6163333, w * 0.6563333, h * 0.6370000)
      ..cubicTo(
          w * 0.6366667, h * 0.6576667, w * 0.6123333, h * 0.6693333, w * 0.5833333, h * 0.6716667)
      ..cubicTo(
          w * 0.5790000, h * 0.6716667, w * 0.5766667, h * 0.6736667, w * 0.5766667, h * 0.6776667)
      ..lineTo(w * 0.5766667, h * 0.7233333)
      ..cubicTo(
          w * 0.5766667, h * 0.7270000, w * 0.5790000, h * 0.7290000, w * 0.5833333, h * 0.7290000)
      ..cubicTo(
          w * 0.6276667, h * 0.7276667, w * 0.6653333, h * 0.7106667, w * 0.6963333, h * 0.6786667)
      ..cubicTo(
          w * 0.7273333, h * 0.6466667, w * 0.7426667, h * 0.6083333, w * 0.7426667, h * 0.5636667)
      ..cubicTo(
          w * 0.7426667, h * 0.5390000, w * 0.7380000, h * 0.5166667, w * 0.7283333, h * 0.4966667)
      ..cubicTo(
          w * 0.7546667, h * 0.4646667, w * 0.7676667, h * 0.4280000, w * 0.7676667, h * 0.3860000)
      ..cubicTo(
          w * 0.7676667, h * 0.3546667, w * 0.7596667, h * 0.3256667, w * 0.7440000, h * 0.2986667)
      ..cubicTo(
          w * 0.7283333, h * 0.2716667, w * 0.7070000, h * 0.2503333, w * 0.6800000, h * 0.2346667)
      ..cubicTo(
          w * 0.6530000, h * 0.2190000, w * 0.6240000, h * 0.2110000, w * 0.5926667, h * 0.2110000)
      ..cubicTo(
          w * 0.5413333, h * 0.2110000, w * 0.4980000, h * 0.2303333, w * 0.4633333, h * 0.2686667)
      ..cubicTo(
          w * 0.4363333, h * 0.2543333, w * 0.4063333, h * 0.2470000, w * 0.3733333, h * 0.2470000)
      ..cubicTo(
          w * 0.3263333, h * 0.2470000, w * 0.2843333, h * 0.2616667, w * 0.2480000, h * 0.2906667)
      ..cubicTo(
          w * 0.2116667, h * 0.3196667, w * 0.1883333, h * 0.3570000, w * 0.1780000, h * 0.4026667)
      ..cubicTo(
          w * 0.1410000, h * 0.4113333, w * 0.1106667, h * 0.4303333, w * 0.08700000, h * 0.4603333)
      ..cubicTo(w * 0.06333333, h * 0.4903333, w * 0.05066667, h * 0.5250000, w * 0.05066667,
          h * 0.5633333)
      ..close()
      ..moveTo(w * 0.3203333, h * 0.8826667)
      ..cubicTo(
          w * 0.3200000, h * 0.8876667, w * 0.3213333, h * 0.8926667, w * 0.3250000, h * 0.8973333)
      ..cubicTo(
          w * 0.3286667, h * 0.9020000, w * 0.3336667, h * 0.9056667, w * 0.3403333, h * 0.9083333)
      ..cubicTo(
          w * 0.3426667, h * 0.9090000, w * 0.3450000, h * 0.9093333, w * 0.3473333, h * 0.9093333)
      ..cubicTo(
          w * 0.3530000, h * 0.9093333, w * 0.3586667, h * 0.9076667, w * 0.3643333, h * 0.9043333)
      ..cubicTo(
          w * 0.3700000, h * 0.9010000, w * 0.3736667, h * 0.8956667, w * 0.3756667, h * 0.8886667)
      ..lineTo(w * 0.4520000, h * 0.6030000)
      ..cubicTo(
          w * 0.4540000, h * 0.5953333, w * 0.4533333, h * 0.5880000, w * 0.4496667, h * 0.5816667)
      ..cubicTo(
          w * 0.4460000, h * 0.5750000, w * 0.4406667, h * 0.5706667, w * 0.4333333, h * 0.5683333)
      ..cubicTo(
          w * 0.4256667, h * 0.5660000, w * 0.4183333, h * 0.5666667, w * 0.4116667, h * 0.5706667)
      ..cubicTo(
          w * 0.4050000, h * 0.5743333, w * 0.4003333, h * 0.5800000, w * 0.3983333, h * 0.5876667)
      ..lineTo(w * 0.3213333, h * 0.8743333)
      ..cubicTo(
          w * 0.3206667, h * 0.8766667, w * 0.3203333, h * 0.8796667, w * 0.3203333, h * 0.8826667)
      ..close()
      ..moveTo(w * 0.3313333, h * 0.1543333)
      ..cubicTo(
          w * 0.3313333, h * 0.1623333, w * 0.3340000, h * 0.1686667, w * 0.3396667, h * 0.1740000)
      ..lineTo(w * 0.3610000, h * 0.1960000)
      ..cubicTo(
          w * 0.3666667, h * 0.2016667, w * 0.3733333, h * 0.2043333, w * 0.3813333, h * 0.2046667)
      ..cubicTo(
          w * 0.3893333, h * 0.2046667, w * 0.3956667, h * 0.2020000, w * 0.4003333, h * 0.1960000)
      ..cubicTo(
          w * 0.4066667, h * 0.1910000, w * 0.4096667, h * 0.1843333, w * 0.4096667, h * 0.1760000)
      ..cubicTo(
          w * 0.4096667, h * 0.1680000, w * 0.4070000, h * 0.1616667, w * 0.4013333, h * 0.1563333)
      ..lineTo(w * 0.3803333, h * 0.1343333)
      ..cubicTo(
          w * 0.3746667, h * 0.1290000, w * 0.3676667, h * 0.1263333, w * 0.3600000, h * 0.1263333)
      ..cubicTo(
          w * 0.3516667, h * 0.1263333, w * 0.3446667, h * 0.1290000, w * 0.3393333, h * 0.1343333)
      ..cubicTo(
          w * 0.3340000, h * 0.1396667, w * 0.3313333, h * 0.1463333, w * 0.3313333, h * 0.1543333)
      ..close()
      ..moveTo(w * 0.4590000, h * 0.7810000)
      ..cubicTo(
          w * 0.4590000, h * 0.7850000, w * 0.4603333, h * 0.7890000, w * 0.4626667, h * 0.7936667)
      ..cubicTo(
          w * 0.4670000, h * 0.8003333, w * 0.4723333, h * 0.8050000, w * 0.4793333, h * 0.8080000)
      ..cubicTo(
          w * 0.4816667, h * 0.8090000, w * 0.4850000, h * 0.8096667, w * 0.4893333, h * 0.8096667)
      ..cubicTo(
          w * 0.4943333, h * 0.8096667, w * 0.4980000, h * 0.8090000, w * 0.5003333, h * 0.8076667)
      ..cubicTo(
          w * 0.5070000, h * 0.8050000, w * 0.5116667, h * 0.7983333, w * 0.5140000, h * 0.7883333)
      ..lineTo(w * 0.5636667, h * 0.6033333)
      ..cubicTo(
          w * 0.5656667, h * 0.5953333, w * 0.5650000, h * 0.5883333, w * 0.5613333, h * 0.5816667)
      ..cubicTo(
          w * 0.5576667, h * 0.5753333, w * 0.5520000, h * 0.5710000, w * 0.5443333, h * 0.5686667)
      ..cubicTo(
          w * 0.5366667, h * 0.5663333, w * 0.5293333, h * 0.5670000, w * 0.5230000, h * 0.5710000)
      ..cubicTo(
          w * 0.5163333, h * 0.5746667, w * 0.5120000, h * 0.5803333, w * 0.5100000, h * 0.5880000)
      ..lineTo(w * 0.4600000, h * 0.7733333)
      ..cubicTo(
          w * 0.4600000, h * 0.7740000, w * 0.4596667, h * 0.7753333, w * 0.4593333, h * 0.7770000)
      ..cubicTo(
          w * 0.4590000, h * 0.7790000, w * 0.4590000, h * 0.7800000, w * 0.4590000, h * 0.7810000)
      ..close()
      ..moveTo(w * 0.5100000, h * 0.3013333)
      ..cubicTo(
          w * 0.5323333, h * 0.2800000, w * 0.5596667, h * 0.2690000, w * 0.5926667, h * 0.2690000)
      ..cubicTo(
          w * 0.6250000, h * 0.2690000, w * 0.6530000, h * 0.2803333, w * 0.6760000, h * 0.3030000)
      ..cubicTo(
          w * 0.6990000, h * 0.3256667, w * 0.7106667, h * 0.3533333, w * 0.7106667, h * 0.3856667)
      ..cubicTo(
          w * 0.7106667, h * 0.4063333, w * 0.7050000, h * 0.4270000, w * 0.6933333, h * 0.4473333)
      ..cubicTo(
          w * 0.6603333, h * 0.4146667, w * 0.6213333, h * 0.3983333, w * 0.5766667, h * 0.3983333)
      ..lineTo(w * 0.5663333, h * 0.3983333)
      ..cubicTo(
          w * 0.5560000, h * 0.3593333, w * 0.5370000, h * 0.3270000, w * 0.5100000, h * 0.3013333)
      ..close()
      ..moveTo(w * 0.5636667, h * 0.1263333)
      ..cubicTo(
          w * 0.5636667, h * 0.1340000, w * 0.5666667, h * 0.1406667, w * 0.5723333, h * 0.1463333)
      ..cubicTo(
          w * 0.5780000, h * 0.1520000, w * 0.5846667, h * 0.1550000, w * 0.5923333, h * 0.1550000)
      ..cubicTo(
          w * 0.6003333, h * 0.1550000, w * 0.6066667, h * 0.1523333, w * 0.6120000, h * 0.1466667)
      ..cubicTo(
          w * 0.6173333, h * 0.1410000, w * 0.6196667, h * 0.1343333, w * 0.6196667, h * 0.1263333)
      ..lineTo(w * 0.6196667, h * 0.05766667)
      ..cubicTo(w * 0.6196667, h * 0.04966667, w * 0.6170000, h * 0.04300000, w * 0.6120000,
          h * 0.03733333)
      ..cubicTo(w * 0.6070000, h * 0.03166667, w * 0.6003333, h * 0.02900000, w * 0.5923333,
          h * 0.02900000)
      ..cubicTo(w * 0.5846667, h * 0.02900000, w * 0.5780000, h * 0.03166667, w * 0.5723333,
          h * 0.03733333)
      ..cubicTo(w * 0.5666667, h * 0.04300000, w * 0.5636667, h * 0.04966667, w * 0.5636667,
          h * 0.05766667)
      ..lineTo(w * 0.5636667, h * 0.1263333)
      ..close()
      ..moveTo(w * 0.7480000, h * 0.2023333)
      ..cubicTo(
          w * 0.7480000, h * 0.2103333, w * 0.7510000, h * 0.2170000, w * 0.7566667, h * 0.2223333)
      ..cubicTo(
          w * 0.7613333, h * 0.2280000, w * 0.7676667, h * 0.2306667, w * 0.7756667, h * 0.2306667)
      ..cubicTo(
          w * 0.7836667, h * 0.2306667, w * 0.7903333, h * 0.2280000, w * 0.7956667, h * 0.2223333)
      ..lineTo(w * 0.8436667, h * 0.1740000)
      ..cubicTo(
          w * 0.8493333, h * 0.1686667, w * 0.8523333, h * 0.1623333, w * 0.8523333, h * 0.1543333)
      ..cubicTo(
          w * 0.8523333, h * 0.1463333, w * 0.8496667, h * 0.1396667, w * 0.8440000, h * 0.1340000)
      ..cubicTo(
          w * 0.8383333, h * 0.1283333, w * 0.8316667, h * 0.1256667, w * 0.8236667, h * 0.1256667)
      ..cubicTo(
          w * 0.8163333, h * 0.1256667, w * 0.8100000, h * 0.1286667, w * 0.8046667, h * 0.1343333)
      ..lineTo(w * 0.7566667, h * 0.1823333)
      ..cubicTo(
          w * 0.7510000, h * 0.1876667, w * 0.7480000, h * 0.1943333, w * 0.7480000, h * 0.2023333)
      ..close()
      ..moveTo(w * 0.7750000, h * 0.5976667)
      ..cubicTo(
          w * 0.7750000, h * 0.6050000, w * 0.7776667, h * 0.6116667, w * 0.7830000, h * 0.6176667)
      ..lineTo(w * 0.8050000, h * 0.6386667)
      ..cubicTo(
          w * 0.8090000, h * 0.6433333, w * 0.8153333, h * 0.6463333, w * 0.8230000, h * 0.6466667)
      ..lineTo(w * 0.8233333, h * 0.6470000)
      ..cubicTo(
          w * 0.8236667, h * 0.6470000, w * 0.8243333, h * 0.6470000, w * 0.8250000, h * 0.6470000)
      ..cubicTo(
          w * 0.8256667, h * 0.6470000, w * 0.8260000, h * 0.6470000, w * 0.8266667, h * 0.6470000)
      ..cubicTo(
          w * 0.8330000, h * 0.6470000, w * 0.8386667, h * 0.6440000, w * 0.8443333, h * 0.6383333)
      ..cubicTo(
          w * 0.8500000, h * 0.6330000, w * 0.8530000, h * 0.6263333, w * 0.8530000, h * 0.6183333)
      ..cubicTo(
          w * 0.8530000, h * 0.6106667, w * 0.8500000, h * 0.6040000, w * 0.8443333, h * 0.5980000)
      ..lineTo(w * 0.8226667, h * 0.5776667)
      ..cubicTo(
          w * 0.8173333, h * 0.5716667, w * 0.8106667, h * 0.5686667, w * 0.8033333, h * 0.5686667)
      ..cubicTo(
          w * 0.7956667, h * 0.5686667, w * 0.7890000, h * 0.5713333, w * 0.7833333, h * 0.5770000)
      ..cubicTo(
          w * 0.7776667, h * 0.5830000, w * 0.7750000, h * 0.5900000, w * 0.7750000, h * 0.5976667)
      ..close()
      ..moveTo(w * 0.8233333, h * 0.3860000)
      ..cubicTo(
          w * 0.8233333, h * 0.3936667, w * 0.8263333, h * 0.4003333, w * 0.8323333, h * 0.4060000)
      ..cubicTo(
          w * 0.8383333, h * 0.4120000, w * 0.8450000, h * 0.4150000, w * 0.8526667, h * 0.4150000)
      ..lineTo(w * 0.9203333, h * 0.4150000)
      ..cubicTo(
          w * 0.9280000, h * 0.4150000, w * 0.9346667, h * 0.4120000, w * 0.9403333, h * 0.4063333)
      ..cubicTo(
          w * 0.9460000, h * 0.4006667, w * 0.9490000, h * 0.3936667, w * 0.9490000, h * 0.3860000)
      ..cubicTo(
          w * 0.9490000, h * 0.3783333, w * 0.9463333, h * 0.3716667, w * 0.9406667, h * 0.3663333)
      ..cubicTo(
          w * 0.9350000, h * 0.3610000, w * 0.9283333, h * 0.3583333, w * 0.9203333, h * 0.3583333)
      ..lineTo(w * 0.8526667, h * 0.3583333)
      ..cubicTo(
          w * 0.8443333, h * 0.3583333, w * 0.8373333, h * 0.3610000, w * 0.8316667, h * 0.3663333)
      ..cubicTo(
          w * 0.8260000, h * 0.3716667, w * 0.8233333, h * 0.3783333, w * 0.8233333, h * 0.3860000)
      ..close();
  }

  Path _dustPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.2443333, h * 0.5526667)
      ..cubicTo(
          w * 0.2443333, h * 0.5450000, w * 0.2470000, h * 0.5390000, w * 0.2520000, h * 0.5340000)
      ..cubicTo(
          w * 0.2573333, h * 0.5290000, w * 0.2643333, h * 0.5266667, w * 0.2733333, h * 0.5266667)
      ..lineTo(w * 0.4636667, h * 0.5266667)
      ..cubicTo(
          w * 0.4726667, h * 0.5266667, w * 0.4796667, h * 0.5290000, w * 0.4850000, h * 0.5340000)
      ..cubicTo(
          w * 0.4903333, h * 0.5390000, w * 0.4926667, h * 0.5450000, w * 0.4926667, h * 0.5526667)
      ..cubicTo(
          w * 0.4926667, h * 0.5616667, w * 0.4900000, h * 0.5690000, w * 0.4850000, h * 0.5740000)
      ..cubicTo(
          w * 0.4800000, h * 0.5790000, w * 0.4726667, h * 0.5816667, w * 0.4636667, h * 0.5816667)
      ..lineTo(w * 0.2733333, h * 0.5816667)
      ..cubicTo(
          w * 0.2643333, h * 0.5816667, w * 0.2573333, h * 0.5790000, w * 0.2520000, h * 0.5740000)
      ..cubicTo(
          w * 0.2466667, h * 0.5690000, w * 0.2443333, h * 0.5620000, w * 0.2443333, h * 0.5526667)
      ..close()
      ..moveTo(w * 0.2443333, h * 0.3556667)
      ..cubicTo(
          w * 0.2443333, h * 0.3483333, w * 0.2470000, h * 0.3420000, w * 0.2520000, h * 0.3373333)
      ..cubicTo(
          w * 0.2573333, h * 0.3323333, w * 0.2643333, h * 0.3300000, w * 0.2733333, h * 0.3300000)
      ..lineTo(w * 0.3720000, h * 0.3300000)
      ..cubicTo(
          w * 0.3810000, h * 0.3300000, w * 0.3880000, h * 0.3323333, w * 0.3933333, h * 0.3373333)
      ..cubicTo(
          w * 0.3986667, h * 0.3420000, w * 0.4013333, h * 0.3483333, w * 0.4013333, h * 0.3556667)
      ..cubicTo(
          w * 0.4013333, h * 0.3646667, w * 0.3986667, h * 0.3716667, w * 0.3933333, h * 0.3770000)
      ..cubicTo(
          w * 0.3880000, h * 0.3823333, w * 0.3810000, h * 0.3850000, w * 0.3720000, h * 0.3850000)
      ..lineTo(w * 0.2733333, h * 0.3850000)
      ..cubicTo(
          w * 0.2643333, h * 0.3850000, w * 0.2573333, h * 0.3823333, w * 0.2520000, h * 0.3773333)
      ..cubicTo(
          w * 0.2466667, h * 0.3723333, w * 0.2443333, h * 0.3646667, w * 0.2443333, h * 0.3556667)
      ..close()
      ..moveTo(w * 0.2773333, h * 0.6513333)
      ..cubicTo(
          w * 0.2773333, h * 0.6440000, w * 0.2803333, h * 0.6373333, w * 0.2866667, h * 0.6313333)
      ..cubicTo(
          w * 0.2926667, h * 0.6253333, w * 0.2996667, h * 0.6220000, w * 0.3066667, h * 0.6220000)
      ..cubicTo(
          w * 0.3153333, h * 0.6220000, w * 0.3220000, h * 0.6250000, w * 0.3273333, h * 0.6310000)
      ..cubicTo(
          w * 0.3326667, h * 0.6370000, w * 0.3353333, h * 0.6436667, w * 0.3353333, h * 0.6513333)
      ..cubicTo(
          w * 0.3353333, h * 0.6603333, w * 0.3326667, h * 0.6676667, w * 0.3276667, h * 0.6730000)
      ..cubicTo(
          w * 0.3226667, h * 0.6783333, w * 0.3156667, h * 0.6806667, w * 0.3066667, h * 0.6806667)
      ..cubicTo(
          w * 0.2990000, h * 0.6806667, w * 0.2920000, h * 0.6780000, w * 0.2863333, h * 0.6726667)
      ..cubicTo(
          w * 0.2800000, h * 0.6670000, w * 0.2773333, h * 0.6600000, w * 0.2773333, h * 0.6513333)
      ..close()
      ..moveTo(w * 0.3246667, h * 0.4536667)
      ..cubicTo(
          w * 0.3246667, h * 0.4460000, w * 0.3270000, h * 0.4390000, w * 0.3320000, h * 0.4333333)
      ..cubicTo(
          w * 0.3370000, h * 0.4273333, w * 0.3430000, h * 0.4243333, w * 0.3500000, h * 0.4243333)
      ..cubicTo(
          w * 0.3586667, h * 0.4243333, w * 0.3660000, h * 0.4273333, w * 0.3713333, h * 0.4333333)
      ..cubicTo(
          w * 0.3766667, h * 0.4393333, w * 0.3793333, h * 0.4460000, w * 0.3793333, h * 0.4536667)
      ..cubicTo(
          w * 0.3793333, h * 0.4626667, w * 0.3766667, h * 0.4700000, w * 0.3716667, h * 0.4753333)
      ..cubicTo(
          w * 0.3663333, h * 0.4806667, w * 0.3593333, h * 0.4830000, w * 0.3500000, h * 0.4830000)
      ..cubicTo(
          w * 0.3423333, h * 0.4830000, w * 0.3363333, h * 0.4803333, w * 0.3316667, h * 0.4750000)
      ..cubicTo(
          w * 0.3270000, h * 0.4696667, w * 0.3246667, h * 0.4626667, w * 0.3246667, h * 0.4536667)
      ..close()
      ..moveTo(w * 0.3576667, h * 0.6513333)
      ..cubicTo(
          w * 0.3576667, h * 0.6436667, w * 0.3603333, h * 0.6366667, w * 0.3656667, h * 0.6310000)
      ..cubicTo(
          w * 0.3710000, h * 0.6253333, w * 0.3783333, h * 0.6220000, w * 0.3870000, h * 0.6220000)
      ..lineTo(w * 0.5146667, h * 0.6220000)
      ..lineTo(w * 0.5440000, h * 0.6513333)
      ..cubicTo(
          w * 0.5440000, h * 0.6600000, w * 0.5410000, h * 0.6670000, w * 0.5350000, h * 0.6726667)
      ..cubicTo(
          w * 0.5290000, h * 0.6783333, w * 0.5223333, h * 0.6806667, w * 0.5146667, h * 0.6806667)
      ..lineTo(w * 0.3870000, h * 0.6806667)
      ..cubicTo(
          w * 0.3780000, h * 0.6806667, w * 0.3706667, h * 0.6780000, w * 0.3653333, h * 0.6726667)
      ..cubicTo(
          w * 0.3600000, h * 0.6673333, w * 0.3576667, h * 0.6603333, w * 0.3576667, h * 0.6513333)
      ..close()
      ..moveTo(w * 0.4016667, h * 0.4536667)
      ..cubicTo(
          w * 0.4016667, h * 0.4463333, w * 0.4046667, h * 0.4396667, w * 0.4110000, h * 0.4336667)
      ..cubicTo(
          w * 0.4170000, h * 0.4276667, w * 0.4240000, h * 0.4243333, w * 0.4310000, h * 0.4243333)
      ..lineTo(w * 0.5586667, h * 0.4243333)
      ..cubicTo(
          w * 0.5673333, h * 0.4243333, w * 0.5743333, h * 0.4273333, w * 0.5796667, h * 0.4333333)
      ..cubicTo(
          w * 0.5850000, h * 0.4393333, w * 0.5876667, h * 0.4460000, w * 0.5876667, h * 0.4536667)
      ..cubicTo(
          w * 0.5876667, h * 0.4626667, w * 0.5850000, h * 0.4700000, w * 0.5800000, h * 0.4753333)
      ..cubicTo(
          w * 0.5746667, h * 0.4806667, w * 0.5676667, h * 0.4830000, w * 0.5586667, h * 0.4830000)
      ..lineTo(w * 0.4310000, h * 0.4830000)
      ..cubicTo(
          w * 0.4233333, h * 0.4830000, w * 0.4163333, h * 0.4803333, w * 0.4106667, h * 0.4750000)
      ..cubicTo(
          w * 0.4046667, h * 0.4696667, w * 0.4016667, h * 0.4626667, w * 0.4016667, h * 0.4536667)
      ..close()
      ..moveTo(w * 0.4270000, h * 0.3556667)
      ..cubicTo(
          w * 0.4270000, h * 0.3483333, w * 0.4296667, h * 0.3420000, w * 0.4350000, h * 0.3373333)
      ..cubicTo(
          w * 0.4403333, h * 0.3326667, w * 0.4473333, h * 0.3300000, w * 0.4563333, h * 0.3300000)
      ..lineTo(w * 0.6466667, h * 0.3300000)
      ..cubicTo(
          w * 0.6543333, h * 0.3300000, w * 0.6610000, h * 0.3326667, w * 0.6670000, h * 0.3376667)
      ..cubicTo(
          w * 0.6730000, h * 0.3426667, w * 0.6760000, h * 0.3486667, w * 0.6760000, h * 0.3556667)
      ..cubicTo(
          w * 0.6760000, h * 0.3643333, w * 0.6730000, h * 0.3716667, w * 0.6670000, h * 0.3770000)
      ..cubicTo(
          w * 0.6610000, h * 0.3823333, w * 0.6543333, h * 0.3850000, w * 0.6466667, h * 0.3850000)
      ..lineTo(w * 0.4563333, h * 0.3850000)
      ..cubicTo(
          w * 0.4473333, h * 0.3850000, w * 0.4400000, h * 0.3823333, w * 0.4346667, h * 0.3770000)
      ..cubicTo(
          w * 0.4293333, h * 0.3716667, w * 0.4270000, h * 0.3646667, w * 0.4270000, h * 0.3556667)
      ..close()
      ..moveTo(w * 0.5146667, h * 0.5526667)
      ..cubicTo(
          w * 0.5146667, h * 0.5456667, w * 0.5176667, h * 0.5393333, w * 0.5236667, h * 0.5343333)
      ..cubicTo(
          w * 0.5296667, h * 0.5293333, w * 0.5363333, h * 0.5266667, w * 0.5440000, h * 0.5266667)
      ..cubicTo(
          w * 0.5516667, h * 0.5266667, w * 0.5583333, h * 0.5293333, w * 0.5643333, h * 0.5343333)
      ..cubicTo(
          w * 0.5703333, h * 0.5393333, w * 0.5733333, h * 0.5456667, w * 0.5733333, h * 0.5526667)
      ..cubicTo(
          w * 0.5733333, h * 0.5613333, w * 0.5703333, h * 0.5683333, w * 0.5643333, h * 0.5736667)
      ..cubicTo(
          w * 0.5583333, h * 0.5790000, w * 0.5516667, h * 0.5816667, w * 0.5440000, h * 0.5816667)
      ..cubicTo(
          w * 0.5363333, h * 0.5816667, w * 0.5293333, h * 0.5790000, w * 0.5236667, h * 0.5736667)
      ..cubicTo(
          w * 0.5176667, h * 0.5686667, w * 0.5146667, h * 0.5616667, w * 0.5146667, h * 0.5526667)
      ..close()
      ..moveTo(w * 0.5660000, h * 0.6513333)
      ..cubicTo(
          w * 0.5660000, h * 0.6436667, w * 0.5686667, h * 0.6366667, w * 0.5740000, h * 0.6310000)
      ..cubicTo(
          w * 0.5793333, h * 0.6250000, w * 0.5863333, h * 0.6220000, w * 0.5950000, h * 0.6220000)
      ..lineTo(w * 0.6573333, h * 0.6220000)
      ..cubicTo(
          w * 0.6660000, h * 0.6220000, w * 0.6730000, h * 0.6250000, w * 0.6783333, h * 0.6306667)
      ..cubicTo(
          w * 0.6836667, h * 0.6363333, w * 0.6863333, h * 0.6433333, w * 0.6863333, h * 0.6513333)
      ..cubicTo(
          w * 0.6863333, h * 0.6603333, w * 0.6836667, h * 0.6676667, w * 0.6786667, h * 0.6730000)
      ..cubicTo(
          w * 0.6736667, h * 0.6783333, w * 0.6663333, h * 0.6806667, w * 0.6573333, h * 0.6806667)
      ..lineTo(w * 0.5950000, h * 0.6806667)
      ..cubicTo(
          w * 0.5860000, h * 0.6806667, w * 0.5790000, h * 0.6780000, w * 0.5736667, h * 0.6730000)
      ..cubicTo(
          w * 0.5686667, h * 0.6676667, w * 0.5660000, h * 0.6603333, w * 0.5660000, h * 0.6513333)
      ..close()
      ..moveTo(w * 0.5950000, h * 0.5526667)
      ..cubicTo(
          w * 0.5950000, h * 0.5456667, w * 0.5980000, h * 0.5393333, w * 0.6040000, h * 0.5343333)
      ..cubicTo(
          w * 0.6100000, h * 0.5293333, w * 0.6166667, h * 0.5266667, w * 0.6243333, h * 0.5266667)
      ..lineTo(w * 0.7266667, h * 0.5266667)
      ..cubicTo(
          w * 0.7340000, h * 0.5266667, w * 0.7400000, h * 0.5293333, w * 0.7446667, h * 0.5343333)
      ..cubicTo(
          w * 0.7493333, h * 0.5393333, w * 0.7520000, h * 0.5453333, w * 0.7520000, h * 0.5526667)
      ..cubicTo(
          w * 0.7520000, h * 0.5616667, w * 0.7496667, h * 0.5686667, w * 0.7450000, h * 0.5740000)
      ..cubicTo(
          w * 0.7403333, h * 0.5793333, w * 0.7343333, h * 0.5816667, w * 0.7266667, h * 0.5816667)
      ..lineTo(w * 0.6243333, h * 0.5816667)
      ..cubicTo(
          w * 0.6166667, h * 0.5816667, w * 0.6096667, h * 0.5790000, w * 0.6040000, h * 0.5736667)
      ..cubicTo(
          w * 0.5980000, h * 0.5686667, w * 0.5950000, h * 0.5616667, w * 0.5950000, h * 0.5526667)
      ..close()
      ..moveTo(w * 0.6096667, h * 0.4536667)
      ..cubicTo(
          w * 0.6096667, h * 0.4463333, w * 0.6126667, h * 0.4396667, w * 0.6190000, h * 0.4336667)
      ..cubicTo(
          w * 0.6250000, h * 0.4276667, w * 0.6320000, h * 0.4243333, w * 0.6390000, h * 0.4243333)
      ..lineTo(w * 0.7043333, h * 0.4243333)
      ..cubicTo(
          w * 0.7113333, h * 0.4243333, w * 0.7173333, h * 0.4273333, w * 0.7223333, h * 0.4333333)
      ..cubicTo(
          w * 0.7273333, h * 0.4393333, w * 0.7300000, h * 0.4460000, w * 0.7300000, h * 0.4536667)
      ..cubicTo(
          w * 0.7300000, h * 0.4626667, w * 0.7276667, h * 0.4696667, w * 0.7226667, h * 0.4750000)
      ..cubicTo(
          w * 0.7180000, h * 0.4803333, w * 0.7116667, h * 0.4830000, w * 0.7043333, h * 0.4830000)
      ..lineTo(w * 0.6390000, h * 0.4830000)
      ..cubicTo(
          w * 0.6313333, h * 0.4830000, w * 0.6243333, h * 0.4803333, w * 0.6186667, h * 0.4750000)
      ..cubicTo(
          w * 0.6126667, h * 0.4696667, w * 0.6096667, h * 0.4626667, w * 0.6096667, h * 0.4536667)
      ..close()
      ..moveTo(w * 0.7010000, h * 0.3556667)
      ..cubicTo(
          w * 0.7010000, h * 0.3483333, w * 0.7033333, h * 0.3423333, w * 0.7083333, h * 0.3373333)
      ..cubicTo(
          w * 0.7133333, h * 0.3323333, w * 0.7193333, h * 0.3300000, w * 0.7266667, h * 0.3300000)
      ..cubicTo(
          w * 0.7356667, h * 0.3300000, w * 0.7426667, h * 0.3323333, w * 0.7480000, h * 0.3373333)
      ..cubicTo(
          w * 0.7533333, h * 0.3420000, w * 0.7560000, h * 0.3483333, w * 0.7560000, h * 0.3556667)
      ..cubicTo(
          w * 0.7560000, h * 0.3646667, w * 0.7533333, h * 0.3716667, w * 0.7480000, h * 0.3770000)
      ..cubicTo(
          w * 0.7426667, h * 0.3823333, w * 0.7356667, h * 0.3850000, w * 0.7266667, h * 0.3850000)
      ..cubicTo(
          w * 0.7190000, h * 0.3850000, w * 0.7130000, h * 0.3823333, w * 0.7083333, h * 0.3770000)
      ..cubicTo(
          w * 0.7033333, h * 0.3716667, w * 0.7010000, h * 0.3646667, w * 0.7010000, h * 0.3556667)
      ..close();
  }

  Path _fogPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.08733333, h * 0.7016667)
      ..cubicTo(w * 0.08733333, h * 0.6936667, w * 0.09000000, h * 0.6866667, w * 0.09566667,
          h * 0.6813333)
      ..cubicTo(
          w * 0.1013333, h * 0.6760000, w * 0.1083333, h * 0.6733333, w * 0.1166667, h * 0.6733333)
      ..lineTo(w * 0.7390000, h * 0.6733333)
      ..cubicTo(
          w * 0.7473333, h * 0.6733333, w * 0.7540000, h * 0.6760000, w * 0.7593333, h * 0.6813333)
      ..cubicTo(
          w * 0.7646667, h * 0.6866667, w * 0.7673333, h * 0.6933333, w * 0.7673333, h * 0.7016667)
      ..cubicTo(
          w * 0.7673333, h * 0.7093333, w * 0.7646667, h * 0.7160000, w * 0.7590000, h * 0.7210000)
      ..cubicTo(
          w * 0.7533333, h * 0.7263333, w * 0.7466667, h * 0.7286667, w * 0.7390000, h * 0.7286667)
      ..lineTo(w * 0.1166667, h * 0.7286667)
      ..cubicTo(
          w * 0.1083333, h * 0.7286667, w * 0.1013333, h * 0.7260000, w * 0.09566667, h * 0.7210000)
      ..cubicTo(w * 0.09000000, h * 0.7156667, w * 0.08733333, h * 0.7093333, w * 0.08733333,
          h * 0.7016667)
      ..close()
      ..moveTo(w * 0.1746667, h * 0.5970000)
      ..cubicTo(
          w * 0.1746667, h * 0.5890000, w * 0.1776667, h * 0.5823333, w * 0.1833333, h * 0.5770000)
      ..cubicTo(
          w * 0.1883333, h * 0.5720000, w * 0.1950000, h * 0.5693333, w * 0.2030000, h * 0.5693333)
      ..lineTo(w * 0.8253333, h * 0.5693333)
      ..cubicTo(
          w * 0.8330000, h * 0.5693333, w * 0.8393333, h * 0.5720000, w * 0.8446667, h * 0.5773333)
      ..cubicTo(
          w * 0.8500000, h * 0.5826667, w * 0.8523333, h * 0.5890000, w * 0.8523333, h * 0.5970000)
      ..cubicTo(
          w * 0.8523333, h * 0.6050000, w * 0.8496667, h * 0.6116667, w * 0.8446667, h * 0.6170000)
      ..cubicTo(
          w * 0.8393333, h * 0.6226667, w * 0.8330000, h * 0.6253333, w * 0.8253333, h * 0.6253333)
      ..lineTo(w * 0.2030000, h * 0.6253333)
      ..cubicTo(
          w * 0.1950000, h * 0.6253333, w * 0.1883333, h * 0.6226667, w * 0.1830000, h * 0.6170000)
      ..cubicTo(
          w * 0.1773333, h * 0.6113333, w * 0.1746667, h * 0.6046667, w * 0.1746667, h * 0.5970000)
      ..close()
      ..moveTo(w * 0.1790000, h * 0.5173333)
      ..cubicTo(
          w * 0.1790000, h * 0.5203333, w * 0.1806667, h * 0.5216667, w * 0.1840000, h * 0.5216667)
      ..lineTo(w * 0.2316667, h * 0.5216667)
      ..cubicTo(
          w * 0.2336667, h * 0.5216667, w * 0.2360000, h * 0.5200000, w * 0.2383333, h * 0.5163333)
      ..cubicTo(
          w * 0.2463333, h * 0.4990000, w * 0.2580000, h * 0.4850000, w * 0.2736667, h * 0.4740000)
      ..cubicTo(
          w * 0.2893333, h * 0.4630000, w * 0.3066667, h * 0.4566667, w * 0.3253333, h * 0.4553333)
      ..lineTo(w * 0.3436667, h * 0.4530000)
      ..cubicTo(
          w * 0.3473333, h * 0.4530000, w * 0.3493333, h * 0.4510000, w * 0.3493333, h * 0.4470000)
      ..lineTo(w * 0.3516667, h * 0.4303333)
      ..cubicTo(
          w * 0.3553333, h * 0.3943333, w * 0.3703333, h * 0.3643333, w * 0.3973333, h * 0.3403333)
      ..cubicTo(
          w * 0.4243333, h * 0.3163333, w * 0.4560000, h * 0.3043333, w * 0.4923333, h * 0.3043333)
      ..cubicTo(
          w * 0.5283333, h * 0.3043333, w * 0.5596667, h * 0.3163333, w * 0.5866667, h * 0.3400000)
      ..cubicTo(
          w * 0.6133333, h * 0.3636667, w * 0.6286667, h * 0.3936667, w * 0.6323333, h * 0.4293333)
      ..lineTo(w * 0.6350000, h * 0.4483333)
      ..cubicTo(
          w * 0.6350000, h * 0.4520000, w * 0.6373333, h * 0.4540000, w * 0.6416667, h * 0.4540000)
      ..lineTo(w * 0.6946667, h * 0.4540000)
      ..cubicTo(
          w * 0.7160000, h * 0.4540000, w * 0.7356667, h * 0.4596667, w * 0.7533333, h * 0.4713333)
      ..cubicTo(
          w * 0.7710000, h * 0.4830000, w * 0.7840000, h * 0.4980000, w * 0.7926667, h * 0.5170000)
      ..cubicTo(
          w * 0.7950000, h * 0.5206667, w * 0.7973333, h * 0.5223333, w * 0.7996667, h * 0.5223333)
      ..lineTo(w * 0.8473333, h * 0.5223333)
      ..cubicTo(
          w * 0.8513333, h * 0.5223333, w * 0.8530000, h * 0.5200000, w * 0.8520000, h * 0.5146667)
      ..cubicTo(
          w * 0.8423333, h * 0.4806667, w * 0.8226667, h * 0.4526667, w * 0.7940000, h * 0.4310000)
      ..cubicTo(
          w * 0.7650000, h * 0.4093333, w * 0.7320000, h * 0.3986667, w * 0.6950000, h * 0.3986667)
      ..lineTo(w * 0.6843333, h * 0.3986667)
      ..cubicTo(
          w * 0.6733333, h * 0.3543333, w * 0.6500000, h * 0.3180000, w * 0.6143333, h * 0.2896667)
      ..cubicTo(
          w * 0.5786667, h * 0.2613333, w * 0.5383333, h * 0.2473333, w * 0.4926667, h * 0.2473333)
      ..cubicTo(
          w * 0.4460000, h * 0.2473333, w * 0.4046667, h * 0.2620000, w * 0.3683333, h * 0.2913333)
      ..cubicTo(
          w * 0.3320000, h * 0.3206667, w * 0.3090000, h * 0.3580000, w * 0.2986667, h * 0.4033333)
      ..cubicTo(
          w * 0.2703333, h * 0.4100000, w * 0.2453333, h * 0.4233333, w * 0.2240000, h * 0.4436667)
      ..cubicTo(
          w * 0.2026667, h * 0.4640000, w * 0.1876667, h * 0.4880000, w * 0.1793333, h * 0.5163333)
      ..lineTo(w * 0.1793333, h * 0.5150000)
      ..cubicTo(
          w * 0.1790000, h * 0.5150000, w * 0.1790000, h * 0.5160000, w * 0.1790000, h * 0.5173333)
      ..close()
      ..moveTo(w * 0.2326667, h * 0.8036667)
      ..cubicTo(
          w * 0.2326667, h * 0.7956667, w * 0.2356667, h * 0.7893333, w * 0.2413333, h * 0.7840000)
      ..cubicTo(
          w * 0.2463333, h * 0.7790000, w * 0.2530000, h * 0.7763333, w * 0.2613333, h * 0.7763333)
      ..lineTo(w * 0.8840000, h * 0.7763333)
      ..cubicTo(
          w * 0.8920000, h * 0.7763333, w * 0.8986667, h * 0.7790000, w * 0.9040000, h * 0.7840000)
      ..cubicTo(
          w * 0.9096667, h * 0.7893333, w * 0.9123333, h * 0.7956667, w * 0.9123333, h * 0.8033333)
      ..cubicTo(
          w * 0.9123333, h * 0.8113333, w * 0.9096667, h * 0.8180000, w * 0.9040000, h * 0.8236667)
      ..cubicTo(
          w * 0.8983333, h * 0.8293333, w * 0.8916667, h * 0.8320000, w * 0.8840000, h * 0.8320000)
      ..lineTo(w * 0.2613333, h * 0.8320000)
      ..cubicTo(
          w * 0.2536667, h * 0.8320000, w * 0.2470000, h * 0.8290000, w * 0.2413333, h * 0.8233333)
      ..cubicTo(
          w * 0.2356667, h * 0.8183333, w * 0.2326667, h * 0.8113333, w * 0.2326667, h * 0.8036667)
      ..close();
  }

  Path _hailPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1546667, h * 0.5633333)
      ..cubicTo(
          w * 0.1546667, h * 0.6076667, w * 0.1700000, h * 0.6456667, w * 0.2010000, h * 0.6776667)
      ..cubicTo(
          w * 0.2320000, h * 0.7096667, w * 0.2696667, h * 0.7266667, w * 0.3143333, h * 0.7286667)
      ..cubicTo(
          w * 0.3180000, h * 0.7286667, w * 0.3200000, h * 0.7266667, w * 0.3200000, h * 0.7230000)
      ..lineTo(w * 0.3200000, h * 0.6783333)
      ..cubicTo(
          w * 0.3200000, h * 0.6746667, w * 0.3180000, h * 0.6726667, w * 0.3143333, h * 0.6726667)
      ..cubicTo(
          w * 0.2856667, h * 0.6713333, w * 0.2616667, h * 0.6600000, w * 0.2416667, h * 0.6386667)
      ..cubicTo(
          w * 0.2216667, h * 0.6173333, w * 0.2116667, h * 0.5923333, w * 0.2116667, h * 0.5633333)
      ..cubicTo(
          w * 0.2116667, h * 0.5356667, w * 0.2210000, h * 0.5120000, w * 0.2396667, h * 0.4913333)
      ..cubicTo(
          w * 0.2583333, h * 0.4710000, w * 0.2816667, h * 0.4590000, w * 0.3093333, h * 0.4556667)
      ..lineTo(w * 0.3270000, h * 0.4546667)
      ..cubicTo(
          w * 0.3313333, h * 0.4546667, w * 0.3336667, h * 0.4526667, w * 0.3336667, h * 0.4483333)
      ..lineTo(w * 0.3356667, h * 0.4306667)
      ..cubicTo(
          w * 0.3393333, h * 0.3946667, w * 0.3543333, h * 0.3643333, w * 0.3813333, h * 0.3403333)
      ..cubicTo(
          w * 0.4083333, h * 0.3160000, w * 0.4400000, h * 0.3040000, w * 0.4763333, h * 0.3040000)
      ..cubicTo(
          w * 0.5126667, h * 0.3040000, w * 0.5443333, h * 0.3160000, w * 0.5713333, h * 0.3403333)
      ..cubicTo(
          w * 0.5983333, h * 0.3646667, w * 0.6136667, h * 0.3946667, w * 0.6176667, h * 0.4306667)
      ..lineTo(w * 0.6203333, h * 0.4500000)
      ..cubicTo(
          w * 0.6203333, h * 0.4536667, w * 0.6223333, h * 0.4556667, w * 0.6263333, h * 0.4556667)
      ..lineTo(w * 0.6800000, h * 0.4556667)
      ..cubicTo(
          w * 0.7096667, h * 0.4556667, w * 0.7353333, h * 0.4663333, w * 0.7570000, h * 0.4876667)
      ..cubicTo(
          w * 0.7786667, h * 0.5090000, w * 0.7896667, h * 0.5340000, w * 0.7896667, h * 0.5633333)
      ..cubicTo(
          w * 0.7896667, h * 0.5923333, w * 0.7796667, h * 0.6173333, w * 0.7596667, h * 0.6386667)
      ..cubicTo(
          w * 0.7396667, h * 0.6600000, w * 0.7153333, h * 0.6713333, w * 0.6870000, h * 0.6726667)
      ..cubicTo(
          w * 0.6826667, h * 0.6726667, w * 0.6803333, h * 0.6746667, w * 0.6803333, h * 0.6783333)
      ..lineTo(w * 0.6803333, h * 0.7230000)
      ..cubicTo(
          w * 0.6803333, h * 0.7266667, w * 0.6826667, h * 0.7286667, w * 0.6870000, h * 0.7286667)
      ..cubicTo(
          w * 0.7160000, h * 0.7280000, w * 0.7426667, h * 0.7200000, w * 0.7670000, h * 0.7050000)
      ..cubicTo(
          w * 0.7913333, h * 0.6900000, w * 0.8106667, h * 0.6700000, w * 0.8246667, h * 0.6450000)
      ..cubicTo(
          w * 0.8386667, h * 0.6200000, w * 0.8456667, h * 0.5926667, w * 0.8456667, h * 0.5636667)
      ..cubicTo(
          w * 0.8456667, h * 0.5340000, w * 0.8383333, h * 0.5063333, w * 0.8233333, h * 0.4813333)
      ..cubicTo(
          w * 0.8086667, h * 0.4563333, w * 0.7883333, h * 0.4363333, w * 0.7630000, h * 0.4220000)
      ..cubicTo(
          w * 0.7376667, h * 0.4076667, w * 0.7096667, h * 0.4000000, w * 0.6800000, h * 0.4000000)
      ..lineTo(w * 0.6693333, h * 0.4000000)
      ..cubicTo(
          w * 0.6586667, h * 0.3553333, w * 0.6350000, h * 0.3190000, w * 0.5993333, h * 0.2906667)
      ..cubicTo(
          w * 0.5636667, h * 0.2623333, w * 0.5226667, h * 0.2480000, w * 0.4766667, h * 0.2480000)
      ..cubicTo(
          w * 0.4296667, h * 0.2480000, w * 0.3880000, h * 0.2626667, w * 0.3516667, h * 0.2916667)
      ..cubicTo(
          w * 0.3153333, h * 0.3206667, w * 0.2920000, h * 0.3580000, w * 0.2816667, h * 0.4033333)
      ..cubicTo(
          w * 0.2446667, h * 0.4120000, w * 0.2143333, h * 0.4310000, w * 0.1906667, h * 0.4610000)
      ..cubicTo(
          w * 0.1670000, h * 0.4910000, w * 0.1546667, h * 0.5250000, w * 0.1546667, h * 0.5633333)
      ..close()
      ..moveTo(w * 0.3363333, h * 0.8033333)
      ..cubicTo(
          w * 0.3393333, h * 0.8103333, w * 0.3446667, h * 0.8156667, w * 0.3516667, h * 0.8186667)
      ..cubicTo(
          w * 0.3583333, h * 0.8220000, w * 0.3653333, h * 0.8223333, w * 0.3723333, h * 0.8193333)
      ..cubicTo(
          w * 0.3796667, h * 0.8163333, w * 0.3843333, h * 0.8113333, w * 0.3873333, h * 0.8043333)
      ..cubicTo(
          w * 0.3906667, h * 0.7970000, w * 0.3910000, h * 0.7900000, w * 0.3880000, h * 0.7830000)
      ..cubicTo(
          w * 0.3853333, h * 0.7760000, w * 0.3800000, h * 0.7713333, w * 0.3730000, h * 0.7683333)
      ..cubicTo(
          w * 0.3663333, h * 0.7646667, w * 0.3596667, h * 0.7643333, w * 0.3526667, h * 0.7673333)
      ..cubicTo(
          w * 0.3456667, h * 0.7703333, w * 0.3406667, h * 0.7753333, w * 0.3373333, h * 0.7830000)
      ..cubicTo(
          w * 0.3336667, h * 0.7886667, w * 0.3336667, h * 0.7953333, w * 0.3363333, h * 0.8033333)
      ..close()
      ..moveTo(w * 0.3573333, h * 0.7093333)
      ..cubicTo(
          w * 0.3573333, h * 0.7146667, w * 0.3590000, h * 0.7196667, w * 0.3623333, h * 0.7243333)
      ..cubicTo(
          w * 0.3656667, h * 0.7293333, w * 0.3710000, h * 0.7326667, w * 0.3776667, h * 0.7350000)
      ..cubicTo(
          w * 0.3840000, h * 0.7386667, w * 0.3910000, h * 0.7390000, w * 0.3983333, h * 0.7353333)
      ..cubicTo(
          w * 0.4056667, h * 0.7320000, w * 0.4106667, h * 0.7253333, w * 0.4130000, h * 0.7153333)
      ..lineTo(w * 0.4430000, h * 0.6026667)
      ..cubicTo(
          w * 0.4450000, h * 0.5943333, w * 0.4443333, h * 0.5870000, w * 0.4403333, h * 0.5803333)
      ..cubicTo(
          w * 0.4363333, h * 0.5736667, w * 0.4306667, h * 0.5696667, w * 0.4226667, h * 0.5683333)
      ..cubicTo(
          w * 0.4200000, h * 0.5676667, w * 0.4173333, h * 0.5673333, w * 0.4146667, h * 0.5673333)
      ..cubicTo(
          w * 0.4093333, h * 0.5673333, w * 0.4040000, h * 0.5690000, w * 0.3990000, h * 0.5723333)
      ..cubicTo(
          w * 0.3940000, h * 0.5756667, w * 0.3903333, h * 0.5806667, w * 0.3883333, h * 0.5870000)
      ..lineTo(w * 0.3590000, h * 0.7000000)
      ..cubicTo(
          w * 0.3576667, h * 0.7053333, w * 0.3573333, h * 0.7083333, w * 0.3573333, h * 0.7093333)
      ..close()
      ..moveTo(w * 0.4193333, h * 0.8956667)
      ..cubicTo(
          w * 0.4193333, h * 0.8996667, w * 0.4200000, h * 0.9030000, w * 0.4213333, h * 0.9053333)
      ..cubicTo(
          w * 0.4243333, h * 0.9126667, w * 0.4293333, h * 0.9176667, w * 0.4363333, h * 0.9203333)
      ..cubicTo(
          w * 0.4393333, h * 0.9220000, w * 0.4430000, h * 0.9230000, w * 0.4473333, h * 0.9230000)
      ..cubicTo(
          w * 0.4493333, h * 0.9230000, w * 0.4526667, h * 0.9223333, w * 0.4573333, h * 0.9210000)
      ..cubicTo(
          w * 0.4646667, h * 0.9183333, w * 0.4700000, h * 0.9133333, w * 0.4730000, h * 0.9060000)
      ..cubicTo(
          w * 0.4763333, h * 0.8986667, w * 0.4763333, h * 0.8913333, w * 0.4730000, h * 0.8840000)
      ..cubicTo(
          w * 0.4696667, h * 0.8766667, w * 0.4646667, h * 0.8716667, w * 0.4580000, h * 0.8686667)
      ..cubicTo(
          w * 0.4513333, h * 0.8656667, w * 0.4446667, h * 0.8656667, w * 0.4373333, h * 0.8686667)
      ..cubicTo(
          w * 0.4310000, h * 0.8713333, w * 0.4266667, h * 0.8753333, w * 0.4236667, h * 0.8806667)
      ..cubicTo(
          w * 0.4206667, h * 0.8860000, w * 0.4193333, h * 0.8910000, w * 0.4193333, h * 0.8956667)
      ..close()
      ..moveTo(w * 0.4436667, h * 0.8086667)
      ..cubicTo(
          w * 0.4436667, h * 0.8210000, w * 0.4506667, h * 0.8290000, w * 0.4646667, h * 0.8330000)
      ..cubicTo(
          w * 0.4683333, h * 0.8340000, w * 0.4710000, h * 0.8343333, w * 0.4726667, h * 0.8343333)
      ..cubicTo(
          w * 0.4776667, h * 0.8343333, w * 0.4820000, h * 0.8333333, w * 0.4853333, h * 0.8316667)
      ..cubicTo(
          w * 0.4923333, h * 0.8290000, w * 0.4970000, h * 0.8226667, w * 0.4993333, h * 0.8126667)
      ..lineTo(w * 0.5550000, h * 0.6030000)
      ..cubicTo(
          w * 0.5570000, h * 0.5950000, w * 0.5563333, h * 0.5880000, w * 0.5530000, h * 0.5813333)
      ..cubicTo(
          w * 0.5496667, h * 0.5750000, w * 0.5440000, h * 0.5706667, w * 0.5366667, h * 0.5686667)
      ..cubicTo(
          w * 0.5340000, h * 0.5680000, w * 0.5310000, h * 0.5676667, w * 0.5276667, h * 0.5676667)
      ..cubicTo(
          w * 0.5223333, h * 0.5676667, w * 0.5170000, h * 0.5693333, w * 0.5116667, h * 0.5726667)
      ..cubicTo(
          w * 0.5063333, h * 0.5760000, w * 0.5030000, h * 0.5810000, w * 0.5016667, h * 0.5873333)
      ..lineTo(w * 0.4446667, h * 0.7986667)
      ..cubicTo(
          w * 0.4440000, h * 0.8033333, w * 0.4436667, h * 0.8066667, w * 0.4436667, h * 0.8086667)
      ..close()
      ..moveTo(w * 0.5580000, h * 0.7933333)
      ..cubicTo(
          w * 0.5580000, h * 0.7973333, w * 0.5586667, h * 0.8010000, w * 0.5606667, h * 0.8040000)
      ..cubicTo(
          w * 0.5633333, h * 0.8103333, w * 0.5683333, h * 0.8153333, w * 0.5753333, h * 0.8186667)
      ..cubicTo(
          w * 0.5790000, h * 0.8200000, w * 0.5830000, h * 0.8210000, w * 0.5870000, h * 0.8210000)
      ..cubicTo(
          w * 0.5890000, h * 0.8210000, w * 0.5923333, h * 0.8203333, w * 0.5970000, h * 0.8190000)
      ..cubicTo(
          w * 0.6040000, h * 0.8163333, w * 0.6093333, h * 0.8113333, w * 0.6123333, h * 0.8043333)
      ..cubicTo(
          w * 0.6146667, h * 0.7970000, w * 0.6146667, h * 0.7900000, w * 0.6120000, h * 0.7833333)
      ..cubicTo(
          w * 0.6093333, h * 0.7766667, w * 0.6046667, h * 0.7716667, w * 0.5980000, h * 0.7683333)
      ..cubicTo(
          w * 0.5903333, h * 0.7646667, w * 0.5833333, h * 0.7643333, w * 0.5763333, h * 0.7673333)
      ..cubicTo(
          w * 0.5693333, h * 0.7703333, w * 0.5643333, h * 0.7753333, w * 0.5610000, h * 0.7830000)
      ..cubicTo(
          w * 0.5590000, h * 0.7863333, w * 0.5580000, h * 0.7896667, w * 0.5580000, h * 0.7933333)
      ..close()
      ..moveTo(w * 0.5823333, h * 0.7076667)
      ..cubicTo(
          w * 0.5823333, h * 0.7123333, w * 0.5840000, h * 0.7173333, w * 0.5876667, h * 0.7226667)
      ..cubicTo(
          w * 0.5913333, h * 0.7280000, w * 0.5963333, h * 0.7316667, w * 0.6026667, h * 0.7336667)
      ..cubicTo(
          w * 0.6080000, h * 0.7346667, w * 0.6110000, h * 0.7353333, w * 0.6116667, h * 0.7353333)
      ..cubicTo(
          w * 0.6146667, h * 0.7353333, w * 0.6190000, h * 0.7343333, w * 0.6240000, h * 0.7320000)
      ..cubicTo(
          w * 0.6306667, h * 0.7290000, w * 0.6350000, h * 0.7230000, w * 0.6373333, h * 0.7146667)
      ..lineTo(w * 0.6673333, h * 0.6033333)
      ..cubicTo(
          w * 0.6680000, h * 0.5976667, w * 0.6683333, h * 0.5946667, w * 0.6683333, h * 0.5946667)
      ..cubicTo(
          w * 0.6683333, h * 0.5893333, w * 0.6666667, h * 0.5843333, w * 0.6633333, h * 0.5793333)
      ..cubicTo(
          w * 0.6600000, h * 0.5743333, w * 0.6550000, h * 0.5710000, w * 0.6483333, h * 0.5690000)
      ..cubicTo(
          w * 0.6453333, h * 0.5683333, w * 0.6423333, h * 0.5680000, w * 0.6396667, h * 0.5680000)
      ..cubicTo(
          w * 0.6343333, h * 0.5680000, w * 0.6290000, h * 0.5696667, w * 0.6240000, h * 0.5730000)
      ..cubicTo(
          w * 0.6190000, h * 0.5763333, w * 0.6156667, h * 0.5813333, w * 0.6136667, h * 0.5880000)
      ..lineTo(w * 0.5836667, h * 0.7000000)
      ..lineTo(w * 0.5823333, h * 0.7076667)
      ..close();
  }

  Path _hotPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1380000, h * 0.4920000)
      ..cubicTo(
          w * 0.1380000, h * 0.4840000, w * 0.1410000, h * 0.4773333, w * 0.1470000, h * 0.4716667)
      ..cubicTo(
          w * 0.1526667, h * 0.4660000, w * 0.1596667, h * 0.4633333, w * 0.1676667, h * 0.4633333)
      ..lineTo(w * 0.2363333, h * 0.4633333)
      ..cubicTo(
          w * 0.2443333, h * 0.4633333, w * 0.2510000, h * 0.4660000, w * 0.2563333, h * 0.4716667)
      ..cubicTo(
          w * 0.2620000, h * 0.4773333, w * 0.2646667, h * 0.4840000, w * 0.2646667, h * 0.4920000)
      ..cubicTo(
          w * 0.2646667, h * 0.5003333, w * 0.2620000, h * 0.5073333, w * 0.2563333, h * 0.5130000)
      ..cubicTo(
          w * 0.2506667, h * 0.5186667, w * 0.2440000, h * 0.5213333, w * 0.2363333, h * 0.5213333)
      ..lineTo(w * 0.1676667, h * 0.5213333)
      ..cubicTo(
          w * 0.1593333, h * 0.5213333, w * 0.1523333, h * 0.5186667, w * 0.1466667, h * 0.5130000)
      ..cubicTo(
          w * 0.1406667, h * 0.5073333, w * 0.1380000, h * 0.5003333, w * 0.1380000, h * 0.4920000)
      ..close()
      ..moveTo(w * 0.2353333, h * 0.2580000)
      ..cubicTo(
          w * 0.2353333, h * 0.2503333, w * 0.2380000, h * 0.2433333, w * 0.2433333, h * 0.2373333)
      ..cubicTo(
          w * 0.2500000, h * 0.2320000, w * 0.2570000, h * 0.2290000, w * 0.2653333, h * 0.2290000)
      ..cubicTo(
          w * 0.2723333, h * 0.2290000, w * 0.2790000, h * 0.2316667, w * 0.2850000, h * 0.2373333)
      ..lineTo(w * 0.3333333, h * 0.2866667)
      ..cubicTo(
          w * 0.3390000, h * 0.2920000, w * 0.3416667, h * 0.2986667, w * 0.3416667, h * 0.3066667)
      ..cubicTo(
          w * 0.3416667, h * 0.3146667, w * 0.3390000, h * 0.3213333, w * 0.3333333, h * 0.3266667)
      ..cubicTo(
          w * 0.3276667, h * 0.3323333, w * 0.3213333, h * 0.3350000, w * 0.3133333, h * 0.3350000)
      ..cubicTo(
          w * 0.3046667, h * 0.3350000, w * 0.2980000, h * 0.3323333, w * 0.2930000, h * 0.3266667)
      ..lineTo(w * 0.2430000, h * 0.2786667)
      ..cubicTo(
          w * 0.2383333, h * 0.2730000, w * 0.2353333, h * 0.2660000, w * 0.2353333, h * 0.2580000)
      ..close()
      ..moveTo(w * 0.3223333, h * 0.4920000)
      ..cubicTo(
          w * 0.3223333, h * 0.4683333, w * 0.3270000, h * 0.4456667, w * 0.3366667, h * 0.4240000)
      ..cubicTo(
          w * 0.3460000, h * 0.4023333, w * 0.3590000, h * 0.3833333, w * 0.3746667, h * 0.3676667)
      ..cubicTo(
          w * 0.3906667, h * 0.3520000, w * 0.4096667, h * 0.3393333, w * 0.4313333, h * 0.3300000)
      ..cubicTo(
          w * 0.4530000, h * 0.3206667, w * 0.4760000, h * 0.3156667, w * 0.5000000, h * 0.3156667)
      ..cubicTo(
          w * 0.5320000, h * 0.3156667, w * 0.5613333, h * 0.3236667, w * 0.5886667, h * 0.3396667)
      ..cubicTo(
          w * 0.6160000, h * 0.3556667, w * 0.6376667, h * 0.3770000, w * 0.6533333, h * 0.4043333)
      ..cubicTo(
          w * 0.6690000, h * 0.4313333, w * 0.6770000, h * 0.4606667, w * 0.6770000, h * 0.4920000)
      ..cubicTo(
          w * 0.6770000, h * 0.4970000, w * 0.6766667, h * 0.5016667, w * 0.6760000, h * 0.5060000)
      ..cubicTo(
          w * 0.6666667, h * 0.5003333, w * 0.6560000, h * 0.4976667, w * 0.6436667, h * 0.4976667)
      ..cubicTo(
          w * 0.6356667, h * 0.4976667, w * 0.6276667, h * 0.4993333, w * 0.6196667, h * 0.5026667)
      ..cubicTo(
          w * 0.6200000, h * 0.5003333, w * 0.6200000, h * 0.4966667, w * 0.6200000, h * 0.4920000)
      ..cubicTo(
          w * 0.6200000, h * 0.4593333, w * 0.6083333, h * 0.4316667, w * 0.5846667, h * 0.4086667)
      ..cubicTo(
          w * 0.5610000, h * 0.3856667, w * 0.5326667, h * 0.3740000, w * 0.4996667, h * 0.3740000)
      ..cubicTo(
          w * 0.4666667, h * 0.3740000, w * 0.4386667, h * 0.3856667, w * 0.4150000, h * 0.4086667)
      ..cubicTo(
          w * 0.3913333, h * 0.4316667, w * 0.3800000, h * 0.4593333, w * 0.3800000, h * 0.4920000)
      ..lineTo(w * 0.3800000, h * 0.4980000)
      ..cubicTo(
          w * 0.3703333, h * 0.4986667, w * 0.3610000, h * 0.5013333, w * 0.3520000, h * 0.5063333)
      ..cubicTo(
          w * 0.3516667, h * 0.5066667, w * 0.3506667, h * 0.5073333, w * 0.3486667, h * 0.5086667)
      ..cubicTo(
          w * 0.3466667, h * 0.5100000, w * 0.3446667, h * 0.5116667, w * 0.3423333, h * 0.5133333)
      ..cubicTo(
          w * 0.3400000, h * 0.5150000, w * 0.3376667, h * 0.5170000, w * 0.3346667, h * 0.5196667)
      ..cubicTo(
          w * 0.3316667, h * 0.5223333, w * 0.3286667, h * 0.5250000, w * 0.3260000, h * 0.5276667)
      ..cubicTo(
          w * 0.3233333, h * 0.5170000, w * 0.3223333, h * 0.5050000, w * 0.3223333, h * 0.4920000)
      ..close()
      ..moveTo(w * 0.3233333, h * 0.6136667)
      ..lineTo(w * 0.3233333, h * 0.6086667)
      ..cubicTo(
          w * 0.3230000, h * 0.6056667, w * 0.3233333, h * 0.6020000, w * 0.3240000, h * 0.5976667)
      ..cubicTo(
          w * 0.3256667, h * 0.5856667, w * 0.3303333, h * 0.5743333, w * 0.3380000, h * 0.5636667)
      ..cubicTo(
          w * 0.3423333, h * 0.5583333, w * 0.3453333, h * 0.5546667, w * 0.3470000, h * 0.5533333)
      ..cubicTo(
          w * 0.3473333, h * 0.5526667, w * 0.3476667, h * 0.5520000, w * 0.3483333, h * 0.5513333)
      ..lineTo(w * 0.3496667, h * 0.5500000)
      ..cubicTo(
          w * 0.3506667, h * 0.5496667, w * 0.3520000, h * 0.5483333, w * 0.3536667, h * 0.5466667)
      ..cubicTo(
          w * 0.3543333, h * 0.5460000, w * 0.3553333, h * 0.5450000, w * 0.3563333, h * 0.5440000)
      ..cubicTo(
          w * 0.3573333, h * 0.5430000, w * 0.3583333, h * 0.5426667, w * 0.3586667, h * 0.5420000)
      ..cubicTo(
          w * 0.3603333, h * 0.5403333, w * 0.3620000, h * 0.5393333, w * 0.3633333, h * 0.5386667)
      ..lineTo(w * 0.3690000, h * 0.5350000)
      ..cubicTo(
          w * 0.3736667, h * 0.5320000, w * 0.3793333, h * 0.5303333, w * 0.3856667, h * 0.5303333)
      ..lineTo(w * 0.3866667, h * 0.5303333)
      ..cubicTo(
          w * 0.3900000, h * 0.5303333, w * 0.3930000, h * 0.5306667, w * 0.3953333, h * 0.5313333)
      ..cubicTo(
          w * 0.3963333, h * 0.5316667, w * 0.3976667, h * 0.5323333, w * 0.3996667, h * 0.5336667)
      ..lineTo(w * 0.3996667, h * 0.5340000)
      ..cubicTo(
          w * 0.4043333, h * 0.5360000, w * 0.4083333, h * 0.5393333, w * 0.4110000, h * 0.5436667)
      ..cubicTo(
          w * 0.4136667, h * 0.5480000, w * 0.4153333, h * 0.5526667, w * 0.4153333, h * 0.5576667)
      ..cubicTo(
          w * 0.4153333, h * 0.5633333, w * 0.4136667, h * 0.5680000, w * 0.4106667, h * 0.5716667)
      ..cubicTo(
          w * 0.4086667, h * 0.5746667, w * 0.4060000, h * 0.5773333, w * 0.4033333, h * 0.5793333)
      ..cubicTo(
          w * 0.4026667, h * 0.5796667, w * 0.4020000, h * 0.5800000, w * 0.4013333, h * 0.5803333)
      ..cubicTo(
          w * 0.4006667, h * 0.5806667, w * 0.4000000, h * 0.5810000, w * 0.4000000, h * 0.5810000)
      ..lineTo(w * 0.3980000, h * 0.5823333)
      ..cubicTo(
          w * 0.3966667, h * 0.5833333, w * 0.3956667, h * 0.5843333, w * 0.3946667, h * 0.5850000)
      ..cubicTo(
          w * 0.3936667, h * 0.5856667, w * 0.3926667, h * 0.5870000, w * 0.3910000, h * 0.5886667)
      ..cubicTo(
          w * 0.3896667, h * 0.5903333, w * 0.3883333, h * 0.5916667, w * 0.3873333, h * 0.5933333)
      ..cubicTo(
          w * 0.3863333, h * 0.5946667, w * 0.3853333, h * 0.5966667, w * 0.3843333, h * 0.5983333)
      ..cubicTo(
          w * 0.3833333, h * 0.6003333, w * 0.3826667, h * 0.6023333, w * 0.3826667, h * 0.6040000)
      ..lineTo(w * 0.3826667, h * 0.6090000)
      ..cubicTo(
          w * 0.3840000, h * 0.6140000, w * 0.3853333, h * 0.6180000, w * 0.3863333, h * 0.6210000)
      ..cubicTo(
          w * 0.3886667, h * 0.6256667, w * 0.3923333, h * 0.6303333, w * 0.3976667, h * 0.6356667)
      ..cubicTo(
          w * 0.3980000, h * 0.6363333, w * 0.4006667, h * 0.6390000, w * 0.4056667, h * 0.6440000)
      ..cubicTo(
          w * 0.4343333, h * 0.6700000, w * 0.4480000, h * 0.6980000, w * 0.4460000, h * 0.7273333)
      ..cubicTo(
          w * 0.4453333, h * 0.7373333, w * 0.4430000, h * 0.7470000, w * 0.4390000, h * 0.7563333)
      ..cubicTo(
          w * 0.4350000, h * 0.7656667, w * 0.4303333, h * 0.7733333, w * 0.4246667, h * 0.7796667)
      ..cubicTo(
          w * 0.4193333, h * 0.7860000, w * 0.4150000, h * 0.7906667, w * 0.4116667, h * 0.7940000)
      ..cubicTo(
          w * 0.4083333, h * 0.7970000, w * 0.4056667, h * 0.7993333, w * 0.4033333, h * 0.8010000)
      ..cubicTo(
          w * 0.4030000, h * 0.8013333, w * 0.4023333, h * 0.8016667, w * 0.4013333, h * 0.8023333)
      ..cubicTo(
          w * 0.4003333, h * 0.8030000, w * 0.3993333, h * 0.8036667, w * 0.3990000, h * 0.8036667)
      ..cubicTo(
          w * 0.3963333, h * 0.8050000, w * 0.3940000, h * 0.8056667, w * 0.3916667, h * 0.8060000)
      ..cubicTo(
          w * 0.3886667, h * 0.8063333, w * 0.3866667, h * 0.8066667, w * 0.3850000, h * 0.8066667)
      ..cubicTo(
          w * 0.3750000, h * 0.8066667, w * 0.3670000, h * 0.8033333, w * 0.3613333, h * 0.7966667)
      ..cubicTo(
          w * 0.3566667, h * 0.7910000, w * 0.3546667, h * 0.7843333, w * 0.3553333, h * 0.7770000)
      ..cubicTo(
          w * 0.3560000, h * 0.7696667, w * 0.3596667, h * 0.7636667, w * 0.3663333, h * 0.7593333)
      ..lineTo(w * 0.3666667, h * 0.7583333)
      ..cubicTo(
          w * 0.3670000, h * 0.7580000, w * 0.3676667, h * 0.7573333, w * 0.3683333, h * 0.7570000)
      ..cubicTo(
          w * 0.3690000, h * 0.7563333, w * 0.3696667, h * 0.7556667, w * 0.3706667, h * 0.7550000)
      ..cubicTo(
          w * 0.3716667, h * 0.7543333, w * 0.3726667, h * 0.7533333, w * 0.3733333, h * 0.7523333)
      ..cubicTo(
          w * 0.3743333, h * 0.7513333, w * 0.3753333, h * 0.7500000, w * 0.3760000, h * 0.7490000)
      ..cubicTo(
          w * 0.3770000, h * 0.7476667, w * 0.3780000, h * 0.7463333, w * 0.3786667, h * 0.7450000)
      ..cubicTo(
          w * 0.3796667, h * 0.7436667, w * 0.3806667, h * 0.7420000, w * 0.3813333, h * 0.7403333)
      ..cubicTo(
          w * 0.3823333, h * 0.7386667, w * 0.3830000, h * 0.7370000, w * 0.3836667, h * 0.7353333)
      ..cubicTo(
          w * 0.3843333, h * 0.7336667, w * 0.3846667, h * 0.7320000, w * 0.3853333, h * 0.7300000)
      ..cubicTo(
          w * 0.3856667, h * 0.7280000, w * 0.3860000, h * 0.7260000, w * 0.3860000, h * 0.7243333)
      ..cubicTo(
          w * 0.3866667, h * 0.7176667, w * 0.3850000, h * 0.7110000, w * 0.3810000, h * 0.7043333)
      ..cubicTo(
          w * 0.3793333, h * 0.7006667, w * 0.3770000, h * 0.6970000, w * 0.3736667, h * 0.6933333)
      ..cubicTo(
          w * 0.3713333, h * 0.6906667, w * 0.3696667, h * 0.6890000, w * 0.3686667, h * 0.6880000)
      ..cubicTo(
          w * 0.3656667, h * 0.6843333, w * 0.3640000, h * 0.6823333, w * 0.3636667, h * 0.6820000)
      ..cubicTo(
          w * 0.3630000, h * 0.6816667, w * 0.3623333, h * 0.6810000, w * 0.3613333, h * 0.6800000)
      ..cubicTo(
          w * 0.3603333, h * 0.6790000, w * 0.3596667, h * 0.6786667, w * 0.3593333, h * 0.6783333)
      ..cubicTo(
          w * 0.3543333, h * 0.6736667, w * 0.3506667, h * 0.6696667, w * 0.3480000, h * 0.6663333)
      ..cubicTo(
          w * 0.3440000, h * 0.6610000, w * 0.3410000, h * 0.6576667, w * 0.3400000, h * 0.6556667)
      ..cubicTo(
          w * 0.3336667, h * 0.6470000, w * 0.3293333, h * 0.6383333, w * 0.3270000, h * 0.6296667)
      ..cubicTo(
          w * 0.3256667, h * 0.6250000, w * 0.3246667, h * 0.6213333, w * 0.3243333, h * 0.6190000)
      ..cubicTo(
          w * 0.3243333, h * 0.6183333, w * 0.3240000, h * 0.6173333, w * 0.3236667, h * 0.6163333)
      ..cubicTo(
          w * 0.3233333, h * 0.6153333, w * 0.3233333, h * 0.6146667, w * 0.3233333, h * 0.6136667)
      ..close()
      ..moveTo(w * 0.4526667, h * 0.6026667)
      ..cubicTo(
          w * 0.4526667, h * 0.6006667, w * 0.4526667, h * 0.5993333, w * 0.4530000, h * 0.5980000)
      ..cubicTo(
          w * 0.4536667, h * 0.5906667, w * 0.4560000, h * 0.5836667, w * 0.4596667, h * 0.5766667)
      ..cubicTo(
          w * 0.4633333, h * 0.5696667, w * 0.4670000, h * 0.5636667, w * 0.4713333, h * 0.5590000)
      ..cubicTo(
          w * 0.4756667, h * 0.5543333, w * 0.4796667, h * 0.5500000, w * 0.4840000, h * 0.5463333)
      ..cubicTo(
          w * 0.4883333, h * 0.5426667, w * 0.4916667, h * 0.5400000, w * 0.4943333, h * 0.5380000)
      ..lineTo(w * 0.4983333, h * 0.5356667)
      ..cubicTo(
          w * 0.5033333, h * 0.5326667, w * 0.5090000, h * 0.5310000, w * 0.5150000, h * 0.5310000)
      ..cubicTo(
          w * 0.5186667, h * 0.5310000, w * 0.5220000, h * 0.5313333, w * 0.5250000, h * 0.5320000)
      ..cubicTo(
          w * 0.5253333, h * 0.5320000, w * 0.5256667, h * 0.5323333, w * 0.5266667, h * 0.5326667)
      ..cubicTo(
          w * 0.5276667, h * 0.5333333, w * 0.5283333, h * 0.5336667, w * 0.5286667, h * 0.5340000)
      ..cubicTo(
          w * 0.5290000, h * 0.5340000, w * 0.5293333, h * 0.5340000, w * 0.5296667, h * 0.5343333)
      ..cubicTo(
          w * 0.5300000, h * 0.5343333, w * 0.5306667, h * 0.5350000, w * 0.5320000, h * 0.5360000)
      ..cubicTo(
          w * 0.5386667, h * 0.5400000, w * 0.5426667, h * 0.5460000, w * 0.5446667, h * 0.5540000)
      ..cubicTo(
          w * 0.5446667, h * 0.5546667, w * 0.5446667, h * 0.5553333, w * 0.5446667, h * 0.5563333)
      ..cubicTo(
          w * 0.5446667, h * 0.5570000, w * 0.5446667, h * 0.5576667, w * 0.5446667, h * 0.5580000)
      ..cubicTo(
          w * 0.5446667, h * 0.5590000, w * 0.5443333, h * 0.5603333, w * 0.5440000, h * 0.5620000)
      ..cubicTo(
          w * 0.5436667, h * 0.5636667, w * 0.5433333, h * 0.5646667, w * 0.5433333, h * 0.5650000)
      ..cubicTo(
          w * 0.5410000, h * 0.5726667, w * 0.5363333, h * 0.5780000, w * 0.5293333, h * 0.5816667)
      ..cubicTo(
          w * 0.5183333, h * 0.5890000, w * 0.5123333, h * 0.5966667, w * 0.5116667, h * 0.6046667)
      ..cubicTo(
          w * 0.5113333, h * 0.6073333, w * 0.5113333, h * 0.6096667, w * 0.5116667, h * 0.6120000)
      ..cubicTo(
          w * 0.5123333, h * 0.6160000, w * 0.5143333, h * 0.6203333, w * 0.5173333, h * 0.6250000)
      ..cubicTo(
          w * 0.5210000, h * 0.6303333, w * 0.5236667, h * 0.6340000, w * 0.5253333, h * 0.6356667)
      ..cubicTo(
          w * 0.5306667, h * 0.6410000, w * 0.5336667, h * 0.6440000, w * 0.5346667, h * 0.6446667)
      ..cubicTo(
          w * 0.5386667, h * 0.6483333, w * 0.5440000, h * 0.6540000, w * 0.5503333, h * 0.6616667)
      ..cubicTo(
          w * 0.5683333, h * 0.6833333, w * 0.5766667, h * 0.7056667, w * 0.5750000, h * 0.7283333)
      ..cubicTo(
          w * 0.5743333, h * 0.7383333, w * 0.5720000, h * 0.7480000, w * 0.5680000, h * 0.7573333)
      ..cubicTo(
          w * 0.5640000, h * 0.7666667, w * 0.5593333, h * 0.7743333, w * 0.5536667, h * 0.7806667)
      ..cubicTo(
          w * 0.5483333, h * 0.7866667, w * 0.5436667, h * 0.7916667, w * 0.5403333, h * 0.7950000)
      ..cubicTo(
          w * 0.5366667, h * 0.7983333, w * 0.5340000, h * 0.8006667, w * 0.5320000, h * 0.8020000)
      ..lineTo(w * 0.5280000, h * 0.8046667)
      ..cubicTo(
          w * 0.5243333, h * 0.8060000, w * 0.5223333, h * 0.8066667, w * 0.5210000, h * 0.8070000)
      ..cubicTo(
          w * 0.5173333, h * 0.8073333, w * 0.5150000, h * 0.8076667, w * 0.5143333, h * 0.8076667)
      ..lineTo(w * 0.5133333, h * 0.8076667)
      ..cubicTo(
          w * 0.5106667, h * 0.8076667, w * 0.5086667, h * 0.8073333, w * 0.5070000, h * 0.8070000)
      ..cubicTo(
          w * 0.5063333, h * 0.8070000, w * 0.5053333, h * 0.8070000, w * 0.5043333, h * 0.8066667)
      ..cubicTo(
          w * 0.5033333, h * 0.8063333, w * 0.5023333, h * 0.8063333, w * 0.5020000, h * 0.8063333)
      ..cubicTo(
          w * 0.5016667, h * 0.8063333, w * 0.5013333, h * 0.8063333, w * 0.5010000, h * 0.8060000)
      ..cubicTo(
          w * 0.5006667, h * 0.8056667, w * 0.5003333, h * 0.8056667, w * 0.4996667, h * 0.8053333)
      ..cubicTo(
          w * 0.4993333, h * 0.8050000, w * 0.4990000, h * 0.8050000, w * 0.4986667, h * 0.8050000)
      ..cubicTo(
          w * 0.4936667, h * 0.8013333, w * 0.4906667, h * 0.7993333, w * 0.4900000, h * 0.7980000)
      ..cubicTo(
          w * 0.4846667, h * 0.7920000, w * 0.4826667, h * 0.7853333, w * 0.4836667, h * 0.7780000)
      ..cubicTo(
          w * 0.4846667, h * 0.7706667, w * 0.4883333, h * 0.7650000, w * 0.4950000, h * 0.7603333)
      ..lineTo(w * 0.4960000, h * 0.7590000)
      ..cubicTo(
          w * 0.4966667, h * 0.7583333, w * 0.4976667, h * 0.7573333, w * 0.4990000, h * 0.7563333)
      ..lineTo(w * 0.5030000, h * 0.7523333)
      ..lineTo(w * 0.5073333, h * 0.7470000)
      ..lineTo(w * 0.5113333, h * 0.7406667)
      ..lineTo(w * 0.5143333, h * 0.7333333)
      ..lineTo(w * 0.5156667, h * 0.7253333)
      ..cubicTo(
          w * 0.5160000, h * 0.7120000, w * 0.5083333, h * 0.6980000, w * 0.4926667, h * 0.6830000)
      ..cubicTo(
          w * 0.4863333, h * 0.6773333, w * 0.4816667, h * 0.6726667, w * 0.4780000, h * 0.6686667)
      ..cubicTo(
          w * 0.4596667, h * 0.6456667, w * 0.4513333, h * 0.6240000, w * 0.4526667, h * 0.6026667)
      ..close()
      ..moveTo(w * 0.4706667, h * 0.2306667)
      ..lineTo(w * 0.4706667, h * 0.1616667)
      ..cubicTo(
          w * 0.4706667, h * 0.1536667, w * 0.4736667, h * 0.1466667, w * 0.4793333, h * 0.1410000)
      ..cubicTo(
          w * 0.4850000, h * 0.1353333, w * 0.4920000, h * 0.1326667, w * 0.4996667, h * 0.1326667)
      ..cubicTo(
          w * 0.5076667, h * 0.1326667, w * 0.5146667, h * 0.1353333, w * 0.5203333, h * 0.1410000)
      ..cubicTo(
          w * 0.5260000, h * 0.1466667, w * 0.5286667, h * 0.1536667, w * 0.5286667, h * 0.1616667)
      ..lineTo(w * 0.5286667, h * 0.2306667)
      ..cubicTo(
          w * 0.5286667, h * 0.2386667, w * 0.5260000, h * 0.2450000, w * 0.5203333, h * 0.2503333)
      ..cubicTo(
          w * 0.5146667, h * 0.2556667, w * 0.5080000, h * 0.2580000, w * 0.5000000, h * 0.2580000)
      ..cubicTo(
          w * 0.4920000, h * 0.2580000, w * 0.4853333, h * 0.2553333, w * 0.4796667, h * 0.2503333)
      ..cubicTo(
          w * 0.4736667, h * 0.2450000, w * 0.4706667, h * 0.2386667, w * 0.4706667, h * 0.2306667)
      ..close()
      ..moveTo(w * 0.5826667, h * 0.5976667)
      ..cubicTo(
          w * 0.5833333, h * 0.5903333, w * 0.5856667, h * 0.5833333, w * 0.5893333, h * 0.5763333)
      ..cubicTo(
          w * 0.5930000, h * 0.5693333, w * 0.5966667, h * 0.5633333, w * 0.6010000, h * 0.5586667)
      ..cubicTo(
          w * 0.6053333, h * 0.5540000, w * 0.6093333, h * 0.5496667, w * 0.6136667, h * 0.5460000)
      ..cubicTo(
          w * 0.6176667, h * 0.5423333, w * 0.6210000, h * 0.5396667, w * 0.6236667, h * 0.5376667)
      ..lineTo(w * 0.6280000, h * 0.5353333)
      ..cubicTo(
          w * 0.6286667, h * 0.5346667, w * 0.6300000, h * 0.5340000, w * 0.6313333, h * 0.5326667)
      ..cubicTo(
          w * 0.6350000, h * 0.5313333, w * 0.6393333, h * 0.5303333, w * 0.6440000, h * 0.5303333)
      ..cubicTo(
          w * 0.6553333, h * 0.5303333, w * 0.6636667, h * 0.5346667, w * 0.6696667, h * 0.5430000)
      ..cubicTo(
          w * 0.6713333, h * 0.5453333, w * 0.6723333, h * 0.5476667, w * 0.6730000, h * 0.5506667)
      ..cubicTo(
          w * 0.6733333, h * 0.5513333, w * 0.6736667, h * 0.5523333, w * 0.6736667, h * 0.5533333)
      ..lineTo(w * 0.6736667, h * 0.5570000)
      ..cubicTo(
          w * 0.6736667, h * 0.5673333, w * 0.6686667, h * 0.5753333, w * 0.6586667, h * 0.5803333)
      ..cubicTo(
          w * 0.6480000, h * 0.5873333, w * 0.6423333, h * 0.5950000, w * 0.6413333, h * 0.6033333)
      ..cubicTo(
          w * 0.6400000, h * 0.6146667, w * 0.6476667, h * 0.6280000, w * 0.6640000, h * 0.6433333)
      ..cubicTo(
          w * 0.6933333, h * 0.6690000, w * 0.7066667, h * 0.6970000, w * 0.7050000, h * 0.7266667)
      ..cubicTo(
          w * 0.7043333, h * 0.7366667, w * 0.7020000, h * 0.7463333, w * 0.6980000, h * 0.7556667)
      ..cubicTo(
          w * 0.6940000, h * 0.7650000, w * 0.6890000, h * 0.7726667, w * 0.6836667, h * 0.7790000)
      ..cubicTo(
          w * 0.6780000, h * 0.7853333, w * 0.6736667, h * 0.7900000, w * 0.6706667, h * 0.7933333)
      ..cubicTo(
          w * 0.6676667, h * 0.7966667, w * 0.6646667, h * 0.7986667, w * 0.6623333, h * 0.8003333)
      ..cubicTo(
          w * 0.6570000, h * 0.8036667, w * 0.6523333, h * 0.8053333, w * 0.6486667, h * 0.8056667)
      ..cubicTo(
          w * 0.6476667, h * 0.8060000, w * 0.6460000, h * 0.8060000, w * 0.6436667, h * 0.8060000)
      ..cubicTo(
          w * 0.6336667, h * 0.8060000, w * 0.6260000, h * 0.8026667, w * 0.6206667, h * 0.7960000)
      ..cubicTo(
          w * 0.6156667, h * 0.7903333, w * 0.6136667, h * 0.7836667, w * 0.6143333, h * 0.7763333)
      ..cubicTo(
          w * 0.6150000, h * 0.7690000, w * 0.6186667, h * 0.7630000, w * 0.6250000, h * 0.7586667)
      ..cubicTo(
          w * 0.6260000, h * 0.7583333, w * 0.6280000, h * 0.7566667, w * 0.6310000, h * 0.7540000)
      ..cubicTo(
          w * 0.6340000, h * 0.7513333, w * 0.6370000, h * 0.7470000, w * 0.6406667, h * 0.7413333)
      ..cubicTo(
          w * 0.6440000, h * 0.7353333, w * 0.6460000, h * 0.7296667, w * 0.6463333, h * 0.7236667)
      ..cubicTo(
          w * 0.6470000, h * 0.7103333, w * 0.6390000, h * 0.6963333, w * 0.6230000, h * 0.6813333)
      ..cubicTo(
          w * 0.6093333, h * 0.6693333, w * 0.5986667, h * 0.6563333, w * 0.5916667, h * 0.6426667)
      ..cubicTo(
          w * 0.5836667, h * 0.6286667, w * 0.5806667, h * 0.6133333, w * 0.5826667, h * 0.5976667)
      ..close()
      ..moveTo(w * 0.6590000, h * 0.3070000)
      ..cubicTo(
          w * 0.6590000, h * 0.2986667, w * 0.6616667, h * 0.2920000, w * 0.6666667, h * 0.2870000)
      ..lineTo(w * 0.7153333, h * 0.2376667)
      ..cubicTo(
          w * 0.7213333, h * 0.2320000, w * 0.7280000, h * 0.2293333, w * 0.7356667, h * 0.2293333)
      ..cubicTo(
          w * 0.7436667, h * 0.2293333, w * 0.7503333, h * 0.2323333, w * 0.7560000, h * 0.2380000)
      ..cubicTo(
          w * 0.7616667, h * 0.2436667, w * 0.7646667, h * 0.2506667, w * 0.7646667, h * 0.2583333)
      ..cubicTo(
          w * 0.7646667, h * 0.2666667, w * 0.7616667, h * 0.2736667, w * 0.7560000, h * 0.2790000)
      ..lineTo(w * 0.7066667, h * 0.3270000)
      ..cubicTo(
          w * 0.7006667, h * 0.3326667, w * 0.6940000, h * 0.3353333, w * 0.6863333, h * 0.3353333)
      ..cubicTo(
          w * 0.6786667, h * 0.3353333, w * 0.6720000, h * 0.3326667, w * 0.6670000, h * 0.3270000)
      ..cubicTo(
          w * 0.6616667, h * 0.3216667, w * 0.6590000, h * 0.3146667, w * 0.6590000, h * 0.3070000)
      ..close()
      ..moveTo(w * 0.7356667, h * 0.4920000)
      ..cubicTo(
          w * 0.7356667, h * 0.4846667, w * 0.7386667, h * 0.4780000, w * 0.7443333, h * 0.4716667)
      ..cubicTo(
          w * 0.7496667, h * 0.4660000, w * 0.7560000, h * 0.4633333, w * 0.7636667, h * 0.4633333)
      ..lineTo(w * 0.8323333, h * 0.4633333)
      ..cubicTo(
          w * 0.8403333, h * 0.4633333, w * 0.8473333, h * 0.4663333, w * 0.8530000, h * 0.4720000)
      ..cubicTo(
          w * 0.8586667, h * 0.4776667, w * 0.8620000, h * 0.4843333, w * 0.8620000, h * 0.4920000)
      ..cubicTo(
          w * 0.8620000, h * 0.5000000, w * 0.8590000, h * 0.5070000, w * 0.8533333, h * 0.5126667)
      ..cubicTo(
          w * 0.8473333, h * 0.5183333, w * 0.8406667, h * 0.5213333, w * 0.8323333, h * 0.5213333)
      ..lineTo(w * 0.7636667, h * 0.5213333)
      ..cubicTo(
          w * 0.7556667, h * 0.5213333, w * 0.7486667, h * 0.5186667, w * 0.7436667, h * 0.5130000)
      ..cubicTo(
          w * 0.7383333, h * 0.5073333, w * 0.7356667, h * 0.5003333, w * 0.7356667, h * 0.4920000)
      ..close();
  }

  Path _hurricanePath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.3693333, h * 0.4843333)
      ..lineTo(w * 0.3693333, h * 0.4836667)
      ..cubicTo(
          w * 0.3690000, h * 0.4810000, w * 0.3693333, h * 0.4770000, w * 0.3693333, h * 0.4713333)
      ..cubicTo(
          w * 0.3696667, h * 0.4660000, w * 0.3706667, h * 0.4570000, w * 0.3726667, h * 0.4443333)
      ..cubicTo(
          w * 0.3746667, h * 0.4316667, w * 0.3773333, h * 0.4190000, w * 0.3810000, h * 0.4060000)
      ..cubicTo(
          w * 0.3846667, h * 0.3930000, w * 0.3903333, h * 0.3780000, w * 0.3980000, h * 0.3610000)
      ..cubicTo(
          w * 0.4056667, h * 0.3440000, w * 0.4146667, h * 0.3280000, w * 0.4253333, h * 0.3130000)
      ..cubicTo(
          w * 0.4360000, h * 0.2980000, w * 0.4500000, h * 0.2823333, w * 0.4673333, h * 0.2666667)
      ..cubicTo(
          w * 0.4846667, h * 0.2510000, w * 0.5040000, h * 0.2370000, w * 0.5250000, h * 0.2253333)
      ..cubicTo(
          w * 0.5303333, h * 0.2223333, w * 0.5356667, h * 0.2216667, w * 0.5413333, h * 0.2233333)
      ..cubicTo(
          w * 0.5470000, h * 0.2250000, w * 0.5513333, h * 0.2283333, w * 0.5540000, h * 0.2336667)
      ..cubicTo(
          w * 0.5570000, h * 0.2390000, w * 0.5576667, h * 0.2443333, w * 0.5560000, h * 0.2503333)
      ..cubicTo(
          w * 0.5543333, h * 0.2560000, w * 0.5510000, h * 0.2606667, w * 0.5460000, h * 0.2633333)
      ..cubicTo(
          w * 0.5023333, h * 0.2873333, w * 0.4686667, h * 0.3210000, w * 0.4450000, h * 0.3650000)
      ..cubicTo(
          w * 0.4630000, h * 0.3566667, w * 0.4810000, h * 0.3523333, w * 0.4993333, h * 0.3523333)
      ..cubicTo(
          w * 0.5350000, h * 0.3523333, w * 0.5660000, h * 0.3650000, w * 0.5916667, h * 0.3906667)
      ..cubicTo(
          w * 0.6173333, h * 0.4163333, w * 0.6300000, h * 0.4470000, w * 0.6300000, h * 0.4826667)
      ..cubicTo(
          w * 0.6300000, h * 0.4853333, w * 0.6300000, h * 0.4880000, w * 0.6300000, h * 0.4906667)
      ..cubicTo(
          w * 0.6300000, h * 0.4933333, w * 0.6293333, h * 0.4990000, w * 0.6286667, h * 0.5080000)
      ..cubicTo(
          w * 0.6280000, h * 0.5170000, w * 0.6266667, h * 0.5253333, w * 0.6250000, h * 0.5336667)
      ..cubicTo(
          w * 0.6233333, h * 0.5420000, w * 0.6206667, h * 0.5523333, w * 0.6173333, h * 0.5646667)
      ..cubicTo(
          w * 0.6136667, h * 0.5770000, w * 0.6096667, h * 0.5890000, w * 0.6046667, h * 0.6000000)
      ..cubicTo(
          w * 0.5996667, h * 0.6110000, w * 0.5933333, h * 0.6233333, w * 0.5853333, h * 0.6366667)
      ..cubicTo(
          w * 0.5773333, h * 0.6500000, w * 0.5683333, h * 0.6623333, w * 0.5583333, h * 0.6740000)
      ..cubicTo(
          w * 0.5483333, h * 0.6856667, w * 0.5363333, h * 0.6973333, w * 0.5223333, h * 0.7090000)
      ..cubicTo(
          w * 0.5080000, h * 0.7206667, w * 0.4926667, h * 0.7313333, w * 0.4760000, h * 0.7406667)
      ..cubicTo(
          w * 0.4730000, h * 0.7426667, w * 0.4693333, h * 0.7433333, w * 0.4656667, h * 0.7433333)
      ..cubicTo(
          w * 0.4570000, h * 0.7433333, w * 0.4506667, h * 0.7393333, w * 0.4463333, h * 0.7316667)
      ..cubicTo(
          w * 0.4433333, h * 0.7263333, w * 0.4426667, h * 0.7210000, w * 0.4443333, h * 0.7153333)
      ..cubicTo(
          w * 0.4460000, h * 0.7096667, w * 0.4493333, h * 0.7053333, w * 0.4546667, h * 0.7026667)
      ..cubicTo(
          w * 0.4993333, h * 0.6776667, w * 0.5333333, h * 0.6433333, w * 0.5566667, h * 0.6000000)
      ..cubicTo(
          w * 0.5386667, h * 0.6086667, w * 0.5196667, h * 0.6126667, w * 0.4996667, h * 0.6126667)
      ..cubicTo(
          w * 0.4766667, h * 0.6126667, w * 0.4550000, h * 0.6070000, w * 0.4350000, h * 0.5953333)
      ..cubicTo(
          w * 0.4150000, h * 0.5840000, w * 0.3993333, h * 0.5683333, w * 0.3873333, h * 0.5483333)
      ..cubicTo(
          w * 0.3756667, h * 0.5290000, w * 0.3696667, h * 0.5076667, w * 0.3693333, h * 0.4843333)
      ..close()
      ..moveTo(w * 0.4260000, h * 0.4826667)
      ..cubicTo(
          w * 0.4260000, h * 0.5030000, w * 0.4333333, h * 0.5203333, w * 0.4476667, h * 0.5350000)
      ..cubicTo(
          w * 0.4620000, h * 0.5493333, w * 0.4793333, h * 0.5566667, w * 0.4996667, h * 0.5566667)
      ..cubicTo(
          w * 0.5186667, h * 0.5566667, w * 0.5350000, h * 0.5503333, w * 0.5493333, h * 0.5376667)
      ..cubicTo(
          w * 0.5633333, h * 0.5250000, w * 0.5713333, h * 0.5093333, w * 0.5736667, h * 0.4906667)
      ..lineTo(w * 0.5740000, h * 0.4830000)
      ..cubicTo(
          w * 0.5740000, h * 0.4823333, w * 0.5740000, h * 0.4816667, w * 0.5743333, h * 0.4813333)
      ..cubicTo(
          w * 0.5740000, h * 0.4613333, w * 0.5666667, h * 0.4443333, w * 0.5523333, h * 0.4306667)
      ..cubicTo(
          w * 0.5380000, h * 0.4166667, w * 0.5203333, h * 0.4100000, w * 0.5000000, h * 0.4100000)
      ..cubicTo(
          w * 0.4813333, h * 0.4100000, w * 0.4653333, h * 0.4160000, w * 0.4513333, h * 0.4280000)
      ..cubicTo(
          w * 0.4373333, h * 0.4400000, w * 0.4293333, h * 0.4553333, w * 0.4270000, h * 0.4733333)
      ..lineTo(w * 0.4263333, h * 0.4816667)
      ..lineTo(w * 0.4263333, h * 0.4826667)
      ..close();
  }

  Path _lightningPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.2653333, h * 0.8170000)
      ..lineTo(w * 0.2783333, h * 0.8170000)
      ..lineTo(w * 0.5076667, h * 0.4776667)
      ..cubicTo(
          w * 0.5106667, h * 0.4716667, w * 0.5090000, h * 0.4686667, w * 0.5026667, h * 0.4686667)
      ..lineTo(w * 0.4080000, h * 0.4686667)
      ..lineTo(w * 0.5076667, h * 0.2870000)
      ..cubicTo(
          w * 0.5106667, h * 0.2810000, w * 0.5083333, h * 0.2780000, w * 0.5010000, h * 0.2780000)
      ..lineTo(w * 0.3740000, h * 0.2780000)
      ..cubicTo(
          w * 0.3703333, h * 0.2780000, w * 0.3673333, h * 0.2800000, w * 0.3643333, h * 0.2840000)
      ..lineTo(w * 0.2716667, h * 0.5306667)
      ..cubicTo(
          w * 0.2710000, h * 0.5366667, w * 0.2730000, h * 0.5396667, w * 0.2780000, h * 0.5396667)
      ..lineTo(w * 0.3696667, h * 0.5396667)
      ..lineTo(w * 0.2653333, h * 0.8170000)
      ..close()
      ..moveTo(w * 0.5486667, h * 0.6060000)
      ..lineTo(w * 0.5576667, h * 0.6060000)
      ..lineTo(w * 0.7316667, h * 0.3503333)
      ..cubicTo(
          w * 0.7333333, h * 0.3476667, w * 0.7336667, h * 0.3453333, w * 0.7330000, h * 0.3436667)
      ..cubicTo(
          w * 0.7323333, h * 0.3420000, w * 0.7303333, h * 0.3413333, w * 0.7273333, h * 0.3413333)
      ..lineTo(w * 0.6573333, h * 0.3413333)
      ..lineTo(w * 0.7300000, h * 0.2070000)
      ..cubicTo(
          w * 0.7340000, h * 0.2003333, w * 0.7320000, h * 0.1970000, w * 0.7240000, h * 0.1970000)
      ..lineTo(w * 0.6326667, h * 0.1970000)
      ..cubicTo(
          w * 0.6283333, h * 0.1970000, w * 0.6250000, h * 0.1990000, w * 0.6226667, h * 0.2033333)
      ..lineTo(w * 0.5533333, h * 0.3860000)
      ..cubicTo(
          w * 0.5523333, h * 0.3890000, w * 0.5523333, h * 0.3913333, w * 0.5536667, h * 0.3930000)
      ..cubicTo(
          w * 0.5550000, h * 0.3946667, w * 0.5570000, h * 0.3953333, w * 0.5600000, h * 0.3953333)
      ..lineTo(w * 0.6280000, h * 0.3953333)
      ..lineTo(w * 0.5486667, h * 0.6060000)
      ..close();
  }

  Path _naPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.2290000, h * 0.6076667)
      ..lineTo(w * 0.2936667, h * 0.6076667)
      ..lineTo(w * 0.2936667, h * 0.4863333)
      ..lineTo(w * 0.2943333, h * 0.4863333)
      ..lineTo(w * 0.3626667, h * 0.6076667)
      ..lineTo(w * 0.4290000, h * 0.6076667)
      ..lineTo(w * 0.4290000, h * 0.3856667)
      ..lineTo(w * 0.3643333, h * 0.3856667)
      ..lineTo(w * 0.3643333, h * 0.5040000)
      ..lineTo(w * 0.3636667, h * 0.5040000)
      ..lineTo(w * 0.2990000, h * 0.3856667)
      ..lineTo(w * 0.2290000, h * 0.3856667)
      ..lineTo(w * 0.2290000, h * 0.6076667)
      ..close()
      ..moveTo(w * 0.4463333, h * 0.6126667)
      ..lineTo(w * 0.4940000, h * 0.6126667)
      ..lineTo(w * 0.5810000, h * 0.3803333)
      ..lineTo(w * 0.5336667, h * 0.3803333)
      ..lineTo(w * 0.4463333, h * 0.6126667)
      ..close()
      ..moveTo(w * 0.5420000, h * 0.6076667)
      ..lineTo(w * 0.6110000, h * 0.6076667)
      ..lineTo(w * 0.6206667, h * 0.5760000)
      ..lineTo(w * 0.6913333, h * 0.5760000)
      ..lineTo(w * 0.7006667, h * 0.6076667)
      ..lineTo(w * 0.7716667, h * 0.6076667)
      ..lineTo(w * 0.6906667, h * 0.3856667)
      ..lineTo(w * 0.6236667, h * 0.3856667)
      ..lineTo(w * 0.5420000, h * 0.6076667)
      ..close()
      ..moveTo(w * 0.6356667, h * 0.5280000)
      ..lineTo(w * 0.6570000, h * 0.4600000)
      ..lineTo(w * 0.6580000, h * 0.4600000)
      ..lineTo(w * 0.6780000, h * 0.5280000)
      ..lineTo(w * 0.6356667, h * 0.5280000)
      ..close();
  }

  Path _nightCloudyPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1380000, h * 0.5633333)
      ..cubicTo(
          w * 0.1380000, h * 0.5246667, w * 0.1496667, h * 0.4906667, w * 0.1733333, h * 0.4606667)
      ..cubicTo(
          w * 0.1970000, h * 0.4306667, w * 0.2273333, h * 0.4116667, w * 0.2646667, h * 0.4033333)
      ..cubicTo(
          w * 0.2723333, h * 0.3690000, w * 0.2880000, h * 0.3390000, w * 0.3113333, h * 0.3133333)
      ..cubicTo(
          w * 0.3346667, h * 0.2876667, w * 0.3630000, h * 0.2693333, w * 0.3956667, h * 0.2583333)
      ..cubicTo(
          w * 0.4163333, h * 0.2513333, w * 0.4376667, h * 0.2476667, w * 0.4600000, h * 0.2476667)
      ..cubicTo(
          w * 0.4870000, h * 0.2476667, w * 0.5133333, h * 0.2530000, w * 0.5383333, h * 0.2636667)
      ..cubicTo(
          w * 0.5476667, h * 0.2480000, w * 0.5586667, h * 0.2343333, w * 0.5713333, h * 0.2230000)
      ..cubicTo(
          w * 0.5840000, h * 0.2116667, w * 0.5970000, h * 0.2026667, w * 0.6103333, h * 0.1966667)
      ..cubicTo(
          w * 0.6236667, h * 0.1906667, w * 0.6370000, h * 0.1860000, w * 0.6496667, h * 0.1830000)
      ..cubicTo(
          w * 0.6623333, h * 0.1800000, w * 0.6750000, h * 0.1786667, w * 0.6870000, h * 0.1786667)
      ..cubicTo(
          w * 0.6996667, h * 0.1786667, w * 0.7133333, h * 0.1803333, w * 0.7280000, h * 0.1840000)
      ..lineTo(w * 0.7553333, h * 0.1923333)
      ..cubicTo(
          w * 0.7600000, h * 0.1943333, w * 0.7613333, h * 0.1966667, w * 0.7600000, h * 0.1996667)
      ..lineTo(w * 0.7553333, h * 0.2196667)
      ..cubicTo(
          w * 0.7530000, h * 0.2300000, w * 0.7520000, h * 0.2396667, w * 0.7520000, h * 0.2483333)
      ..cubicTo(
          w * 0.7520000, h * 0.2586667, w * 0.7536667, h * 0.2693333, w * 0.7570000, h * 0.2800000)
      ..cubicTo(
          w * 0.7603333, h * 0.2906667, w * 0.7650000, h * 0.3010000, w * 0.7716667, h * 0.3113333)
      ..cubicTo(
          w * 0.7780000, h * 0.3216667, w * 0.7870000, h * 0.3306667, w * 0.7983333, h * 0.3390000)
      ..cubicTo(
          w * 0.8096667, h * 0.3473333, w * 0.8223333, h * 0.3536667, w * 0.8366667, h * 0.3580000)
      ..lineTo(w * 0.8573333, h * 0.3653333)
      ..cubicTo(
          w * 0.8606667, h * 0.3663333, w * 0.8623333, h * 0.3680000, w * 0.8623333, h * 0.3706667)
      ..cubicTo(
          w * 0.8623333, h * 0.3713333, w * 0.8620000, h * 0.3720000, w * 0.8616667, h * 0.3730000)
      ..lineTo(w * 0.8556667, h * 0.3953333)
      ..cubicTo(
          w * 0.8466667, h * 0.4313333, w * 0.8296667, h * 0.4596667, w * 0.8056667, h * 0.4810000)
      ..cubicTo(
          w * 0.8190000, h * 0.5043333, w * 0.8263333, h * 0.5293333, w * 0.8273333, h * 0.5556667)
      ..cubicTo(
          w * 0.8276667, h * 0.5573333, w * 0.8276667, h * 0.5596667, w * 0.8276667, h * 0.5633333)
      ..cubicTo(
          w * 0.8276667, h * 0.5930000, w * 0.8203333, h * 0.6206667, w * 0.8053333, h * 0.6460000)
      ..cubicTo(
          w * 0.7906667, h * 0.6713333, w * 0.7703333, h * 0.6913333, w * 0.7453333, h * 0.7060000)
      ..cubicTo(
          w * 0.7200000, h * 0.7206667, w * 0.6923333, h * 0.7283333, w * 0.6626667, h * 0.7283333)
      ..lineTo(w * 0.3023333, h * 0.7283333)
      ..cubicTo(
          w * 0.2726667, h * 0.7283333, w * 0.2450000, h * 0.7210000, w * 0.2196667, h * 0.7060000)
      ..cubicTo(
          w * 0.1943333, h * 0.6910000, w * 0.1746667, h * 0.6710000, w * 0.1600000, h * 0.6460000)
      ..cubicTo(
          w * 0.1453333, h * 0.6210000, w * 0.1380000, h * 0.5933333, w * 0.1380000, h * 0.5633333)
      ..close()
      ..moveTo(w * 0.1950000, h * 0.5633333)
      ..cubicTo(
          w * 0.1950000, h * 0.5930000, w * 0.2056667, h * 0.6186667, w * 0.2270000, h * 0.6403333)
      ..cubicTo(
          w * 0.2483333, h * 0.6620000, w * 0.2733333, h * 0.6730000, w * 0.3023333, h * 0.6730000)
      ..lineTo(w * 0.6626667, h * 0.6730000)
      ..cubicTo(
          w * 0.6923333, h * 0.6730000, w * 0.7176667, h * 0.6623333, w * 0.7386667, h * 0.6406667)
      ..cubicTo(
          w * 0.7596667, h * 0.6190000, w * 0.7703333, h * 0.5933333, w * 0.7703333, h * 0.5633333)
      ..cubicTo(
          w * 0.7703333, h * 0.5340000, w * 0.7596667, h * 0.5090000, w * 0.7383333, h * 0.4880000)
      ..cubicTo(
          w * 0.7170000, h * 0.4670000, w * 0.6916667, h * 0.4563333, w * 0.6623333, h * 0.4563333)
      ..lineTo(w * 0.6030000, h * 0.4563333)
      ..lineTo(w * 0.5996667, h * 0.4313333)
      ..cubicTo(
          w * 0.5963333, h * 0.3976667, w * 0.5823333, h * 0.3686667, w * 0.5576667, h * 0.3450000)
      ..cubicTo(
          w * 0.5330000, h * 0.3213333, w * 0.5036667, h * 0.3080000, w * 0.4700000, h * 0.3050000)
      ..cubicTo(
          w * 0.4690000, h * 0.3050000, w * 0.4673333, h * 0.3050000, w * 0.4650000, h * 0.3046667)
      ..cubicTo(
          w * 0.4626667, h * 0.3043333, w * 0.4613333, h * 0.3043333, w * 0.4600000, h * 0.3043333)
      ..cubicTo(
          w * 0.4430000, h * 0.3043333, w * 0.4260000, h * 0.3076667, w * 0.4086667, h * 0.3140000)
      ..lineTo(w * 0.4086667, h * 0.3133333)
      ..cubicTo(
          w * 0.3843333, h * 0.3226667, w * 0.3636667, h * 0.3380000, w * 0.3473333, h * 0.3590000)
      ..cubicTo(
          w * 0.3306667, h * 0.3800000, w * 0.3206667, h * 0.4040000, w * 0.3173333, h * 0.4313333)
      ..lineTo(w * 0.3150000, h * 0.4553333)
      ..lineTo(w * 0.2923333, h * 0.4563333)
      ..cubicTo(
          w * 0.2643333, h * 0.4596667, w * 0.2410000, h * 0.4713333, w * 0.2223333, h * 0.4916667)
      ..cubicTo(
          w * 0.2036667, h * 0.5120000, w * 0.1950000, h * 0.5356667, w * 0.1950000, h * 0.5633333)
      ..close()
      ..moveTo(w * 0.5866667, h * 0.2930000)
      ..cubicTo(
          w * 0.6220000, h * 0.3233333, w * 0.6440000, h * 0.3586667, w * 0.6523333, h * 0.3990000)
      ..lineTo(w * 0.6630000, h * 0.3990000)
      ..cubicTo(
          w * 0.7043333, h * 0.3990000, w * 0.7396667, h * 0.4120000, w * 0.7686667, h * 0.4383333)
      ..cubicTo(
          w * 0.7796667, h * 0.4280000, w * 0.7880000, h * 0.4160000, w * 0.7940000, h * 0.4026667)
      ..cubicTo(
          w * 0.7636667, h * 0.3883333, w * 0.7396667, h * 0.3663333, w * 0.7220000, h * 0.3370000)
      ..cubicTo(
          w * 0.7046667, h * 0.3076667, w * 0.6956667, h * 0.2766667, w * 0.6956667, h * 0.2443333)
      ..lineTo(w * 0.6956667, h * 0.2363333)
      ..cubicTo(
          w * 0.6940000, h * 0.2360000, w * 0.6913333, h * 0.2360000, w * 0.6876667, h * 0.2360000)
      ..cubicTo(
          w * 0.6683333, h * 0.2356667, w * 0.6493333, h * 0.2403333, w * 0.6310000, h * 0.2506667)
      ..cubicTo(
          w * 0.6126667, h * 0.2606667, w * 0.5976667, h * 0.2746667, w * 0.5866667, h * 0.2930000)
      ..close();
  }

  Path _nightCloudyGustsPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.09933333, h * 0.7006667)
      ..cubicTo(
          w * 0.09933333, h * 0.7083333, w * 0.1023333, h * 0.7150000, w * 0.1083333, h * 0.7206667)
      ..cubicTo(
          w * 0.1140000, h * 0.7263333, w * 0.1206667, h * 0.7290000, w * 0.1286667, h * 0.7290000)
      ..lineTo(w * 0.3200000, h * 0.7290000)
      ..cubicTo(
          w * 0.3286667, h * 0.7290000, w * 0.3363333, h * 0.7323333, w * 0.3430000, h * 0.7386667)
      ..cubicTo(
          w * 0.3496667, h * 0.7450000, w * 0.3530000, h * 0.7526667, w * 0.3530000, h * 0.7613333)
      ..cubicTo(
          w * 0.3530000, h * 0.7703333, w * 0.3496667, h * 0.7780000, w * 0.3430000, h * 0.7843333)
      ..cubicTo(
          w * 0.3363333, h * 0.7906667, w * 0.3286667, h * 0.7940000, w * 0.3200000, h * 0.7940000)
      ..cubicTo(
          w * 0.3113333, h * 0.7940000, w * 0.3040000, h * 0.7906667, w * 0.2973333, h * 0.7840000)
      ..cubicTo(
          w * 0.2913333, h * 0.7786667, w * 0.2846667, h * 0.7760000, w * 0.2770000, h * 0.7760000)
      ..cubicTo(
          w * 0.2690000, h * 0.7760000, w * 0.2623333, h * 0.7786667, w * 0.2570000, h * 0.7840000)
      ..cubicTo(
          w * 0.2516667, h * 0.7893333, w * 0.2490000, h * 0.7960000, w * 0.2490000, h * 0.8040000)
      ..cubicTo(
          w * 0.2490000, h * 0.8113333, w * 0.2516667, h * 0.8180000, w * 0.2570000, h * 0.8240000)
      ..cubicTo(
          w * 0.2743333, h * 0.8416667, w * 0.2956667, h * 0.8503333, w * 0.3200000, h * 0.8503333)
      ..cubicTo(
          w * 0.3443333, h * 0.8503333, w * 0.3656667, h * 0.8416667, w * 0.3830000, h * 0.8243333)
      ..cubicTo(
          w * 0.4003333, h * 0.8070000, w * 0.4090000, h * 0.7860000, w * 0.4090000, h * 0.7613333)
      ..cubicTo(
          w * 0.4090000, h * 0.7366667, w * 0.4003333, h * 0.7156667, w * 0.3830000, h * 0.6983333)
      ..cubicTo(
          w * 0.3656667, h * 0.6810000, w * 0.3446667, h * 0.6720000, w * 0.3200000, h * 0.6720000)
      ..lineTo(w * 0.1286667, h * 0.6720000)
      ..cubicTo(
          w * 0.1206667, h * 0.6720000, w * 0.1140000, h * 0.6750000, w * 0.1080000, h * 0.6806667)
      ..cubicTo(w * 0.1023333, h * 0.6863333, w * 0.09933333, h * 0.6930000, w * 0.09933333,
          h * 0.7006667)
      ..close()
      ..moveTo(w * 0.09933333, h * 0.6000000)
      ..cubicTo(
          w * 0.09933333, h * 0.6073333, w * 0.1023333, h * 0.6136667, w * 0.1083333, h * 0.6193333)
      ..cubicTo(
          w * 0.1140000, h * 0.6246667, w * 0.1210000, h * 0.6273333, w * 0.1286667, h * 0.6273333)
      ..lineTo(w * 0.4903333, h * 0.6273333)
      ..cubicTo(
          w * 0.5150000, h * 0.6273333, w * 0.5360000, h * 0.6186667, w * 0.5533333, h * 0.6013333)
      ..cubicTo(
          w * 0.5706667, h * 0.5840000, w * 0.5793333, h * 0.5630000, w * 0.5793333, h * 0.5386667)
      ..cubicTo(
          w * 0.5793333, h * 0.5140000, w * 0.5706667, h * 0.4933333, w * 0.5533333, h * 0.4760000)
      ..cubicTo(
          w * 0.5360000, h * 0.4586667, w * 0.5150000, h * 0.4503333, w * 0.4903333, h * 0.4503333)
      ..cubicTo(
          w * 0.4650000, h * 0.4503333, w * 0.4440000, h * 0.4586667, w * 0.4273333, h * 0.4756667)
      ..cubicTo(
          w * 0.4223333, h * 0.4810000, w * 0.4196667, h * 0.4876667, w * 0.4196667, h * 0.4960000)
      ..cubicTo(
          w * 0.4196667, h * 0.5043333, w * 0.4223333, h * 0.5110000, w * 0.4273333, h * 0.5160000)
      ..cubicTo(
          w * 0.4323333, h * 0.5210000, w * 0.4390000, h * 0.5236667, w * 0.4470000, h * 0.5236667)
      ..cubicTo(
          w * 0.4550000, h * 0.5236667, w * 0.4616667, h * 0.5213333, w * 0.4676667, h * 0.5160000)
      ..cubicTo(
          w * 0.4740000, h * 0.5096667, w * 0.4816667, h * 0.5066667, w * 0.4903333, h * 0.5066667)
      ..cubicTo(
          w * 0.4990000, h * 0.5066667, w * 0.5063333, h * 0.5096667, w * 0.5126667, h * 0.5160000)
      ..cubicTo(
          w * 0.5190000, h * 0.5223333, w * 0.5223333, h * 0.5300000, w * 0.5223333, h * 0.5386667)
      ..cubicTo(
          w * 0.5223333, h * 0.5473333, w * 0.5190000, h * 0.5550000, w * 0.5126667, h * 0.5613333)
      ..cubicTo(
          w * 0.5063333, h * 0.5676667, w * 0.4986667, h * 0.5710000, w * 0.4903333, h * 0.5710000)
      ..lineTo(w * 0.1286667, h * 0.5710000)
      ..cubicTo(
          w * 0.1206667, h * 0.5710000, w * 0.1140000, h * 0.5740000, w * 0.1080000, h * 0.5796667)
      ..cubicTo(w * 0.1023333, h * 0.5856667, w * 0.09933333, h * 0.5923333, w * 0.09933333,
          h * 0.6000000)
      ..close()
      ..moveTo(w * 0.1833333, h * 0.5216667)
      ..cubicTo(
          w * 0.1833333, h * 0.5246667, w * 0.1850000, h * 0.5260000, w * 0.1886667, h * 0.5260000)
      ..lineTo(w * 0.2366667, h * 0.5260000)
      ..cubicTo(
          w * 0.2393333, h * 0.5260000, w * 0.2416667, h * 0.5243333, w * 0.2440000, h * 0.5210000)
      ..cubicTo(
          w * 0.2513333, h * 0.5030000, w * 0.2630000, h * 0.4880000, w * 0.2790000, h * 0.4760000)
      ..cubicTo(
          w * 0.2946667, h * 0.4643333, w * 0.3123333, h * 0.4576667, w * 0.3316667, h * 0.4560000)
      ..lineTo(w * 0.3490000, h * 0.4536667)
      ..cubicTo(
          w * 0.3530000, h * 0.4536667, w * 0.3553333, h * 0.4516667, w * 0.3553333, h * 0.4480000)
      ..lineTo(w * 0.3580000, h * 0.4306667)
      ..cubicTo(
          w * 0.3616667, h * 0.3946667, w * 0.3770000, h * 0.3643333, w * 0.4040000, h * 0.3403333)
      ..cubicTo(
          w * 0.4310000, h * 0.3160000, w * 0.4630000, h * 0.3040000, w * 0.4993333, h * 0.3040000)
      ..cubicTo(
          w * 0.5356667, h * 0.3040000, w * 0.5676667, h * 0.3160000, w * 0.5943333, h * 0.3403333)
      ..cubicTo(
          w * 0.6213333, h * 0.3643333, w * 0.6366667, h * 0.3946667, w * 0.6403333, h * 0.4310000)
      ..lineTo(w * 0.6426667, h * 0.4503333)
      ..cubicTo(
          w * 0.6426667, h * 0.4543333, w * 0.6446667, h * 0.4563333, w * 0.6490000, h * 0.4563333)
      ..lineTo(w * 0.7030000, h * 0.4563333)
      ..cubicTo(
          w * 0.7333333, h * 0.4563333, w * 0.7590000, h * 0.4670000, w * 0.7803333, h * 0.4880000)
      ..cubicTo(
          w * 0.8016667, h * 0.5090000, w * 0.8123333, h * 0.5343333, w * 0.8123333, h * 0.5640000)
      ..cubicTo(
          w * 0.8123333, h * 0.5936667, w * 0.8016667, h * 0.6190000, w * 0.7803333, h * 0.6403333)
      ..cubicTo(
          w * 0.7590000, h * 0.6616667, w * 0.7333333, h * 0.6723333, w * 0.7033333, h * 0.6723333)
      ..lineTo(w * 0.4730000, h * 0.6723333)
      ..cubicTo(
          w * 0.4693333, h * 0.6723333, w * 0.4673333, h * 0.6743333, w * 0.4673333, h * 0.6783333)
      ..lineTo(w * 0.4673333, h * 0.7240000)
      ..cubicTo(
          w * 0.4673333, h * 0.7276667, w * 0.4693333, h * 0.7296667, w * 0.4730000, h * 0.7296667)
      ..lineTo(w * 0.7033333, h * 0.7296667)
      ..cubicTo(
          w * 0.7330000, h * 0.7296667, w * 0.7606667, h * 0.7223333, w * 0.7860000, h * 0.7073333)
      ..cubicTo(
          w * 0.8113333, h * 0.6923333, w * 0.8313333, h * 0.6723333, w * 0.8460000, h * 0.6470000)
      ..cubicTo(
          w * 0.8606667, h * 0.6216667, w * 0.8683333, h * 0.5940000, w * 0.8683333, h * 0.5643333)
      ..cubicTo(
          w * 0.8683333, h * 0.5350000, w * 0.8606667, h * 0.5073333, w * 0.8456667, h * 0.4816667)
      ..cubicTo(
          w * 0.8700000, h * 0.4580000, w * 0.8866667, h * 0.4293333, w * 0.8960000, h * 0.3956667)
      ..lineTo(w * 0.9000000, h * 0.3726667)
      ..cubicTo(
          w * 0.9006667, h * 0.3720000, w * 0.9010000, h * 0.3713333, w * 0.9010000, h * 0.3703333)
      ..cubicTo(
          w * 0.9010000, h * 0.3690000, w * 0.8993333, h * 0.3670000, w * 0.8963333, h * 0.3650000)
      ..lineTo(w * 0.8763333, h * 0.3580000)
      ..cubicTo(
          w * 0.8483333, h * 0.3493333, w * 0.8270000, h * 0.3343333, w * 0.8123333, h * 0.3126667)
      ..cubicTo(
          w * 0.7976667, h * 0.2910000, w * 0.7903333, h * 0.2686667, w * 0.7903333, h * 0.2453333)
      ..cubicTo(
          w * 0.7903333, h * 0.2373333, w * 0.7913333, h * 0.2283333, w * 0.7933333, h * 0.2190000)
      ..lineTo(w * 0.7976667, h * 0.1983333)
      ..cubicTo(
          w * 0.7983333, h * 0.1950000, w * 0.7970000, h * 0.1923333, w * 0.7933333, h * 0.1910000)
      ..lineTo(w * 0.7666667, h * 0.1830000)
      ..cubicTo(
          w * 0.7520000, h * 0.1793333, w * 0.7383333, h * 0.1776667, w * 0.7250000, h * 0.1776667)
      ..cubicTo(
          w * 0.7126667, h * 0.1776667, w * 0.7003333, h * 0.1790000, w * 0.6876667, h * 0.1820000)
      ..cubicTo(
          w * 0.6750000, h * 0.1850000, w * 0.6620000, h * 0.1893333, w * 0.6483333, h * 0.1956667)
      ..cubicTo(
          w * 0.6350000, h * 0.2016667, w * 0.6216667, h * 0.2106667, w * 0.6090000, h * 0.2223333)
      ..cubicTo(
          w * 0.5963333, h * 0.2340000, w * 0.5850000, h * 0.2473333, w * 0.5756667, h * 0.2630000)
      ..cubicTo(
          w * 0.5520000, h * 0.2530000, w * 0.5263333, h * 0.2480000, w * 0.4983333, h * 0.2480000)
      ..cubicTo(
          w * 0.4513333, h * 0.2480000, w * 0.4096667, h * 0.2626667, w * 0.3733333, h * 0.2916667)
      ..cubicTo(
          w * 0.3370000, h * 0.3206667, w * 0.3143333, h * 0.3580000, w * 0.3043333, h * 0.4033333)
      ..cubicTo(
          w * 0.2756667, h * 0.4100000, w * 0.2506667, h * 0.4236667, w * 0.2286667, h * 0.4443333)
      ..cubicTo(
          w * 0.2066667, h * 0.4650000, w * 0.1916667, h * 0.4893333, w * 0.1833333, h * 0.5176667)
      ..lineTo(w * 0.1833333, h * 0.5186667)
      ..cubicTo(
          w * 0.1836667, h * 0.5193333, w * 0.1833333, h * 0.5203333, w * 0.1833333, h * 0.5216667)
      ..close()
      ..moveTo(w * 0.6243333, h * 0.2920000)
      ..cubicTo(
          w * 0.6346667, h * 0.2736667, w * 0.6490000, h * 0.2596667, w * 0.6673333, h * 0.2500000)
      ..cubicTo(
          w * 0.6856667, h * 0.2403333, w * 0.7046667, h * 0.2353333, w * 0.7243333, h * 0.2353333)
      ..cubicTo(
          w * 0.7290000, h * 0.2353333, w * 0.7323333, h * 0.2353333, w * 0.7346667, h * 0.2356667)
      ..cubicTo(
          w * 0.7343333, h * 0.2386667, w * 0.7340000, h * 0.2426667, w * 0.7340000, h * 0.2476667)
      ..cubicTo(
          w * 0.7340000, h * 0.2790000, w * 0.7426667, h * 0.3093333, w * 0.7603333, h * 0.3380000)
      ..cubicTo(
          w * 0.7776667, h * 0.3666667, w * 0.8020000, h * 0.3883333, w * 0.8326667, h * 0.4026667)
      ..cubicTo(
          w * 0.8273333, h * 0.4153333, w * 0.8190000, h * 0.4266667, w * 0.8076667, h * 0.4370000)
      ..cubicTo(
          w * 0.7780000, h * 0.4116667, w * 0.7430000, h * 0.3990000, w * 0.7023333, h * 0.3990000)
      ..lineTo(w * 0.6913333, h * 0.3990000)
      ..cubicTo(
          w * 0.6826667, h * 0.3570000, w * 0.6603333, h * 0.3213333, w * 0.6243333, h * 0.2920000)
      ..close();
  }

  Path _nightHailPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1366667, h * 0.5636667)
      ..cubicTo(
          w * 0.1366667, h * 0.6080000, w * 0.1520000, h * 0.6463333, w * 0.1830000, h * 0.6780000)
      ..cubicTo(
          w * 0.2140000, h * 0.7096667, w * 0.2516667, h * 0.7270000, w * 0.2963333, h * 0.7290000)
      ..cubicTo(
          w * 0.3003333, h * 0.7290000, w * 0.3023333, h * 0.7270000, w * 0.3023333, h * 0.7233333)
      ..lineTo(w * 0.3023333, h * 0.6786667)
      ..cubicTo(
          w * 0.3023333, h * 0.6750000, w * 0.3003333, h * 0.6730000, w * 0.2963333, h * 0.6730000)
      ..cubicTo(
          w * 0.2676667, h * 0.6716667, w * 0.2436667, h * 0.6603333, w * 0.2236667, h * 0.6390000)
      ..cubicTo(
          w * 0.2036667, h * 0.6176667, w * 0.1936667, h * 0.5926667, w * 0.1936667, h * 0.5636667)
      ..cubicTo(
          w * 0.1936667, h * 0.5360000, w * 0.2030000, h * 0.5120000, w * 0.2216667, h * 0.4913333)
      ..cubicTo(
          w * 0.2403333, h * 0.4710000, w * 0.2636667, h * 0.4590000, w * 0.2916667, h * 0.4556667)
      ..lineTo(w * 0.3093333, h * 0.4546667)
      ..cubicTo(
          w * 0.3136667, h * 0.4546667, w * 0.3160000, h * 0.4526667, w * 0.3160000, h * 0.4486667)
      ..lineTo(w * 0.3183333, h * 0.4306667)
      ..cubicTo(
          w * 0.3220000, h * 0.3946667, w * 0.3370000, h * 0.3643333, w * 0.3640000, h * 0.3400000)
      ..cubicTo(
          w * 0.3910000, h * 0.3156667, w * 0.4226667, h * 0.3033333, w * 0.4590000, h * 0.3033333)
      ..cubicTo(
          w * 0.4950000, h * 0.3033333, w * 0.5266667, h * 0.3156667, w * 0.5540000, h * 0.3400000)
      ..cubicTo(
          w * 0.5813333, h * 0.3643333, w * 0.5966667, h * 0.3946667, w * 0.6006667, h * 0.4306667)
      ..lineTo(w * 0.6033333, h * 0.4500000)
      ..cubicTo(
          w * 0.6033333, h * 0.4536667, w * 0.6053333, h * 0.4556667, w * 0.6090000, h * 0.4556667)
      ..lineTo(w * 0.6626667, h * 0.4556667)
      ..cubicTo(
          w * 0.6923333, h * 0.4556667, w * 0.7180000, h * 0.4663333, w * 0.7396667, h * 0.4876667)
      ..cubicTo(
          w * 0.7613333, h * 0.5090000, w * 0.7723333, h * 0.5343333, w * 0.7723333, h * 0.5633333)
      ..cubicTo(
          w * 0.7723333, h * 0.5923333, w * 0.7623333, h * 0.6173333, w * 0.7423333, h * 0.6386667)
      ..cubicTo(
          w * 0.7223333, h * 0.6600000, w * 0.6980000, h * 0.6713333, w * 0.6696667, h * 0.6726667)
      ..cubicTo(
          w * 0.6653333, h * 0.6726667, w * 0.6630000, h * 0.6746667, w * 0.6630000, h * 0.6783333)
      ..lineTo(w * 0.6630000, h * 0.7230000)
      ..cubicTo(
          w * 0.6630000, h * 0.7266667, w * 0.6653333, h * 0.7286667, w * 0.6696667, h * 0.7286667)
      ..cubicTo(
          w * 0.7140000, h * 0.7273333, w * 0.7516667, h * 0.7103333, w * 0.7823333, h * 0.6783333)
      ..cubicTo(
          w * 0.8133333, h * 0.6463333, w * 0.8286667, h * 0.6080000, w * 0.8286667, h * 0.5633333)
      ..cubicTo(
          w * 0.8286667, h * 0.5346667, w * 0.8213333, h * 0.5080000, w * 0.8070000, h * 0.4830000)
      ..cubicTo(
          w * 0.8333333, h * 0.4583333, w * 0.8503333, h * 0.4290000, w * 0.8586667, h * 0.3956667)
      ..lineTo(w * 0.8630000, h * 0.3730000)
      ..cubicTo(
          w * 0.8636667, h * 0.3726667, w * 0.8640000, h * 0.3720000, w * 0.8640000, h * 0.3706667)
      ..cubicTo(
          w * 0.8640000, h * 0.3683333, w * 0.8623333, h * 0.3663333, w * 0.8586667, h * 0.3653333)
      ..lineTo(w * 0.8400000, h * 0.3596667)
      ..cubicTo(
          w * 0.8210000, h * 0.3540000, w * 0.8050000, h * 0.3446667, w * 0.7913333, h * 0.3313333)
      ..cubicTo(
          w * 0.7780000, h * 0.3180000, w * 0.7683333, h * 0.3043333, w * 0.7626667, h * 0.2896667)
      ..cubicTo(
          w * 0.7570000, h * 0.2753333, w * 0.7543333, h * 0.2606667, w * 0.7543333, h * 0.2456667)
      ..cubicTo(
          w * 0.7540000, h * 0.2376667, w * 0.7550000, h * 0.2286667, w * 0.7570000, h * 0.2193333)
      ..lineTo(w * 0.7616667, h * 0.2000000)
      ..cubicTo(
          w * 0.7626667, h * 0.1970000, w * 0.7610000, h * 0.1946667, w * 0.7570000, h * 0.1926667)
      ..lineTo(w * 0.7303333, h * 0.1843333)
      ..cubicTo(
          w * 0.7163333, h * 0.1803333, w * 0.7016667, h * 0.1780000, w * 0.6866667, h * 0.1780000)
      ..cubicTo(
          w * 0.6750000, h * 0.1780000, w * 0.6630000, h * 0.1793333, w * 0.6506667, h * 0.1823333)
      ..cubicTo(
          w * 0.6383333, h * 0.1853333, w * 0.6253333, h * 0.1896667, w * 0.6116667, h * 0.1956667)
      ..cubicTo(
          w * 0.5980000, h * 0.2016667, w * 0.5850000, h * 0.2106667, w * 0.5720000, h * 0.2223333)
      ..cubicTo(
          w * 0.5593333, h * 0.2340000, w * 0.5480000, h * 0.2473333, w * 0.5386667, h * 0.2630000)
      ..cubicTo(
          w * 0.5136667, h * 0.2523333, w * 0.4873333, h * 0.2466667, w * 0.4596667, h * 0.2466667)
      ..cubicTo(
          w * 0.4126667, h * 0.2466667, w * 0.3706667, h * 0.2613333, w * 0.3343333, h * 0.2903333)
      ..cubicTo(
          w * 0.2980000, h * 0.3193333, w * 0.2746667, h * 0.3566667, w * 0.2643333, h * 0.4023333)
      ..cubicTo(
          w * 0.2273333, h * 0.4110000, w * 0.1970000, h * 0.4300000, w * 0.1730000, h * 0.4600000)
      ..cubicTo(
          w * 0.1490000, h * 0.4900000, w * 0.1366667, h * 0.5253333, w * 0.1366667, h * 0.5636667)
      ..close()
      ..moveTo(w * 0.3193333, h * 0.7980000)
      ..cubicTo(
          w * 0.3223333, h * 0.8050000, w * 0.3273333, h * 0.8100000, w * 0.3346667, h * 0.8130000)
      ..cubicTo(
          w * 0.3410000, h * 0.8163333, w * 0.3480000, h * 0.8166667, w * 0.3553333, h * 0.8136667)
      ..cubicTo(
          w * 0.3626667, h * 0.8110000, w * 0.3676667, h * 0.8060000, w * 0.3703333, h * 0.7986667)
      ..cubicTo(
          w * 0.3736667, h * 0.7913333, w * 0.3740000, h * 0.7843333, w * 0.3710000, h * 0.7770000)
      ..cubicTo(
          w * 0.3683333, h * 0.7700000, w * 0.3633333, h * 0.7650000, w * 0.3560000, h * 0.7623333)
      ..cubicTo(
          w * 0.3493333, h * 0.7590000, w * 0.3423333, h * 0.7586667, w * 0.3353333, h * 0.7616667)
      ..cubicTo(
          w * 0.3283333, h * 0.7646667, w * 0.3230000, h * 0.7696667, w * 0.3196667, h * 0.7770000)
      ..cubicTo(
          w * 0.3166667, h * 0.7826667, w * 0.3163333, h * 0.7896667, w * 0.3193333, h * 0.7980000)
      ..close()
      ..moveTo(w * 0.3400000, h * 0.7036667)
      ..cubicTo(
          w * 0.3400000, h * 0.7086667, w * 0.3416667, h * 0.7136667, w * 0.3453333, h * 0.7186667)
      ..cubicTo(
          w * 0.3490000, h * 0.7236667, w * 0.3540000, h * 0.7273333, w * 0.3606667, h * 0.7293333)
      ..cubicTo(
          w * 0.3693333, h * 0.7326667, w * 0.3766667, h * 0.7326667, w * 0.3830000, h * 0.7293333)
      ..cubicTo(
          w * 0.3893333, h * 0.7260000, w * 0.3936667, h * 0.7196667, w * 0.3963333, h * 0.7103333)
      ..lineTo(w * 0.4256667, h * 0.6033333)
      ..cubicTo(
          w * 0.4280000, h * 0.5950000, w * 0.4270000, h * 0.5876667, w * 0.4230000, h * 0.5810000)
      ..cubicTo(
          w * 0.4190000, h * 0.5743333, w * 0.4130000, h * 0.5703333, w * 0.4050000, h * 0.5686667)
      ..cubicTo(
          w * 0.3976667, h * 0.5663333, w * 0.3906667, h * 0.5670000, w * 0.3840000, h * 0.5710000)
      ..cubicTo(
          w * 0.3773333, h * 0.5746667, w * 0.3730000, h * 0.5803333, w * 0.3706667, h * 0.5880000)
      ..lineTo(w * 0.3413333, h * 0.6953333)
      ..cubicTo(
          w * 0.3413333, h * 0.6960000, w * 0.3410000, h * 0.6973333, w * 0.3406667, h * 0.6993333)
      ..cubicTo(
          w * 0.3403333, h * 0.7010000, w * 0.3400000, h * 0.7026667, w * 0.3400000, h * 0.7036667)
      ..close()
      ..moveTo(w * 0.4023333, h * 0.8903333)
      ..cubicTo(
          w * 0.4023333, h * 0.8943333, w * 0.4030000, h * 0.8976667, w * 0.4043333, h * 0.9000000)
      ..cubicTo(
          w * 0.4073333, h * 0.9073333, w * 0.4123333, h * 0.9123333, w * 0.4193333, h * 0.9150000)
      ..cubicTo(
          w * 0.4223333, h * 0.9166667, w * 0.4260000, h * 0.9173333, w * 0.4303333, h * 0.9173333)
      ..cubicTo(
          w * 0.4323333, h * 0.9173333, w * 0.4356667, h * 0.9166667, w * 0.4403333, h * 0.9153333)
      ..cubicTo(
          w * 0.4480000, h * 0.9126667, w * 0.4533333, h * 0.9076667, w * 0.4563333, h * 0.9003333)
      ..cubicTo(
          w * 0.4596667, h * 0.8930000, w * 0.4596667, h * 0.8856667, w * 0.4563333, h * 0.8783333)
      ..cubicTo(
          w * 0.4530000, h * 0.8710000, w * 0.4480000, h * 0.8660000, w * 0.4413333, h * 0.8630000)
      ..cubicTo(
          w * 0.4346667, h * 0.8600000, w * 0.4280000, h * 0.8600000, w * 0.4210000, h * 0.8630000)
      ..cubicTo(
          w * 0.4146667, h * 0.8656667, w * 0.4100000, h * 0.8696667, w * 0.4070000, h * 0.8750000)
      ..cubicTo(
          w * 0.4036667, h * 0.8806667, w * 0.4023333, h * 0.8856667, w * 0.4023333, h * 0.8903333)
      ..close()
      ..moveTo(w * 0.4270000, h * 0.8020000)
      ..cubicTo(
          w * 0.4270000, h * 0.8146667, w * 0.4340000, h * 0.8233333, w * 0.4483333, h * 0.8280000)
      ..cubicTo(
          w * 0.4513333, h * 0.8290000, w * 0.4540000, h * 0.8296667, w * 0.4560000, h * 0.8296667)
      ..cubicTo(
          w * 0.4596667, h * 0.8296667, w * 0.4636667, h * 0.8286667, w * 0.4676667, h * 0.8270000)
      ..cubicTo(
          w * 0.4753333, h * 0.8243333, w * 0.4806667, h * 0.8180000, w * 0.4833333, h * 0.8080000)
      ..lineTo(w * 0.5383333, h * 0.6040000)
      ..cubicTo(
          w * 0.5403333, h * 0.5960000, w * 0.5396667, h * 0.5890000, w * 0.5360000, h * 0.5823333)
      ..cubicTo(
          w * 0.5323333, h * 0.5760000, w * 0.5266667, h * 0.5716667, w * 0.5193333, h * 0.5693333)
      ..cubicTo(
          w * 0.5116667, h * 0.5670000, w * 0.5043333, h * 0.5676667, w * 0.4976667, h * 0.5716667)
      ..cubicTo(
          w * 0.4910000, h * 0.5753333, w * 0.4863333, h * 0.5810000, w * 0.4843333, h * 0.5886667)
      ..lineTo(w * 0.4283333, h * 0.7943333)
      ..cubicTo(
          w * 0.4273333, h * 0.7973333, w * 0.4270000, h * 0.8000000, w * 0.4270000, h * 0.8020000)
      ..close()
      ..moveTo(w * 0.5416667, h * 0.7880000)
      ..cubicTo(
          w * 0.5416667, h * 0.7923333, w * 0.5423333, h * 0.7956667, w * 0.5440000, h * 0.7983333)
      ..cubicTo(
          w * 0.5466667, h * 0.8050000, w * 0.5516667, h * 0.8100000, w * 0.5586667, h * 0.8130000)
      ..cubicTo(
          w * 0.5626667, h * 0.8146667, w * 0.5663333, h * 0.8156667, w * 0.5703333, h * 0.8156667)
      ..cubicTo(
          w * 0.5723333, h * 0.8156667, w * 0.5756667, h * 0.8150000, w * 0.5803333, h * 0.8136667)
      ..cubicTo(
          w * 0.5876667, h * 0.8106667, w * 0.5926667, h * 0.8060000, w * 0.5953333, h * 0.7990000)
      ..cubicTo(
          w * 0.5980000, h * 0.7916667, w * 0.5980000, h * 0.7846667, w * 0.5953333, h * 0.7780000)
      ..cubicTo(
          w * 0.5926667, h * 0.7713333, w * 0.5880000, h * 0.7663333, w * 0.5813333, h * 0.7630000)
      ..cubicTo(
          w * 0.5740000, h * 0.7596667, w * 0.5666667, h * 0.7593333, w * 0.5596667, h * 0.7623333)
      ..cubicTo(
          w * 0.5523333, h * 0.7650000, w * 0.5473333, h * 0.7703333, w * 0.5440000, h * 0.7776667)
      ..cubicTo(
          w * 0.5423333, h * 0.7803333, w * 0.5416667, h * 0.7836667, w * 0.5416667, h * 0.7880000)
      ..close()
      ..moveTo(w * 0.5656667, h * 0.7026667)
      ..cubicTo(
          w * 0.5656667, h * 0.7080000, w * 0.5673333, h * 0.7133333, w * 0.5706667, h * 0.7180000)
      ..cubicTo(
          w * 0.5740000, h * 0.7226667, w * 0.5790000, h * 0.7263333, w * 0.5856667, h * 0.7283333)
      ..cubicTo(
          w * 0.5913333, h * 0.7290000, w * 0.5943333, h * 0.7293333, w * 0.5946667, h * 0.7293333)
      ..cubicTo(
          w * 0.6083333, h * 0.7293333, w * 0.6166667, h * 0.7226667, w * 0.6203333, h * 0.7090000)
      ..lineTo(w * 0.6493333, h * 0.6033333)
      ..cubicTo(
          w * 0.6513333, h * 0.5953333, w * 0.6506667, h * 0.5883333, w * 0.6470000, h * 0.5816667)
      ..cubicTo(
          w * 0.6433333, h * 0.5753333, w * 0.6376667, h * 0.5710000, w * 0.6303333, h * 0.5686667)
      ..cubicTo(
          w * 0.6226667, h * 0.5663333, w * 0.6153333, h * 0.5670000, w * 0.6090000, h * 0.5710000)
      ..cubicTo(
          w * 0.6023333, h * 0.5746667, w * 0.5980000, h * 0.5803333, w * 0.5956667, h * 0.5880000)
      ..lineTo(w * 0.5666667, h * 0.6936667)
      ..cubicTo(
          w * 0.5660000, h * 0.6966667, w * 0.5656667, h * 0.6996667, w * 0.5656667, h * 0.7026667)
      ..close()
      ..moveTo(w * 0.5873333, h * 0.2943333)
      ..cubicTo(
          w * 0.5976667, h * 0.2753333, w * 0.6123333, h * 0.2606667, w * 0.6306667, h * 0.2506667)
      ..cubicTo(
          w * 0.6490000, h * 0.2406667, w * 0.6686667, h * 0.2356667, w * 0.6893333, h * 0.2360000)
      ..cubicTo(
          w * 0.6930000, h * 0.2360000, w * 0.6960000, h * 0.2363333, w * 0.6976667, h * 0.2366667)
      ..lineTo(w * 0.6976667, h * 0.2470000)
      ..cubicTo(
          w * 0.6976667, h * 0.2796667, w * 0.7063333, h * 0.3100000, w * 0.7236667, h * 0.3386667)
      ..cubicTo(
          w * 0.7410000, h * 0.3673333, w * 0.7653333, h * 0.3890000, w * 0.7960000, h * 0.4036667)
      ..cubicTo(
          w * 0.7896667, h * 0.4183333, w * 0.7813333, h * 0.4300000, w * 0.7710000, h * 0.4393333)
      ..cubicTo(
          w * 0.7416667, h * 0.4130000, w * 0.7056667, h * 0.4000000, w * 0.6626667, h * 0.4000000)
      ..lineTo(w * 0.6520000, h * 0.4000000)
      ..cubicTo(
          w * 0.6433333, h * 0.3583333, w * 0.6220000, h * 0.3230000, w * 0.5873333, h * 0.2943333)
      ..close();
  }

  Path _nightLightningPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1373333, h * 0.5636667)
      ..cubicTo(
          w * 0.1373333, h * 0.6080000, w * 0.1526667, h * 0.6463333, w * 0.1836667, h * 0.6780000)
      ..cubicTo(
          w * 0.2146667, h * 0.7096667, w * 0.2523333, h * 0.7270000, w * 0.2970000, h * 0.7290000)
      ..cubicTo(
          w * 0.3006667, h * 0.7290000, w * 0.3026667, h * 0.7270000, w * 0.3026667, h * 0.7233333)
      ..lineTo(w * 0.3026667, h * 0.6776667)
      ..cubicTo(
          w * 0.3026667, h * 0.6736667, w * 0.3006667, h * 0.6716667, w * 0.2970000, h * 0.6716667)
      ..cubicTo(
          w * 0.2680000, h * 0.6693333, w * 0.2436667, h * 0.6580000, w * 0.2240000, h * 0.6370000)
      ..cubicTo(
          w * 0.2043333, h * 0.6163333, w * 0.1943333, h * 0.5916667, w * 0.1943333, h * 0.5633333)
      ..cubicTo(
          w * 0.1943333, h * 0.5353333, w * 0.2036667, h * 0.5110000, w * 0.2226667, h * 0.4903333)
      ..cubicTo(
          w * 0.2416667, h * 0.4696667, w * 0.2646667, h * 0.4580000, w * 0.2926667, h * 0.4556667)
      ..lineTo(w * 0.3103333, h * 0.4533333)
      ..cubicTo(
          w * 0.3146667, h * 0.4533333, w * 0.3170000, h * 0.4513333, w * 0.3170000, h * 0.4476667)
      ..lineTo(w * 0.3193333, h * 0.4303333)
      ..cubicTo(
          w * 0.3230000, h * 0.3943333, w * 0.3380000, h * 0.3640000, w * 0.3650000, h * 0.3400000)
      ..cubicTo(
          w * 0.3920000, h * 0.3156667, w * 0.4236667, h * 0.3036667, w * 0.4600000, h * 0.3036667)
      ..cubicTo(
          w * 0.4963333, h * 0.3036667, w * 0.5280000, h * 0.3156667, w * 0.5550000, h * 0.3400000)
      ..cubicTo(
          w * 0.5820000, h * 0.3640000, w * 0.5973333, h * 0.3943333, w * 0.6013333, h * 0.4306667)
      ..lineTo(w * 0.6036667, h * 0.4500000)
      ..cubicTo(
          w * 0.6036667, h * 0.4540000, w * 0.6056667, h * 0.4560000, w * 0.6096667, h * 0.4560000)
      ..lineTo(w * 0.6633333, h * 0.4560000)
      ..cubicTo(
          w * 0.6936667, h * 0.4560000, w * 0.7193333, h * 0.4666667, w * 0.7406667, h * 0.4876667)
      ..cubicTo(
          w * 0.7620000, h * 0.5086667, w * 0.7726667, h * 0.5340000, w * 0.7726667, h * 0.5636667)
      ..cubicTo(
          w * 0.7726667, h * 0.5920000, w * 0.7626667, h * 0.6166667, w * 0.7430000, h * 0.6373333)
      ..cubicTo(
          w * 0.7233333, h * 0.6580000, w * 0.6990000, h * 0.6696667, w * 0.6700000, h * 0.6720000)
      ..cubicTo(
          w * 0.6656667, h * 0.6720000, w * 0.6633333, h * 0.6740000, w * 0.6633333, h * 0.6780000)
      ..lineTo(w * 0.6633333, h * 0.7236667)
      ..cubicTo(
          w * 0.6633333, h * 0.7273333, w * 0.6656667, h * 0.7293333, w * 0.6700000, h * 0.7293333)
      ..cubicTo(
          w * 0.7143333, h * 0.7280000, w * 0.7520000, h * 0.7110000, w * 0.7826667, h * 0.6790000)
      ..cubicTo(
          w * 0.8133333, h * 0.6470000, w * 0.8286667, h * 0.6086667, w * 0.8286667, h * 0.5640000)
      ..cubicTo(
          w * 0.8286667, h * 0.5343333, w * 0.8210000, h * 0.5066667, w * 0.8060000, h * 0.4813333)
      ..cubicTo(
          w * 0.8326667, h * 0.4573333, w * 0.8500000, h * 0.4286667, w * 0.8576667, h * 0.3953333)
      ..lineTo(w * 0.8626667, h * 0.3713333)
      ..cubicTo(
          w * 0.8630000, h * 0.3710000, w * 0.8630000, h * 0.3703333, w * 0.8630000, h * 0.3690000)
      ..cubicTo(
          w * 0.8630000, h * 0.3666667, w * 0.8613333, h * 0.3646667, w * 0.8576667, h * 0.3636667)
      ..lineTo(w * 0.8383333, h * 0.3580000)
      ..cubicTo(
          w * 0.8193333, h * 0.3526667, w * 0.8033333, h * 0.3433333, w * 0.7900000, h * 0.3306667)
      ..cubicTo(
          w * 0.7766667, h * 0.3176667, w * 0.7673333, h * 0.3040000, w * 0.7616667, h * 0.2896667)
      ..cubicTo(
          w * 0.7560000, h * 0.2753333, w * 0.7533333, h * 0.2606667, w * 0.7533333, h * 0.2456667)
      ..cubicTo(
          w * 0.7533333, h * 0.2376667, w * 0.7543333, h * 0.2286667, w * 0.7563333, h * 0.2193333)
      ..lineTo(w * 0.7610000, h * 0.1986667)
      ..cubicTo(
          w * 0.7620000, h * 0.1956667, w * 0.7603333, h * 0.1930000, w * 0.7563333, h * 0.1913333)
      ..lineTo(w * 0.7300000, h * 0.1833333)
      ..cubicTo(
          w * 0.7153333, h * 0.1796667, w * 0.7016667, h * 0.1780000, w * 0.6883333, h * 0.1780000)
      ..cubicTo(
          w * 0.6763333, h * 0.1780000, w * 0.6640000, h * 0.1793333, w * 0.6510000, h * 0.1823333)
      ..cubicTo(
          w * 0.6383333, h * 0.1853333, w * 0.6250000, h * 0.1896667, w * 0.6113333, h * 0.1960000)
      ..cubicTo(
          w * 0.5976667, h * 0.2020000, w * 0.5843333, h * 0.2110000, w * 0.5713333, h * 0.2226667)
      ..cubicTo(
          w * 0.5583333, h * 0.2343333, w * 0.5473333, h * 0.2476667, w * 0.5380000, h * 0.2633333)
      ..cubicTo(
          w * 0.5143333, h * 0.2533333, w * 0.4886667, h * 0.2483333, w * 0.4603333, h * 0.2483333)
      ..cubicTo(
          w * 0.4133333, h * 0.2483333, w * 0.3716667, h * 0.2630000, w * 0.3353333, h * 0.2920000)
      ..cubicTo(
          w * 0.2990000, h * 0.3210000, w * 0.2756667, h * 0.3583333, w * 0.2653333, h * 0.4036667)
      ..cubicTo(
          w * 0.2286667, h * 0.4123333, w * 0.1983333, h * 0.4316667, w * 0.1743333, h * 0.4616667)
      ..cubicTo(
          w * 0.1493333, h * 0.4913333, w * 0.1373333, h * 0.5253333, w * 0.1373333, h * 0.5636667)
      ..close()
      ..moveTo(w * 0.3930000, h * 0.7186667)
      ..cubicTo(
          w * 0.3913333, h * 0.7233333, w * 0.3930000, h * 0.7260000, w * 0.3976667, h * 0.7260000)
      ..lineTo(w * 0.4696667, h * 0.7260000)
      ..lineTo(w * 0.4260000, h * 0.8640000)
      ..lineTo(w * 0.4360000, h * 0.8640000)
      ..lineTo(w * 0.5750000, h * 0.6776667)
      ..cubicTo(
          w * 0.5763333, h * 0.6763333, w * 0.5766667, h * 0.6746667, w * 0.5760000, h * 0.6730000)
      ..cubicTo(
          w * 0.5753333, h * 0.6713333, w * 0.5740000, h * 0.6706667, w * 0.5716667, h * 0.6706667)
      ..lineTo(w * 0.4983333, h * 0.6706667)
      ..lineTo(w * 0.5753333, h * 0.5303333)
      ..cubicTo(
          w * 0.5776667, h * 0.5256667, w * 0.5760000, h * 0.5230000, w * 0.5706667, h * 0.5230000)
      ..lineTo(w * 0.4726667, h * 0.5230000)
      ..cubicTo(
          w * 0.4700000, h * 0.5230000, w * 0.4676667, h * 0.5246667, w * 0.4653333, h * 0.5276667)
      ..lineTo(w * 0.3930000, h * 0.7186667)
      ..close()
      ..moveTo(w * 0.5866667, h * 0.2936667)
      ..cubicTo(
          w * 0.5976667, h * 0.2746667, w * 0.6123333, h * 0.2603333, w * 0.6310000, h * 0.2503333)
      ..cubicTo(
          w * 0.6493333, h * 0.2403333, w * 0.6686667, h * 0.2353333, w * 0.6883333, h * 0.2353333)
      ..cubicTo(
          w * 0.6926667, h * 0.2353333, w * 0.6956667, h * 0.2356667, w * 0.6973333, h * 0.2360000)
      ..lineTo(w * 0.6973333, h * 0.2463333)
      ..cubicTo(
          w * 0.6973333, h * 0.2783333, w * 0.7060000, h * 0.3086667, w * 0.7233333, h * 0.3373333)
      ..cubicTo(
          w * 0.7406667, h * 0.3660000, w * 0.7646667, h * 0.3876667, w * 0.7956667, h * 0.4026667)
      ..cubicTo(
          w * 0.7903333, h * 0.4150000, w * 0.7820000, h * 0.4270000, w * 0.7706667, h * 0.4383333)
      ..cubicTo(
          w * 0.7400000, h * 0.4120000, w * 0.7043333, h * 0.3990000, w * 0.6633333, h * 0.3990000)
      ..lineTo(w * 0.6526667, h * 0.3990000)
      ..cubicTo(
          w * 0.6430000, h * 0.3570000, w * 0.6210000, h * 0.3220000, w * 0.5866667, h * 0.2936667)
      ..close();
  }

  Path _nightRainPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1356667, h * 0.5633333)
      ..cubicTo(
          w * 0.1356667, h * 0.6076667, w * 0.1513333, h * 0.6460000, w * 0.1823333, h * 0.6780000)
      ..cubicTo(
          w * 0.2133333, h * 0.7100000, w * 0.2513333, h * 0.7270000, w * 0.2956667, h * 0.7290000)
      ..cubicTo(
          w * 0.2996667, h * 0.7290000, w * 0.3016667, h * 0.7270000, w * 0.3016667, h * 0.7233333)
      ..lineTo(w * 0.3016667, h * 0.6786667)
      ..cubicTo(
          w * 0.3016667, h * 0.6750000, w * 0.2996667, h * 0.6730000, w * 0.2956667, h * 0.6730000)
      ..cubicTo(
          w * 0.2670000, h * 0.6713333, w * 0.2426667, h * 0.6600000, w * 0.2226667, h * 0.6386667)
      ..cubicTo(
          w * 0.2026667, h * 0.6173333, w * 0.1926667, h * 0.5923333, w * 0.1926667, h * 0.5633333)
      ..cubicTo(
          w * 0.1926667, h * 0.5356667, w * 0.2020000, h * 0.5116667, w * 0.2210000, h * 0.4910000)
      ..cubicTo(
          w * 0.2400000, h * 0.4703333, w * 0.2633333, h * 0.4586667, w * 0.2910000, h * 0.4553333)
      ..lineTo(w * 0.3086667, h * 0.4540000)
      ..cubicTo(
          w * 0.3130000, h * 0.4540000, w * 0.3153333, h * 0.4520000, w * 0.3153333, h * 0.4483333)
      ..lineTo(w * 0.3176667, h * 0.4303333)
      ..cubicTo(
          w * 0.3213333, h * 0.3943333, w * 0.3366667, h * 0.3640000, w * 0.3636667, h * 0.3396667)
      ..cubicTo(
          w * 0.3906667, h * 0.3153333, w * 0.4226667, h * 0.3030000, w * 0.4590000, h * 0.3030000)
      ..cubicTo(
          w * 0.4953333, h * 0.3030000, w * 0.5270000, h * 0.3153333, w * 0.5543333, h * 0.3396667)
      ..cubicTo(
          w * 0.5816667, h * 0.3640000, w * 0.5970000, h * 0.3943333, w * 0.6010000, h * 0.4303333)
      ..lineTo(w * 0.6036667, h * 0.4493333)
      ..cubicTo(
          w * 0.6036667, h * 0.4533333, w * 0.6056667, h * 0.4553333, w * 0.6093333, h * 0.4553333)
      ..lineTo(w * 0.6633333, h * 0.4553333)
      ..cubicTo(
          w * 0.6930000, h * 0.4553333, w * 0.7190000, h * 0.4660000, w * 0.7406667, h * 0.4873333)
      ..cubicTo(
          w * 0.7623333, h * 0.5086667, w * 0.7733333, h * 0.5340000, w * 0.7733333, h * 0.5633333)
      ..cubicTo(
          w * 0.7733333, h * 0.5923333, w * 0.7633333, h * 0.6173333, w * 0.7433333, h * 0.6386667)
      ..cubicTo(
          w * 0.7233333, h * 0.6600000, w * 0.6990000, h * 0.6713333, w * 0.6703333, h * 0.6730000)
      ..cubicTo(
          w * 0.6656667, h * 0.6730000, w * 0.6633333, h * 0.6750000, w * 0.6633333, h * 0.6786667)
      ..lineTo(w * 0.6633333, h * 0.7233333)
      ..cubicTo(
          w * 0.6633333, h * 0.7270000, w * 0.6656667, h * 0.7290000, w * 0.6703333, h * 0.7290000)
      ..cubicTo(
          w * 0.7146667, h * 0.7276667, w * 0.7523333, h * 0.7106667, w * 0.7830000, h * 0.6786667)
      ..cubicTo(
          w * 0.8140000, h * 0.6463333, w * 0.8293333, h * 0.6080000, w * 0.8293333, h * 0.5636667)
      ..cubicTo(
          w * 0.8293333, h * 0.5343333, w * 0.8216667, h * 0.5070000, w * 0.8066667, h * 0.4816667)
      ..cubicTo(
          w * 0.8336667, h * 0.4573333, w * 0.8510000, h * 0.4283333, w * 0.8593333, h * 0.3943333)
      ..lineTo(w * 0.8640000, h * 0.3703333)
      ..cubicTo(
          w * 0.8643333, h * 0.3700000, w * 0.8646667, h * 0.3693333, w * 0.8646667, h * 0.3680000)
      ..cubicTo(
          w * 0.8646667, h * 0.3656667, w * 0.8630000, h * 0.3636667, w * 0.8593333, h * 0.3626667)
      ..lineTo(w * 0.8406667, h * 0.3566667)
      ..cubicTo(
          w * 0.8216667, h * 0.3513333, w * 0.8053333, h * 0.3420000, w * 0.7920000, h * 0.3290000)
      ..cubicTo(
          w * 0.7783333, h * 0.3160000, w * 0.7686667, h * 0.3023333, w * 0.7630000, h * 0.2880000)
      ..cubicTo(
          w * 0.7573333, h * 0.2736667, w * 0.7543333, h * 0.2593333, w * 0.7543333, h * 0.2453333)
      ..cubicTo(
          w * 0.7536667, h * 0.2380000, w * 0.7546667, h * 0.2286667, w * 0.7570000, h * 0.2180000)
      ..lineTo(w * 0.7616667, h * 0.1976667)
      ..cubicTo(
          w * 0.7630000, h * 0.1943333, w * 0.7616667, h * 0.1916667, w * 0.7570000, h * 0.1896667)
      ..lineTo(w * 0.7306667, h * 0.1816667)
      ..cubicTo(
          w * 0.7156667, h * 0.1783333, w * 0.7016667, h * 0.1766667, w * 0.6883333, h * 0.1766667)
      ..cubicTo(
          w * 0.6756667, h * 0.1766667, w * 0.6630000, h * 0.1780000, w * 0.6503333, h * 0.1810000)
      ..cubicTo(
          w * 0.6373333, h * 0.1840000, w * 0.6240000, h * 0.1883333, w * 0.6103333, h * 0.1946667)
      ..cubicTo(
          w * 0.5966667, h * 0.2006667, w * 0.5833333, h * 0.2096667, w * 0.5703333, h * 0.2213333)
      ..cubicTo(
          w * 0.5573333, h * 0.2330000, w * 0.5463333, h * 0.2463333, w * 0.5370000, h * 0.2620000)
      ..cubicTo(
          w * 0.5096667, h * 0.2520000, w * 0.4836667, h * 0.2470000, w * 0.4593333, h * 0.2470000)
      ..cubicTo(
          w * 0.4123333, h * 0.2470000, w * 0.3703333, h * 0.2616667, w * 0.3340000, h * 0.2910000)
      ..cubicTo(
          w * 0.2976667, h * 0.3203333, w * 0.2740000, h * 0.3576667, w * 0.2636667, h * 0.4033333)
      ..cubicTo(
          w * 0.2266667, h * 0.4120000, w * 0.1963333, h * 0.4310000, w * 0.1723333, h * 0.4610000)
      ..cubicTo(
          w * 0.1476667, h * 0.4906667, w * 0.1356667, h * 0.5250000, w * 0.1356667, h * 0.5633333)
      ..close()
      ..moveTo(w * 0.3210000, h * 0.7913333)
      ..cubicTo(
          w * 0.3210000, h * 0.7970000, w * 0.3226667, h * 0.8023333, w * 0.3263333, h * 0.8076667)
      ..cubicTo(
          w * 0.3300000, h * 0.8130000, w * 0.3353333, h * 0.8166667, w * 0.3426667, h * 0.8186667)
      ..cubicTo(
          w * 0.3503333, h * 0.8210000, w * 0.3576667, h * 0.8203333, w * 0.3640000, h * 0.8173333)
      ..cubicTo(
          w * 0.3706667, h * 0.8140000, w * 0.3750000, h * 0.8080000, w * 0.3773333, h * 0.7986667)
      ..lineTo(w * 0.4250000, h * 0.6030000)
      ..cubicTo(
          w * 0.4270000, h * 0.5946667, w * 0.4260000, h * 0.5870000, w * 0.4223333, h * 0.5806667)
      ..cubicTo(
          w * 0.4183333, h * 0.5740000, w * 0.4126667, h * 0.5700000, w * 0.4050000, h * 0.5683333)
      ..cubicTo(
          w * 0.3976667, h * 0.5660000, w * 0.3906667, h * 0.5666667, w * 0.3840000, h * 0.5706667)
      ..cubicTo(
          w * 0.3773333, h * 0.5743333, w * 0.3726667, h * 0.5800000, w * 0.3703333, h * 0.5876667)
      ..lineTo(w * 0.3223333, h * 0.7843333)
      ..cubicTo(
          w * 0.3223333, h * 0.7846667, w * 0.3220000, h * 0.7856667, w * 0.3216667, h * 0.7873333)
      ..cubicTo(
          w * 0.3213333, h * 0.7890000, w * 0.3210000, h * 0.7903333, w * 0.3210000, h * 0.7913333)
      ..close()
      ..moveTo(w * 0.4080000, h * 0.8936667)
      ..cubicTo(
          w * 0.4080000, h * 0.8990000, w * 0.4096667, h * 0.9040000, w * 0.4130000, h * 0.9090000)
      ..cubicTo(
          w * 0.4163333, h * 0.9140000, w * 0.4213333, h * 0.9173333, w * 0.4280000, h * 0.9193333)
      ..cubicTo(
          w * 0.4316667, h * 0.9203333, w * 0.4343333, h * 0.9206667, w * 0.4360000, h * 0.9206667)
      ..cubicTo(
          w * 0.4506667, h * 0.9206667, w * 0.4596667, h * 0.9140000, w * 0.4633333, h * 0.9010000)
      ..lineTo(w * 0.5383333, h * 0.6033333)
      ..cubicTo(
          w * 0.5403333, h * 0.5953333, w * 0.5396667, h * 0.5880000, w * 0.5360000, h * 0.5816667)
      ..cubicTo(
          w * 0.5323333, h * 0.5753333, w * 0.5266667, h * 0.5710000, w * 0.5193333, h * 0.5686667)
      ..cubicTo(
          w * 0.5116667, h * 0.5663333, w * 0.5043333, h * 0.5670000, w * 0.4973333, h * 0.5710000)
      ..cubicTo(
          w * 0.4903333, h * 0.5750000, w * 0.4860000, h * 0.5803333, w * 0.4843333, h * 0.5876667)
      ..lineTo(w * 0.4090000, h * 0.8850000)
      ..cubicTo(
          w * 0.4090000, h * 0.8853333, w * 0.4090000, h * 0.8866667, w * 0.4086667, h * 0.8890000)
      ..cubicTo(
          w * 0.4080000, h * 0.8910000, w * 0.4080000, h * 0.8926667, w * 0.4080000, h * 0.8936667)
      ..close()
      ..moveTo(w * 0.5466667, h * 0.7940000)
      ..cubicTo(
          w * 0.5466667, h * 0.8060000, w * 0.5536667, h * 0.8140000, w * 0.5676667, h * 0.8186667)
      ..cubicTo(
          w * 0.5723333, h * 0.8200000, w * 0.5756667, h * 0.8206667, w * 0.5776667, h * 0.8206667)
      ..cubicTo(
          w * 0.5813333, h * 0.8206667, w * 0.5853333, h * 0.8200000, w * 0.5893333, h * 0.8183333)
      ..cubicTo(
          w * 0.5963333, h * 0.8156667, w * 0.6006667, h * 0.8090000, w * 0.6023333, h * 0.7990000)
      ..lineTo(w * 0.6500000, h * 0.6033333)
      ..cubicTo(
          w * 0.6520000, h * 0.5953333, w * 0.6513333, h * 0.5883333, w * 0.6473333, h * 0.5816667)
      ..cubicTo(
          w * 0.6436667, h * 0.5753333, w * 0.6380000, h * 0.5710000, w * 0.6303333, h * 0.5686667)
      ..cubicTo(
          w * 0.6226667, h * 0.5663333, w * 0.6153333, h * 0.5670000, w * 0.6083333, h * 0.5710000)
      ..cubicTo(
          w * 0.6013333, h * 0.5746667, w * 0.5973333, h * 0.5803333, w * 0.5956667, h * 0.5880000)
      ..lineTo(w * 0.5480000, h * 0.7846667)
      ..cubicTo(
          w * 0.5473333, h * 0.7900000, w * 0.5466667, h * 0.7933333, w * 0.5466667, h * 0.7940000)
      ..close()
      ..moveTo(w * 0.5860000, h * 0.2923333)
      ..cubicTo(
          w * 0.5966667, h * 0.2730000, w * 0.6110000, h * 0.2583333, w * 0.6296667, h * 0.2480000)
      ..cubicTo(
          w * 0.6480000, h * 0.2380000, w * 0.6676667, h * 0.2330000, w * 0.6883333, h * 0.2333333)
      ..cubicTo(
          w * 0.6923333, h * 0.2333333, w * 0.6953333, h * 0.2333333, w * 0.6973333, h * 0.2336667)
      ..lineTo(w * 0.6973333, h * 0.2436667)
      ..cubicTo(
          w * 0.6970000, h * 0.2760000, w * 0.7053333, h * 0.3063333, w * 0.7230000, h * 0.3353333)
      ..cubicTo(
          w * 0.7403333, h * 0.3640000, w * 0.7650000, h * 0.3860000, w * 0.7966667, h * 0.4010000)
      ..cubicTo(
          w * 0.7893333, h * 0.4163333, w * 0.7803333, h * 0.4280000, w * 0.7703333, h * 0.4366667)
      ..cubicTo(
          w * 0.7396667, h * 0.4113333, w * 0.7040000, h * 0.3990000, w * 0.6626667, h * 0.3990000)
      ..lineTo(w * 0.6523333, h * 0.3990000)
      ..cubicTo(
          w * 0.6433333, h * 0.3566667, w * 0.6213333, h * 0.3213333, w * 0.5860000, h * 0.2923333)
      ..close();
  }

  Path _nightRainMixPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1356667, h * 0.5643333)
      ..cubicTo(
          w * 0.1356667, h * 0.6086667, w * 0.1513333, h * 0.6466667, w * 0.1823333, h * 0.6786667)
      ..cubicTo(
          w * 0.2133333, h * 0.7106667, w * 0.2513333, h * 0.7276667, w * 0.2956667, h * 0.7290000)
      ..cubicTo(
          w * 0.2996667, h * 0.7290000, w * 0.3016667, h * 0.7270000, w * 0.3016667, h * 0.7233333)
      ..lineTo(w * 0.3016667, h * 0.6786667)
      ..cubicTo(
          w * 0.3016667, h * 0.6750000, w * 0.2996667, h * 0.6730000, w * 0.2956667, h * 0.6730000)
      ..cubicTo(
          w * 0.2673333, h * 0.6716667, w * 0.2430000, h * 0.6600000, w * 0.2230000, h * 0.6386667)
      ..cubicTo(
          w * 0.2030000, h * 0.6173333, w * 0.1926667, h * 0.5923333, w * 0.1926667, h * 0.5643333)
      ..cubicTo(
          w * 0.1926667, h * 0.5360000, w * 0.2020000, h * 0.5113333, w * 0.2210000, h * 0.4906667)
      ..cubicTo(
          w * 0.2400000, h * 0.4700000, w * 0.2633333, h * 0.4583333, w * 0.2910000, h * 0.4560000)
      ..lineTo(w * 0.3086667, h * 0.4536667)
      ..cubicTo(
          w * 0.3130000, h * 0.4536667, w * 0.3153333, h * 0.4516667, w * 0.3153333, h * 0.4476667)
      ..lineTo(w * 0.3176667, h * 0.4306667)
      ..cubicTo(
          w * 0.3213333, h * 0.3940000, w * 0.3363333, h * 0.3633333, w * 0.3633333, h * 0.3390000)
      ..cubicTo(
          w * 0.3903333, h * 0.3146667, w * 0.4220000, h * 0.3023333, w * 0.4586667, h * 0.3023333)
      ..cubicTo(
          w * 0.4950000, h * 0.3023333, w * 0.5266667, h * 0.3146667, w * 0.5540000, h * 0.3390000)
      ..cubicTo(
          w * 0.5813333, h * 0.3633333, w * 0.5970000, h * 0.3936667, w * 0.6006667, h * 0.4296667)
      ..lineTo(w * 0.6030000, h * 0.4486667)
      ..cubicTo(
          w * 0.6030000, h * 0.4526667, w * 0.6050000, h * 0.4550000, w * 0.6086667, h * 0.4550000)
      ..lineTo(w * 0.6626667, h * 0.4550000)
      ..cubicTo(
          w * 0.6930000, h * 0.4550000, w * 0.7186667, h * 0.4656667, w * 0.7403333, h * 0.4873333)
      ..cubicTo(
          w * 0.7620000, h * 0.5086667, w * 0.7726667, h * 0.5343333, w * 0.7726667, h * 0.5643333)
      ..cubicTo(
          w * 0.7726667, h * 0.5826667, w * 0.7680000, h * 0.6000000, w * 0.7590000, h * 0.6163333)
      ..cubicTo(
          w * 0.7500000, h * 0.6326667, w * 0.7373333, h * 0.6460000, w * 0.7213333, h * 0.6563333)
      ..cubicTo(
          w * 0.7053333, h * 0.6666667, w * 0.6880000, h * 0.6723333, w * 0.6693333, h * 0.6733333)
      ..cubicTo(
          w * 0.6650000, h * 0.6733333, w * 0.6626667, h * 0.6753333, w * 0.6626667, h * 0.6790000)
      ..lineTo(w * 0.6626667, h * 0.7236667)
      ..cubicTo(
          w * 0.6626667, h * 0.7273333, w * 0.6650000, h * 0.7293333, w * 0.6693333, h * 0.7293333)
      ..cubicTo(
          w * 0.6986667, h * 0.7286667, w * 0.7256667, h * 0.7206667, w * 0.7500000, h * 0.7056667)
      ..cubicTo(
          w * 0.7743333, h * 0.6906667, w * 0.7936667, h * 0.6706667, w * 0.8076667, h * 0.6456667)
      ..cubicTo(
          w * 0.8216667, h * 0.6206667, w * 0.8286667, h * 0.5936667, w * 0.8286667, h * 0.5646667)
      ..cubicTo(
          w * 0.8286667, h * 0.5353333, w * 0.8210000, h * 0.5073333, w * 0.8060000, h * 0.4810000)
      ..cubicTo(
          w * 0.8336667, h * 0.4563333, w * 0.8513333, h * 0.4270000, w * 0.8586667, h * 0.3936667)
      ..lineTo(w * 0.8633333, h * 0.3710000)
      ..cubicTo(
          w * 0.8640000, h * 0.3703333, w * 0.8643333, h * 0.3696667, w * 0.8643333, h * 0.3686667)
      ..cubicTo(
          w * 0.8643333, h * 0.3666667, w * 0.8623333, h * 0.3650000, w * 0.8586667, h * 0.3633333)
      ..lineTo(w * 0.8403333, h * 0.3573333)
      ..cubicTo(
          w * 0.8213333, h * 0.3516667, w * 0.8046667, h * 0.3423333, w * 0.7913333, h * 0.3290000)
      ..cubicTo(
          w * 0.7776667, h * 0.3156667, w * 0.7680000, h * 0.3020000, w * 0.7623333, h * 0.2873333)
      ..cubicTo(
          w * 0.7566667, h * 0.2730000, w * 0.7536667, h * 0.2586667, w * 0.7536667, h * 0.2443333)
      ..cubicTo(
          w * 0.7530000, h * 0.2373333, w * 0.7540000, h * 0.2280000, w * 0.7566667, h * 0.2170000)
      ..lineTo(w * 0.7610000, h * 0.1976667)
      ..cubicTo(
          w * 0.7623333, h * 0.1943333, w * 0.7610000, h * 0.1916667, w * 0.7566667, h * 0.1900000)
      ..lineTo(w * 0.7300000, h * 0.1820000)
      ..cubicTo(
          w * 0.7163333, h * 0.1783333, w * 0.7020000, h * 0.1763333, w * 0.6870000, h * 0.1763333)
      ..cubicTo(
          w * 0.6750000, h * 0.1763333, w * 0.6623333, h * 0.1776667, w * 0.6496667, h * 0.1806667)
      ..cubicTo(
          w * 0.6370000, h * 0.1836667, w * 0.6236667, h * 0.1880000, w * 0.6100000, h * 0.1943333)
      ..cubicTo(
          w * 0.5963333, h * 0.2006667, w * 0.5830000, h * 0.2096667, w * 0.5700000, h * 0.2213333)
      ..cubicTo(
          w * 0.5570000, h * 0.2330000, w * 0.5460000, h * 0.2466667, w * 0.5366667, h * 0.2623333)
      ..cubicTo(
          w * 0.5096667, h * 0.2520000, w * 0.4833333, h * 0.2470000, w * 0.4583333, h * 0.2470000)
      ..cubicTo(
          w * 0.4113333, h * 0.2470000, w * 0.3693333, h * 0.2616667, w * 0.3330000, h * 0.2910000)
      ..cubicTo(
          w * 0.2966667, h * 0.3203333, w * 0.2730000, h * 0.3576667, w * 0.2626667, h * 0.4033333)
      ..cubicTo(
          w * 0.2253333, h * 0.4130000, w * 0.1946667, h * 0.4326667, w * 0.1710000, h * 0.4623333)
      ..cubicTo(
          w * 0.1473333, h * 0.4913333, w * 0.1356667, h * 0.5256667, w * 0.1356667, h * 0.5643333)
      ..close()
      ..moveTo(w * 0.3160000, h * 0.7993333)
      ..cubicTo(
          w * 0.3160000, h * 0.8050000, w * 0.3176667, h * 0.8106667, w * 0.3213333, h * 0.8163333)
      ..cubicTo(
          w * 0.3250000, h * 0.8220000, w * 0.3303333, h * 0.8256667, w * 0.3370000, h * 0.8280000)
      ..cubicTo(
          w * 0.3446667, h * 0.8303333, w * 0.3516667, h * 0.8300000, w * 0.3583333, h * 0.8266667)
      ..cubicTo(
          w * 0.3650000, h * 0.8233333, w * 0.3690000, h * 0.8173333, w * 0.3713333, h * 0.8080000)
      ..lineTo(w * 0.3760000, h * 0.7876667)
      ..cubicTo(
          w * 0.3776667, h * 0.7800000, w * 0.3766667, h * 0.7730000, w * 0.3730000, h * 0.7666667)
      ..cubicTo(
          w * 0.3693333, h * 0.7600000, w * 0.3636667, h * 0.7556667, w * 0.3556667, h * 0.7533333)
      ..cubicTo(
          w * 0.3480000, h * 0.7510000, w * 0.3410000, h * 0.7520000, w * 0.3343333, h * 0.7560000)
      ..cubicTo(
          w * 0.3276667, h * 0.7600000, w * 0.3230000, h * 0.7660000, w * 0.3210000, h * 0.7736667)
      ..lineTo(w * 0.3166667, h * 0.7930000)
      ..cubicTo(
          w * 0.3160000, h * 0.7943333, w * 0.3160000, h * 0.7963333, w * 0.3160000, h * 0.7993333)
      ..close()
      ..moveTo(w * 0.3413333, h * 0.7026667)
      ..cubicTo(
          w * 0.3413333, h * 0.7096667, w * 0.3440000, h * 0.7160000, w * 0.3496667, h * 0.7216667)
      ..cubicTo(
          w * 0.3550000, h * 0.7273333, w * 0.3610000, h * 0.7300000, w * 0.3683333, h * 0.7300000)
      ..cubicTo(
          w * 0.3763333, h * 0.7300000, w * 0.3830000, h * 0.7273333, w * 0.3883333, h * 0.7220000)
      ..cubicTo(
          w * 0.3936667, h * 0.7166667, w * 0.3963333, h * 0.7103333, w * 0.3963333, h * 0.7023333)
      ..cubicTo(
          w * 0.3963333, h * 0.6946667, w * 0.3936667, h * 0.6880000, w * 0.3883333, h * 0.6826667)
      ..cubicTo(
          w * 0.3830000, h * 0.6773333, w * 0.3763333, h * 0.6746667, w * 0.3683333, h * 0.6746667)
      ..cubicTo(
          w * 0.3606667, h * 0.6746667, w * 0.3540000, h * 0.6773333, w * 0.3490000, h * 0.6823333)
      ..cubicTo(
          w * 0.3440000, h * 0.6873333, w * 0.3413333, h * 0.6950000, w * 0.3413333, h * 0.7026667)
      ..close()
      ..moveTo(w * 0.3616667, h * 0.6270000)
      ..cubicTo(
          w * 0.3613333, h * 0.6323333, w * 0.3626667, h * 0.6373333, w * 0.3663333, h * 0.6420000)
      ..cubicTo(
          w * 0.3696667, h * 0.6470000, w * 0.3750000, h * 0.6503333, w * 0.3823333, h * 0.6526667)
      ..cubicTo(
          w * 0.3893333, h * 0.6546667, w * 0.3960000, h * 0.6540000, w * 0.4030000, h * 0.6503333)
      ..cubicTo(
          w * 0.4100000, h * 0.6466667, w * 0.4143333, h * 0.6410000, w * 0.4166667, h * 0.6333333)
      ..lineTo(w * 0.4260000, h * 0.6033333)
      ..cubicTo(
          w * 0.4283333, h * 0.5953333, w * 0.4276667, h * 0.5880000, w * 0.4236667, h * 0.5816667)
      ..cubicTo(
          w * 0.4196667, h * 0.5753333, w * 0.4136667, h * 0.5710000, w * 0.4056667, h * 0.5686667)
      ..cubicTo(
          w * 0.3983333, h * 0.5663333, w * 0.3913333, h * 0.5670000, w * 0.3846667, h * 0.5710000)
      ..cubicTo(
          w * 0.3780000, h * 0.5746667, w * 0.3733333, h * 0.5803333, w * 0.3710000, h * 0.5876667)
      ..lineTo(w * 0.3630000, h * 0.6183333)
      ..cubicTo(
          w * 0.3630000, h * 0.6190000, w * 0.3626667, h * 0.6203333, w * 0.3623333, h * 0.6223333)
      ..cubicTo(
          w * 0.3616667, h * 0.6240000, w * 0.3616667, h * 0.6256667, w * 0.3616667, h * 0.6270000)
      ..close()
      ..moveTo(w * 0.4003333, h * 0.9033333)
      ..cubicTo(
          w * 0.4003333, h * 0.9093333, w * 0.4020000, h * 0.9146667, w * 0.4053333, h * 0.9200000)
      ..cubicTo(
          w * 0.4086667, h * 0.9253333, w * 0.4140000, h * 0.9290000, w * 0.4213333, h * 0.9310000)
      ..cubicTo(
          w * 0.4240000, h * 0.9316667, w * 0.4270000, h * 0.9320000, w * 0.4296667, h * 0.9320000)
      ..cubicTo(
          w * 0.4440000, h * 0.9320000, w * 0.4526667, h * 0.9253333, w * 0.4560000, h * 0.9116667)
      ..lineTo(w * 0.4606667, h * 0.8920000)
      ..cubicTo(
          w * 0.4626667, h * 0.8833333, w * 0.4616667, h * 0.8760000, w * 0.4580000, h * 0.8693333)
      ..cubicTo(
          w * 0.4543333, h * 0.8626667, w * 0.4483333, h * 0.8586667, w * 0.4406667, h * 0.8570000)
      ..cubicTo(
          w * 0.4336667, h * 0.8546667, w * 0.4266667, h * 0.8553333, w * 0.4196667, h * 0.8593333)
      ..cubicTo(
          w * 0.4126667, h * 0.8633333, w * 0.4083333, h * 0.8690000, w * 0.4060000, h * 0.8763333)
      ..lineTo(w * 0.4013333, h * 0.8960000)
      ..cubicTo(
          w * 0.4006667, h * 0.8990000, w * 0.4003333, h * 0.9013333, w * 0.4003333, h * 0.9033333)
      ..close()
      ..moveTo(w * 0.4263333, h * 0.8066667)
      ..cubicTo(
          w * 0.4263333, h * 0.8140000, w * 0.4290000, h * 0.8203333, w * 0.4346667, h * 0.8260000)
      ..cubicTo(
          w * 0.4400000, h * 0.8313333, w * 0.4463333, h * 0.8340000, w * 0.4536667, h * 0.8340000)
      ..cubicTo(
          w * 0.4616667, h * 0.8340000, w * 0.4680000, h * 0.8313333, w * 0.4733333, h * 0.8263333)
      ..cubicTo(
          w * 0.4786667, h * 0.8210000, w * 0.4810000, h * 0.8146667, w * 0.4810000, h * 0.8066667)
      ..cubicTo(
          w * 0.4810000, h * 0.7990000, w * 0.4783333, h * 0.7926667, w * 0.4733333, h * 0.7873333)
      ..cubicTo(
          w * 0.4683333, h * 0.7820000, w * 0.4616667, h * 0.7796667, w * 0.4536667, h * 0.7796667)
      ..cubicTo(
          w * 0.4456667, h * 0.7796667, w * 0.4393333, h * 0.7823333, w * 0.4340000, h * 0.7873333)
      ..cubicTo(
          w * 0.4290000, h * 0.7923333, w * 0.4263333, h * 0.7990000, w * 0.4263333, h * 0.8066667)
      ..close()
      ..moveTo(w * 0.4473333, h * 0.7310000)
      ..cubicTo(
          w * 0.4470000, h * 0.7360000, w * 0.4483333, h * 0.7413333, w * 0.4516667, h * 0.7466667)
      ..cubicTo(
          w * 0.4550000, h * 0.7520000, w * 0.4600000, h * 0.7553333, w * 0.4666667, h * 0.7566667)
      ..cubicTo(
          w * 0.4743333, h * 0.7586667, w * 0.4813333, h * 0.7580000, w * 0.4880000, h * 0.7546667)
      ..cubicTo(
          w * 0.4943333, h * 0.7513333, w * 0.4990000, h * 0.7450000, w * 0.5016667, h * 0.7360000)
      ..lineTo(w * 0.5106667, h * 0.7060000)
      ..cubicTo(
          w * 0.5130000, h * 0.6986667, w * 0.5123333, h * 0.6916667, w * 0.5083333, h * 0.6850000)
      ..cubicTo(
          w * 0.5043333, h * 0.6783333, w * 0.4986667, h * 0.6740000, w * 0.4906667, h * 0.6716667)
      ..cubicTo(
          w * 0.4833333, h * 0.6693333, w * 0.4763333, h * 0.6703333, w * 0.4693333, h * 0.6743333)
      ..cubicTo(
          w * 0.4623333, h * 0.6783333, w * 0.4580000, h * 0.6843333, w * 0.4556667, h * 0.6920000)
      ..lineTo(w * 0.4483333, h * 0.7220000)
      ..cubicTo(
          w * 0.4476667, h * 0.7246667, w * 0.4473333, h * 0.7276667, w * 0.4473333, h * 0.7310000)
      ..close()
      ..moveTo(w * 0.5390000, h * 0.8026667)
      ..cubicTo(
          w * 0.5390000, h * 0.8080000, w * 0.5406667, h * 0.8133333, w * 0.5440000, h * 0.8186667)
      ..cubicTo(
          w * 0.5473333, h * 0.8240000, w * 0.5526667, h * 0.8276667, w * 0.5593333, h * 0.8296667)
      ..cubicTo(
          w * 0.5603333, h * 0.8296667, w * 0.5620000, h * 0.8300000, w * 0.5640000, h * 0.8303333)
      ..cubicTo(
          w * 0.5660000, h * 0.8306667, w * 0.5673333, h * 0.8310000, w * 0.5686667, h * 0.8310000)
      ..cubicTo(
          w * 0.5823333, h * 0.8310000, w * 0.5906667, h * 0.8236667, w * 0.5940000, h * 0.8090000)
      ..lineTo(w * 0.5986667, h * 0.7890000)
      ..cubicTo(
          w * 0.6010000, h * 0.7820000, w * 0.6003333, h * 0.7750000, w * 0.5963333, h * 0.7680000)
      ..cubicTo(
          w * 0.5926667, h * 0.7610000, w * 0.5870000, h * 0.7566667, w * 0.5793333, h * 0.7543333)
      ..cubicTo(
          w * 0.5710000, h * 0.7523333, w * 0.5633333, h * 0.7530000, w * 0.5566667, h * 0.7570000)
      ..cubicTo(
          w * 0.5500000, h * 0.7610000, w * 0.5453333, h * 0.7666667, w * 0.5430000, h * 0.7746667)
      ..lineTo(w * 0.5400000, h * 0.7943333)
      ..cubicTo(
          w * 0.5400000, h * 0.7950000, w * 0.5396667, h * 0.7966667, w * 0.5393333, h * 0.7983333)
      ..cubicTo(
          w * 0.5393333, h * 0.8000000, w * 0.5390000, h * 0.8013333, w * 0.5390000, h * 0.8026667)
      ..close()
      ..moveTo(w * 0.5636667, h * 0.7040000)
      ..cubicTo(
          w * 0.5636667, h * 0.7113333, w * 0.5663333, h * 0.7180000, w * 0.5720000, h * 0.7230000)
      ..cubicTo(
          w * 0.5770000, h * 0.7283333, w * 0.5833333, h * 0.7310000, w * 0.5910000, h * 0.7310000)
      ..cubicTo(
          w * 0.5990000, h * 0.7310000, w * 0.6053333, h * 0.7283333, w * 0.6106667, h * 0.7233333)
      ..cubicTo(
          w * 0.6160000, h * 0.7183333, w * 0.6183333, h * 0.7116667, w * 0.6183333, h * 0.7040000)
      ..cubicTo(
          w * 0.6183333, h * 0.6960000, w * 0.6156667, h * 0.6896667, w * 0.6106667, h * 0.6843333)
      ..cubicTo(
          w * 0.6056667, h * 0.6790000, w * 0.5990000, h * 0.6766667, w * 0.5910000, h * 0.6766667)
      ..cubicTo(
          w * 0.5830000, h * 0.6766667, w * 0.5766667, h * 0.6793333, w * 0.5713333, h * 0.6843333)
      ..cubicTo(
          w * 0.5660000, h * 0.6893333, w * 0.5636667, h * 0.6960000, w * 0.5636667, h * 0.7040000)
      ..close()
      ..moveTo(w * 0.5840000, h * 0.6270000)
      ..cubicTo(
          w * 0.5840000, h * 0.6326667, w * 0.5856667, h * 0.6380000, w * 0.5893333, h * 0.6430000)
      ..cubicTo(
          w * 0.5930000, h * 0.6480000, w * 0.5983333, h * 0.6516667, w * 0.6056667, h * 0.6536667)
      ..cubicTo(
          w * 0.6063333, h * 0.6536667, w * 0.6076667, h * 0.6540000, w * 0.6096667, h * 0.6543333)
      ..cubicTo(
          w * 0.6116667, h * 0.6546667, w * 0.6133333, h * 0.6550000, w * 0.6143333, h * 0.6550000)
      ..cubicTo(
          w * 0.6176667, h * 0.6550000, w * 0.6216667, h * 0.6540000, w * 0.6263333, h * 0.6520000)
      ..cubicTo(
          w * 0.6333333, h * 0.6483333, w * 0.6380000, h * 0.6423333, w * 0.6400000, h * 0.6346667)
      ..lineTo(w * 0.6480000, h * 0.6046667)
      ..cubicTo(
          w * 0.6500000, h * 0.5970000, w * 0.6493333, h * 0.5900000, w * 0.6453333, h * 0.5836667)
      ..cubicTo(
          w * 0.6416667, h * 0.5770000, w * 0.6360000, h * 0.5726667, w * 0.6283333, h * 0.5703333)
      ..cubicTo(
          w * 0.6206667, h * 0.5680000, w * 0.6136667, h * 0.5686667, w * 0.6070000, h * 0.5723333)
      ..cubicTo(
          w * 0.6003333, h * 0.5760000, w * 0.5963333, h * 0.5813333, w * 0.5940000, h * 0.5893333)
      ..lineTo(w * 0.5846667, h * 0.6196667)
      ..cubicTo(
          w * 0.5846667, h * 0.6203333, w * 0.5843333, h * 0.6216667, w * 0.5840000, h * 0.6236667)
      ..cubicTo(
          w * 0.5843333, h * 0.6246667, w * 0.5840000, h * 0.6260000, w * 0.5840000, h * 0.6270000)
      ..close()
      ..moveTo(w * 0.5863333, h * 0.2920000)
      ..cubicTo(
          w * 0.5970000, h * 0.2726667, w * 0.6116667, h * 0.2580000, w * 0.6300000, h * 0.2473333)
      ..cubicTo(
          w * 0.6486667, h * 0.2366667, w * 0.6676667, h * 0.2316667, w * 0.6876667, h * 0.2320000)
      ..cubicTo(
          w * 0.6906667, h * 0.2320000, w * 0.6940000, h * 0.2323333, w * 0.6976667, h * 0.2330000)
      ..lineTo(w * 0.6976667, h * 0.2433333)
      ..cubicTo(
          w * 0.6973333, h * 0.2760000, w * 0.7060000, h * 0.3066667, w * 0.7233333, h * 0.3353333)
      ..cubicTo(
          w * 0.7410000, h * 0.3640000, w * 0.7656667, h * 0.3853333, w * 0.7973333, h * 0.4000000)
      ..cubicTo(
          w * 0.7910000, h * 0.4136667, w * 0.7820000, h * 0.4260000, w * 0.7706667, h * 0.4370000)
      ..cubicTo(
          w * 0.7400000, h * 0.4116667, w * 0.7040000, h * 0.3990000, w * 0.6630000, h * 0.3990000)
      ..lineTo(w * 0.6526667, h * 0.3990000)
      ..cubicTo(
          w * 0.6423333, h * 0.3553333, w * 0.6203333, h * 0.3196667, w * 0.5863333, h * 0.2920000)
      ..close();
  }

  Path _nightShowersPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1356667, h * 0.5636667)
      ..cubicTo(
          w * 0.1356667, h * 0.6080000, w * 0.1510000, h * 0.6463333, w * 0.1820000, h * 0.6780000)
      ..cubicTo(
          w * 0.2130000, h * 0.7096667, w * 0.2506667, h * 0.7270000, w * 0.2953333, h * 0.7290000)
      ..cubicTo(
          w * 0.2990000, h * 0.7290000, w * 0.3010000, h * 0.7270000, w * 0.3010000, h * 0.7233333)
      ..lineTo(w * 0.3010000, h * 0.6776667)
      ..cubicTo(
          w * 0.3010000, h * 0.6736667, w * 0.2990000, h * 0.6716667, w * 0.2953333, h * 0.6716667)
      ..cubicTo(
          w * 0.2663333, h * 0.6693333, w * 0.2420000, h * 0.6580000, w * 0.2223333, h * 0.6370000)
      ..cubicTo(
          w * 0.2026667, h * 0.6163333, w * 0.1926667, h * 0.5916667, w * 0.1926667, h * 0.5633333)
      ..cubicTo(
          w * 0.1926667, h * 0.5356667, w * 0.2020000, h * 0.5120000, w * 0.2206667, h * 0.4913333)
      ..cubicTo(
          w * 0.2393333, h * 0.4706667, w * 0.2626667, h * 0.4590000, w * 0.2906667, h * 0.4556667)
      ..lineTo(w * 0.3083333, h * 0.4533333)
      ..cubicTo(
          w * 0.3126667, h * 0.4533333, w * 0.3150000, h * 0.4513333, w * 0.3150000, h * 0.4476667)
      ..lineTo(w * 0.3173333, h * 0.4303333)
      ..cubicTo(
          w * 0.3210000, h * 0.3943333, w * 0.3360000, h * 0.3640000, w * 0.3630000, h * 0.3400000)
      ..cubicTo(
          w * 0.3900000, h * 0.3156667, w * 0.4216667, h * 0.3036667, w * 0.4580000, h * 0.3036667)
      ..cubicTo(
          w * 0.4943333, h * 0.3036667, w * 0.5260000, h * 0.3156667, w * 0.5530000, h * 0.3400000)
      ..cubicTo(
          w * 0.5800000, h * 0.3640000, w * 0.5956667, h * 0.3943333, w * 0.5993333, h * 0.4306667)
      ..lineTo(w * 0.6020000, h * 0.4500000)
      ..cubicTo(
          w * 0.6020000, h * 0.4540000, w * 0.6040000, h * 0.4560000, w * 0.6080000, h * 0.4560000)
      ..lineTo(w * 0.6616667, h * 0.4560000)
      ..cubicTo(
          w * 0.6916667, h * 0.4560000, w * 0.7173333, h * 0.4666667, w * 0.7390000, h * 0.4876667)
      ..cubicTo(
          w * 0.7603333, h * 0.5086667, w * 0.7713333, h * 0.5340000, w * 0.7713333, h * 0.5636667)
      ..cubicTo(
          w * 0.7713333, h * 0.5920000, w * 0.7613333, h * 0.6166667, w * 0.7416667, h * 0.6373333)
      ..cubicTo(
          w * 0.7220000, h * 0.6580000, w * 0.6973333, h * 0.6696667, w * 0.6686667, h * 0.6720000)
      ..cubicTo(
          w * 0.6643333, h * 0.6720000, w * 0.6620000, h * 0.6740000, w * 0.6620000, h * 0.6780000)
      ..lineTo(w * 0.6620000, h * 0.7236667)
      ..cubicTo(
          w * 0.6620000, h * 0.7273333, w * 0.6643333, h * 0.7293333, w * 0.6686667, h * 0.7293333)
      ..cubicTo(
          w * 0.7130000, h * 0.7280000, w * 0.7506667, h * 0.7110000, w * 0.7813333, h * 0.6790000)
      ..cubicTo(
          w * 0.8120000, h * 0.6470000, w * 0.8273333, h * 0.6086667, w * 0.8273333, h * 0.5640000)
      ..cubicTo(
          w * 0.8273333, h * 0.5350000, w * 0.8200000, h * 0.5080000, w * 0.8056667, h * 0.4830000)
      ..cubicTo(
          w * 0.8326667, h * 0.4586667, w * 0.8503333, h * 0.4296667, w * 0.8583333, h * 0.3956667)
      ..lineTo(w * 0.8583333, h * 0.3913333)
      ..lineTo(w * 0.8646667, h * 0.3650000)
      ..lineTo(w * 0.8393333, h * 0.3580000)
      ..cubicTo(
          w * 0.8123333, h * 0.3500000, w * 0.7913333, h * 0.3346667, w * 0.7763333, h * 0.3130000)
      ..cubicTo(
          w * 0.7613333, h * 0.2910000, w * 0.7540000, h * 0.2683333, w * 0.7540000, h * 0.2453333)
      ..cubicTo(
          w * 0.7540000, h * 0.2366667, w * 0.7550000, h * 0.2280000, w * 0.7566667, h * 0.2193333)
      ..lineTo(w * 0.7633333, h * 0.1926667)
      ..lineTo(w * 0.7350000, h * 0.1843333)
      ..lineTo(w * 0.7300000, h * 0.1830000)
      ..cubicTo(
          w * 0.7143333, h * 0.1800000, w * 0.7006667, h * 0.1783333, w * 0.6883333, h * 0.1783333)
      ..cubicTo(
          w * 0.6756667, h * 0.1783333, w * 0.6630000, h * 0.1796667, w * 0.6503333, h * 0.1826667)
      ..cubicTo(
          w * 0.6373333, h * 0.1856667, w * 0.6240000, h * 0.1900000, w * 0.6103333, h * 0.1963333)
      ..cubicTo(
          w * 0.5963333, h * 0.2026667, w * 0.5830000, h * 0.2113333, w * 0.5703333, h * 0.2230000)
      ..cubicTo(
          w * 0.5576667, h * 0.2346667, w * 0.5463333, h * 0.2483333, w * 0.5370000, h * 0.2640000)
      ..cubicTo(
          w * 0.5123333, h * 0.2530000, w * 0.4860000, h * 0.2476667, w * 0.4583333, h * 0.2476667)
      ..cubicTo(
          w * 0.4113333, h * 0.2476667, w * 0.3696667, h * 0.2623333, w * 0.3333333, h * 0.2913333)
      ..cubicTo(
          w * 0.2970000, h * 0.3203333, w * 0.2743333, h * 0.3576667, w * 0.2643333, h * 0.4033333)
      ..cubicTo(
          w * 0.2270000, h * 0.4120000, w * 0.1960000, h * 0.4310000, w * 0.1720000, h * 0.4606667)
      ..cubicTo(
          w * 0.1476667, h * 0.4910000, w * 0.1356667, h * 0.5253333, w * 0.1356667, h * 0.5636667)
      ..close()
      ..moveTo(w * 0.3156667, h * 0.7893333)
      ..cubicTo(
          w * 0.3156667, h * 0.7943333, w * 0.3173333, h * 0.7993333, w * 0.3206667, h * 0.8043333)
      ..cubicTo(
          w * 0.3240000, h * 0.8093333, w * 0.3290000, h * 0.8130000, w * 0.3356667, h * 0.8153333)
      ..cubicTo(
          w * 0.3430000, h * 0.8176667, w * 0.3500000, h * 0.8173333, w * 0.3570000, h * 0.8136667)
      ..cubicTo(
          w * 0.3640000, h * 0.8100000, w * 0.3683333, h * 0.8043333, w * 0.3706667, h * 0.7966667)
      ..lineTo(w * 0.3800000, h * 0.7613333)
      ..cubicTo(
          w * 0.3823333, h * 0.7543333, w * 0.3816667, h * 0.7476667, w * 0.3776667, h * 0.7406667)
      ..cubicTo(
          w * 0.3736667, h * 0.7336667, w * 0.3680000, h * 0.7293333, w * 0.3606667, h * 0.7270000)
      ..cubicTo(
          w * 0.3530000, h * 0.7250000, w * 0.3456667, h * 0.7260000, w * 0.3390000, h * 0.7296667)
      ..cubicTo(
          w * 0.3323333, h * 0.7333333, w * 0.3276667, h * 0.7396667, w * 0.3250000, h * 0.7473333)
      ..lineTo(w * 0.3173333, h * 0.7803333)
      ..cubicTo(
          w * 0.3163333, h * 0.7856667, w * 0.3156667, h * 0.7886667, w * 0.3156667, h * 0.7893333)
      ..close()
      ..moveTo(w * 0.3590000, h * 0.6316667)
      ..cubicTo(
          w * 0.3590000, h * 0.6353333, w * 0.3600000, h * 0.6393333, w * 0.3623333, h * 0.6436667)
      ..cubicTo(
          w * 0.3646667, h * 0.6493333, w * 0.3706667, h * 0.6536667, w * 0.3800000, h * 0.6563333)
      ..cubicTo(
          w * 0.3880000, h * 0.6583333, w * 0.3953333, h * 0.6576667, w * 0.4020000, h * 0.6543333)
      ..cubicTo(
          w * 0.4083333, h * 0.6510000, w * 0.4130000, h * 0.6450000, w * 0.4153333, h * 0.6370000)
      ..lineTo(w * 0.4246667, h * 0.6026667)
      ..cubicTo(
          w * 0.4270000, h * 0.5950000, w * 0.4263333, h * 0.5876667, w * 0.4223333, h * 0.5813333)
      ..cubicTo(
          w * 0.4183333, h * 0.5746667, w * 0.4126667, h * 0.5703333, w * 0.4053333, h * 0.5683333)
      ..cubicTo(
          w * 0.3973333, h * 0.5663333, w * 0.3896667, h * 0.5670000, w * 0.3830000, h * 0.5706667)
      ..cubicTo(
          w * 0.3763333, h * 0.5743333, w * 0.3720000, h * 0.5800000, w * 0.3696667, h * 0.5880000)
      ..lineTo(w * 0.3606667, h * 0.6216667)
      ..cubicTo(
          w * 0.3596667, h * 0.6260000, w * 0.3590000, h * 0.6293333, w * 0.3590000, h * 0.6316667)
      ..close()
      ..moveTo(w * 0.4006667, h * 0.8933333)
      ..cubicTo(
          w * 0.4006667, h * 0.8990000, w * 0.4023333, h * 0.9043333, w * 0.4056667, h * 0.9096667)
      ..cubicTo(
          w * 0.4090000, h * 0.9150000, w * 0.4140000, h * 0.9186667, w * 0.4206667, h * 0.9206667)
      ..cubicTo(
          w * 0.4243333, h * 0.9216667, w * 0.4266667, h * 0.9223333, w * 0.4283333, h * 0.9223333)
      ..cubicTo(
          w * 0.4313333, h * 0.9223333, w * 0.4353333, h * 0.9213333, w * 0.4410000, h * 0.9190000)
      ..cubicTo(
          w * 0.4476667, h * 0.9163333, w * 0.4523333, h * 0.9100000, w * 0.4553333, h * 0.9006667)
      ..lineTo(w * 0.4653333, h * 0.8656667)
      ..cubicTo(
          w * 0.4676667, h * 0.8586667, w * 0.4670000, h * 0.8516667, w * 0.4630000, h * 0.8446667)
      ..cubicTo(
          w * 0.4590000, h * 0.8376667, w * 0.4533333, h * 0.8333333, w * 0.4460000, h * 0.8310000)
      ..cubicTo(
          w * 0.4380000, h * 0.8290000, w * 0.4303333, h * 0.8296667, w * 0.4236667, h * 0.8336667)
      ..cubicTo(
          w * 0.4170000, h * 0.8376667, w * 0.4123333, h * 0.8433333, w * 0.4100000, h * 0.8513333)
      ..lineTo(w * 0.4016667, h * 0.8850000)
      ..cubicTo(
          w * 0.4010000, h * 0.8876667, w * 0.4006667, h * 0.8906667, w * 0.4006667, h * 0.8933333)
      ..close()
      ..moveTo(w * 0.4450000, h * 0.7343333)
      ..cubicTo(
          w * 0.4450000, h * 0.7393333, w * 0.4466667, h * 0.7443333, w * 0.4500000, h * 0.7493333)
      ..cubicTo(
          w * 0.4533333, h * 0.7543333, w * 0.4583333, h * 0.7580000, w * 0.4653333, h * 0.7603333)
      ..cubicTo(
          w * 0.4726667, h * 0.7626667, w * 0.4800000, h * 0.7620000, w * 0.4866667, h * 0.7583333)
      ..cubicTo(
          w * 0.4933333, h * 0.7546667, w * 0.4976667, h * 0.7490000, w * 0.5000000, h * 0.7410000)
      ..lineTo(w * 0.5090000, h * 0.7063333)
      ..cubicTo(
          w * 0.5113333, h * 0.6993333, w * 0.5106667, h * 0.6923333, w * 0.5070000, h * 0.6856667)
      ..cubicTo(
          w * 0.5033333, h * 0.6790000, w * 0.4980000, h * 0.6743333, w * 0.4906667, h * 0.6720000)
      ..cubicTo(
          w * 0.4826667, h * 0.6700000, w * 0.4750000, h * 0.6710000, w * 0.4680000, h * 0.6746667)
      ..cubicTo(
          w * 0.4610000, h * 0.6783333, w * 0.4563333, h * 0.6846667, w * 0.4540000, h * 0.6923333)
      ..lineTo(w * 0.4460000, h * 0.7256667)
      ..lineTo(w * 0.4450000, h * 0.7343333)
      ..close()
      ..moveTo(w * 0.5386667, h * 0.7930000)
      ..cubicTo(
          w * 0.5386667, h * 0.8056667, w * 0.5456667, h * 0.8136667, w * 0.5600000, h * 0.8180000)
      ..cubicTo(
          w * 0.5630000, h * 0.8186667, w * 0.5656667, h * 0.8190000, w * 0.5680000, h * 0.8190000)
      ..cubicTo(
          w * 0.5730000, h * 0.8190000, w * 0.5770000, h * 0.8183333, w * 0.5803333, h * 0.8166667)
      ..cubicTo(
          w * 0.5873333, h * 0.8140000, w * 0.5923333, h * 0.8076667, w * 0.5950000, h * 0.7976667)
      ..lineTo(w * 0.6040000, h * 0.7636667)
      ..cubicTo(
          w * 0.6060000, h * 0.7553333, w * 0.6053333, h * 0.7480000, w * 0.6013333, h * 0.7413333)
      ..cubicTo(
          w * 0.5973333, h * 0.7346667, w * 0.5916667, h * 0.7306667, w * 0.5836667, h * 0.7290000)
      ..cubicTo(
          w * 0.5760000, h * 0.7266667, w * 0.5686667, h * 0.7273333, w * 0.5623333, h * 0.7313333)
      ..cubicTo(
          w * 0.5560000, h * 0.7353333, w * 0.5513333, h * 0.7410000, w * 0.5490000, h * 0.7483333)
      ..lineTo(w * 0.5400000, h * 0.7830000)
      ..cubicTo(
          w * 0.5400000, h * 0.7836667, w * 0.5396667, h * 0.7853333, w * 0.5393333, h * 0.7880000)
      ..cubicTo(
          w * 0.5386667, h * 0.7903333, w * 0.5386667, h * 0.7920000, w * 0.5386667, h * 0.7930000)
      ..close()
      ..moveTo(w * 0.5850000, h * 0.6326667)
      ..cubicTo(
          w * 0.5850000, h * 0.6380000, w * 0.5866667, h * 0.6430000, w * 0.5900000, h * 0.6480000)
      ..cubicTo(
          w * 0.5933333, h * 0.6530000, w * 0.5986667, h * 0.6566667, w * 0.6053333, h * 0.6586667)
      ..cubicTo(
          w * 0.6100000, h * 0.6596667, w * 0.6126667, h * 0.6603333, w * 0.6130000, h * 0.6603333)
      ..cubicTo(
          w * 0.6160000, h * 0.6603333, w * 0.6200000, h * 0.6593333, w * 0.6256667, h * 0.6570000)
      ..cubicTo(
          w * 0.6326667, h * 0.6543333, w * 0.6373333, h * 0.6480000, w * 0.6403333, h * 0.6386667)
      ..lineTo(w * 0.6496667, h * 0.6040000)
      ..cubicTo(
          w * 0.6516667, h * 0.5966667, w * 0.6506667, h * 0.5896667, w * 0.6470000, h * 0.5830000)
      ..cubicTo(
          w * 0.6433333, h * 0.5763333, w * 0.6370000, h * 0.5720000, w * 0.6293333, h * 0.5696667)
      ..cubicTo(
          w * 0.6220000, h * 0.5673333, w * 0.6150000, h * 0.5680000, w * 0.6083333, h * 0.5720000)
      ..cubicTo(
          w * 0.6016667, h * 0.5760000, w * 0.5973333, h * 0.5816667, w * 0.5950000, h * 0.5893333)
      ..lineTo(w * 0.5863333, h * 0.6246667)
      ..cubicTo(
          w * 0.5853333, h * 0.6276667, w * 0.5850000, h * 0.6306667, w * 0.5850000, h * 0.6326667)
      ..close()
      ..moveTo(w * 0.5860000, h * 0.2936667)
      ..cubicTo(
          w * 0.5966667, h * 0.2750000, w * 0.6113333, h * 0.2603333, w * 0.6303333, h * 0.2500000)
      ..cubicTo(
          w * 0.6493333, h * 0.2396667, w * 0.6693333, h * 0.2343333, w * 0.6906667, h * 0.2343333)
      ..lineTo(w * 0.6976667, h * 0.2343333)
      ..cubicTo(
          w * 0.6973333, h * 0.2373333, w * 0.6973333, h * 0.2413333, w * 0.6973333, h * 0.2470000)
      ..cubicTo(
          w * 0.6973333, h * 0.2786667, w * 0.7060000, h * 0.3086667, w * 0.7233333, h * 0.3373333)
      ..cubicTo(
          w * 0.7406667, h * 0.3660000, w * 0.7650000, h * 0.3876667, w * 0.7956667, h * 0.4026667)
      ..cubicTo(
          w * 0.7883333, h * 0.4170000, w * 0.7796667, h * 0.4293333, w * 0.7696667, h * 0.4393333)
      ..cubicTo(
          w * 0.7386667, h * 0.4123333, w * 0.7023333, h * 0.3990000, w * 0.6613333, h * 0.3990000)
      ..lineTo(w * 0.6506667, h * 0.3990000)
      ..cubicTo(
          w * 0.6423333, h * 0.3593333, w * 0.6210000, h * 0.3243333, w * 0.5860000, h * 0.2936667)
      ..close();
  }

  Path _nightSleetPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1363333, h * 0.5710000)
      ..lineTo(w * 0.1363333, h * 0.5586667)
      ..cubicTo(
          w * 0.1376667, h * 0.5213333, w * 0.1503333, h * 0.4883333, w * 0.1740000, h * 0.4596667)
      ..cubicTo(
          w * 0.1976667, h * 0.4310000, w * 0.2276667, h * 0.4123333, w * 0.2633333, h * 0.4040000)
      ..cubicTo(
          w * 0.2736667, h * 0.3586667, w * 0.2973333, h * 0.3213333, w * 0.3336667, h * 0.2920000)
      ..cubicTo(
          w * 0.3700000, h * 0.2626667, w * 0.4120000, h * 0.2483333, w * 0.4590000, h * 0.2483333)
      ..cubicTo(
          w * 0.4836667, h * 0.2483333, w * 0.5100000, h * 0.2533333, w * 0.5383333, h * 0.2636667)
      ..cubicTo(
          w * 0.5476667, h * 0.2483333, w * 0.5586667, h * 0.2350000, w * 0.5713333, h * 0.2236667)
      ..cubicTo(
          w * 0.5840000, h * 0.2123333, w * 0.5970000, h * 0.2036667, w * 0.6106667, h * 0.1973333)
      ..cubicTo(
          w * 0.6243333, h * 0.1913333, w * 0.6373333, h * 0.1866667, w * 0.6503333, h * 0.1840000)
      ..cubicTo(
          w * 0.6630000, h * 0.1813333, w * 0.6756667, h * 0.1800000, w * 0.6880000, h * 0.1800000)
      ..cubicTo(
          w * 0.7010000, h * 0.1800000, w * 0.7146667, h * 0.1813333, w * 0.7293333, h * 0.1843333)
      ..lineTo(w * 0.7560000, h * 0.1926667)
      ..cubicTo(
          w * 0.7600000, h * 0.1946667, w * 0.7616667, h * 0.1970000, w * 0.7606667, h * 0.2003333)
      ..lineTo(w * 0.7566667, h * 0.2210000)
      ..cubicTo(
          w * 0.7543333, h * 0.2306667, w * 0.7533333, h * 0.2400000, w * 0.7533333, h * 0.2490000)
      ..cubicTo(
          w * 0.7533333, h * 0.2593333, w * 0.7550000, h * 0.2696667, w * 0.7583333, h * 0.2806667)
      ..cubicTo(
          w * 0.7616667, h * 0.2913333, w * 0.7663333, h * 0.3020000, w * 0.7730000, h * 0.3123333)
      ..cubicTo(
          w * 0.7796667, h * 0.3226667, w * 0.7883333, h * 0.3320000, w * 0.7996667, h * 0.3406667)
      ..cubicTo(
          w * 0.8110000, h * 0.3493333, w * 0.8236667, h * 0.3556667, w * 0.8383333, h * 0.3600000)
      ..lineTo(w * 0.8590000, h * 0.3656667)
      ..cubicTo(
          w * 0.8623333, h * 0.3666667, w * 0.8640000, h * 0.3683333, w * 0.8640000, h * 0.3710000)
      ..cubicTo(
          w * 0.8640000, h * 0.3723333, w * 0.8640000, h * 0.3730000, w * 0.8636667, h * 0.3733333)
      ..lineTo(w * 0.8573333, h * 0.3960000)
      ..cubicTo(
          w * 0.8493333, h * 0.4296667, w * 0.8323333, h * 0.4590000, w * 0.8070000, h * 0.4833333)
      ..cubicTo(
          w * 0.8216667, h * 0.5086667, w * 0.8290000, h * 0.5360000, w * 0.8290000, h * 0.5650000)
      ..cubicTo(
          w * 0.8290000, h * 0.6096667, w * 0.8136667, h * 0.6480000, w * 0.7826667, h * 0.6800000)
      ..cubicTo(
          w * 0.7516667, h * 0.7123333, w * 0.7140000, h * 0.7290000, w * 0.6696667, h * 0.7303333)
      ..cubicTo(
          w * 0.6656667, h * 0.7303333, w * 0.6633333, h * 0.7283333, w * 0.6633333, h * 0.7240000)
      ..lineTo(w * 0.6633333, h * 0.6786667)
      ..cubicTo(
          w * 0.6633333, h * 0.6746667, w * 0.6653333, h * 0.6726667, w * 0.6696667, h * 0.6726667)
      ..cubicTo(
          w * 0.6986667, h * 0.6706667, w * 0.7230000, h * 0.6590000, w * 0.7430000, h * 0.6383333)
      ..cubicTo(
          w * 0.7630000, h * 0.6176667, w * 0.7730000, h * 0.5930000, w * 0.7730000, h * 0.5646667)
      ..cubicTo(
          w * 0.7730000, h * 0.5350000, w * 0.7623333, h * 0.5093333, w * 0.7406667, h * 0.4883333)
      ..cubicTo(
          w * 0.7190000, h * 0.4673333, w * 0.6933333, h * 0.4566667, w * 0.6630000, h * 0.4566667)
      ..lineTo(w * 0.6090000, h * 0.4566667)
      ..cubicTo(
          w * 0.6053333, h * 0.4566667, w * 0.6033333, h * 0.4546667, w * 0.6033333, h * 0.4506667)
      ..lineTo(w * 0.6010000, h * 0.4313333)
      ..cubicTo(
          w * 0.5973333, h * 0.3956667, w * 0.5816667, h * 0.3653333, w * 0.5543333, h * 0.3410000)
      ..cubicTo(
          w * 0.5270000, h * 0.3166667, w * 0.4953333, h * 0.3043333, w * 0.4590000, h * 0.3043333)
      ..cubicTo(
          w * 0.4226667, h * 0.3043333, w * 0.3906667, h * 0.3166667, w * 0.3640000, h * 0.3410000)
      ..cubicTo(
          w * 0.3370000, h * 0.3653333, w * 0.3216667, h * 0.3956667, w * 0.3183333, h * 0.4316667)
      ..lineTo(w * 0.3160000, h * 0.4490000)
      ..cubicTo(
          w * 0.3160000, h * 0.4526667, w * 0.3136667, h * 0.4546667, w * 0.3093333, h * 0.4546667)
      ..lineTo(w * 0.2916667, h * 0.4570000)
      ..cubicTo(
          w * 0.2636667, h * 0.4603333, w * 0.2403333, h * 0.4723333, w * 0.2216667, h * 0.4926667)
      ..cubicTo(
          w * 0.2026667, h * 0.5133333, w * 0.1933333, h * 0.5373333, w * 0.1933333, h * 0.5650000)
      ..lineTo(w * 0.1933333, h * 0.5656667)
      ..lineTo(w * 0.1936667, h * 0.5660000)
      ..lineTo(w * 0.1943333, h * 0.5660000)
      ..cubicTo(
          w * 0.1943333, h * 0.5833333, w * 0.1983333, h * 0.6000000, w * 0.2063333, h * 0.6153333)
      ..cubicTo(
          w * 0.2143333, h * 0.6306667, w * 0.2250000, h * 0.6433333, w * 0.2386667, h * 0.6533333)
      ..lineTo(w * 0.2390000, h * 0.6533333)
      ..lineTo(w * 0.2393333, h * 0.6536667)
      ..lineTo(w * 0.2396667, h * 0.6540000)
      ..cubicTo(
          w * 0.2470000, h * 0.6593333, w * 0.2536667, h * 0.6630000, w * 0.2603333, h * 0.6656667)
      ..cubicTo(
          w * 0.2716667, h * 0.6706667, w * 0.2833333, h * 0.6733333, w * 0.2960000, h * 0.6736667)
      ..cubicTo(
          w * 0.2996667, h * 0.6736667, w * 0.3016667, h * 0.6756667, w * 0.3016667, h * 0.6793333)
      ..lineTo(w * 0.3016667, h * 0.7240000)
      ..cubicTo(
          w * 0.3016667, h * 0.7280000, w * 0.2996667, h * 0.7300000, w * 0.2960000, h * 0.7300000)
      ..cubicTo(
          w * 0.2650000, h * 0.7286667, w * 0.2366667, h * 0.7193333, w * 0.2110000, h * 0.7026667)
      ..lineTo(w * 0.2106667, h * 0.7026667)
      ..cubicTo(
          w * 0.1886667, h * 0.6883333, w * 0.1710000, h * 0.6696667, w * 0.1576667, h * 0.6463333)
      ..cubicTo(
          w * 0.1443333, h * 0.6230000, w * 0.1373333, h * 0.5980000, w * 0.1363333, h * 0.5710000)
      ..close()
      ..moveTo(w * 0.3196667, h * 0.8033333)
      ..cubicTo(
          w * 0.3196667, h * 0.8023333, w * 0.3200000, h * 0.8010000, w * 0.3203333, h * 0.7990000)
      ..cubicTo(
          w * 0.3206667, h * 0.7970000, w * 0.3210000, h * 0.7960000, w * 0.3210000, h * 0.7950000)
      ..lineTo(w * 0.3240000, h * 0.7753333)
      ..cubicTo(
          w * 0.3263333, h * 0.7673333, w * 0.3306667, h * 0.7616667, w * 0.3376667, h * 0.7576667)
      ..cubicTo(
          w * 0.3446667, h * 0.7536667, w * 0.3520000, h * 0.7530000, w * 0.3603333, h * 0.7550000)
      ..cubicTo(
          w * 0.3680000, h * 0.7573333, w * 0.3733333, h * 0.7620000, w * 0.3773333, h * 0.7686667)
      ..cubicTo(
          w * 0.3810000, h * 0.7756667, w * 0.3816667, h * 0.7826667, w * 0.3796667, h * 0.7896667)
      ..lineTo(w * 0.3750000, h * 0.8096667)
      ..cubicTo(
          w * 0.3716667, h * 0.8240000, w * 0.3633333, h * 0.8313333, w * 0.3496667, h * 0.8313333)
      ..cubicTo(
          w * 0.3486667, h * 0.8313333, w * 0.3470000, h * 0.8313333, w * 0.3446667, h * 0.8310000)
      ..cubicTo(
          w * 0.3423333, h * 0.8306667, w * 0.3410000, h * 0.8306667, w * 0.3403333, h * 0.8306667)
      ..cubicTo(
          w * 0.3333333, h * 0.8286667, w * 0.3283333, h * 0.8250000, w * 0.3250000, h * 0.8196667)
      ..cubicTo(
          w * 0.3213333, h * 0.8143333, w * 0.3196667, h * 0.8090000, w * 0.3196667, h * 0.8033333)
      ..close()
      ..moveTo(w * 0.3443333, h * 0.7053333)
      ..cubicTo(
          w * 0.3443333, h * 0.6973333, w * 0.3470000, h * 0.6910000, w * 0.3520000, h * 0.6856667)
      ..cubicTo(
          w * 0.3570000, h * 0.6803333, w * 0.3636667, h * 0.6780000, w * 0.3716667, h * 0.6780000)
      ..cubicTo(
          w * 0.3796667, h * 0.6780000, w * 0.3860000, h * 0.6806667, w * 0.3913333, h * 0.6856667)
      ..cubicTo(
          w * 0.3966667, h * 0.6906667, w * 0.3990000, h * 0.6973333, w * 0.3990000, h * 0.7053333)
      ..cubicTo(
          w * 0.3990000, h * 0.7130000, w * 0.3963333, h * 0.7196667, w * 0.3913333, h * 0.7246667)
      ..cubicTo(
          w * 0.3863333, h * 0.7296667, w * 0.3796667, h * 0.7323333, w * 0.3716667, h * 0.7323333)
      ..cubicTo(
          w * 0.3640000, h * 0.7323333, w * 0.3576667, h * 0.7296667, w * 0.3526667, h * 0.7240000)
      ..cubicTo(
          w * 0.3473333, h * 0.7190000, w * 0.3443333, h * 0.7126667, w * 0.3443333, h * 0.7053333)
      ..close()
      ..moveTo(w * 0.3990000, h * 0.9053333)
      ..cubicTo(
          w * 0.3990000, h * 0.9040000, w * 0.3993333, h * 0.9016667, w * 0.4003333, h * 0.8980000)
      ..lineTo(w * 0.4046667, h * 0.8783333)
      ..cubicTo(
          w * 0.4070000, h * 0.8706667, w * 0.4116667, h * 0.8650000, w * 0.4183333, h * 0.8613333)
      ..cubicTo(
          w * 0.4253333, h * 0.8573333, w * 0.4323333, h * 0.8566667, w * 0.4393333, h * 0.8590000)
      ..cubicTo(
          w * 0.4470000, h * 0.8603333, w * 0.4530000, h * 0.8646667, w * 0.4570000, h * 0.8713333)
      ..cubicTo(
          w * 0.4610000, h * 0.8780000, w * 0.4620000, h * 0.8856667, w * 0.4596667, h * 0.8940000)
      ..lineTo(w * 0.4553333, h * 0.9136667)
      ..cubicTo(
          w * 0.4520000, h * 0.9273333, w * 0.4430000, h * 0.9340000, w * 0.4286667, h * 0.9340000)
      ..cubicTo(
          w * 0.4263333, h * 0.9340000, w * 0.4233333, h * 0.9336667, w * 0.4206667, h * 0.9330000)
      ..cubicTo(
          w * 0.4133333, h * 0.9310000, w * 0.4080000, h * 0.9273333, w * 0.4043333, h * 0.9220000)
      ..cubicTo(
          w * 0.4010000, h * 0.9163333, w * 0.3990000, h * 0.9110000, w * 0.3990000, h * 0.9053333)
      ..close()
      ..moveTo(w * 0.4253333, h * 0.8083333)
      ..cubicTo(
          w * 0.4253333, h * 0.8006667, w * 0.4280000, h * 0.7943333, w * 0.4330000, h * 0.7890000)
      ..cubicTo(
          w * 0.4383333, h * 0.7836667, w * 0.4446667, h * 0.7813333, w * 0.4526667, h * 0.7813333)
      ..cubicTo(
          w * 0.4606667, h * 0.7813333, w * 0.4670000, h * 0.7840000, w * 0.4723333, h * 0.7890000)
      ..cubicTo(
          w * 0.4776667, h * 0.7943333, w * 0.4800000, h * 0.8006667, w * 0.4800000, h * 0.8083333)
      ..cubicTo(
          w * 0.4800000, h * 0.8163333, w * 0.4773333, h * 0.8226667, w * 0.4723333, h * 0.8280000)
      ..cubicTo(
          w * 0.4670000, h * 0.8333333, w * 0.4606667, h * 0.8356667, w * 0.4526667, h * 0.8356667)
      ..cubicTo(
          w * 0.4450000, h * 0.8356667, w * 0.4386667, h * 0.8330000, w * 0.4333333, h * 0.8276667)
      ..cubicTo(
          w * 0.4280000, h * 0.8223333, w * 0.4253333, h * 0.8160000, w * 0.4253333, h * 0.8083333)
      ..close()
      ..moveTo(w * 0.4460000, h * 0.7326667)
      ..cubicTo(
          w * 0.4460000, h * 0.7296667, w * 0.4463333, h * 0.7266667, w * 0.4470000, h * 0.7236667)
      ..lineTo(w * 0.4546667, h * 0.6936667)
      ..cubicTo(
          w * 0.4570000, h * 0.6860000, w * 0.4616667, h * 0.6800000, w * 0.4683333, h * 0.6760000)
      ..cubicTo(
          w * 0.4753333, h * 0.6720000, w * 0.4823333, h * 0.6710000, w * 0.4896667, h * 0.6733333)
      ..cubicTo(
          w * 0.4976667, h * 0.6756667, w * 0.5033333, h * 0.6800000, w * 0.5073333, h * 0.6866667)
      ..cubicTo(
          w * 0.5113333, h * 0.6933333, w * 0.5120000, h * 0.7003333, w * 0.5096667, h * 0.7076667)
      ..lineTo(w * 0.5010000, h * 0.7376667)
      ..cubicTo(
          w * 0.4983333, h * 0.7470000, w * 0.4936667, h * 0.7530000, w * 0.4873333, h * 0.7563333)
      ..cubicTo(
          w * 0.4810000, h * 0.7596667, w * 0.4736667, h * 0.7603333, w * 0.4660000, h * 0.7583333)
      ..cubicTo(
          w * 0.4593333, h * 0.7570000, w * 0.4543333, h * 0.7536667, w * 0.4510000, h * 0.7483333)
      ..cubicTo(
          w * 0.4470000, h * 0.7430000, w * 0.4456667, h * 0.7376667, w * 0.4460000, h * 0.7326667)
      ..close()
      ..moveTo(w * 0.5380000, h * 0.8040000)
      ..cubicTo(
          w * 0.5380000, h * 0.8030000, w * 0.5380000, h * 0.8013333, w * 0.5383333, h * 0.7996667)
      ..cubicTo(
          w * 0.5386667, h * 0.7980000, w * 0.5386667, h * 0.7966667, w * 0.5386667, h * 0.7960000)
      ..lineTo(w * 0.5416667, h * 0.7763333)
      ..cubicTo(
          w * 0.5440000, h * 0.7683333, w * 0.5483333, h * 0.7626667, w * 0.5553333, h * 0.7586667)
      ..cubicTo(
          w * 0.5623333, h * 0.7546667, w * 0.5696667, h * 0.7540000, w * 0.5780000, h * 0.7560000)
      ..cubicTo(
          w * 0.5856667, h * 0.7583333, w * 0.5913333, h * 0.7630000, w * 0.5950000, h * 0.7696667)
      ..cubicTo(
          w * 0.5990000, h * 0.7766667, w * 0.5996667, h * 0.7836667, w * 0.5973333, h * 0.7906667)
      ..lineTo(w * 0.5926667, h * 0.8106667)
      ..cubicTo(
          w * 0.5893333, h * 0.8253333, w * 0.5810000, h * 0.8326667, w * 0.5673333, h * 0.8326667)
      ..cubicTo(
          w * 0.5663333, h * 0.8326667, w * 0.5646667, h * 0.8323333, w * 0.5626667, h * 0.8320000)
      ..cubicTo(
          w * 0.5606667, h * 0.8316667, w * 0.5590000, h * 0.8313333, w * 0.5580000, h * 0.8313333)
      ..cubicTo(
          w * 0.5513333, h * 0.8293333, w * 0.5463333, h * 0.8256667, w * 0.5430000, h * 0.8203333)
      ..cubicTo(
          w * 0.5396667, h * 0.8150000, w * 0.5380000, h * 0.8096667, w * 0.5380000, h * 0.8040000)
      ..close()
      ..moveTo(w * 0.5626667, h * 0.7060000)
      ..cubicTo(
          w * 0.5626667, h * 0.6980000, w * 0.5653333, h * 0.6916667, w * 0.5703333, h * 0.6863333)
      ..cubicTo(
          w * 0.5753333, h * 0.6810000, w * 0.5820000, h * 0.6786667, w * 0.5900000, h * 0.6786667)
      ..cubicTo(
          w * 0.5980000, h * 0.6786667, w * 0.6043333, h * 0.6813333, w * 0.6096667, h * 0.6863333)
      ..cubicTo(
          w * 0.6150000, h * 0.6916667, w * 0.6173333, h * 0.6980000, w * 0.6173333, h * 0.7060000)
      ..cubicTo(
          w * 0.6173333, h * 0.7136667, w * 0.6146667, h * 0.7200000, w * 0.6096667, h * 0.7253333)
      ..cubicTo(
          w * 0.6043333, h * 0.7306667, w * 0.5980000, h * 0.7330000, w * 0.5900000, h * 0.7330000)
      ..cubicTo(
          w * 0.5820000, h * 0.7330000, w * 0.5756667, h * 0.7303333, w * 0.5706667, h * 0.7250000)
      ..cubicTo(
          w * 0.5656667, h * 0.7200000, w * 0.5626667, h * 0.7136667, w * 0.5626667, h * 0.7060000)
      ..close()
      ..moveTo(w * 0.5863333, h * 0.2940000)
      ..cubicTo(
          w * 0.6210000, h * 0.3223333, w * 0.6430000, h * 0.3573333, w * 0.6523333, h * 0.3993333)
      ..lineTo(w * 0.6633333, h * 0.3993333)
      ..cubicTo(
          w * 0.7043333, h * 0.3993333, w * 0.7400000, h * 0.4123333, w * 0.7706667, h * 0.4386667)
      ..cubicTo(
          w * 0.7820000, h * 0.4283333, w * 0.7903333, h * 0.4170000, w * 0.7960000, h * 0.4040000)
      ..cubicTo(
          w * 0.7753333, h * 0.3940000, w * 0.7576667, h * 0.3806667, w * 0.7423333, h * 0.3636667)
      ..cubicTo(
          w * 0.7273333, h * 0.3466667, w * 0.7160000, h * 0.3283333, w * 0.7083333, h * 0.3083333)
      ..cubicTo(
          w * 0.7006667, h * 0.2883333, w * 0.6970000, h * 0.2676667, w * 0.6970000, h * 0.2463333)
      ..lineTo(w * 0.6970000, h * 0.2363333)
      ..lineTo(w * 0.6896667, h * 0.2363333)
      ..cubicTo(
          w * 0.6690000, h * 0.2363333, w * 0.6493333, h * 0.2413333, w * 0.6306667, h * 0.2513333)
      ..cubicTo(
          w * 0.6120000, h * 0.2613333, w * 0.5973333, h * 0.2756667, w * 0.5863333, h * 0.2940000)
      ..close();
  }

  Path _nightSnowPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1356667, h * 0.5643333)
      ..cubicTo(
          w * 0.1356667, h * 0.6086667, w * 0.1513333, h * 0.6466667, w * 0.1823333, h * 0.6786667)
      ..cubicTo(
          w * 0.2133333, h * 0.7106667, w * 0.2513333, h * 0.7276667, w * 0.2956667, h * 0.7290000)
      ..cubicTo(
          w * 0.2996667, h * 0.7290000, w * 0.3016667, h * 0.7270000, w * 0.3016667, h * 0.7233333)
      ..lineTo(w * 0.3016667, h * 0.6786667)
      ..cubicTo(
          w * 0.3016667, h * 0.6750000, w * 0.2996667, h * 0.6730000, w * 0.2956667, h * 0.6730000)
      ..cubicTo(
          w * 0.2673333, h * 0.6716667, w * 0.2430000, h * 0.6600000, w * 0.2230000, h * 0.6386667)
      ..cubicTo(
          w * 0.2026667, h * 0.6173333, w * 0.1926667, h * 0.5923333, w * 0.1926667, h * 0.5640000)
      ..cubicTo(
          w * 0.1926667, h * 0.5356667, w * 0.2020000, h * 0.5113333, w * 0.2210000, h * 0.4906667)
      ..cubicTo(
          w * 0.2400000, h * 0.4700000, w * 0.2633333, h * 0.4586667, w * 0.2910000, h * 0.4563333)
      ..lineTo(w * 0.3086667, h * 0.4540000)
      ..cubicTo(
          w * 0.3130000, h * 0.4540000, w * 0.3153333, h * 0.4520000, w * 0.3153333, h * 0.4483333)
      ..lineTo(w * 0.3176667, h * 0.4310000)
      ..cubicTo(
          w * 0.3213333, h * 0.3946667, w * 0.3363333, h * 0.3640000, w * 0.3633333, h * 0.3393333)
      ..cubicTo(
          w * 0.3903333, h * 0.3146667, w * 0.4220000, h * 0.3023333, w * 0.4586667, h * 0.3023333)
      ..cubicTo(
          w * 0.4950000, h * 0.3023333, w * 0.5266667, h * 0.3146667, w * 0.5540000, h * 0.3390000)
      ..cubicTo(
          w * 0.5813333, h * 0.3633333, w * 0.5966667, h * 0.3936667, w * 0.6006667, h * 0.4296667)
      ..lineTo(w * 0.6033333, h * 0.4486667)
      ..cubicTo(
          w * 0.6033333, h * 0.4526667, w * 0.6053333, h * 0.4546667, w * 0.6090000, h * 0.4546667)
      ..lineTo(w * 0.6630000, h * 0.4546667)
      ..cubicTo(
          w * 0.6933333, h * 0.4546667, w * 0.7190000, h * 0.4653333, w * 0.7406667, h * 0.4870000)
      ..cubicTo(
          w * 0.7623333, h * 0.5083333, w * 0.7730000, h * 0.5340000, w * 0.7730000, h * 0.5640000)
      ..cubicTo(
          w * 0.7730000, h * 0.5923333, w * 0.7630000, h * 0.6173333, w * 0.7426667, h * 0.6386667)
      ..cubicTo(
          w * 0.7223333, h * 0.6600000, w * 0.6983333, h * 0.6713333, w * 0.6700000, h * 0.6730000)
      ..cubicTo(
          w * 0.6653333, h * 0.6730000, w * 0.6630000, h * 0.6750000, w * 0.6630000, h * 0.6786667)
      ..lineTo(w * 0.6630000, h * 0.7233333)
      ..cubicTo(
          w * 0.6630000, h * 0.7270000, w * 0.6653333, h * 0.7290000, w * 0.6700000, h * 0.7290000)
      ..cubicTo(
          w * 0.6993333, h * 0.7283333, w * 0.7260000, h * 0.7203333, w * 0.7503333, h * 0.7053333)
      ..cubicTo(
          w * 0.7746667, h * 0.6903333, w * 0.7940000, h * 0.6703333, w * 0.8080000, h * 0.6453333)
      ..cubicTo(
          w * 0.8220000, h * 0.6203333, w * 0.8290000, h * 0.5933333, w * 0.8290000, h * 0.5643333)
      ..cubicTo(
          w * 0.8290000, h * 0.5340000, w * 0.8216667, h * 0.5063333, w * 0.8073333, h * 0.4816667)
      ..cubicTo(
          w * 0.8320000, h * 0.4596667, w * 0.8486667, h * 0.4310000, w * 0.8580000, h * 0.3956667)
      ..lineTo(w * 0.8636667, h * 0.3716667)
      ..cubicTo(
          w * 0.8640000, h * 0.3713333, w * 0.8643333, h * 0.3703333, w * 0.8643333, h * 0.3690000)
      ..cubicTo(
          w * 0.8643333, h * 0.3666667, w * 0.8626667, h * 0.3646667, w * 0.8590000, h * 0.3636667)
      ..lineTo(w * 0.8386667, h * 0.3580000)
      ..cubicTo(
          w * 0.8240000, h * 0.3536667, w * 0.8110000, h * 0.3473333, w * 0.7996667, h * 0.3390000)
      ..cubicTo(
          w * 0.7883333, h * 0.3306667, w * 0.7793333, h * 0.3213333, w * 0.7726667, h * 0.3110000)
      ..cubicTo(
          w * 0.7660000, h * 0.3006667, w * 0.7613333, h * 0.2903333, w * 0.7580000, h * 0.2793333)
      ..cubicTo(
          w * 0.7546667, h * 0.2686667, w * 0.7530000, h * 0.2580000, w * 0.7530000, h * 0.2476667)
      ..cubicTo(
          w * 0.7530000, h * 0.2386667, w * 0.7540000, h * 0.2290000, w * 0.7563333, h * 0.2190000)
      ..lineTo(w * 0.7600000, h * 0.1983333)
      ..cubicTo(
          w * 0.7606667, h * 0.1953333, w * 0.7593333, h * 0.1926667, w * 0.7553333, h * 0.1910000)
      ..lineTo(w * 0.7286667, h * 0.1830000)
      ..cubicTo(
          w * 0.7140000, h * 0.1793333, w * 0.7003333, h * 0.1776667, w * 0.6870000, h * 0.1776667)
      ..cubicTo(
          w * 0.6746667, h * 0.1776667, w * 0.6623333, h * 0.1790000, w * 0.6496667, h * 0.1820000)
      ..cubicTo(
          w * 0.6370000, h * 0.1850000, w * 0.6240000, h * 0.1893333, w * 0.6103333, h * 0.1956667)
      ..cubicTo(
          w * 0.5966667, h * 0.2020000, w * 0.5836667, h * 0.2106667, w * 0.5710000, h * 0.2223333)
      ..cubicTo(
          w * 0.5583333, h * 0.2340000, w * 0.5473333, h * 0.2473333, w * 0.5380000, h * 0.2630000)
      ..cubicTo(
          w * 0.5110000, h * 0.2520000, w * 0.4846667, h * 0.2463333, w * 0.4586667, h * 0.2463333)
      ..cubicTo(
          w * 0.4116667, h * 0.2463333, w * 0.3696667, h * 0.2610000, w * 0.3333333, h * 0.2903333)
      ..cubicTo(
          w * 0.2970000, h * 0.3196667, w * 0.2733333, h * 0.3570000, w * 0.2630000, h * 0.4026667)
      ..cubicTo(
          w * 0.2256667, h * 0.4120000, w * 0.1950000, h * 0.4316667, w * 0.1713333, h * 0.4613333)
      ..cubicTo(
          w * 0.1476667, h * 0.4913333, w * 0.1356667, h * 0.5256667, w * 0.1356667, h * 0.5643333)
      ..close()
      ..moveTo(w * 0.3486667, h * 0.7006667)
      ..cubicTo(
          w * 0.3486667, h * 0.7086667, w * 0.3513333, h * 0.7153333, w * 0.3566667, h * 0.7206667)
      ..cubicTo(
          w * 0.3620000, h * 0.7263333, w * 0.3683333, h * 0.7290000, w * 0.3763333, h * 0.7290000)
      ..cubicTo(
          w * 0.3843333, h * 0.7290000, w * 0.3910000, h * 0.7263333, w * 0.3963333, h * 0.7206667)
      ..cubicTo(
          w * 0.4016667, h * 0.7150000, w * 0.4043333, h * 0.7083333, w * 0.4043333, h * 0.7006667)
      ..cubicTo(
          w * 0.4043333, h * 0.6933333, w * 0.4016667, h * 0.6866667, w * 0.3963333, h * 0.6813333)
      ..cubicTo(
          w * 0.3910000, h * 0.6760000, w * 0.3843333, h * 0.6733333, w * 0.3763333, h * 0.6733333)
      ..cubicTo(
          w * 0.3686667, h * 0.6733333, w * 0.3620000, h * 0.6760000, w * 0.3566667, h * 0.6813333)
      ..cubicTo(
          w * 0.3513333, h * 0.6866667, w * 0.3486667, h * 0.6930000, w * 0.3486667, h * 0.7006667)
      ..close()
      ..moveTo(w * 0.3486667, h * 0.8220000)
      ..cubicTo(
          w * 0.3486667, h * 0.8296667, w * 0.3513333, h * 0.8360000, w * 0.3566667, h * 0.8413333)
      ..cubicTo(
          w * 0.3620000, h * 0.8466667, w * 0.3686667, h * 0.8493333, w * 0.3760000, h * 0.8493333)
      ..cubicTo(
          w * 0.3840000, h * 0.8493333, w * 0.3906667, h * 0.8466667, w * 0.3960000, h * 0.8416667)
      ..cubicTo(
          w * 0.4013333, h * 0.8363333, w * 0.4040000, h * 0.8300000, w * 0.4040000, h * 0.8220000)
      ..cubicTo(
          w * 0.4040000, h * 0.8140000, w * 0.4013333, h * 0.8076667, w * 0.3960000, h * 0.8023333)
      ..cubicTo(
          w * 0.3906667, h * 0.7970000, w * 0.3840000, h * 0.7946667, w * 0.3760000, h * 0.7946667)
      ..cubicTo(
          w * 0.3680000, h * 0.7946667, w * 0.3616667, h * 0.7973333, w * 0.3563333, h * 0.8023333)
      ..cubicTo(
          w * 0.3513333, h * 0.8073333, w * 0.3486667, h * 0.8140000, w * 0.3486667, h * 0.8220000)
      ..close()
      ..moveTo(w * 0.4553333, h * 0.7653333)
      ..cubicTo(
          w * 0.4553333, h * 0.7733333, w * 0.4580000, h * 0.7800000, w * 0.4633333, h * 0.7850000)
      ..cubicTo(
          w * 0.4686667, h * 0.7903333, w * 0.4753333, h * 0.7930000, w * 0.4826667, h * 0.7930000)
      ..cubicTo(
          w * 0.4906667, h * 0.7930000, w * 0.4973333, h * 0.7903333, w * 0.5030000, h * 0.7850000)
      ..cubicTo(
          w * 0.5086667, h * 0.7796667, w * 0.5113333, h * 0.7730000, w * 0.5113333, h * 0.7653333)
      ..cubicTo(
          w * 0.5113333, h * 0.7573333, w * 0.5086667, h * 0.7506667, w * 0.5030000, h * 0.7450000)
      ..cubicTo(
          w * 0.4973333, h * 0.7393333, w * 0.4906667, h * 0.7363333, w * 0.4826667, h * 0.7363333)
      ..cubicTo(
          w * 0.4753333, h * 0.7363333, w * 0.4690000, h * 0.7393333, w * 0.4633333, h * 0.7450000)
      ..cubicTo(
          w * 0.4576667, h * 0.7506667, w * 0.4553333, h * 0.7573333, w * 0.4553333, h * 0.7653333)
      ..close()
      ..moveTo(w * 0.4553333, h * 0.6440000)
      ..cubicTo(
          w * 0.4553333, h * 0.6520000, w * 0.4580000, h * 0.6583333, w * 0.4633333, h * 0.6633333)
      ..cubicTo(
          w * 0.4686667, h * 0.6686667, w * 0.4753333, h * 0.6713333, w * 0.4826667, h * 0.6713333)
      ..cubicTo(
          w * 0.4906667, h * 0.6713333, w * 0.4976667, h * 0.6686667, w * 0.5030000, h * 0.6636667)
      ..cubicTo(
          w * 0.5083333, h * 0.6586667, w * 0.5113333, h * 0.6520000, w * 0.5113333, h * 0.6440000)
      ..cubicTo(
          w * 0.5113333, h * 0.6363333, w * 0.5086667, h * 0.6296667, w * 0.5030000, h * 0.6240000)
      ..cubicTo(
          w * 0.4973333, h * 0.6183333, w * 0.4906667, h * 0.6156667, w * 0.4826667, h * 0.6156667)
      ..cubicTo(
          w * 0.4753333, h * 0.6156667, w * 0.4686667, h * 0.6183333, w * 0.4633333, h * 0.6240000)
      ..cubicTo(
          w * 0.4580000, h * 0.6296667, w * 0.4553333, h * 0.6363333, w * 0.4553333, h * 0.6440000)
      ..close()
      ..moveTo(w * 0.4553333, h * 0.8876667)
      ..cubicTo(
          w * 0.4553333, h * 0.8950000, w * 0.4580000, h * 0.9013333, w * 0.4633333, h * 0.9066667)
      ..cubicTo(
          w * 0.4690000, h * 0.9123333, w * 0.4753333, h * 0.9150000, w * 0.4826667, h * 0.9150000)
      ..cubicTo(
          w * 0.4906667, h * 0.9150000, w * 0.4973333, h * 0.9123333, w * 0.5030000, h * 0.9070000)
      ..cubicTo(
          w * 0.5086667, h * 0.9016667, w * 0.5113333, h * 0.8953333, w * 0.5113333, h * 0.8873333)
      ..cubicTo(
          w * 0.5113333, h * 0.8793333, w * 0.5086667, h * 0.8726667, w * 0.5030000, h * 0.8670000)
      ..cubicTo(
          w * 0.4973333, h * 0.8613333, w * 0.4906667, h * 0.8583333, w * 0.4826667, h * 0.8583333)
      ..cubicTo(
          w * 0.4753333, h * 0.8583333, w * 0.4690000, h * 0.8613333, w * 0.4633333, h * 0.8670000)
      ..cubicTo(
          w * 0.4583333, h * 0.8730000, w * 0.4553333, h * 0.8800000, w * 0.4553333, h * 0.8876667)
      ..close()
      ..moveTo(w * 0.5633333, h * 0.7006667)
      ..cubicTo(
          w * 0.5633333, h * 0.7086667, w * 0.5660000, h * 0.7153333, w * 0.5716667, h * 0.7206667)
      ..cubicTo(
          w * 0.5773333, h * 0.7260000, w * 0.5836667, h * 0.7290000, w * 0.5916667, h * 0.7290000)
      ..cubicTo(
          w * 0.5996667, h * 0.7290000, w * 0.6060000, h * 0.7263333, w * 0.6113333, h * 0.7206667)
      ..cubicTo(
          w * 0.6166667, h * 0.7150000, w * 0.6193333, h * 0.7083333, w * 0.6193333, h * 0.7006667)
      ..cubicTo(
          w * 0.6193333, h * 0.6933333, w * 0.6166667, h * 0.6866667, w * 0.6113333, h * 0.6813333)
      ..cubicTo(
          w * 0.6060000, h * 0.6760000, w * 0.5996667, h * 0.6733333, w * 0.5916667, h * 0.6733333)
      ..cubicTo(
          w * 0.5836667, h * 0.6733333, w * 0.5773333, h * 0.6760000, w * 0.5716667, h * 0.6813333)
      ..cubicTo(
          w * 0.5660000, h * 0.6866667, w * 0.5633333, h * 0.6930000, w * 0.5633333, h * 0.7006667)
      ..close()
      ..moveTo(w * 0.5633333, h * 0.8220000)
      ..cubicTo(
          w * 0.5633333, h * 0.8296667, w * 0.5660000, h * 0.8360000, w * 0.5713333, h * 0.8413333)
      ..cubicTo(
          w * 0.5766667, h * 0.8466667, w * 0.5833333, h * 0.8493333, w * 0.5913333, h * 0.8493333)
      ..cubicTo(
          w * 0.5993333, h * 0.8493333, w * 0.6056667, h * 0.8466667, w * 0.6110000, h * 0.8413333)
      ..cubicTo(
          w * 0.6163333, h * 0.8360000, w * 0.6186667, h * 0.8296667, w * 0.6186667, h * 0.8216667)
      ..cubicTo(
          w * 0.6186667, h * 0.8136667, w * 0.6160000, h * 0.8073333, w * 0.6110000, h * 0.8020000)
      ..cubicTo(
          w * 0.6056667, h * 0.7966667, w * 0.5993333, h * 0.7943333, w * 0.5913333, h * 0.7943333)
      ..cubicTo(
          w * 0.5833333, h * 0.7943333, w * 0.5766667, h * 0.7970000, w * 0.5713333, h * 0.8020000)
      ..cubicTo(
          w * 0.5660000, h * 0.8073333, w * 0.5633333, h * 0.8140000, w * 0.5633333, h * 0.8220000)
      ..close()
      ..moveTo(w * 0.5860000, h * 0.2923333)
      ..cubicTo(
          w * 0.5963333, h * 0.2743333, w * 0.6110000, h * 0.2603333, w * 0.6293333, h * 0.2503333)
      ..cubicTo(
          w * 0.6476667, h * 0.2403333, w * 0.6666667, h * 0.2353333, w * 0.6863333, h * 0.2350000)
      ..cubicTo(
          w * 0.6913333, h * 0.2350000, w * 0.6950000, h * 0.2353333, w * 0.6973333, h * 0.2356667)
      ..lineTo(w * 0.6973333, h * 0.2460000)
      ..cubicTo(
          w * 0.6973333, h * 0.2783333, w * 0.7060000, h * 0.3086667, w * 0.7233333, h * 0.3373333)
      ..cubicTo(
          w * 0.7406667, h * 0.3660000, w * 0.7650000, h * 0.3876667, w * 0.7956667, h * 0.4026667)
      ..cubicTo(
          w * 0.7903333, h * 0.4146667, w * 0.7820000, h * 0.4266667, w * 0.7703333, h * 0.4383333)
      ..cubicTo(
          w * 0.7406667, h * 0.4120000, w * 0.7050000, h * 0.3990000, w * 0.6626667, h * 0.3990000)
      ..lineTo(w * 0.6523333, h * 0.3990000)
      ..cubicTo(
          w * 0.6433333, h * 0.3580000, w * 0.6213333, h * 0.3226667, w * 0.5860000, h * 0.2923333)
      ..close();
  }

  Path _nightSprinklePath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1370000, h * 0.5630000)
      ..cubicTo(
          w * 0.1370000, h * 0.6073333, w * 0.1523333, h * 0.6456667, w * 0.1833333, h * 0.6773333)
      ..cubicTo(
          w * 0.2143333, h * 0.7093333, w * 0.2520000, h * 0.7263333, w * 0.2966667, h * 0.7286667)
      ..cubicTo(
          w * 0.3006667, h * 0.7286667, w * 0.3026667, h * 0.7266667, w * 0.3026667, h * 0.7226667)
      ..lineTo(w * 0.3026667, h * 0.6783333)
      ..cubicTo(
          w * 0.3026667, h * 0.6743333, w * 0.3006667, h * 0.6723333, w * 0.2966667, h * 0.6723333)
      ..cubicTo(
          w * 0.2680000, h * 0.6710000, w * 0.2440000, h * 0.6596667, w * 0.2240000, h * 0.6383333)
      ..cubicTo(
          w * 0.2040000, h * 0.6170000, w * 0.1940000, h * 0.5920000, w * 0.1940000, h * 0.5630000)
      ..cubicTo(
          w * 0.1940000, h * 0.5353333, w * 0.2033333, h * 0.5113333, w * 0.2220000, h * 0.4906667)
      ..cubicTo(
          w * 0.2406667, h * 0.4703333, w * 0.2640000, h * 0.4583333, w * 0.2920000, h * 0.4550000)
      ..lineTo(w * 0.3093333, h * 0.4536667)
      ..cubicTo(
          w * 0.3136667, h * 0.4536667, w * 0.3160000, h * 0.4516667, w * 0.3160000, h * 0.4476667)
      ..lineTo(w * 0.3183333, h * 0.4296667)
      ..cubicTo(
          w * 0.3220000, h * 0.3936667, w * 0.3370000, h * 0.3633333, w * 0.3640000, h * 0.3393333)
      ..cubicTo(
          w * 0.3910000, h * 0.3150000, w * 0.4226667, h * 0.3030000, w * 0.4590000, h * 0.3030000)
      ..cubicTo(
          w * 0.4953333, h * 0.3030000, w * 0.5270000, h * 0.3153333, w * 0.5543333, h * 0.3396667)
      ..cubicTo(
          w * 0.5816667, h * 0.3640000, w * 0.5970000, h * 0.3940000, w * 0.6010000, h * 0.4300000)
      ..lineTo(w * 0.6033333, h * 0.4490000)
      ..cubicTo(
          w * 0.6033333, h * 0.4530000, w * 0.6053333, h * 0.4553333, w * 0.6093333, h * 0.4553333)
      ..lineTo(w * 0.6633333, h * 0.4553333)
      ..cubicTo(
          w * 0.6930000, h * 0.4553333, w * 0.7183333, h * 0.4660000, w * 0.7400000, h * 0.4873333)
      ..cubicTo(
          w * 0.7616667, h * 0.5086667, w * 0.7723333, h * 0.5340000, w * 0.7723333, h * 0.5630000)
      ..cubicTo(
          w * 0.7723333, h * 0.5920000, w * 0.7623333, h * 0.6170000, w * 0.7423333, h * 0.6383333)
      ..cubicTo(
          w * 0.7223333, h * 0.6596667, w * 0.6980000, h * 0.6710000, w * 0.6696667, h * 0.6723333)
      ..cubicTo(
          w * 0.6656667, h * 0.6723333, w * 0.6633333, h * 0.6743333, w * 0.6633333, h * 0.6783333)
      ..lineTo(w * 0.6633333, h * 0.7226667)
      ..cubicTo(
          w * 0.6633333, h * 0.7266667, w * 0.6653333, h * 0.7286667, w * 0.6696667, h * 0.7286667)
      ..cubicTo(
          w * 0.6990000, h * 0.7276667, w * 0.7256667, h * 0.7196667, w * 0.7500000, h * 0.7046667)
      ..cubicTo(
          w * 0.7743333, h * 0.6896667, w * 0.7936667, h * 0.6696667, w * 0.8076667, h * 0.6446667)
      ..cubicTo(
          w * 0.8216667, h * 0.6196667, w * 0.8286667, h * 0.5923333, w * 0.8286667, h * 0.5633333)
      ..cubicTo(
          w * 0.8286667, h * 0.5343333, w * 0.8210000, h * 0.5073333, w * 0.8060000, h * 0.4816667)
      ..cubicTo(
          w * 0.8320000, h * 0.4570000, w * 0.8490000, h * 0.4283333, w * 0.8573333, h * 0.3956667)
      ..lineTo(w * 0.8620000, h * 0.3713333)
      ..cubicTo(
          w * 0.8623333, h * 0.3710000, w * 0.8626667, h * 0.3703333, w * 0.8626667, h * 0.3690000)
      ..cubicTo(
          w * 0.8626667, h * 0.3666667, w * 0.8610000, h * 0.3646667, w * 0.8573333, h * 0.3636667)
      ..lineTo(w * 0.8383333, h * 0.3580000)
      ..cubicTo(
          w * 0.8193333, h * 0.3526667, w * 0.8030000, h * 0.3433333, w * 0.7896667, h * 0.3306667)
      ..cubicTo(
          w * 0.7760000, h * 0.3180000, w * 0.7663333, h * 0.3043333, w * 0.7606667, h * 0.2903333)
      ..cubicTo(
          w * 0.7550000, h * 0.2760000, w * 0.7520000, h * 0.2620000, w * 0.7520000, h * 0.2476667)
      ..cubicTo(
          w * 0.7520000, h * 0.2380000, w * 0.7533333, h * 0.2286667, w * 0.7556667, h * 0.2193333)
      ..lineTo(w * 0.7600000, h * 0.1990000)
      ..cubicTo(
          w * 0.7606667, h * 0.1956667, w * 0.7593333, h * 0.1930000, w * 0.7556667, h * 0.1913333)
      ..lineTo(w * 0.7290000, h * 0.1833333)
      ..cubicTo(
          w * 0.7140000, h * 0.1800000, w * 0.7000000, h * 0.1783333, w * 0.6866667, h * 0.1783333)
      ..cubicTo(
          w * 0.6746667, h * 0.1783333, w * 0.6623333, h * 0.1796667, w * 0.6493333, h * 0.1826667)
      ..cubicTo(
          w * 0.6366667, h * 0.1856667, w * 0.6233333, h * 0.1900000, w * 0.6096667, h * 0.1960000)
      ..cubicTo(
          w * 0.5960000, h * 0.2020000, w * 0.5826667, h * 0.2106667, w * 0.5696667, h * 0.2223333)
      ..cubicTo(
          w * 0.5566667, h * 0.2340000, w * 0.5456667, h * 0.2470000, w * 0.5363333, h * 0.2623333)
      ..cubicTo(
          w * 0.5093333, h * 0.2520000, w * 0.4833333, h * 0.2470000, w * 0.4586667, h * 0.2470000)
      ..cubicTo(
          w * 0.4116667, h * 0.2470000, w * 0.3696667, h * 0.2616667, w * 0.3333333, h * 0.2910000)
      ..cubicTo(
          w * 0.2970000, h * 0.3203333, w * 0.2733333, h * 0.3576667, w * 0.2630000, h * 0.4030000)
      ..cubicTo(
          w * 0.2260000, h * 0.4116667, w * 0.1956667, h * 0.4310000, w * 0.1720000, h * 0.4610000)
      ..cubicTo(
          w * 0.1490000, h * 0.4903333, w * 0.1370000, h * 0.5246667, w * 0.1370000, h * 0.5630000)
      ..close()
      ..moveTo(w * 0.3350000, h * 0.5923333)
      ..cubicTo(
          w * 0.3350000, h * 0.6050000, w * 0.3396667, h * 0.6160000, w * 0.3490000, h * 0.6250000)
      ..cubicTo(
          w * 0.3583333, h * 0.6340000, w * 0.3696667, h * 0.6383333, w * 0.3830000, h * 0.6383333)
      ..cubicTo(
          w * 0.3963333, h * 0.6383333, w * 0.4073333, h * 0.6340000, w * 0.4163333, h * 0.6250000)
      ..cubicTo(
          w * 0.4253333, h * 0.6160000, w * 0.4296667, h * 0.6053333, w * 0.4296667, h * 0.5923333)
      ..cubicTo(
          w * 0.4296667, h * 0.5836667, w * 0.4256667, h * 0.5723333, w * 0.4180000, h * 0.5583333)
      ..cubicTo(
          w * 0.4103333, h * 0.5443333, w * 0.4030000, h * 0.5333333, w * 0.3963333, h * 0.5256667)
      ..cubicTo(
          w * 0.3926667, h * 0.5216667, w * 0.3883333, h * 0.5170000, w * 0.3826667, h * 0.5113333)
      ..lineTo(w * 0.3710000, h * 0.5250000)
      ..cubicTo(
          w * 0.3620000, h * 0.5346667, w * 0.3536667, h * 0.5463333, w * 0.3460000, h * 0.5596667)
      ..cubicTo(
          w * 0.3383333, h * 0.5730000, w * 0.3350000, h * 0.5836667, w * 0.3350000, h * 0.5923333)
      ..close()
      ..moveTo(w * 0.4346667, h * 0.7253333)
      ..cubicTo(
          w * 0.4346667, h * 0.7473333, w * 0.4423333, h * 0.7656667, w * 0.4573333, h * 0.7806667)
      ..cubicTo(
          w * 0.4726667, h * 0.7956667, w * 0.4910000, h * 0.8030000, w * 0.5123333, h * 0.8030000)
      ..cubicTo(
          w * 0.5343333, h * 0.8030000, w * 0.5526667, h * 0.7953333, w * 0.5676667, h * 0.7803333)
      ..cubicTo(
          w * 0.5826667, h * 0.7650000, w * 0.5903333, h * 0.7466667, w * 0.5903333, h * 0.7253333)
      ..cubicTo(
          w * 0.5903333, h * 0.7070000, w * 0.5813333, h * 0.6846667, w * 0.5636667, h * 0.6586667)
      ..cubicTo(
          w * 0.5490000, h * 0.6393333, w * 0.5346667, h * 0.6226667, w * 0.5210000, h * 0.6090000)
      ..cubicTo(
          w * 0.5183333, h * 0.6070000, w * 0.5153333, h * 0.6046667, w * 0.5123333, h * 0.6013333)
      ..lineTo(w * 0.5046667, h * 0.6090000)
      ..cubicTo(
          w * 0.4916667, h * 0.6210000, w * 0.4773333, h * 0.6376667, w * 0.4620000, h * 0.6583333)
      ..cubicTo(
          w * 0.4540000, h * 0.6693333, w * 0.4476667, h * 0.6810000, w * 0.4423333, h * 0.6930000)
      ..cubicTo(
          w * 0.4370000, h * 0.7053333, w * 0.4346667, h * 0.7160000, w * 0.4346667, h * 0.7253333)
      ..close()
      ..moveTo(w * 0.4836667, h * 0.5030000)
      ..cubicTo(
          w * 0.4836667, h * 0.5116667, w * 0.4870000, h * 0.5186667, w * 0.4933333, h * 0.5250000)
      ..cubicTo(
          w * 0.4996667, h * 0.5313333, w * 0.5073333, h * 0.5340000, w * 0.5166667, h * 0.5340000)
      ..cubicTo(
          w * 0.5253333, h * 0.5340000, w * 0.5323333, h * 0.5310000, w * 0.5386667, h * 0.5250000)
      ..cubicTo(
          w * 0.5446667, h * 0.5190000, w * 0.5476667, h * 0.5116667, w * 0.5476667, h * 0.5030000)
      ..cubicTo(
          w * 0.5476667, h * 0.4886667, w * 0.5373333, h * 0.4706667, w * 0.5166667, h * 0.4490000)
      ..lineTo(w * 0.5083333, h * 0.4580000)
      ..cubicTo(
          w * 0.5023333, h * 0.4646667, w * 0.4966667, h * 0.4723333, w * 0.4916667, h * 0.4813333)
      ..cubicTo(
          w * 0.4860000, h * 0.4903333, w * 0.4836667, h * 0.4976667, w * 0.4836667, h * 0.5030000)
      ..close()
      ..moveTo(w * 0.5853333, h * 0.2923333)
      ..cubicTo(
          w * 0.5970000, h * 0.2733333, w * 0.6120000, h * 0.2590000, w * 0.6300000, h * 0.2493333)
      ..cubicTo(
          w * 0.6480000, h * 0.2396667, w * 0.6673333, h * 0.2346667, w * 0.6873333, h * 0.2346667)
      ..cubicTo(
          w * 0.6913333, h * 0.2346667, w * 0.6943333, h * 0.2350000, w * 0.6963333, h * 0.2353333)
      ..lineTo(w * 0.6963333, h * 0.2453333)
      ..cubicTo(
          w * 0.6963333, h * 0.2773333, w * 0.7050000, h * 0.3076667, w * 0.7226667, h * 0.3366667)
      ..cubicTo(
          w * 0.7403333, h * 0.3656667, w * 0.7643333, h * 0.3873333, w * 0.7953333, h * 0.4023333)
      ..cubicTo(
          w * 0.7900000, h * 0.4150000, w * 0.7816667, h * 0.4263333, w * 0.7703333, h * 0.4366667)
      ..cubicTo(
          w * 0.7393333, h * 0.4113333, w * 0.7040000, h * 0.3986667, w * 0.6633333, h * 0.3986667)
      ..lineTo(w * 0.6523333, h * 0.3986667)
      ..cubicTo(
          w * 0.6423333, h * 0.3550000, w * 0.6200000, h * 0.3196667, w * 0.5853333, h * 0.2923333)
      ..close();
  }

  Path _nightStormShowersPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1363333, h * 0.5630000)
      ..cubicTo(
          w * 0.1363333, h * 0.6000000, w * 0.1473333, h * 0.6330000, w * 0.1693333, h * 0.6620000)
      ..cubicTo(
          w * 0.1913333, h * 0.6910000, w * 0.2200000, h * 0.7110000, w * 0.2553333, h * 0.7216667)
      ..lineTo(w * 0.2336667, h * 0.7783333)
      ..cubicTo(
          w * 0.2323333, h * 0.7830000, w * 0.2336667, h * 0.7853333, w * 0.2383333, h * 0.7853333)
      ..lineTo(w * 0.3090000, h * 0.7853333)
      ..lineTo(w * 0.2660000, h * 0.9246667)
      ..lineTo(w * 0.2753333, h * 0.9246667)
      ..lineTo(w * 0.4163333, h * 0.7373333)
      ..cubicTo(
          w * 0.4176667, h * 0.7360000, w * 0.4176667, h * 0.7343333, w * 0.4170000, h * 0.7326667)
      ..cubicTo(
          w * 0.4160000, h * 0.7310000, w * 0.4146667, h * 0.7303333, w * 0.4123333, h * 0.7303333)
      ..lineTo(w * 0.3396667, h * 0.7303333)
      ..lineTo(w * 0.4220000, h * 0.5756667)
      ..cubicTo(
          w * 0.4243333, h * 0.5710000, w * 0.4230000, h * 0.5683333, w * 0.4176667, h * 0.5683333)
      ..lineTo(w * 0.3190000, h * 0.5683333)
      ..cubicTo(
          w * 0.3160000, h * 0.5683333, w * 0.3136667, h * 0.5700000, w * 0.3116667, h * 0.5733333)
      ..lineTo(w * 0.2760000, h * 0.6693333)
      ..cubicTo(
          w * 0.2523333, h * 0.6633333, w * 0.2326667, h * 0.6503333, w * 0.2166667, h * 0.6303333)
      ..cubicTo(
          w * 0.2006667, h * 0.6103333, w * 0.1930000, h * 0.5880000, w * 0.1930000, h * 0.5633333)
      ..cubicTo(
          w * 0.1930000, h * 0.5356667, w * 0.2023333, h * 0.5116667, w * 0.2213333, h * 0.4910000)
      ..cubicTo(
          w * 0.2403333, h * 0.4706667, w * 0.2636667, h * 0.4586667, w * 0.2913333, h * 0.4553333)
      ..lineTo(w * 0.3090000, h * 0.4530000)
      ..cubicTo(
          w * 0.3133333, h * 0.4530000, w * 0.3156667, h * 0.4510000, w * 0.3156667, h * 0.4470000)
      ..lineTo(w * 0.3180000, h * 0.4300000)
      ..cubicTo(
          w * 0.3216667, h * 0.3940000, w * 0.3366667, h * 0.3636667, w * 0.3636667, h * 0.3393333)
      ..cubicTo(
          w * 0.3906667, h * 0.3150000, w * 0.4223333, h * 0.3026667, w * 0.4586667, h * 0.3026667)
      ..cubicTo(
          w * 0.4950000, h * 0.3026667, w * 0.5266667, h * 0.3150000, w * 0.5540000, h * 0.3393333)
      ..cubicTo(
          w * 0.5813333, h * 0.3636667, w * 0.5966667, h * 0.3940000, w * 0.6006667, h * 0.4296667)
      ..lineTo(w * 0.6030000, h * 0.4486667)
      ..cubicTo(
          w * 0.6030000, h * 0.4526667, w * 0.6050000, h * 0.4550000, w * 0.6086667, h * 0.4550000)
      ..lineTo(w * 0.6626667, h * 0.4550000)
      ..cubicTo(
          w * 0.6930000, h * 0.4550000, w * 0.7186667, h * 0.4656667, w * 0.7403333, h * 0.4866667)
      ..cubicTo(
          w * 0.7620000, h * 0.5076667, w * 0.7726667, h * 0.5333333, w * 0.7726667, h * 0.5626667)
      ..cubicTo(
          w * 0.7726667, h * 0.5910000, w * 0.7626667, h * 0.6156667, w * 0.7426667, h * 0.6363333)
      ..cubicTo(
          w * 0.7226667, h * 0.6570000, w * 0.6983333, h * 0.6686667, w * 0.6693333, h * 0.6706667)
      ..cubicTo(
          w * 0.6653333, h * 0.6706667, w * 0.6630000, h * 0.6726667, w * 0.6630000, h * 0.6770000)
      ..lineTo(w * 0.6630000, h * 0.7223333)
      ..cubicTo(
          w * 0.6630000, h * 0.7263333, w * 0.6650000, h * 0.7283333, w * 0.6693333, h * 0.7283333)
      ..cubicTo(
          w * 0.7136667, h * 0.7270000, w * 0.7513333, h * 0.7100000, w * 0.7823333, h * 0.6780000)
      ..cubicTo(
          w * 0.8133333, h * 0.6456667, w * 0.8286667, h * 0.6073333, w * 0.8286667, h * 0.5630000)
      ..cubicTo(
          w * 0.8286667, h * 0.5340000, w * 0.8213333, h * 0.5070000, w * 0.8066667, h * 0.4813333)
      ..cubicTo(
          w * 0.8320000, h * 0.4566667, w * 0.8490000, h * 0.4276667, w * 0.8570000, h * 0.3940000)
      ..lineTo(w * 0.8633333, h * 0.3713333)
      ..cubicTo(
          w * 0.8636667, h * 0.3710000, w * 0.8636667, h * 0.3703333, w * 0.8636667, h * 0.3690000)
      ..cubicTo(
          w * 0.8636667, h * 0.3663333, w * 0.8620000, h * 0.3646667, w * 0.8586667, h * 0.3636667)
      ..lineTo(w * 0.8380000, h * 0.3580000)
      ..cubicTo(
          w * 0.8190000, h * 0.3523333, w * 0.8026667, h * 0.3430000, w * 0.7893333, h * 0.3300000)
      ..cubicTo(
          w * 0.7760000, h * 0.3170000, w * 0.7666667, h * 0.3033333, w * 0.7610000, h * 0.2893333)
      ..cubicTo(
          w * 0.7553333, h * 0.2753333, w * 0.7526667, h * 0.2613333, w * 0.7530000, h * 0.2473333)
      ..cubicTo(
          w * 0.7530000, h * 0.2380000, w * 0.7540000, h * 0.2286667, w * 0.7563333, h * 0.2190000)
      ..lineTo(w * 0.7600000, h * 0.1986667)
      ..cubicTo(
          w * 0.7606667, h * 0.1953333, w * 0.7593333, h * 0.1926667, w * 0.7553333, h * 0.1910000)
      ..lineTo(w * 0.7286667, h * 0.1830000)
      ..cubicTo(
          w * 0.7130000, h * 0.1800000, w * 0.6993333, h * 0.1783333, w * 0.6873333, h * 0.1783333)
      ..cubicTo(
          w * 0.6750000, h * 0.1780000, w * 0.6623333, h * 0.1793333, w * 0.6496667, h * 0.1823333)
      ..cubicTo(
          w * 0.6370000, h * 0.1850000, w * 0.6236667, h * 0.1896667, w * 0.6100000, h * 0.1956667)
      ..cubicTo(
          w * 0.5963333, h * 0.2016667, w * 0.5833333, h * 0.2106667, w * 0.5706667, h * 0.2220000)
      ..cubicTo(
          w * 0.5580000, h * 0.2333333, w * 0.5470000, h * 0.2466667, w * 0.5376667, h * 0.2620000)
      ..cubicTo(
          w * 0.5100000, h * 0.2516667, w * 0.4836667, h * 0.2466667, w * 0.4590000, h * 0.2466667)
      ..cubicTo(
          w * 0.4120000, h * 0.2466667, w * 0.3700000, h * 0.2613333, w * 0.3336667, h * 0.2906667)
      ..cubicTo(
          w * 0.2973333, h * 0.3200000, w * 0.2736667, h * 0.3573333, w * 0.2633333, h * 0.4026667)
      ..cubicTo(
          w * 0.2263333, h * 0.4113333, w * 0.1960000, h * 0.4306667, w * 0.1720000, h * 0.4606667)
      ..cubicTo(
          w * 0.1483333, h * 0.4903333, w * 0.1363333, h * 0.5246667, w * 0.1363333, h * 0.5630000)
      ..close()
      ..moveTo(w * 0.4086667, h * 0.8920000)
      ..cubicTo(
          w * 0.4086667, h * 0.8973333, w * 0.4103333, h * 0.9023333, w * 0.4136667, h * 0.9076667)
      ..cubicTo(
          w * 0.4170000, h * 0.9130000, w * 0.4220000, h * 0.9166667, w * 0.4286667, h * 0.9186667)
      ..cubicTo(
          w * 0.4340000, h * 0.9196667, w * 0.4370000, h * 0.9203333, w * 0.4376667, h * 0.9203333)
      ..cubicTo(
          w * 0.4406667, h * 0.9203333, w * 0.4450000, h * 0.9193333, w * 0.4500000, h * 0.9170000)
      ..cubicTo(
          w * 0.4570000, h * 0.9136667, w * 0.4616667, h * 0.9080000, w * 0.4640000, h * 0.8993333)
      ..lineTo(w * 0.4733333, h * 0.8643333)
      ..cubicTo(
          w * 0.4753333, h * 0.8570000, w * 0.4746667, h * 0.8500000, w * 0.4706667, h * 0.8433333)
      ..cubicTo(
          w * 0.4666667, h * 0.8366667, w * 0.4610000, h * 0.8320000, w * 0.4530000, h * 0.8296667)
      ..cubicTo(
          w * 0.4456667, h * 0.8276667, w * 0.4386667, h * 0.8286667, w * 0.4320000, h * 0.8323333)
      ..cubicTo(
          w * 0.4253333, h * 0.8363333, w * 0.4206667, h * 0.8423333, w * 0.4183333, h * 0.8500000)
      ..lineTo(w * 0.4093333, h * 0.8833333)
      ..lineTo(w * 0.4086667, h * 0.8920000)
      ..close()
      ..moveTo(w * 0.4533333, h * 0.7333333)
      ..cubicTo(
          w * 0.4533333, h * 0.7476667, w * 0.4600000, h * 0.7560000, w * 0.4736667, h * 0.7583333)
      ..cubicTo(
          w * 0.4783333, h * 0.7593333, w * 0.4813333, h * 0.7600000, w * 0.4826667, h * 0.7600000)
      ..cubicTo(
          w * 0.4953333, h * 0.7600000, w * 0.5036667, h * 0.7530000, w * 0.5083333, h * 0.7390000)
      ..lineTo(w * 0.5183333, h * 0.7050000)
      ..cubicTo(
          w * 0.5203333, h * 0.6976667, w * 0.5193333, h * 0.6906667, w * 0.5156667, h * 0.6840000)
      ..cubicTo(
          w * 0.5120000, h * 0.6773333, w * 0.5056667, h * 0.6726667, w * 0.4980000, h * 0.6703333)
      ..cubicTo(
          w * 0.4906667, h * 0.6680000, w * 0.4833333, h * 0.6686667, w * 0.4766667, h * 0.6726667)
      ..cubicTo(
          w * 0.4700000, h * 0.6766667, w * 0.4653333, h * 0.6823333, w * 0.4630000, h * 0.6903333)
      ..lineTo(w * 0.4546667, h * 0.7240000)
      ..cubicTo(
          w * 0.4536667, h * 0.7270000, w * 0.4533333, h * 0.7300000, w * 0.4533333, h * 0.7333333)
      ..close()
      ..moveTo(w * 0.5470000, h * 0.7890000)
      ..cubicTo(
          w * 0.5473333, h * 0.7946667, w * 0.5493333, h * 0.8000000, w * 0.5530000, h * 0.8050000)
      ..cubicTo(
          w * 0.5566667, h * 0.8100000, w * 0.5620000, h * 0.8140000, w * 0.5690000, h * 0.8163333)
      ..cubicTo(
          w * 0.5743333, h * 0.8176667, w * 0.5780000, h * 0.8183333, w * 0.5800000, h * 0.8183333)
      ..cubicTo(
          w * 0.5913333, h * 0.8183333, w * 0.5993333, h * 0.8106667, w * 0.6036667, h * 0.7956667)
      ..lineTo(w * 0.6116667, h * 0.7616667)
      ..cubicTo(
          w * 0.6140000, h * 0.7540000, w * 0.6133333, h * 0.7466667, w * 0.6096667, h * 0.7396667)
      ..cubicTo(
          w * 0.6060000, h * 0.7326667, w * 0.6003333, h * 0.7283333, w * 0.5930000, h * 0.7260000)
      ..cubicTo(
          w * 0.5846667, h * 0.7240000, w * 0.5770000, h * 0.7250000, w * 0.5703333, h * 0.7286667)
      ..cubicTo(
          w * 0.5636667, h * 0.7326667, w * 0.5593333, h * 0.7386667, w * 0.5580000, h * 0.7463333)
      ..lineTo(w * 0.5483333, h * 0.7806667)
      ..cubicTo(
          w * 0.5483333, h * 0.7813333, w * 0.5480000, h * 0.7826667, w * 0.5476667, h * 0.7846667)
      ..cubicTo(
          w * 0.5470000, h * 0.7870000, w * 0.5470000, h * 0.7883333, w * 0.5470000, h * 0.7890000)
      ..close()
      ..moveTo(w * 0.5863333, h * 0.2923333)
      ..cubicTo(
          w * 0.5973333, h * 0.2736667, w * 0.6123333, h * 0.2593333, w * 0.6310000, h * 0.2493333)
      ..cubicTo(
          w * 0.6496667, h * 0.2393333, w * 0.6693333, h * 0.2343333, w * 0.6896667, h * 0.2343333)
      ..lineTo(w * 0.6970000, h * 0.2343333)
      ..lineTo(w * 0.6970000, h * 0.2450000)
      ..cubicTo(
          w * 0.6970000, h * 0.2663333, w * 0.7006667, h * 0.2870000, w * 0.7083333, h * 0.3070000)
      ..cubicTo(
          w * 0.7160000, h * 0.3270000, w * 0.7270000, h * 0.3453333, w * 0.7423333, h * 0.3623333)
      ..cubicTo(
          w * 0.7573333, h * 0.3793333, w * 0.7753333, h * 0.3926667, w * 0.7960000, h * 0.4026667)
      ..cubicTo(
          w * 0.7903333, h * 0.4153333, w * 0.7820000, h * 0.4266667, w * 0.7706667, h * 0.4370000)
      ..cubicTo(
          w * 0.7403333, h * 0.4110000, w * 0.7046667, h * 0.3980000, w * 0.6633333, h * 0.3980000)
      ..lineTo(w * 0.6523333, h * 0.3980000)
      ..cubicTo(
          w * 0.6426667, h * 0.3560000, w * 0.6206667, h * 0.3206667, w * 0.5863333, h * 0.2923333)
      ..close()
      ..moveTo(w * 0.5926667, h * 0.6290000)
      ..cubicTo(
          w * 0.5926667, h * 0.6433333, w * 0.6000000, h * 0.6526667, w * 0.6143333, h * 0.6563333)
      ..cubicTo(
          w * 0.6190000, h * 0.6570000, w * 0.6223333, h * 0.6576667, w * 0.6243333, h * 0.6576667)
      ..cubicTo(
          w * 0.6363333, h * 0.6576667, w * 0.6446667, h * 0.6503333, w * 0.6490000, h * 0.6360000)
      ..lineTo(w * 0.6583333, h * 0.6013333)
      ..cubicTo(
          w * 0.6586667, h * 0.5996667, w * 0.6586667, h * 0.5973333, w * 0.6586667, h * 0.5940000)
      ..cubicTo(
          w * 0.6590000, h * 0.5883333, w * 0.6576667, h * 0.5830000, w * 0.6540000, h * 0.5776667)
      ..cubicTo(
          w * 0.6503333, h * 0.5723333, w * 0.6450000, h * 0.5686667, w * 0.6376667, h * 0.5666667)
      ..cubicTo(
          w * 0.6373333, h * 0.5666667, w * 0.6360000, h * 0.5666667, w * 0.6343333, h * 0.5663333)
      ..cubicTo(
          w * 0.6326667, h * 0.5660000, w * 0.6310000, h * 0.5660000, w * 0.6300000, h * 0.5660000)
      ..cubicTo(
          w * 0.6246667, h * 0.5660000, w * 0.6193333, h * 0.5676667, w * 0.6140000, h * 0.5710000)
      ..cubicTo(
          w * 0.6086667, h * 0.5743333, w * 0.6050000, h * 0.5796667, w * 0.6030000, h * 0.5866667)
      ..lineTo(w * 0.5933333, h * 0.6206667)
      ..cubicTo(
          w * 0.5933333, h * 0.6210000, w * 0.5933333, h * 0.6220000, w * 0.5930000, h * 0.6240000)
      ..cubicTo(
          w * 0.5930000, h * 0.6263333, w * 0.5926667, h * 0.6280000, w * 0.5926667, h * 0.6290000)
      ..close();
  }

  Path _nightThunderstormPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1360000, h * 0.5626667)
      ..cubicTo(
          w * 0.1360000, h * 0.5996667, w * 0.1470000, h * 0.6326667, w * 0.1690000, h * 0.6620000)
      ..cubicTo(
          w * 0.1910000, h * 0.6913333, w * 0.2196667, h * 0.7110000, w * 0.2550000, h * 0.7216667)
      ..lineTo(w * 0.2330000, h * 0.7780000)
      ..cubicTo(
          w * 0.2320000, h * 0.7826667, w * 0.2336667, h * 0.7850000, w * 0.2380000, h * 0.7850000)
      ..lineTo(w * 0.3086667, h * 0.7850000)
      ..lineTo(w * 0.2763333, h * 0.9020000)
      ..lineTo(w * 0.2860000, h * 0.9020000)
      ..lineTo(w * 0.4163333, h * 0.7373333)
      ..cubicTo(
          w * 0.4176667, h * 0.7356667, w * 0.4176667, h * 0.7340000, w * 0.4166667, h * 0.7323333)
      ..cubicTo(
          w * 0.4156667, h * 0.7306667, w * 0.4140000, h * 0.7300000, w * 0.4116667, h * 0.7300000)
      ..lineTo(w * 0.3390000, h * 0.7300000)
      ..lineTo(w * 0.4216667, h * 0.5756667)
      ..cubicTo(
          w * 0.4240000, h * 0.5710000, w * 0.4226667, h * 0.5683333, w * 0.4173333, h * 0.5683333)
      ..lineTo(w * 0.3186667, h * 0.5683333)
      ..cubicTo(
          w * 0.3156667, h * 0.5683333, w * 0.3133333, h * 0.5700000, w * 0.3110000, h * 0.5730000)
      ..lineTo(w * 0.2753333, h * 0.6690000)
      ..cubicTo(
          w * 0.2513333, h * 0.6630000, w * 0.2316667, h * 0.6500000, w * 0.2160000, h * 0.6300000)
      ..cubicTo(
          w * 0.2003333, h * 0.6100000, w * 0.1926667, h * 0.5876667, w * 0.1926667, h * 0.5630000)
      ..cubicTo(
          w * 0.1926667, h * 0.5353333, w * 0.2020000, h * 0.5113333, w * 0.2210000, h * 0.4906667)
      ..cubicTo(
          w * 0.2400000, h * 0.4700000, w * 0.2633333, h * 0.4583333, w * 0.2910000, h * 0.4550000)
      ..lineTo(w * 0.3083333, h * 0.4523333)
      ..cubicTo(
          w * 0.3126667, h * 0.4523333, w * 0.3150000, h * 0.4503333, w * 0.3150000, h * 0.4466667)
      ..lineTo(w * 0.3173333, h * 0.4293333)
      ..cubicTo(
          w * 0.3210000, h * 0.3933333, w * 0.3360000, h * 0.3630000, w * 0.3630000, h * 0.3386667)
      ..cubicTo(
          w * 0.3900000, h * 0.3143333, w * 0.4216667, h * 0.3020000, w * 0.4580000, h * 0.3020000)
      ..cubicTo(
          w * 0.4940000, h * 0.3020000, w * 0.5256667, h * 0.3143333, w * 0.5530000, h * 0.3386667)
      ..cubicTo(
          w * 0.5803333, h * 0.3630000, w * 0.5960000, h * 0.3933333, w * 0.6000000, h * 0.4290000)
      ..lineTo(w * 0.6023333, h * 0.4486667)
      ..cubicTo(
          w * 0.6023333, h * 0.4523333, w * 0.6043333, h * 0.4543333, w * 0.6083333, h * 0.4543333)
      ..lineTo(w * 0.6623333, h * 0.4543333)
      ..cubicTo(
          w * 0.6926667, h * 0.4543333, w * 0.7183333, h * 0.4650000, w * 0.7400000, h * 0.4860000)
      ..cubicTo(
          w * 0.7616667, h * 0.5070000, w * 0.7723333, h * 0.5326667, w * 0.7723333, h * 0.5623333)
      ..cubicTo(
          w * 0.7723333, h * 0.5906667, w * 0.7623333, h * 0.6153333, w * 0.7423333, h * 0.6360000)
      ..cubicTo(
          w * 0.7223333, h * 0.6566667, w * 0.6980000, h * 0.6683333, w * 0.6690000, h * 0.6706667)
      ..cubicTo(
          w * 0.6650000, h * 0.6706667, w * 0.6626667, h * 0.6726667, w * 0.6626667, h * 0.6763333)
      ..lineTo(w * 0.6626667, h * 0.7223333)
      ..cubicTo(
          w * 0.6626667, h * 0.7263333, w * 0.6646667, h * 0.7283333, w * 0.6690000, h * 0.7283333)
      ..cubicTo(
          w * 0.6983333, h * 0.7273333, w * 0.7250000, h * 0.7193333, w * 0.7493333, h * 0.7043333)
      ..cubicTo(
          w * 0.7736667, h * 0.6893333, w * 0.7930000, h * 0.6693333, w * 0.8070000, h * 0.6443333)
      ..cubicTo(
          w * 0.8210000, h * 0.6193333, w * 0.8280000, h * 0.5920000, w * 0.8280000, h * 0.5626667)
      ..cubicTo(
          w * 0.8280000, h * 0.5336667, w * 0.8206667, h * 0.5066667, w * 0.8060000, h * 0.4810000)
      ..cubicTo(
          w * 0.8323333, h * 0.4556667, w * 0.8496667, h * 0.4266667, w * 0.8580000, h * 0.3936667)
      ..lineTo(w * 0.8626667, h * 0.3696667)
      ..cubicTo(
          w * 0.8630000, h * 0.3693333, w * 0.8633333, h * 0.3683333, w * 0.8633333, h * 0.3673333)
      ..cubicTo(
          w * 0.8633333, h * 0.3650000, w * 0.8616667, h * 0.3633333, w * 0.8580000, h * 0.3623333)
      ..lineTo(w * 0.8393333, h * 0.3563333)
      ..cubicTo(
          w * 0.8203333, h * 0.3510000, w * 0.8040000, h * 0.3416667, w * 0.7906667, h * 0.3290000)
      ..cubicTo(
          w * 0.7770000, h * 0.3163333, w * 0.7673333, h * 0.3023333, w * 0.7616667, h * 0.2880000)
      ..cubicTo(
          w * 0.7560000, h * 0.2733333, w * 0.7530000, h * 0.2586667, w * 0.7530000, h * 0.2440000)
      ..cubicTo(
          w * 0.7530000, h * 0.2353333, w * 0.7540000, h * 0.2263333, w * 0.7556667, h * 0.2173333)
      ..lineTo(w * 0.7603333, h * 0.1970000)
      ..cubicTo(
          w * 0.7616667, h * 0.1936667, w * 0.7603333, h * 0.1910000, w * 0.7556667, h * 0.1893333)
      ..cubicTo(
          w * 0.7486667, h * 0.1863333, w * 0.7386667, h * 0.1836667, w * 0.7256667, h * 0.1806667)
      ..cubicTo(
          w * 0.7126667, h * 0.1776667, w * 0.7000000, h * 0.1763333, w * 0.6873333, h * 0.1763333)
      ..cubicTo(
          w * 0.6753333, h * 0.1763333, w * 0.6630000, h * 0.1776667, w * 0.6500000, h * 0.1806667)
      ..cubicTo(
          w * 0.6373333, h * 0.1836667, w * 0.6240000, h * 0.1880000, w * 0.6103333, h * 0.1943333)
      ..cubicTo(
          w * 0.5966667, h * 0.2003333, w * 0.5833333, h * 0.2093333, w * 0.5703333, h * 0.2210000)
      ..cubicTo(
          w * 0.5573333, h * 0.2326667, w * 0.5463333, h * 0.2460000, w * 0.5370000, h * 0.2616667)
      ..cubicTo(
          w * 0.5096667, h * 0.2516667, w * 0.4830000, h * 0.2466667, w * 0.4576667, h * 0.2466667)
      ..cubicTo(
          w * 0.4106667, h * 0.2466667, w * 0.3686667, h * 0.2613333, w * 0.3323333, h * 0.2903333)
      ..cubicTo(
          w * 0.2960000, h * 0.3193333, w * 0.2723333, h * 0.3566667, w * 0.2620000, h * 0.4023333)
      ..cubicTo(
          w * 0.2250000, h * 0.4110000, w * 0.1946667, h * 0.4303333, w * 0.1706667, h * 0.4603333)
      ..cubicTo(
          w * 0.1480000, h * 0.4896667, w * 0.1360000, h * 0.5240000, w * 0.1360000, h * 0.5626667)
      ..close()
      ..moveTo(w * 0.4060000, h * 0.8900000)
      ..cubicTo(
          w * 0.4060000, h * 0.8953333, w * 0.4076667, h * 0.9006667, w * 0.4110000, h * 0.9053333)
      ..cubicTo(
          w * 0.4143333, h * 0.9103333, w * 0.4193333, h * 0.9136667, w * 0.4260000, h * 0.9153333)
      ..cubicTo(
          w * 0.4296667, h * 0.9160000, w * 0.4330000, h * 0.9163333, w * 0.4360000, h * 0.9163333)
      ..cubicTo(
          w * 0.4496667, h * 0.9163333, w * 0.4580000, h * 0.9093333, w * 0.4613333, h * 0.8953333)
      ..lineTo(w * 0.5386667, h * 0.6023333)
      ..cubicTo(
          w * 0.5406667, h * 0.5943333, w * 0.5400000, h * 0.5873333, w * 0.5363333, h * 0.5806667)
      ..cubicTo(
          w * 0.5326667, h * 0.5740000, w * 0.5270000, h * 0.5696667, w * 0.5196667, h * 0.5676667)
      ..cubicTo(
          w * 0.5120000, h * 0.5653333, w * 0.5046667, h * 0.5660000, w * 0.4980000, h * 0.5696667)
      ..cubicTo(
          w * 0.4913333, h * 0.5733333, w * 0.4866667, h * 0.5786667, w * 0.4846667, h * 0.5860000)
      ..lineTo(w * 0.4073333, h * 0.8806667)
      ..cubicTo(
          w * 0.4063333, h * 0.8840000, w * 0.4060000, h * 0.8870000, w * 0.4060000, h * 0.8900000)
      ..close()
      ..moveTo(w * 0.5450000, h * 0.7893333)
      ..cubicTo(
          w * 0.5450000, h * 0.7946667, w * 0.5466667, h * 0.8000000, w * 0.5500000, h * 0.8046667)
      ..cubicTo(
          w * 0.5533333, h * 0.8093333, w * 0.5583333, h * 0.8130000, w * 0.5653333, h * 0.8150000)
      ..cubicTo(
          w * 0.5663333, h * 0.8150000, w * 0.5680000, h * 0.8150000, w * 0.5703333, h * 0.8153333)
      ..cubicTo(
          w * 0.5726667, h * 0.8156667, w * 0.5746667, h * 0.8156667, w * 0.5756667, h * 0.8156667)
      ..cubicTo(
          w * 0.5883333, h * 0.8156667, w * 0.5963333, h * 0.8086667, w * 0.5996667, h * 0.7946667)
      ..lineTo(w * 0.6496667, h * 0.6023333)
      ..cubicTo(
          w * 0.6516667, h * 0.5943333, w * 0.6510000, h * 0.5870000, w * 0.6470000, h * 0.5803333)
      ..cubicTo(
          w * 0.6433333, h * 0.5740000, w * 0.6376667, h * 0.5696667, w * 0.6300000, h * 0.5676667)
      ..cubicTo(
          w * 0.6223333, h * 0.5653333, w * 0.6150000, h * 0.5660000, w * 0.6083333, h * 0.5696667)
      ..cubicTo(
          w * 0.6016667, h * 0.5733333, w * 0.5973333, h * 0.5786667, w * 0.5953333, h * 0.5863333)
      ..lineTo(w * 0.5453333, h * 0.7803333)
      ..cubicTo(
          w * 0.5453333, h * 0.7836667, w * 0.5450000, h * 0.7866667, w * 0.5450000, h * 0.7893333)
      ..close()
      ..moveTo(w * 0.5863333, h * 0.2916667)
      ..cubicTo(
          w * 0.5973333, h * 0.2726667, w * 0.6120000, h * 0.2583333, w * 0.6306667, h * 0.2483333)
      ..cubicTo(
          w * 0.6490000, h * 0.2383333, w * 0.6686667, h * 0.2333333, w * 0.6893333, h * 0.2333333)
      ..cubicTo(
          w * 0.6933333, h * 0.2333333, w * 0.6966667, h * 0.2333333, w * 0.6983333, h * 0.2336667)
      ..lineTo(w * 0.6983333, h * 0.2443333)
      ..cubicTo(
          w * 0.6983333, h * 0.2763333, w * 0.7070000, h * 0.3066667, w * 0.7243333, h * 0.3353333)
      ..cubicTo(
          w * 0.7416667, h * 0.3640000, w * 0.7660000, h * 0.3856667, w * 0.7966667, h * 0.4010000)
      ..cubicTo(
          w * 0.7906667, h * 0.4150000, w * 0.7820000, h * 0.4266667, w * 0.7703333, h * 0.4366667)
      ..cubicTo(
          w * 0.7396667, h * 0.4103333, w * 0.7040000, h * 0.3973333, w * 0.6630000, h * 0.3973333)
      ..lineTo(w * 0.6523333, h * 0.3973333)
      ..cubicTo(
          w * 0.6430000, h * 0.3553333, w * 0.6210000, h * 0.3203333, w * 0.5863333, h * 0.2916667)
      ..close();
  }

  Path _nightClearPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.2636667, h * 0.4826667)
      ..cubicTo(
          w * 0.2636667, h * 0.4506667, w * 0.2700000, h * 0.4203333, w * 0.2823333, h * 0.3910000)
      ..cubicTo(
          w * 0.2946667, h * 0.3616667, w * 0.3116667, h * 0.3366667, w * 0.3326667, h * 0.3156667)
      ..cubicTo(
          w * 0.3536667, h * 0.2946667, w * 0.3790000, h * 0.2776667, w * 0.4083333, h * 0.2650000)
      ..cubicTo(
          w * 0.4376667, h * 0.2523333, w * 0.4683333, h * 0.2460000, w * 0.5000000, h * 0.2460000)
      ..lineTo(w * 0.5380000, h * 0.2460000)
      ..cubicTo(
          w * 0.5433333, h * 0.2473333, w * 0.5456667, h * 0.2506667, w * 0.5456667, h * 0.2553333)
      ..lineTo(w * 0.5473333, h * 0.2846667)
      ..cubicTo(
          w * 0.5486667, h * 0.3270000, w * 0.5636667, h * 0.3630000, w * 0.5930000, h * 0.3926667)
      ..cubicTo(
          w * 0.6223333, h * 0.4223333, w * 0.6576667, h * 0.4383333, w * 0.6993333, h * 0.4400000)
      ..lineTo(w * 0.7266667, h * 0.4423333)
      ..cubicTo(
          w * 0.7320000, h * 0.4423333, w * 0.7346667, h * 0.4450000, w * 0.7346667, h * 0.4500000)
      ..lineTo(w * 0.7346667, h * 0.4826667)
      ..cubicTo(
          w * 0.7350000, h * 0.5253333, w * 0.7246667, h * 0.5650000, w * 0.7036667, h * 0.6013333)
      ..cubicTo(
          w * 0.6826667, h * 0.6376667, w * 0.6543333, h * 0.6663333, w * 0.6180000, h * 0.6876667)
      ..cubicTo(
          w * 0.5820000, h * 0.7086667, w * 0.5423333, h * 0.7193333, w * 0.4996667, h * 0.7193333)
      ..cubicTo(
          w * 0.4673333, h * 0.7193333, w * 0.4363333, h * 0.7130000, w * 0.4070000, h * 0.7006667)
      ..cubicTo(
          w * 0.3776667, h * 0.6883333, w * 0.3526667, h * 0.6713333, w * 0.3316667, h * 0.6503333)
      ..cubicTo(
          w * 0.3106667, h * 0.6293333, w * 0.2940000, h * 0.6040000, w * 0.2816667, h * 0.5750000)
      ..cubicTo(
          w * 0.2700000, h * 0.5456667, w * 0.2636667, h * 0.5150000, w * 0.2636667, h * 0.4826667)
      ..close()
      ..moveTo(w * 0.3246667, h * 0.4826667)
      ..cubicTo(
          w * 0.3246667, h * 0.5080000, w * 0.3296667, h * 0.5320000, w * 0.3396667, h * 0.5546667)
      ..cubicTo(
          w * 0.3496667, h * 0.5770000, w * 0.3630000, h * 0.5960000, w * 0.3793333, h * 0.6113333)
      ..cubicTo(
          w * 0.3956667, h * 0.6266667, w * 0.4143333, h * 0.6386667, w * 0.4356667, h * 0.6473333)
      ..cubicTo(
          w * 0.4566667, h * 0.6563333, w * 0.4783333, h * 0.6606667, w * 0.5003333, h * 0.6606667)
      ..cubicTo(
          w * 0.5196667, h * 0.6606667, w * 0.5393333, h * 0.6570000, w * 0.5590000, h * 0.6493333)
      ..cubicTo(
          w * 0.5786667, h * 0.6416667, w * 0.5970000, h * 0.6310000, w * 0.6140000, h * 0.6173333)
      ..cubicTo(
          w * 0.6310000, h * 0.6036667, w * 0.6453333, h * 0.5863333, w * 0.6576667, h * 0.5650000)
      ..cubicTo(
          w * 0.6700000, h * 0.5436667, w * 0.6776667, h * 0.5206667, w * 0.6813333, h * 0.4953333)
      ..cubicTo(
          w * 0.6270000, h * 0.4840000, w * 0.5833333, h * 0.4606667, w * 0.5506667, h * 0.4253333)
      ..cubicTo(
          w * 0.5180000, h * 0.3900000, w * 0.4990000, h * 0.3486667, w * 0.4940000, h * 0.3006667)
      ..cubicTo(
          w * 0.4620000, h * 0.3026667, w * 0.4333333, h * 0.3123333, w * 0.4070000, h * 0.3300000)
      ..cubicTo(
          w * 0.3810000, h * 0.3476667, w * 0.3606667, h * 0.3700000, w * 0.3463333, h * 0.3973333)
      ..cubicTo(
          w * 0.3320000, h * 0.4246667, w * 0.3246667, h * 0.4530000, w * 0.3246667, h * 0.4826667)
      ..close();
  }

  Path _nightFogPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.08866667, h * 0.6973333)
      ..cubicTo(w * 0.08866667, h * 0.7050000, w * 0.09133333, h * 0.7113333, w * 0.09700000,
          h * 0.7163333)
      ..cubicTo(
          w * 0.1026667, h * 0.7216667, w * 0.1096667, h * 0.7240000, w * 0.1176667, h * 0.7240000)
      ..lineTo(w * 0.7380000, h * 0.7240000)
      ..cubicTo(
          w * 0.7460000, h * 0.7240000, w * 0.7526667, h * 0.7213333, w * 0.7580000, h * 0.7163333)
      ..cubicTo(
          w * 0.7636667, h * 0.7110000, w * 0.7663333, h * 0.7046667, w * 0.7663333, h * 0.6973333)
      ..cubicTo(
          w * 0.7663333, h * 0.6893333, w * 0.7636667, h * 0.6823333, w * 0.7583333, h * 0.6770000)
      ..cubicTo(
          w * 0.7530000, h * 0.6713333, w * 0.7460000, h * 0.6686667, w * 0.7380000, h * 0.6686667)
      ..lineTo(w * 0.1176667, h * 0.6686667)
      ..cubicTo(
          w * 0.1096667, h * 0.6686667, w * 0.1030000, h * 0.6713333, w * 0.09733333, h * 0.6770000)
      ..cubicTo(w * 0.09166667, h * 0.6826667, w * 0.08866667, h * 0.6896667, w * 0.08866667,
          h * 0.6973333)
      ..close()
      ..moveTo(w * 0.1756667, h * 0.5936667)
      ..cubicTo(
          w * 0.1756667, h * 0.6016667, w * 0.1786667, h * 0.6080000, w * 0.1843333, h * 0.6133333)
      ..cubicTo(
          w * 0.1890000, h * 0.6193333, w * 0.1953333, h * 0.6223333, w * 0.2040000, h * 0.6223333)
      ..lineTo(w * 0.8243333, h * 0.6223333)
      ..cubicTo(
          w * 0.8320000, h * 0.6223333, w * 0.8383333, h * 0.6196667, w * 0.8436667, h * 0.6140000)
      ..cubicTo(
          w * 0.8490000, h * 0.6083333, w * 0.8513333, h * 0.6016667, w * 0.8513333, h * 0.5936667)
      ..cubicTo(
          w * 0.8513333, h * 0.5860000, w * 0.8486667, h * 0.5793333, w * 0.8436667, h * 0.5743333)
      ..cubicTo(
          w * 0.8386667, h * 0.5693333, w * 0.8320000, h * 0.5666667, w * 0.8243333, h * 0.5666667)
      ..lineTo(w * 0.2040000, h * 0.5666667)
      ..cubicTo(
          w * 0.1960000, h * 0.5666667, w * 0.1893333, h * 0.5693333, w * 0.1840000, h * 0.5743333)
      ..cubicTo(
          w * 0.1783333, h * 0.5796667, w * 0.1756667, h * 0.5860000, w * 0.1756667, h * 0.5936667)
      ..close()
      ..moveTo(w * 0.1806667, h * 0.5130000)
      ..lineTo(w * 0.1806667, h * 0.5113333)
      ..cubicTo(
          w * 0.1793333, h * 0.5163333, w * 0.1806667, h * 0.5186667, w * 0.1846667, h * 0.5186667)
      ..lineTo(w * 0.2326667, h * 0.5186667)
      ..cubicTo(
          w * 0.2346667, h * 0.5186667, w * 0.2366667, h * 0.5170000, w * 0.2390000, h * 0.5136667)
      ..cubicTo(
          w * 0.2470000, h * 0.4963333, w * 0.2586667, h * 0.4823333, w * 0.2743333, h * 0.4713333)
      ..cubicTo(
          w * 0.2900000, h * 0.4603333, w * 0.3073333, h * 0.4540000, w * 0.3260000, h * 0.4526667)
      ..lineTo(w * 0.3436667, h * 0.4500000)
      ..cubicTo(
          w * 0.3476667, h * 0.4500000, w * 0.3500000, h * 0.4480000, w * 0.3500000, h * 0.4440000)
      ..lineTo(w * 0.3520000, h * 0.4273333)
      ..cubicTo(
          w * 0.3556667, h * 0.3913333, w * 0.3706667, h * 0.3616667, w * 0.3973333, h * 0.3373333)
      ..cubicTo(
          w * 0.4240000, h * 0.3133333, w * 0.4556667, h * 0.3013333, w * 0.4920000, h * 0.3013333)
      ..cubicTo(
          w * 0.5276667, h * 0.3013333, w * 0.5593333, h * 0.3133333, w * 0.5860000, h * 0.3370000)
      ..cubicTo(
          w * 0.6126667, h * 0.3606667, w * 0.6283333, h * 0.3903333, w * 0.6320000, h * 0.4260000)
      ..lineTo(w * 0.6343333, h * 0.4450000)
      ..cubicTo(
          w * 0.6343333, h * 0.4490000, w * 0.6366667, h * 0.4510000, w * 0.6413333, h * 0.4510000)
      ..lineTo(w * 0.6940000, h * 0.4510000)
      ..cubicTo(
          w * 0.7153333, h * 0.4510000, w * 0.7350000, h * 0.4566667, w * 0.7523333, h * 0.4683333)
      ..cubicTo(
          w * 0.7696667, h * 0.4796667, w * 0.7830000, h * 0.4950000, w * 0.7913333, h * 0.5136667)
      ..cubicTo(
          w * 0.7936667, h * 0.5170000, w * 0.7960000, h * 0.5186667, w * 0.7986667, h * 0.5186667)
      ..lineTo(w * 0.8460000, h * 0.5186667)
      ..cubicTo(
          w * 0.8500000, h * 0.5186667, w * 0.8516667, h * 0.5163333, w * 0.8510000, h * 0.5113333)
      ..cubicTo(
          w * 0.8436667, h * 0.4926667, w * 0.8386667, h * 0.4810000, w * 0.8356667, h * 0.4760000)
      ..cubicTo(
          w * 0.8596667, h * 0.4543333, w * 0.8766667, h * 0.4256667, w * 0.8856667, h * 0.3903333)
      ..lineTo(w * 0.8913333, h * 0.3683333)
      ..cubicTo(
          w * 0.8923333, h * 0.3663333, w * 0.8920000, h * 0.3643333, w * 0.8910000, h * 0.3630000)
      ..cubicTo(
          w * 0.8900000, h * 0.3616667, w * 0.8886667, h * 0.3606667, w * 0.8870000, h * 0.3606667)
      ..lineTo(w * 0.8663333, h * 0.3533333)
      ..cubicTo(
          w * 0.8366667, h * 0.3446667, w * 0.8140000, h * 0.3273333, w * 0.7983333, h * 0.3006667)
      ..cubicTo(
          w * 0.7826667, h * 0.2740000, w * 0.7786667, h * 0.2456667, w * 0.7860000, h * 0.2153333)
      ..lineTo(w * 0.7903333, h * 0.1960000)
      ..cubicTo(
          w * 0.7920000, h * 0.1930000, w * 0.7906667, h * 0.1903333, w * 0.7860000, h * 0.1883333)
      ..lineTo(w * 0.7580000, h * 0.1806667)
      ..cubicTo(
          w * 0.7216667, h * 0.1716667, w * 0.6856667, h * 0.1746667, w * 0.6506667, h * 0.1893333)
      ..cubicTo(
          w * 0.6156667, h * 0.2040000, w * 0.5883333, h * 0.2276667, w * 0.5683333, h * 0.2600000)
      ..cubicTo(
          w * 0.5420000, h * 0.2496667, w * 0.5163333, h * 0.2446667, w * 0.4920000, h * 0.2446667)
      ..cubicTo(
          w * 0.4456667, h * 0.2446667, w * 0.4046667, h * 0.2593333, w * 0.3683333, h * 0.2883333)
      ..cubicTo(
          w * 0.3320000, h * 0.3173333, w * 0.3090000, h * 0.3546667, w * 0.2983333, h * 0.4000000)
      ..cubicTo(
          w * 0.2703333, h * 0.4066667, w * 0.2456667, h * 0.4200000, w * 0.2243333, h * 0.4403333)
      ..cubicTo(
          w * 0.2030000, h * 0.4606667, w * 0.1890000, h * 0.4850000, w * 0.1806667, h * 0.5130000)
      ..close()
      ..moveTo(w * 0.2333333, h * 0.7990000)
      ..cubicTo(
          w * 0.2333333, h * 0.8070000, w * 0.2363333, h * 0.8133333, w * 0.2420000, h * 0.8186667)
      ..cubicTo(
          w * 0.2476667, h * 0.8246667, w * 0.2543333, h * 0.8276667, w * 0.2616667, h * 0.8276667)
      ..lineTo(w * 0.8833333, h * 0.8276667)
      ..cubicTo(
          w * 0.8910000, h * 0.8276667, w * 0.8976667, h * 0.8250000, w * 0.9030000, h * 0.8193333)
      ..cubicTo(
          w * 0.9083333, h * 0.8136667, w * 0.9110000, h * 0.8070000, w * 0.9110000, h * 0.7990000)
      ..cubicTo(
          w * 0.9110000, h * 0.7913333, w * 0.9083333, h * 0.7850000, w * 0.9030000, h * 0.7796667)
      ..cubicTo(
          w * 0.8976667, h * 0.7743333, w * 0.8910000, h * 0.7720000, w * 0.8833333, h * 0.7720000)
      ..lineTo(w * 0.2620000, h * 0.7720000)
      ..cubicTo(
          w * 0.2540000, h * 0.7720000, w * 0.2473333, h * 0.7746667, w * 0.2420000, h * 0.7796667)
      ..cubicTo(
          w * 0.2363333, h * 0.7850000, w * 0.2333333, h * 0.7913333, w * 0.2333333, h * 0.7990000)
      ..close()
      ..moveTo(w * 0.6170000, h * 0.2900000)
      ..cubicTo(
          w * 0.6286667, h * 0.2710000, w * 0.6443333, h * 0.2560000, w * 0.6640000, h * 0.2456667)
      ..cubicTo(
          w * 0.6836667, h * 0.2353333, w * 0.7043333, h * 0.2310000, w * 0.7263333, h * 0.2330000)
      ..cubicTo(
          w * 0.7240000, h * 0.2676667, w * 0.7320000, h * 0.3003333, w * 0.7496667, h * 0.3306667)
      ..cubicTo(
          w * 0.7676667, h * 0.3610000, w * 0.7923333, h * 0.3833333, w * 0.8236667, h * 0.3980000)
      ..cubicTo(
          w * 0.8186667, h * 0.4096667, w * 0.8103333, h * 0.4216667, w * 0.7986667, h * 0.4336667)
      ..cubicTo(
          w * 0.7680000, h * 0.4083333, w * 0.7330000, h * 0.3960000, w * 0.6940000, h * 0.3960000)
      ..lineTo(w * 0.6833333, h * 0.3960000)
      ..cubicTo(
          w * 0.6726667, h * 0.3523333, w * 0.6506667, h * 0.3170000, w * 0.6170000, h * 0.2900000)
      ..close();
  }

  Path _rainPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1546667, h * 0.5636667)
      ..cubicTo(
          w * 0.1546667, h * 0.5253333, w * 0.1666667, h * 0.4913333, w * 0.1906667, h * 0.4613333)
      ..cubicTo(
          w * 0.2146667, h * 0.4313333, w * 0.2450000, h * 0.4123333, w * 0.2816667, h * 0.4036667)
      ..cubicTo(
          w * 0.2920000, h * 0.3583333, w * 0.3156667, h * 0.3210000, w * 0.3520000, h * 0.2916667)
      ..cubicTo(
          w * 0.3883333, h * 0.2623333, w * 0.4300000, h * 0.2480000, w * 0.4770000, h * 0.2480000)
      ..cubicTo(
          w * 0.5230000, h * 0.2480000, w * 0.5636667, h * 0.2623333, w * 0.5996667, h * 0.2906667)
      ..cubicTo(
          w * 0.6356667, h * 0.3190000, w * 0.6590000, h * 0.3556667, w * 0.6696667, h * 0.4003333)
      ..lineTo(w * 0.6803333, h * 0.4003333)
      ..cubicTo(
          w * 0.7100000, h * 0.4003333, w * 0.7376667, h * 0.4076667, w * 0.7630000, h * 0.4220000)
      ..cubicTo(
          w * 0.7883333, h * 0.4363333, w * 0.8086667, h * 0.4563333, w * 0.8233333, h * 0.4813333)
      ..cubicTo(
          w * 0.8380000, h * 0.5063333, w * 0.8456667, h * 0.5340000, w * 0.8456667, h * 0.5636667)
      ..cubicTo(
          w * 0.8456667, h * 0.5930000, w * 0.8386667, h * 0.6200000, w * 0.8246667, h * 0.6450000)
      ..cubicTo(
          w * 0.8106667, h * 0.6700000, w * 0.7913333, h * 0.6900000, w * 0.7670000, h * 0.7050000)
      ..cubicTo(
          w * 0.7426667, h * 0.7200000, w * 0.7160000, h * 0.7280000, w * 0.6870000, h * 0.7286667)
      ..cubicTo(
          w * 0.6826667, h * 0.7286667, w * 0.6803333, h * 0.7266667, w * 0.6803333, h * 0.7230000)
      ..lineTo(w * 0.6803333, h * 0.6786667)
      ..cubicTo(
          w * 0.6803333, h * 0.6746667, w * 0.6826667, h * 0.6726667, w * 0.6870000, h * 0.6726667)
      ..cubicTo(
          w * 0.7153333, h * 0.6713333, w * 0.7396667, h * 0.6600000, w * 0.7596667, h * 0.6386667)
      ..cubicTo(
          w * 0.7796667, h * 0.6173333, w * 0.7896667, h * 0.5923333, w * 0.7896667, h * 0.5633333)
      ..cubicTo(
          w * 0.7896667, h * 0.5343333, w * 0.7786667, h * 0.5093333, w * 0.7570000, h * 0.4880000)
      ..cubicTo(
          w * 0.7353333, h * 0.4666667, w * 0.7096667, h * 0.4560000, w * 0.6800000, h * 0.4560000)
      ..lineTo(w * 0.6263333, h * 0.4560000)
      ..cubicTo(
          w * 0.6223333, h * 0.4560000, w * 0.6203333, h * 0.4540000, w * 0.6203333, h * 0.4503333)
      ..lineTo(w * 0.6176667, h * 0.4310000)
      ..cubicTo(
          w * 0.6140000, h * 0.3950000, w * 0.5983333, h * 0.3646667, w * 0.5713333, h * 0.3406667)
      ..cubicTo(
          w * 0.5440000, h * 0.3163333, w * 0.5126667, h * 0.3043333, w * 0.4763333, h * 0.3043333)
      ..cubicTo(
          w * 0.4400000, h * 0.3043333, w * 0.4080000, h * 0.3163333, w * 0.3813333, h * 0.3406667)
      ..cubicTo(
          w * 0.3543333, h * 0.3650000, w * 0.3393333, h * 0.3950000, w * 0.3360000, h * 0.4310000)
      ..lineTo(w * 0.3336667, h * 0.4486667)
      ..cubicTo(
          w * 0.3336667, h * 0.4526667, w * 0.3313333, h * 0.4550000, w * 0.3270000, h * 0.4550000)
      ..lineTo(w * 0.3093333, h * 0.4560000)
      ..cubicTo(
          w * 0.2816667, h * 0.4593333, w * 0.2583333, h * 0.4713333, w * 0.2393333, h * 0.4916667)
      ..cubicTo(
          w * 0.2203333, h * 0.5120000, w * 0.2110000, h * 0.5360000, w * 0.2110000, h * 0.5636667)
      ..cubicTo(
          w * 0.2110000, h * 0.5926667, w * 0.2210000, h * 0.6176667, w * 0.2410000, h * 0.6390000)
      ..cubicTo(
          w * 0.2610000, h * 0.6603333, w * 0.2853333, h * 0.6716667, w * 0.3136667, h * 0.6730000)
      ..cubicTo(
          w * 0.3173333, h * 0.6730000, w * 0.3193333, h * 0.6750000, w * 0.3193333, h * 0.6790000)
      ..lineTo(w * 0.3193333, h * 0.7233333)
      ..cubicTo(
          w * 0.3193333, h * 0.7270000, w * 0.3173333, h * 0.7290000, w * 0.3136667, h * 0.7290000)
      ..cubicTo(
          w * 0.2690000, h * 0.7270000, w * 0.2313333, h * 0.7100000, w * 0.2003333, h * 0.6780000)
      ..cubicTo(
          w * 0.1693333, h * 0.6460000, w * 0.1546667, h * 0.6080000, w * 0.1546667, h * 0.5636667)
      ..close()
      ..moveTo(w * 0.3330000, h * 0.7866667)
      ..cubicTo(
          w * 0.3330000, h * 0.7853333, w * 0.3333333, h * 0.7830000, w * 0.3343333, h * 0.7800000)
      ..lineTo(w * 0.3886667, h * 0.5876667)
      ..cubicTo(
          w * 0.3906667, h * 0.5813333, w * 0.3943333, h * 0.5763333, w * 0.3993333, h * 0.5730000)
      ..cubicTo(
          w * 0.4043333, h * 0.5696667, w * 0.4096667, h * 0.5680000, w * 0.4146667, h * 0.5680000)
      ..cubicTo(
          w * 0.4170000, h * 0.5680000, w * 0.4196667, h * 0.5683333, w * 0.4226667, h * 0.5690000)
      ..cubicTo(
          w * 0.4306667, h * 0.5703333, w * 0.4366667, h * 0.5746667, w * 0.4406667, h * 0.5813333)
      ..cubicTo(
          w * 0.4446667, h * 0.5880000, w * 0.4456667, h * 0.5953333, w * 0.4433333, h * 0.6036667)
      ..lineTo(w * 0.3890000, h * 0.7946667)
      ..cubicTo(
          w * 0.3850000, h * 0.8090000, w * 0.3756667, h * 0.8160000, w * 0.3616667, h * 0.8160000)
      ..cubicTo(
          w * 0.3603333, h * 0.8160000, w * 0.3593333, h * 0.8156667, w * 0.3580000, h * 0.8153333)
      ..cubicTo(
          w * 0.3560000, h * 0.8146667, w * 0.3550000, h * 0.8143333, w * 0.3546667, h * 0.8143333)
      ..cubicTo(
          w * 0.3473333, h * 0.8123333, w * 0.3420000, h * 0.8086667, w * 0.3383333, h * 0.8033333)
      ..cubicTo(
          w * 0.3346667, h * 0.7976667, w * 0.3330000, h * 0.7923333, w * 0.3330000, h * 0.7866667)
      ..close()
      ..moveTo(w * 0.4203333, h * 0.8803333)
      ..lineTo(w * 0.5016667, h * 0.5880000)
      ..cubicTo(
          w * 0.5030000, h * 0.5816667, w * 0.5063333, h * 0.5766667, w * 0.5116667, h * 0.5733333)
      ..cubicTo(
          w * 0.5170000, h * 0.5700000, w * 0.5223333, h * 0.5683333, w * 0.5280000, h * 0.5683333)
      ..cubicTo(
          w * 0.5310000, h * 0.5683333, w * 0.5340000, h * 0.5686667, w * 0.5370000, h * 0.5693333)
      ..cubicTo(
          w * 0.5443333, h * 0.5713333, w * 0.5496667, h * 0.5756667, w * 0.5533333, h * 0.5823333)
      ..cubicTo(
          w * 0.5570000, h * 0.5890000, w * 0.5576667, h * 0.5960000, w * 0.5556667, h * 0.6036667)
      ..lineTo(w * 0.4746667, h * 0.8963333)
      ..cubicTo(
          w * 0.4733333, h * 0.9020000, w * 0.4703333, h * 0.9066667, w * 0.4650000, h * 0.9106667)
      ..cubicTo(
          w * 0.4596667, h * 0.9146667, w * 0.4543333, h * 0.9166667, w * 0.4480000, h * 0.9166667)
      ..cubicTo(
          w * 0.4450000, h * 0.9166667, w * 0.4420000, h * 0.9160000, w * 0.4396667, h * 0.9150000)
      ..cubicTo(
          w * 0.4330000, h * 0.9133333, w * 0.4273333, h * 0.9090000, w * 0.4223333, h * 0.9020000)
      ..cubicTo(
          w * 0.4186667, h * 0.8960000, w * 0.4180000, h * 0.8890000, w * 0.4203333, h * 0.8803333)
      ..close()
      ..moveTo(w * 0.5580000, h * 0.7873333)
      ..cubicTo(
          w * 0.5580000, h * 0.7860000, w * 0.5583333, h * 0.7836667, w * 0.5593333, h * 0.7796667)
      ..lineTo(w * 0.6136667, h * 0.5873333)
      ..cubicTo(
          w * 0.6156667, h * 0.5810000, w * 0.6190000, h * 0.5760000, w * 0.6236667, h * 0.5726667)
      ..cubicTo(
          w * 0.6286667, h * 0.5693333, w * 0.6336667, h * 0.5676667, w * 0.6390000, h * 0.5676667)
      ..cubicTo(
          w * 0.6416667, h * 0.5676667, w * 0.6446667, h * 0.5680000, w * 0.6476667, h * 0.5686667)
      ..cubicTo(
          w * 0.6546667, h * 0.5706667, w * 0.6596667, h * 0.5740000, w * 0.6630000, h * 0.5790000)
      ..cubicTo(
          w * 0.6663333, h * 0.5840000, w * 0.6680000, h * 0.5893333, w * 0.6680000, h * 0.5946667)
      ..cubicTo(
          w * 0.6680000, h * 0.5956667, w * 0.6676667, h * 0.5973333, w * 0.6673333, h * 0.5993333)
      ..cubicTo(
          w * 0.6670000, h * 0.6013333, w * 0.6666667, h * 0.6026667, w * 0.6666667, h * 0.6033333)
      ..lineTo(w * 0.6123333, h * 0.7943333)
      ..cubicTo(
          w * 0.6110000, h * 0.8006667, w * 0.6080000, h * 0.8060000, w * 0.6030000, h * 0.8096667)
      ..cubicTo(
          w * 0.5980000, h * 0.8133333, w * 0.5923333, h * 0.8153333, w * 0.5860000, h * 0.8153333)
      ..lineTo(w * 0.5780000, h * 0.8136667)
      ..cubicTo(
          w * 0.5713333, h * 0.8116667, w * 0.5663333, h * 0.8083333, w * 0.5626667, h * 0.8030000)
      ..cubicTo(
          w * 0.5596667, h * 0.7980000, w * 0.5580000, h * 0.7926667, w * 0.5580000, h * 0.7873333)
      ..close();
  }

  Path _rainMixPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1550000, h * 0.5653333)
      ..cubicTo(
          w * 0.1550000, h * 0.6093333, w * 0.1706667, h * 0.6473333, w * 0.2016667, h * 0.6790000)
      ..cubicTo(
          w * 0.2326667, h * 0.7110000, w * 0.2703333, h * 0.7276667, w * 0.3143333, h * 0.7290000)
      ..cubicTo(
          w * 0.3183333, h * 0.7290000, w * 0.3203333, h * 0.7270000, w * 0.3203333, h * 0.7233333)
      ..lineTo(w * 0.3203333, h * 0.6790000)
      ..cubicTo(
          w * 0.3203333, h * 0.6750000, w * 0.3183333, h * 0.6730000, w * 0.3143333, h * 0.6730000)
      ..cubicTo(
          w * 0.2863333, h * 0.6716667, w * 0.2620000, h * 0.6603333, w * 0.2420000, h * 0.6390000)
      ..cubicTo(
          w * 0.2220000, h * 0.6176667, w * 0.2116667, h * 0.5933333, w * 0.2116667, h * 0.5650000)
      ..cubicTo(
          w * 0.2116667, h * 0.5370000, w * 0.2210000, h * 0.5126667, w * 0.2400000, h * 0.4920000)
      ..cubicTo(
          w * 0.2590000, h * 0.4713333, w * 0.2820000, h * 0.4596667, w * 0.3100000, h * 0.4573333)
      ..lineTo(w * 0.3276667, h * 0.4550000)
      ..cubicTo(
          w * 0.3316667, h * 0.4550000, w * 0.3340000, h * 0.4530000, w * 0.3340000, h * 0.4490000)
      ..lineTo(w * 0.3363333, h * 0.4323333)
      ..cubicTo(
          w * 0.3396667, h * 0.3960000, w * 0.3546667, h * 0.3653333, w * 0.3816667, h * 0.3406667)
      ..cubicTo(
          w * 0.4086667, h * 0.3160000, w * 0.4403333, h * 0.3036667, w * 0.4770000, h * 0.3036667)
      ..cubicTo(
          w * 0.5130000, h * 0.3036667, w * 0.5446667, h * 0.3160000, w * 0.5716667, h * 0.3403333)
      ..cubicTo(
          w * 0.5986667, h * 0.3646667, w * 0.6143333, h * 0.3946667, w * 0.6183333, h * 0.4306667)
      ..lineTo(w * 0.6206667, h * 0.4500000)
      ..cubicTo(
          w * 0.6206667, h * 0.4540000, w * 0.6226667, h * 0.4560000, w * 0.6270000, h * 0.4560000)
      ..lineTo(w * 0.6803333, h * 0.4560000)
      ..cubicTo(
          w * 0.7103333, h * 0.4560000, w * 0.7360000, h * 0.4666667, w * 0.7576667, h * 0.4883333)
      ..cubicTo(
          w * 0.7790000, h * 0.5096667, w * 0.7900000, h * 0.5353333, w * 0.7900000, h * 0.5650000)
      ..cubicTo(
          w * 0.7900000, h * 0.5930000, w * 0.7800000, h * 0.6176667, w * 0.7600000, h * 0.6390000)
      ..cubicTo(
          w * 0.7400000, h * 0.6600000, w * 0.7156667, h * 0.6713333, w * 0.6873333, h * 0.6730000)
      ..cubicTo(
          w * 0.6830000, h * 0.6730000, w * 0.6806667, h * 0.6750000, w * 0.6806667, h * 0.6790000)
      ..lineTo(w * 0.6806667, h * 0.7233333)
      ..cubicTo(
          w * 0.6806667, h * 0.7270000, w * 0.6830000, h * 0.7290000, w * 0.6873333, h * 0.7290000)
      ..cubicTo(
          w * 0.7316667, h * 0.7276667, w * 0.7693333, h * 0.7110000, w * 0.8000000, h * 0.6790000)
      ..cubicTo(
          w * 0.8306667, h * 0.6470000, w * 0.8460000, h * 0.6093333, w * 0.8460000, h * 0.5650000)
      ..cubicTo(
          w * 0.8460000, h * 0.5353333, w * 0.8386667, h * 0.5076667, w * 0.8236667, h * 0.4823333)
      ..cubicTo(
          w * 0.8090000, h * 0.4570000, w * 0.7886667, h * 0.4370000, w * 0.7633333, h * 0.4223333)
      ..cubicTo(
          w * 0.7380000, h * 0.4076667, w * 0.7103333, h * 0.4003333, w * 0.6806667, h * 0.4003333)
      ..lineTo(w * 0.6703333, h * 0.4003333)
      ..cubicTo(
          w * 0.6593333, h * 0.3556667, w * 0.6360000, h * 0.3193333, w * 0.6000000, h * 0.2906667)
      ..cubicTo(
          w * 0.5643333, h * 0.2623333, w * 0.5233333, h * 0.2480000, w * 0.4773333, h * 0.2480000)
      ..cubicTo(
          w * 0.4303333, h * 0.2480000, w * 0.3886667, h * 0.2626667, w * 0.3523333, h * 0.2916667)
      ..cubicTo(
          w * 0.3160000, h * 0.3206667, w * 0.2926667, h * 0.3580000, w * 0.2823333, h * 0.4033333)
      ..cubicTo(
          w * 0.2446667, h * 0.4130000, w * 0.2143333, h * 0.4326667, w * 0.1906667, h * 0.4623333)
      ..cubicTo(
          w * 0.1670000, h * 0.4920000, w * 0.1550000, h * 0.5266667, w * 0.1550000, h * 0.5653333)
      ..close()
      ..moveTo(w * 0.3350000, h * 0.7993333)
      ..cubicTo(
          w * 0.3350000, h * 0.8050000, w * 0.3366667, h * 0.8106667, w * 0.3403333, h * 0.8163333)
      ..cubicTo(
          w * 0.3440000, h * 0.8220000, w * 0.3493333, h * 0.8256667, w * 0.3560000, h * 0.8280000)
      ..cubicTo(
          w * 0.3636667, h * 0.8303333, w * 0.3706667, h * 0.8300000, w * 0.3773333, h * 0.8266667)
      ..cubicTo(
          w * 0.3836667, h * 0.8236667, w * 0.3883333, h * 0.8173333, w * 0.3903333, h * 0.8080000)
      ..lineTo(w * 0.3950000, h * 0.7876667)
      ..cubicTo(
          w * 0.3966667, h * 0.7800000, w * 0.3956667, h * 0.7730000, w * 0.3920000, h * 0.7666667)
      ..cubicTo(
          w * 0.3883333, h * 0.7603333, w * 0.3826667, h * 0.7556667, w * 0.3746667, h * 0.7533333)
      ..cubicTo(
          w * 0.3673333, h * 0.7510000, w * 0.3600000, h * 0.7520000, w * 0.3533333, h * 0.7560000)
      ..cubicTo(
          w * 0.3466667, h * 0.7600000, w * 0.3420000, h * 0.7660000, w * 0.3400000, h * 0.7736667)
      ..lineTo(w * 0.3353333, h * 0.7933333)
      ..cubicTo(
          w * 0.3353333, h * 0.7943333, w * 0.3350000, h * 0.7963333, w * 0.3350000, h * 0.7993333)
      ..close()
      ..moveTo(w * 0.3603333, h * 0.7026667)
      ..cubicTo(
          w * 0.3603333, h * 0.7096667, w * 0.3630000, h * 0.7160000, w * 0.3686667, h * 0.7216667)
      ..cubicTo(
          w * 0.3740000, h * 0.7273333, w * 0.3800000, h * 0.7300000, w * 0.3873333, h * 0.7300000)
      ..cubicTo(
          w * 0.3953333, h * 0.7300000, w * 0.4020000, h * 0.7273333, w * 0.4073333, h * 0.7220000)
      ..cubicTo(
          w * 0.4126667, h * 0.7166667, w * 0.4153333, h * 0.7103333, w * 0.4153333, h * 0.7023333)
      ..cubicTo(
          w * 0.4153333, h * 0.6946667, w * 0.4126667, h * 0.6880000, w * 0.4073333, h * 0.6826667)
      ..cubicTo(
          w * 0.4020000, h * 0.6773333, w * 0.3953333, h * 0.6746667, w * 0.3873333, h * 0.6746667)
      ..cubicTo(
          w * 0.3796667, h * 0.6746667, w * 0.3733333, h * 0.6773333, w * 0.3680000, h * 0.6823333)
      ..cubicTo(
          w * 0.3630000, h * 0.6883333, w * 0.3603333, h * 0.6950000, w * 0.3603333, h * 0.7026667)
      ..close()
      ..moveTo(w * 0.3806667, h * 0.6270000)
      ..cubicTo(
          w * 0.3803333, h * 0.6323333, w * 0.3816667, h * 0.6373333, w * 0.3853333, h * 0.6420000)
      ..cubicTo(
          w * 0.3886667, h * 0.6470000, w * 0.3940000, h * 0.6503333, w * 0.4013333, h * 0.6526667)
      ..cubicTo(
          w * 0.4083333, h * 0.6546667, w * 0.4150000, h * 0.6540000, w * 0.4220000, h * 0.6503333)
      ..cubicTo(
          w * 0.4290000, h * 0.6466667, w * 0.4333333, h * 0.6410000, w * 0.4356667, h * 0.6333333)
      ..lineTo(w * 0.4450000, h * 0.6033333)
      ..cubicTo(
          w * 0.4473333, h * 0.5953333, w * 0.4466667, h * 0.5880000, w * 0.4426667, h * 0.5816667)
      ..cubicTo(
          w * 0.4386667, h * 0.5753333, w * 0.4326667, h * 0.5710000, w * 0.4246667, h * 0.5686667)
      ..cubicTo(
          w * 0.4173333, h * 0.5663333, w * 0.4103333, h * 0.5670000, w * 0.4036667, h * 0.5710000)
      ..cubicTo(
          w * 0.3970000, h * 0.5746667, w * 0.3923333, h * 0.5803333, w * 0.3900000, h * 0.5876667)
      ..lineTo(w * 0.3820000, h * 0.6183333)
      ..cubicTo(
          w * 0.3820000, h * 0.6190000, w * 0.3816667, h * 0.6203333, w * 0.3813333, h * 0.6223333)
      ..cubicTo(
          w * 0.3810000, h * 0.6240000, w * 0.3806667, h * 0.6256667, w * 0.3806667, h * 0.6270000)
      ..close()
      ..moveTo(w * 0.4196667, h * 0.9033333)
      ..cubicTo(
          w * 0.4196667, h * 0.9093333, w * 0.4213333, h * 0.9146667, w * 0.4246667, h * 0.9200000)
      ..cubicTo(
          w * 0.4280000, h * 0.9253333, w * 0.4333333, h * 0.9290000, w * 0.4406667, h * 0.9310000)
      ..cubicTo(
          w * 0.4433333, h * 0.9316667, w * 0.4463333, h * 0.9320000, w * 0.4490000, h * 0.9320000)
      ..cubicTo(
          w * 0.4633333, h * 0.9320000, w * 0.4720000, h * 0.9253333, w * 0.4753333, h * 0.9116667)
      ..lineTo(w * 0.4800000, h * 0.8920000)
      ..cubicTo(
          w * 0.4820000, h * 0.8833333, w * 0.4810000, h * 0.8760000, w * 0.4773333, h * 0.8693333)
      ..cubicTo(
          w * 0.4733333, h * 0.8626667, w * 0.4676667, h * 0.8586667, w * 0.4600000, h * 0.8570000)
      ..cubicTo(
          w * 0.4530000, h * 0.8546667, w * 0.4460000, h * 0.8553333, w * 0.4390000, h * 0.8593333)
      ..cubicTo(
          w * 0.4320000, h * 0.8633333, w * 0.4276667, h * 0.8690000, w * 0.4253333, h * 0.8763333)
      ..lineTo(w * 0.4206667, h * 0.8960000)
      ..cubicTo(
          w * 0.4200000, h * 0.8990000, w * 0.4196667, h * 0.9013333, w * 0.4196667, h * 0.9033333)
      ..close()
      ..moveTo(w * 0.4453333, h * 0.8066667)
      ..cubicTo(
          w * 0.4453333, h * 0.8140000, w * 0.4480000, h * 0.8203333, w * 0.4536667, h * 0.8260000)
      ..cubicTo(
          w * 0.4590000, h * 0.8313333, w * 0.4653333, h * 0.8340000, w * 0.4726667, h * 0.8340000)
      ..cubicTo(
          w * 0.4806667, h * 0.8340000, w * 0.4870000, h * 0.8313333, w * 0.4923333, h * 0.8263333)
      ..cubicTo(
          w * 0.4976667, h * 0.8210000, w * 0.5000000, h * 0.8146667, w * 0.5000000, h * 0.8066667)
      ..cubicTo(
          w * 0.5000000, h * 0.7990000, w * 0.4973333, h * 0.7926667, w * 0.4923333, h * 0.7873333)
      ..cubicTo(
          w * 0.4870000, h * 0.7820000, w * 0.4806667, h * 0.7796667, w * 0.4726667, h * 0.7796667)
      ..cubicTo(
          w * 0.4646667, h * 0.7796667, w * 0.4583333, h * 0.7823333, w * 0.4530000, h * 0.7873333)
      ..cubicTo(
          w * 0.4476667, h * 0.7923333, w * 0.4453333, h * 0.7990000, w * 0.4453333, h * 0.8066667)
      ..close()
      ..moveTo(w * 0.4663333, h * 0.7310000)
      ..cubicTo(
          w * 0.4660000, h * 0.7360000, w * 0.4673333, h * 0.7413333, w * 0.4706667, h * 0.7466667)
      ..cubicTo(
          w * 0.4740000, h * 0.7520000, w * 0.4790000, h * 0.7553333, w * 0.4856667, h * 0.7566667)
      ..cubicTo(
          w * 0.4933333, h * 0.7586667, w * 0.5003333, h * 0.7580000, w * 0.5070000, h * 0.7546667)
      ..cubicTo(
          w * 0.5136667, h * 0.7513333, w * 0.5180000, h * 0.7450000, w * 0.5206667, h * 0.7360000)
      ..lineTo(w * 0.5296667, h * 0.7060000)
      ..cubicTo(
          w * 0.5320000, h * 0.6986667, w * 0.5313333, h * 0.6916667, w * 0.5273333, h * 0.6850000)
      ..cubicTo(
          w * 0.5233333, h * 0.6783333, w * 0.5176667, h * 0.6740000, w * 0.5096667, h * 0.6716667)
      ..cubicTo(
          w * 0.5023333, h * 0.6693333, w * 0.4953333, h * 0.6703333, w * 0.4883333, h * 0.6743333)
      ..cubicTo(
          w * 0.4813333, h * 0.6783333, w * 0.4770000, h * 0.6843333, w * 0.4746667, h * 0.6920000)
      ..lineTo(w * 0.4670000, h * 0.7220000)
      ..cubicTo(
          w * 0.4666667, h * 0.7246667, w * 0.4663333, h * 0.7276667, w * 0.4663333, h * 0.7310000)
      ..close()
      ..moveTo(w * 0.5583333, h * 0.8026667)
      ..cubicTo(
          w * 0.5583333, h * 0.8080000, w * 0.5600000, h * 0.8133333, w * 0.5633333, h * 0.8186667)
      ..cubicTo(
          w * 0.5666667, h * 0.8240000, w * 0.5720000, h * 0.8276667, w * 0.5786667, h * 0.8296667)
      ..cubicTo(
          w * 0.5796667, h * 0.8296667, w * 0.5813333, h * 0.8300000, w * 0.5833333, h * 0.8303333)
      ..cubicTo(
          w * 0.5853333, h * 0.8306667, w * 0.5866667, h * 0.8310000, w * 0.5880000, h * 0.8310000)
      ..cubicTo(
          w * 0.6016667, h * 0.8310000, w * 0.6100000, h * 0.8236667, w * 0.6133333, h * 0.8090000)
      ..lineTo(w * 0.6180000, h * 0.7890000)
      ..cubicTo(
          w * 0.6203333, h * 0.7820000, w * 0.6196667, h * 0.7750000, w * 0.6156667, h * 0.7680000)
      ..cubicTo(
          w * 0.6120000, h * 0.7610000, w * 0.6063333, h * 0.7566667, w * 0.5986667, h * 0.7543333)
      ..cubicTo(
          w * 0.5903333, h * 0.7523333, w * 0.5826667, h * 0.7530000, w * 0.5760000, h * 0.7570000)
      ..cubicTo(
          w * 0.5693333, h * 0.7610000, w * 0.5646667, h * 0.7666667, w * 0.5623333, h * 0.7746667)
      ..lineTo(w * 0.5593333, h * 0.7943333)
      ..cubicTo(
          w * 0.5593333, h * 0.7950000, w * 0.5590000, h * 0.7966667, w * 0.5586667, h * 0.7983333)
      ..cubicTo(
          w * 0.5583333, h * 0.8000000, w * 0.5583333, h * 0.8013333, w * 0.5583333, h * 0.8026667)
      ..close()
      ..moveTo(w * 0.5830000, h * 0.7040000)
      ..cubicTo(
          w * 0.5830000, h * 0.7113333, w * 0.5856667, h * 0.7180000, w * 0.5913333, h * 0.7230000)
      ..cubicTo(
          w * 0.5963333, h * 0.7283333, w * 0.6026667, h * 0.7310000, w * 0.6103333, h * 0.7310000)
      ..cubicTo(
          w * 0.6183333, h * 0.7310000, w * 0.6246667, h * 0.7283333, w * 0.6300000, h * 0.7233333)
      ..cubicTo(
          w * 0.6353333, h * 0.7183333, w * 0.6376667, h * 0.7116667, w * 0.6376667, h * 0.7040000)
      ..cubicTo(
          w * 0.6376667, h * 0.6960000, w * 0.6350000, h * 0.6896667, w * 0.6300000, h * 0.6843333)
      ..cubicTo(
          w * 0.6250000, h * 0.6790000, w * 0.6183333, h * 0.6766667, w * 0.6103333, h * 0.6766667)
      ..cubicTo(
          w * 0.6023333, h * 0.6766667, w * 0.5960000, h * 0.6793333, w * 0.5906667, h * 0.6843333)
      ..cubicTo(
          w * 0.5856667, h * 0.6896667, w * 0.5830000, h * 0.6960000, w * 0.5830000, h * 0.7040000)
      ..close()
      ..moveTo(w * 0.6033333, h * 0.6270000)
      ..cubicTo(
          w * 0.6033333, h * 0.6326667, w * 0.6050000, h * 0.6380000, w * 0.6086667, h * 0.6430000)
      ..cubicTo(
          w * 0.6123333, h * 0.6480000, w * 0.6176667, h * 0.6516667, w * 0.6250000, h * 0.6536667)
      ..cubicTo(
          w * 0.6256667, h * 0.6536667, w * 0.6270000, h * 0.6540000, w * 0.6290000, h * 0.6543333)
      ..cubicTo(
          w * 0.6310000, h * 0.6546667, w * 0.6326667, h * 0.6550000, w * 0.6336667, h * 0.6550000)
      ..cubicTo(
          w * 0.6370000, h * 0.6550000, w * 0.6410000, h * 0.6540000, w * 0.6456667, h * 0.6520000)
      ..cubicTo(
          w * 0.6526667, h * 0.6483333, w * 0.6573333, h * 0.6423333, w * 0.6593333, h * 0.6346667)
      ..lineTo(w * 0.6673333, h * 0.6046667)
      ..cubicTo(
          w * 0.6693333, h * 0.5970000, w * 0.6686667, h * 0.5900000, w * 0.6646667, h * 0.5836667)
      ..cubicTo(
          w * 0.6610000, h * 0.5770000, w * 0.6553333, h * 0.5726667, w * 0.6476667, h * 0.5703333)
      ..cubicTo(
          w * 0.6400000, h * 0.5680000, w * 0.6330000, h * 0.5686667, w * 0.6263333, h * 0.5723333)
      ..cubicTo(
          w * 0.6200000, h * 0.5760000, w * 0.6153333, h * 0.5813333, w * 0.6133333, h * 0.5893333)
      ..lineTo(w * 0.6040000, h * 0.6196667)
      ..cubicTo(
          w * 0.6040000, h * 0.6203333, w * 0.6036667, h * 0.6216667, w * 0.6033333, h * 0.6236667)
      ..cubicTo(
          w * 0.6033333, h * 0.6246667, w * 0.6033333, h * 0.6260000, w * 0.6033333, h * 0.6270000)
      ..close();
  }

  Path _showersPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1533333, h * 0.5643333)
      ..cubicTo(
          w * 0.1533333, h * 0.5256667, w * 0.1653333, h * 0.4916667, w * 0.1896667, h * 0.4616667)
      ..cubicTo(
          w * 0.2136667, h * 0.4316667, w * 0.2446667, h * 0.4123333, w * 0.2823333, h * 0.4040000)
      ..cubicTo(
          w * 0.2920000, h * 0.3580000, w * 0.3150000, h * 0.3206667, w * 0.3513333, h * 0.2910000)
      ..cubicTo(
          w * 0.3876667, h * 0.2613333, w * 0.4293333, h * 0.2466667, w * 0.4766667, h * 0.2466667)
      ..cubicTo(
          w * 0.5230000, h * 0.2466667, w * 0.5643333, h * 0.2610000, w * 0.6006667, h * 0.2893333)
      ..cubicTo(
          w * 0.6366667, h * 0.3176667, w * 0.6603333, h * 0.3543333, w * 0.6713333, h * 0.3993333)
      ..lineTo(w * 0.6826667, h * 0.3993333)
      ..cubicTo(
          w * 0.7126667, h * 0.3993333, w * 0.7403333, h * 0.4066667, w * 0.7653333, h * 0.4213333)
      ..cubicTo(
          w * 0.7906667, h * 0.4360000, w * 0.8103333, h * 0.4560000, w * 0.8250000, h * 0.4813333)
      ..cubicTo(
          w * 0.8393333, h * 0.5066667, w * 0.8466667, h * 0.5343333, w * 0.8466667, h * 0.5643333)
      ..cubicTo(
          w * 0.8466667, h * 0.6090000, w * 0.8313333, h * 0.6470000, w * 0.8010000, h * 0.6790000)
      ..cubicTo(
          w * 0.7703333, h * 0.7110000, w * 0.7330000, h * 0.7276667, w * 0.6886667, h * 0.7290000)
      ..cubicTo(
          w * 0.6846667, h * 0.7290000, w * 0.6826667, h * 0.7270000, w * 0.6826667, h * 0.7233333)
      ..lineTo(w * 0.6826667, h * 0.6786667)
      ..cubicTo(
          w * 0.6826667, h * 0.6750000, w * 0.6846667, h * 0.6730000, w * 0.6886667, h * 0.6730000)
      ..cubicTo(
          w * 0.7166667, h * 0.6706667, w * 0.7410000, h * 0.6590000, w * 0.7610000, h * 0.6380000)
      ..cubicTo(
          w * 0.7810000, h * 0.6170000, w * 0.7910000, h * 0.5923333, w * 0.7910000, h * 0.5640000)
      ..cubicTo(
          w * 0.7910000, h * 0.5343333, w * 0.7803333, h * 0.5086667, w * 0.7590000, h * 0.4870000)
      ..cubicTo(
          w * 0.7376667, h * 0.4656667, w * 0.7123333, h * 0.4546667, w * 0.6826667, h * 0.4546667)
      ..lineTo(w * 0.6283333, h * 0.4546667)
      ..cubicTo(
          w * 0.6243333, h * 0.4546667, w * 0.6220000, h * 0.4526667, w * 0.6210000, h * 0.4486667)
      ..lineTo(w * 0.6186667, h * 0.4296667)
      ..cubicTo(
          w * 0.6163333, h * 0.4060000, w * 0.6086667, h * 0.3843333, w * 0.5953333, h * 0.3650000)
      ..cubicTo(
          w * 0.5820000, h * 0.3456667, w * 0.5650000, h * 0.3306667, w * 0.5443333, h * 0.3196667)
      ..cubicTo(
          w * 0.5236667, h * 0.3086667, w * 0.5010000, h * 0.3033333, w * 0.4770000, h * 0.3033333)
      ..cubicTo(
          w * 0.4403333, h * 0.3033333, w * 0.4086667, h * 0.3153333, w * 0.3816667, h * 0.3396667)
      ..cubicTo(
          w * 0.3546667, h * 0.3640000, w * 0.3393333, h * 0.3943333, w * 0.3360000, h * 0.4303333)
      ..lineTo(w * 0.3336667, h * 0.4483333)
      ..cubicTo(
          w * 0.3336667, h * 0.4513333, w * 0.3320000, h * 0.4530000, w * 0.3283333, h * 0.4530000)
      ..lineTo(w * 0.3103333, h * 0.4566667)
      ..cubicTo(
          w * 0.2823333, h * 0.4590000, w * 0.2586667, h * 0.4703333, w * 0.2400000, h * 0.4910000)
      ..cubicTo(
          w * 0.2210000, h * 0.5116667, w * 0.2116667, h * 0.5360000, w * 0.2116667, h * 0.5643333)
      ..cubicTo(
          w * 0.2116667, h * 0.5933333, w * 0.2216667, h * 0.6183333, w * 0.2413333, h * 0.6393333)
      ..cubicTo(
          w * 0.2610000, h * 0.6603333, w * 0.2850000, h * 0.6716667, w * 0.3136667, h * 0.6733333)
      ..cubicTo(
          w * 0.3176667, h * 0.6733333, w * 0.3196667, h * 0.6753333, w * 0.3196667, h * 0.6790000)
      ..lineTo(w * 0.3196667, h * 0.7236667)
      ..cubicTo(
          w * 0.3196667, h * 0.7273333, w * 0.3176667, h * 0.7293333, w * 0.3136667, h * 0.7293333)
      ..cubicTo(
          w * 0.2916667, h * 0.7283333, w * 0.2710000, h * 0.7233333, w * 0.2510000, h * 0.7143333)
      ..cubicTo(
          w * 0.2310000, h * 0.7053333, w * 0.2140000, h * 0.6933333, w * 0.2000000, h * 0.6786667)
      ..cubicTo(
          w * 0.1856667, h * 0.6640000, w * 0.1743333, h * 0.6470000, w * 0.1660000, h * 0.6270000)
      ..cubicTo(
          w * 0.1576667, h * 0.6070000, w * 0.1533333, h * 0.5863333, w * 0.1533333, h * 0.5643333)
      ..close()
      ..moveTo(w * 0.3340000, h * 0.7900000)
      ..cubicTo(
          w * 0.3340000, h * 0.7890000, w * 0.3343333, h * 0.7873333, w * 0.3346667, h * 0.7856667)
      ..cubicTo(
          w * 0.3350000, h * 0.7840000, w * 0.3353333, h * 0.7826667, w * 0.3353333, h * 0.7820000)
      ..lineTo(w * 0.3443333, h * 0.7476667)
      ..cubicTo(
          w * 0.3466667, h * 0.7403333, w * 0.3510000, h * 0.7343333, w * 0.3576667, h * 0.7306667)
      ..cubicTo(
          w * 0.3643333, h * 0.7266667, w * 0.3713333, h * 0.7260000, w * 0.3790000, h * 0.7283333)
      ..cubicTo(
          w * 0.3866667, h * 0.7306667, w * 0.3923333, h * 0.7350000, w * 0.3963333, h * 0.7416667)
      ..cubicTo(
          w * 0.4003333, h * 0.7483333, w * 0.4010000, h * 0.7553333, w * 0.3986667, h * 0.7630000)
      ..lineTo(w * 0.3906667, h * 0.7966667)
      ..cubicTo(
          w * 0.3863333, h * 0.8113333, w * 0.3780000, h * 0.8186667, w * 0.3653333, h * 0.8186667)
      ..cubicTo(
          w * 0.3643333, h * 0.8186667, w * 0.3636667, h * 0.8186667, w * 0.3623333, h * 0.8186667)
      ..cubicTo(
          w * 0.3613333, h * 0.8186667, w * 0.3600000, h * 0.8183333, w * 0.3586667, h * 0.8183333)
      ..cubicTo(
          w * 0.3573333, h * 0.8180000, w * 0.3563333, h * 0.8180000, w * 0.3553333, h * 0.8180000)
      ..cubicTo(
          w * 0.3483333, h * 0.8160000, w * 0.3430000, h * 0.8120000, w * 0.3393333, h * 0.8066667)
      ..cubicTo(
          w * 0.3356667, h * 0.8013333, w * 0.3340000, h * 0.7953333, w * 0.3340000, h * 0.7900000)
      ..close()
      ..moveTo(w * 0.3780000, h * 0.6293333)
      ..cubicTo(
          w * 0.3780000, h * 0.6286667, w * 0.3780000, h * 0.6273333, w * 0.3783333, h * 0.6256667)
      ..cubicTo(
          w * 0.3786667, h * 0.6240000, w * 0.3786667, h * 0.6230000, w * 0.3786667, h * 0.6226667)
      ..lineTo(w * 0.3886667, h * 0.5876667)
      ..cubicTo(
          w * 0.3906667, h * 0.5813333, w * 0.3943333, h * 0.5763333, w * 0.3993333, h * 0.5726667)
      ..cubicTo(
          w * 0.4043333, h * 0.5693333, w * 0.4096667, h * 0.5676667, w * 0.4150000, h * 0.5676667)
      ..cubicTo(
          w * 0.4156667, h * 0.5676667, w * 0.4166667, h * 0.5676667, w * 0.4176667, h * 0.5676667)
      ..cubicTo(
          w * 0.4186667, h * 0.5676667, w * 0.4196667, h * 0.5680000, w * 0.4206667, h * 0.5680000)
      ..cubicTo(
          w * 0.4216667, h * 0.5683333, w * 0.4226667, h * 0.5683333, w * 0.4233333, h * 0.5683333)
      ..cubicTo(
          w * 0.4310000, h * 0.5706667, w * 0.4366667, h * 0.5750000, w * 0.4403333, h * 0.5816667)
      ..cubicTo(
          w * 0.4443333, h * 0.5883333, w * 0.4450000, h * 0.5953333, w * 0.4426667, h * 0.6030000)
      ..lineTo(w * 0.4346667, h * 0.6363333)
      ..cubicTo(
          w * 0.4323333, h * 0.6456667, w * 0.4280000, h * 0.6520000, w * 0.4213333, h * 0.6560000)
      ..cubicTo(
          w * 0.4146667, h * 0.6600000, w * 0.4073333, h * 0.6600000, w * 0.3996667, h * 0.6566667)
      ..cubicTo(
          w * 0.3923333, h * 0.6546667, w * 0.3870000, h * 0.6510000, w * 0.3833333, h * 0.6453333)
      ..cubicTo(
          w * 0.3796667, h * 0.6396667, w * 0.3780000, h * 0.6346667, w * 0.3780000, h * 0.6293333)
      ..close()
      ..moveTo(w * 0.4190000, h * 0.8943333)
      ..cubicTo(
          w * 0.4190000, h * 0.8933333, w * 0.4193333, h * 0.8920000, w * 0.4196667, h * 0.8900000)
      ..cubicTo(
          w * 0.4200000, h * 0.8880000, w * 0.4203333, h * 0.8870000, w * 0.4203333, h * 0.8860000)
      ..lineTo(w * 0.4300000, h * 0.8530000)
      ..cubicTo(
          w * 0.4320000, h * 0.8450000, w * 0.4366667, h * 0.8390000, w * 0.4433333, h * 0.8350000)
      ..cubicTo(
          w * 0.4500000, h * 0.8310000, w * 0.4573333, h * 0.8300000, w * 0.4650000, h * 0.8323333)
      ..cubicTo(
          w * 0.4726667, h * 0.8346667, w * 0.4780000, h * 0.8390000, w * 0.4820000, h * 0.8460000)
      ..cubicTo(
          w * 0.4860000, h * 0.8530000, w * 0.4863333, h * 0.8600000, w * 0.4843333, h * 0.8676667)
      ..lineTo(w * 0.4760000, h * 0.9023333)
      ..cubicTo(
          w * 0.4723333, h * 0.9160000, w * 0.4636667, h * 0.9226667, w * 0.4493333, h * 0.9226667)
      ..cubicTo(
          w * 0.4476667, h * 0.9226667, w * 0.4450000, h * 0.9223333, w * 0.4413333, h * 0.9213333)
      ..cubicTo(
          w * 0.4340000, h * 0.9200000, w * 0.4286667, h * 0.9166667, w * 0.4250000, h * 0.9113333)
      ..cubicTo(
          w * 0.4210000, h * 0.9060000, w * 0.4190000, h * 0.9003333, w * 0.4190000, h * 0.8943333)
      ..close()
      ..moveTo(w * 0.4636667, h * 0.7353333)
      ..cubicTo(
          w * 0.4636667, h * 0.7333333, w * 0.4640000, h * 0.7306667, w * 0.4650000, h * 0.7270000)
      ..lineTo(w * 0.4740000, h * 0.6926667)
      ..cubicTo(
          w * 0.4763333, h * 0.6850000, w * 0.4806667, h * 0.6793333, w * 0.4876667, h * 0.6756667)
      ..cubicTo(
          w * 0.4943333, h * 0.6716667, w * 0.5016667, h * 0.6710000, w * 0.5093333, h * 0.6733333)
      ..cubicTo(
          w * 0.5170000, h * 0.6753333, w * 0.5223333, h * 0.6796667, w * 0.5263333, h * 0.6863333)
      ..cubicTo(
          w * 0.5300000, h * 0.6930000, w * 0.5306667, h * 0.7000000, w * 0.5283333, h * 0.7080000)
      ..lineTo(w * 0.5203333, h * 0.7410000)
      ..cubicTo(
          w * 0.5160000, h * 0.7560000, w * 0.5080000, h * 0.7636667, w * 0.4963333, h * 0.7636667)
      ..cubicTo(
          w * 0.4950000, h * 0.7636667, w * 0.4913333, h * 0.7630000, w * 0.4860000, h * 0.7616667)
      ..cubicTo(
          w * 0.4786667, h * 0.7603333, w * 0.4733333, h * 0.7570000, w * 0.4696667, h * 0.7516667)
      ..cubicTo(
          w * 0.4656667, h * 0.7466667, w * 0.4636667, h * 0.7410000, w * 0.4636667, h * 0.7353333)
      ..close()
      ..moveTo(w * 0.5576667, h * 0.7913333)
      ..cubicTo(
          w * 0.5576667, h * 0.7890000, w * 0.5580000, h * 0.7863333, w * 0.5586667, h * 0.7833333)
      ..lineTo(w * 0.5680000, h * 0.7503333)
      ..cubicTo(
          w * 0.5703333, h * 0.7423333, w * 0.5746667, h * 0.7363333, w * 0.5816667, h * 0.7323333)
      ..cubicTo(
          w * 0.5886667, h * 0.7283333, w * 0.5953333, h * 0.7273333, w * 0.6026667, h * 0.7293333)
      ..cubicTo(
          w * 0.6103333, h * 0.7316667, w * 0.6163333, h * 0.7360000, w * 0.6203333, h * 0.7430000)
      ..cubicTo(
          w * 0.6243333, h * 0.7496667, w * 0.6253333, h * 0.7566667, w * 0.6233333, h * 0.7640000)
      ..lineTo(w * 0.6136667, h * 0.7993333)
      ..cubicTo(
          w * 0.6103333, h * 0.8130000, w * 0.6016667, h * 0.8196667, w * 0.5873333, h * 0.8196667)
      ..cubicTo(
          w * 0.5843333, h * 0.8196667, w * 0.5813333, h * 0.8193333, w * 0.5786667, h * 0.8186667)
      ..cubicTo(
          w * 0.5720000, h * 0.8173333, w * 0.5670000, h * 0.8140000, w * 0.5633333, h * 0.8086667)
      ..cubicTo(
          w * 0.5600000, h * 0.8026667, w * 0.5580000, h * 0.7970000, w * 0.5576667, h * 0.7913333)
      ..close()
      ..moveTo(w * 0.6036667, h * 0.6326667)
      ..cubicTo(
          w * 0.6036667, h * 0.6316667, w * 0.6043333, h * 0.6286667, w * 0.6053333, h * 0.6240000)
      ..lineTo(w * 0.6153333, h * 0.5896667)
      ..cubicTo(
          w * 0.6166667, h * 0.5826667, w * 0.6196667, h * 0.5773333, w * 0.6250000, h * 0.5740000)
      ..cubicTo(
          w * 0.6303333, h * 0.5706667, w * 0.6356667, h * 0.5690000, w * 0.6413333, h * 0.5693333)
      ..cubicTo(
          w * 0.6426667, h * 0.5690000, w * 0.6456667, h * 0.5693333, w * 0.6493333, h * 0.5703333)
      ..cubicTo(
          w * 0.6566667, h * 0.5720000, w * 0.6623333, h * 0.5763333, w * 0.6666667, h * 0.5830000)
      ..cubicTo(
          w * 0.6706667, h * 0.5886667, w * 0.6713333, h * 0.5956667, w * 0.6690000, h * 0.6046667)
      ..lineTo(w * 0.6610000, h * 0.6390000)
      ..cubicTo(
          w * 0.6566667, h * 0.6533333, w * 0.6483333, h * 0.6606667, w * 0.6356667, h * 0.6606667)
      ..cubicTo(
          w * 0.6336667, h * 0.6606667, w * 0.6300000, h * 0.6600000, w * 0.6243333, h * 0.6586667)
      ..cubicTo(
          w * 0.6173333, h * 0.6566667, w * 0.6123333, h * 0.6530000, w * 0.6090000, h * 0.6483333)
      ..cubicTo(
          w * 0.6053333, h * 0.6430000, w * 0.6036667, h * 0.6380000, w * 0.6036667, h * 0.6326667)
      ..close();
  }

  Path _sleetPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1363333, h * 0.5650000)
      ..cubicTo(
          w * 0.1363333, h * 0.5263333, w * 0.1483333, h * 0.4920000, w * 0.1723333, h * 0.4620000)
      ..cubicTo(
          w * 0.1963333, h * 0.4320000, w * 0.2270000, h * 0.4123333, w * 0.2636667, h * 0.4040000)
      ..cubicTo(
          w * 0.2740000, h * 0.3583333, w * 0.2973333, h * 0.3210000, w * 0.3336667, h * 0.2916667)
      ..cubicTo(
          w * 0.3700000, h * 0.2623333, w * 0.4120000, h * 0.2476667, w * 0.4593333, h * 0.2476667)
      ..cubicTo(
          w * 0.4863333, h * 0.2476667, w * 0.5110000, h * 0.2520000, w * 0.5326667, h * 0.2610000)
      ..cubicTo(
          w * 0.5326667, h * 0.2613333, w * 0.5326667, h * 0.2613333, w * 0.5330000, h * 0.2616667)
      ..cubicTo(
          w * 0.5610000, h * 0.2723333, w * 0.5856667, h * 0.2896667, w * 0.6066667, h * 0.3133333)
      ..lineTo(w * 0.6076667, h * 0.3133333)
      ..cubicTo(
          w * 0.6303333, h * 0.3376667, w * 0.6453333, h * 0.3666667, w * 0.6533333, h * 0.4006667)
      ..lineTo(w * 0.6636667, h * 0.4006667)
      ..cubicTo(
          w * 0.6996667, h * 0.4006667, w * 0.7310000, h * 0.4103333, w * 0.7580000, h * 0.4293333)
      ..lineTo(w * 0.7580000, h * 0.4290000)
      ..cubicTo(
          w * 0.7756667, h * 0.4410000, w * 0.7906667, h * 0.4556667, w * 0.8026667, h * 0.4733333)
      ..cubicTo(
          w * 0.8146667, h * 0.4910000, w * 0.8226667, h * 0.5103333, w * 0.8270000, h * 0.5313333)
      ..cubicTo(
          w * 0.8283333, h * 0.5383333, w * 0.8290000, h * 0.5440000, w * 0.8296667, h * 0.5486667)
      ..lineTo(w * 0.8296667, h * 0.5506667)
      ..cubicTo(
          w * 0.8296667, h * 0.5510000, w * 0.8296667, h * 0.5526667, w * 0.8300000, h * 0.5563333)
      ..cubicTo(
          w * 0.8303333, h * 0.5600000, w * 0.8303333, h * 0.5626667, w * 0.8303333, h * 0.5643333)
      ..lineTo(w * 0.8303333, h * 0.5653333)
      ..cubicTo(
          w * 0.8303333, h * 0.5946667, w * 0.8233333, h * 0.6220000, w * 0.8090000, h * 0.6470000)
      ..cubicTo(
          w * 0.7950000, h * 0.6720000, w * 0.7756667, h * 0.6923333, w * 0.7510000, h * 0.7073333)
      ..cubicTo(
          w * 0.7266667, h * 0.7223333, w * 0.6996667, h * 0.7303333, w * 0.6703333, h * 0.7313333)
      ..cubicTo(
          w * 0.6660000, h * 0.7313333, w * 0.6636667, h * 0.7293333, w * 0.6636667, h * 0.7256667)
      ..lineTo(w * 0.6636667, h * 0.6810000)
      ..cubicTo(
          w * 0.6636667, h * 0.6766667, w * 0.6660000, h * 0.6746667, w * 0.6703333, h * 0.6746667)
      ..cubicTo(
          w * 0.6990000, h * 0.6733333, w * 0.7230000, h * 0.6620000, w * 0.7430000, h * 0.6406667)
      ..cubicTo(
          w * 0.7630000, h * 0.6193333, w * 0.7730000, h * 0.5943333, w * 0.7730000, h * 0.5653333)
      ..cubicTo(
          w * 0.7730000, h * 0.5356667, w * 0.7623333, h * 0.5103333, w * 0.7406667, h * 0.4890000)
      ..cubicTo(
          w * 0.7193333, h * 0.4676667, w * 0.6936667, h * 0.4570000, w * 0.6636667, h * 0.4570000)
      ..lineTo(w * 0.6100000, h * 0.4570000)
      ..cubicTo(
          w * 0.6060000, h * 0.4570000, w * 0.6040000, h * 0.4550000, w * 0.6040000, h * 0.4513333)
      ..lineTo(w * 0.6013333, h * 0.4316667)
      ..cubicTo(
          w * 0.5980000, h * 0.3983333, w * 0.5840000, h * 0.3696667, w * 0.5590000, h * 0.3453333)
      ..cubicTo(
          w * 0.5586667, h * 0.3450000, w * 0.5586667, h * 0.3446667, w * 0.5583333, h * 0.3443333)
      ..cubicTo(
          w * 0.5580000, h * 0.3440000, w * 0.5576667, h * 0.3436667, w * 0.5576667, h * 0.3433333)
      ..cubicTo(
          w * 0.5573333, h * 0.3430000, w * 0.5570000, h * 0.3426667, w * 0.5563333, h * 0.3426667)
      ..cubicTo(
          w * 0.5563333, h * 0.3420000, w * 0.5560000, h * 0.3416667, w * 0.5556667, h * 0.3416667)
      ..cubicTo(
          w * 0.5313333, h * 0.3196667, w * 0.5030000, h * 0.3070000, w * 0.4703333, h * 0.3043333)
      ..cubicTo(
          w * 0.4680000, h * 0.3040000, w * 0.4643333, h * 0.3040000, w * 0.4590000, h * 0.3040000)
      ..cubicTo(
          w * 0.4223333, h * 0.3040000, w * 0.3906667, h * 0.3163333, w * 0.3636667, h * 0.3406667)
      ..cubicTo(
          w * 0.3366667, h * 0.3650000, w * 0.3213333, h * 0.3953333, w * 0.3180000, h * 0.4313333)
      ..lineTo(w * 0.3153333, h * 0.4510000)
      ..cubicTo(
          w * 0.3143333, h * 0.4540000, w * 0.3116667, h * 0.4556667, w * 0.3080000, h * 0.4556667)
      ..lineTo(w * 0.2916667, h * 0.4566667)
      ..cubicTo(
          w * 0.2636667, h * 0.4600000, w * 0.2400000, h * 0.4720000, w * 0.2213333, h * 0.4923333)
      ..cubicTo(
          w * 0.2026667, h * 0.5126667, w * 0.1933333, h * 0.5370000, w * 0.1933333, h * 0.5650000)
      ..lineTo(w * 0.1933333, h * 0.5663333)
      ..lineTo(w * 0.1943333, h * 0.5663333)
      ..cubicTo(
          w * 0.1946667, h * 0.5823333, w * 0.1980000, h * 0.5973333, w * 0.2043333, h * 0.6113333)
      ..cubicTo(
          w * 0.2110000, h * 0.6256667, w * 0.2196667, h * 0.6376667, w * 0.2310000, h * 0.6476667)
      ..cubicTo(
          w * 0.2380000, h * 0.6536667, w * 0.2460000, h * 0.6590000, w * 0.2556667, h * 0.6636667)
      ..lineTo(w * 0.2556667, h * 0.6640000)
      ..cubicTo(
          w * 0.2690000, h * 0.6703333, w * 0.2823333, h * 0.6740000, w * 0.2960000, h * 0.6746667)
      ..cubicTo(
          w * 0.2996667, h * 0.6746667, w * 0.3016667, h * 0.6766667, w * 0.3016667, h * 0.6806667)
      ..lineTo(w * 0.3016667, h * 0.7253333)
      ..cubicTo(
          w * 0.3016667, h * 0.7290000, w * 0.2996667, h * 0.7310000, w * 0.2960000, h * 0.7310000)
      ..cubicTo(
          w * 0.2786667, h * 0.7300000, w * 0.2623333, h * 0.7266667, w * 0.2466667, h * 0.7210000)
      ..lineTo(w * 0.2466667, h * 0.7213333)
      ..cubicTo(
          w * 0.2190000, h * 0.7116667, w * 0.1953333, h * 0.6956667, w * 0.1763333, h * 0.6736667)
      ..cubicTo(
          w * 0.1573333, h * 0.6516667, w * 0.1446667, h * 0.6256667, w * 0.1393333, h * 0.5966667)
      ..lineTo(w * 0.1393333, h * 0.5956667)
      ..cubicTo(
          w * 0.1390000, h * 0.5953333, w * 0.1390000, h * 0.5950000, w * 0.1390000, h * 0.5943333)
      ..cubicTo(
          w * 0.1370000, h * 0.5856667, w * 0.1363333, h * 0.5756667, w * 0.1363333, h * 0.5650000)
      ..close()
      ..moveTo(w * 0.3196667, h * 0.8040000)
      ..cubicTo(
          w * 0.3196667, h * 0.8030000, w * 0.3200000, h * 0.8016667, w * 0.3203333, h * 0.7996667)
      ..cubicTo(
          w * 0.3206667, h * 0.7980000, w * 0.3210000, h * 0.7966667, w * 0.3210000, h * 0.7956667)
      ..lineTo(w * 0.3240000, h * 0.7760000)
      ..cubicTo(
          w * 0.3263333, h * 0.7680000, w * 0.3306667, h * 0.7623333, w * 0.3376667, h * 0.7583333)
      ..cubicTo(
          w * 0.3446667, h * 0.7543333, w * 0.3520000, h * 0.7536667, w * 0.3603333, h * 0.7556667)
      ..cubicTo(
          w * 0.3680000, h * 0.7580000, w * 0.3733333, h * 0.7626667, w * 0.3773333, h * 0.7693333)
      ..cubicTo(
          w * 0.3810000, h * 0.7763333, w * 0.3816667, h * 0.7833333, w * 0.3796667, h * 0.7903333)
      ..lineTo(w * 0.3750000, h * 0.8103333)
      ..cubicTo(
          w * 0.3716667, h * 0.8250000, w * 0.3633333, h * 0.8323333, w * 0.3496667, h * 0.8323333)
      ..cubicTo(
          w * 0.3486667, h * 0.8323333, w * 0.3470000, h * 0.8320000, w * 0.3450000, h * 0.8316667)
      ..cubicTo(
          w * 0.3430000, h * 0.8313333, w * 0.3416667, h * 0.8310000, w * 0.3403333, h * 0.8310000)
      ..cubicTo(
          w * 0.3333333, h * 0.8290000, w * 0.3283333, h * 0.8253333, w * 0.3250000, h * 0.8200000)
      ..cubicTo(
          w * 0.3213333, h * 0.8150000, w * 0.3196667, h * 0.8096667, w * 0.3196667, h * 0.8040000)
      ..close()
      ..moveTo(w * 0.3443333, h * 0.7060000)
      ..cubicTo(
          w * 0.3443333, h * 0.6980000, w * 0.3470000, h * 0.6916667, w * 0.3520000, h * 0.6863333)
      ..cubicTo(
          w * 0.3570000, h * 0.6810000, w * 0.3636667, h * 0.6786667, w * 0.3716667, h * 0.6786667)
      ..cubicTo(
          w * 0.3796667, h * 0.6786667, w * 0.3860000, h * 0.6813333, w * 0.3913333, h * 0.6863333)
      ..cubicTo(
          w * 0.3966667, h * 0.6913333, w * 0.3990000, h * 0.6980000, w * 0.3990000, h * 0.7060000)
      ..cubicTo(
          w * 0.3990000, h * 0.7136667, w * 0.3963333, h * 0.7200000, w * 0.3913333, h * 0.7253333)
      ..cubicTo(
          w * 0.3863333, h * 0.7306667, w * 0.3796667, h * 0.7330000, w * 0.3716667, h * 0.7330000)
      ..cubicTo(
          w * 0.3640000, h * 0.7330000, w * 0.3576667, h * 0.7303333, w * 0.3526667, h * 0.7250000)
      ..cubicTo(
          w * 0.3473333, h * 0.7196667, w * 0.3443333, h * 0.7133333, w * 0.3443333, h * 0.7060000)
      ..close()
      ..moveTo(w * 0.3990000, h * 0.9056667)
      ..cubicTo(
          w * 0.3990000, h * 0.9043333, w * 0.3993333, h * 0.9020000, w * 0.4003333, h * 0.8980000)
      ..lineTo(w * 0.4046667, h * 0.8783333)
      ..cubicTo(
          w * 0.4070000, h * 0.8706667, w * 0.4116667, h * 0.8650000, w * 0.4183333, h * 0.8613333)
      ..cubicTo(
          w * 0.4253333, h * 0.8573333, w * 0.4323333, h * 0.8566667, w * 0.4393333, h * 0.8590000)
      ..cubicTo(
          w * 0.4470000, h * 0.8603333, w * 0.4530000, h * 0.8646667, w * 0.4570000, h * 0.8713333)
      ..cubicTo(
          w * 0.4610000, h * 0.8780000, w * 0.4620000, h * 0.8856667, w * 0.4596667, h * 0.8940000)
      ..lineTo(w * 0.4553333, h * 0.9136667)
      ..cubicTo(
          w * 0.4520000, h * 0.9273333, w * 0.4430000, h * 0.9340000, w * 0.4286667, h * 0.9340000)
      ..cubicTo(
          w * 0.4263333, h * 0.9340000, w * 0.4233333, h * 0.9336667, w * 0.4206667, h * 0.9330000)
      ..cubicTo(
          w * 0.4133333, h * 0.9310000, w * 0.4080000, h * 0.9273333, w * 0.4043333, h * 0.9220000)
      ..cubicTo(
          w * 0.4010000, h * 0.9166667, w * 0.3990000, h * 0.9113333, w * 0.3990000, h * 0.9056667)
      ..close()
      ..moveTo(w * 0.4253333, h * 0.8086667)
      ..cubicTo(
          w * 0.4253333, h * 0.8010000, w * 0.4280000, h * 0.7943333, w * 0.4330000, h * 0.7893333)
      ..cubicTo(
          w * 0.4383333, h * 0.7840000, w * 0.4446667, h * 0.7816667, w * 0.4526667, h * 0.7816667)
      ..cubicTo(
          w * 0.4606667, h * 0.7816667, w * 0.4670000, h * 0.7843333, w * 0.4723333, h * 0.7893333)
      ..cubicTo(
          w * 0.4776667, h * 0.7946667, w * 0.4800000, h * 0.8010000, w * 0.4800000, h * 0.8086667)
      ..cubicTo(
          w * 0.4800000, h * 0.8166667, w * 0.4773333, h * 0.8230000, w * 0.4723333, h * 0.8283333)
      ..cubicTo(
          w * 0.4670000, h * 0.8336667, w * 0.4606667, h * 0.8360000, w * 0.4526667, h * 0.8360000)
      ..cubicTo(
          w * 0.4450000, h * 0.8360000, w * 0.4386667, h * 0.8333333, w * 0.4333333, h * 0.8280000)
      ..cubicTo(
          w * 0.4280000, h * 0.8226667, w * 0.4253333, h * 0.8163333, w * 0.4253333, h * 0.8086667)
      ..close()
      ..moveTo(w * 0.4460000, h * 0.7330000)
      ..cubicTo(
          w * 0.4460000, h * 0.7296667, w * 0.4463333, h * 0.7266667, w * 0.4470000, h * 0.7240000)
      ..lineTo(w * 0.4546667, h * 0.6940000)
      ..cubicTo(
          w * 0.4570000, h * 0.6863333, w * 0.4616667, h * 0.6803333, w * 0.4683333, h * 0.6763333)
      ..cubicTo(
          w * 0.4753333, h * 0.6723333, w * 0.4823333, h * 0.6713333, w * 0.4896667, h * 0.6736667)
      ..cubicTo(
          w * 0.4976667, h * 0.6760000, w * 0.5033333, h * 0.6803333, w * 0.5073333, h * 0.6870000)
      ..cubicTo(
          w * 0.5113333, h * 0.6936667, w * 0.5120000, h * 0.7006667, w * 0.5096667, h * 0.7080000)
      ..lineTo(w * 0.5010000, h * 0.7380000)
      ..cubicTo(
          w * 0.4983333, h * 0.7473333, w * 0.4936667, h * 0.7533333, w * 0.4873333, h * 0.7566667)
      ..cubicTo(
          w * 0.4810000, h * 0.7600000, w * 0.4736667, h * 0.7606667, w * 0.4660000, h * 0.7586667)
      ..cubicTo(
          w * 0.4593333, h * 0.7573333, w * 0.4543333, h * 0.7540000, w * 0.4510000, h * 0.7486667)
      ..cubicTo(
          w * 0.4470000, h * 0.7433333, w * 0.4456667, h * 0.7380000, w * 0.4460000, h * 0.7330000)
      ..close()
      ..moveTo(w * 0.5380000, h * 0.8043333)
      ..cubicTo(
          w * 0.5380000, h * 0.8033333, w * 0.5380000, h * 0.8016667, w * 0.5383333, h * 0.8000000)
      ..cubicTo(
          w * 0.5386667, h * 0.7983333, w * 0.5386667, h * 0.7970000, w * 0.5386667, h * 0.7963333)
      ..lineTo(w * 0.5416667, h * 0.7766667)
      ..cubicTo(
          w * 0.5440000, h * 0.7686667, w * 0.5483333, h * 0.7630000, w * 0.5553333, h * 0.7590000)
      ..cubicTo(
          w * 0.5623333, h * 0.7550000, w * 0.5696667, h * 0.7543333, w * 0.5780000, h * 0.7563333)
      ..cubicTo(
          w * 0.5856667, h * 0.7586667, w * 0.5913333, h * 0.7633333, w * 0.5950000, h * 0.7700000)
      ..cubicTo(
          w * 0.5990000, h * 0.7770000, w * 0.5996667, h * 0.7840000, w * 0.5973333, h * 0.7910000)
      ..lineTo(w * 0.5926667, h * 0.8110000)
      ..cubicTo(
          w * 0.5893333, h * 0.8256667, w * 0.5810000, h * 0.8330000, w * 0.5673333, h * 0.8330000)
      ..cubicTo(
          w * 0.5663333, h * 0.8330000, w * 0.5646667, h * 0.8326667, w * 0.5626667, h * 0.8323333)
      ..cubicTo(
          w * 0.5606667, h * 0.8320000, w * 0.5590000, h * 0.8316667, w * 0.5580000, h * 0.8316667)
      ..cubicTo(
          w * 0.5513333, h * 0.8296667, w * 0.5463333, h * 0.8260000, w * 0.5430000, h * 0.8206667)
      ..cubicTo(
          w * 0.5400000, h * 0.8153333, w * 0.5380000, h * 0.8100000, w * 0.5380000, h * 0.8043333)
      ..close()
      ..moveTo(w * 0.5626667, h * 0.7063333)
      ..cubicTo(
          w * 0.5626667, h * 0.6983333, w * 0.5653333, h * 0.6920000, w * 0.5703333, h * 0.6866667)
      ..cubicTo(
          w * 0.5756667, h * 0.6813333, w * 0.5820000, h * 0.6790000, w * 0.5900000, h * 0.6790000)
      ..cubicTo(
          w * 0.5980000, h * 0.6790000, w * 0.6043333, h * 0.6816667, w * 0.6096667, h * 0.6866667)
      ..cubicTo(
          w * 0.6150000, h * 0.6920000, w * 0.6173333, h * 0.6983333, w * 0.6173333, h * 0.7063333)
      ..cubicTo(
          w * 0.6173333, h * 0.7140000, w * 0.6146667, h * 0.7206667, w * 0.6096667, h * 0.7256667)
      ..cubicTo(
          w * 0.6046667, h * 0.7306667, w * 0.5983333, h * 0.7333333, w * 0.5903333, h * 0.7333333)
      ..cubicTo(
          w * 0.5823333, h * 0.7333333, w * 0.5760000, h * 0.7306667, w * 0.5710000, h * 0.7253333)
      ..cubicTo(
          w * 0.5656667, h * 0.7203333, w * 0.5626667, h * 0.7140000, w * 0.5626667, h * 0.7063333)
      ..close();
  }

  Path _smokePath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.2113333, h * 0.4160000)
      ..cubicTo(
          w * 0.2113333, h * 0.3846667, w * 0.2213333, h * 0.3566667, w * 0.2410000, h * 0.3320000)
      ..cubicTo(
          w * 0.2606667, h * 0.3073333, w * 0.2856667, h * 0.2916667, w * 0.3160000, h * 0.2850000)
      ..cubicTo(
          w * 0.3243333, h * 0.2476667, w * 0.3433333, h * 0.2166667, w * 0.3733333, h * 0.1926667)
      ..cubicTo(
          w * 0.4033333, h * 0.1686667, w * 0.4373333, h * 0.1566667, w * 0.4760000, h * 0.1566667)
      ..cubicTo(
          w * 0.5133333, h * 0.1566667, w * 0.5470000, h * 0.1683333, w * 0.5766667, h * 0.1916667)
      ..cubicTo(
          w * 0.6063333, h * 0.2150000, w * 0.6253333, h * 0.2450000, w * 0.6343333, h * 0.2813333)
      ..lineTo(w * 0.6433333, h * 0.2813333)
      ..cubicTo(
          w * 0.6806667, h * 0.2813333, w * 0.7126667, h * 0.2943333, w * 0.7393333, h * 0.3206667)
      ..cubicTo(
          w * 0.7656667, h * 0.3466667, w * 0.7790000, h * 0.3786667, w * 0.7790000, h * 0.4156667)
      ..cubicTo(
          w * 0.7790000, h * 0.4356667, w * 0.7750000, h * 0.4546667, w * 0.7666667, h * 0.4723333)
      ..cubicTo(
          w * 0.7583333, h * 0.4900000, w * 0.7470000, h * 0.5053333, w * 0.7323333, h * 0.5180000)
      ..lineTo(w * 0.7323333, h * 0.5190000)
      ..cubicTo(
          w * 0.7323333, h * 0.5386667, w * 0.7260000, h * 0.5563333, w * 0.7136667, h * 0.5720000)
      ..cubicTo(
          w * 0.7013333, h * 0.5876667, w * 0.6856667, h * 0.5973333, w * 0.6670000, h * 0.6016667)
      ..cubicTo(
          w * 0.6623333, h * 0.6223333, w * 0.6520000, h * 0.6400000, w * 0.6366667, h * 0.6543333)
      ..cubicTo(
          w * 0.6213333, h * 0.6686667, w * 0.6030000, h * 0.6776667, w * 0.5823333, h * 0.6810000)
      ..cubicTo(
          w * 0.5920000, h * 0.6923333, w * 0.5966667, h * 0.7050000, w * 0.5966667, h * 0.7186667)
      ..cubicTo(
          w * 0.5966667, h * 0.7346667, w * 0.5910000, h * 0.7483333, w * 0.5796667, h * 0.7600000)
      ..cubicTo(
          w * 0.5683333, h * 0.7713333, w * 0.5546667, h * 0.7773333, w * 0.5386667, h * 0.7773333)
      ..cubicTo(
          w * 0.5226667, h * 0.7773333, w * 0.5090000, h * 0.7716667, w * 0.4976667, h * 0.7600000)
      ..cubicTo(
          w * 0.4863333, h * 0.7486667, w * 0.4806667, h * 0.7346667, w * 0.4806667, h * 0.7186667)
      ..cubicTo(
          w * 0.4806667, h * 0.7123333, w * 0.4816667, h * 0.7060000, w * 0.4840000, h * 0.6996667)
      ..lineTo(w * 0.4806667, h * 0.6996667)
      ..cubicTo(
          w * 0.4613333, h * 0.6996667, w * 0.4446667, h * 0.6926667, w * 0.4306667, h * 0.6786667)
      ..cubicTo(
          w * 0.4166667, h * 0.6646667, w * 0.4096667, h * 0.6480000, w * 0.4096667, h * 0.6286667)
      ..cubicTo(
          w * 0.4096667, h * 0.6153333, w * 0.4130000, h * 0.6033333, w * 0.4196667, h * 0.5930000)
      ..cubicTo(
          w * 0.4023333, h * 0.5833333, w * 0.3900000, h * 0.5696667, w * 0.3823333, h * 0.5513333)
      ..lineTo(w * 0.3396667, h * 0.5513333)
      ..lineTo(w * 0.3396667, h * 0.5510000)
      ..cubicTo(
          w * 0.3040000, h * 0.5486667, w * 0.2736667, h * 0.5346667, w * 0.2486667, h * 0.5086667)
      ..cubicTo(
          w * 0.2236667, h * 0.4826667, w * 0.2113333, h * 0.4520000, w * 0.2113333, h * 0.4160000)
      ..close()
      ..moveTo(w * 0.2580000, h * 0.4076667)
      ..cubicTo(
          w * 0.2580000, h * 0.4343333, w * 0.2673333, h * 0.4570000, w * 0.2860000, h * 0.4756667)
      ..cubicTo(
          w * 0.3046667, h * 0.4943333, w * 0.3273333, h * 0.5036667, w * 0.3536667, h * 0.5036667)
      ..cubicTo(
          w * 0.3700000, h * 0.5036667, w * 0.3853333, h * 0.5000000, w * 0.3993333, h * 0.4923333)
      ..cubicTo(
          w * 0.4033333, h * 0.5170000, w * 0.4150000, h * 0.5376667, w * 0.4340000, h * 0.5543333)
      ..cubicTo(
          w * 0.4530000, h * 0.5710000, w * 0.4756667, h * 0.5790000, w * 0.5013333, h * 0.5790000)
      ..cubicTo(
          w * 0.5303333, h * 0.5790000, w * 0.5550000, h * 0.5686667, w * 0.5753333, h * 0.5483333)
      ..cubicTo(
          w * 0.5890000, h * 0.5643333, w * 0.6060000, h * 0.5720000, w * 0.6266667, h * 0.5720000)
      ..cubicTo(
          w * 0.6456667, h * 0.5720000, w * 0.6616667, h * 0.5653333, w * 0.6753333, h * 0.5520000)
      ..cubicTo(
          w * 0.6886667, h * 0.5386667, w * 0.6953333, h * 0.5223333, w * 0.6953333, h * 0.5033333)
      ..cubicTo(
          w * 0.7086667, h * 0.4943333, w * 0.7193333, h * 0.4830000, w * 0.7270000, h * 0.4686667)
      ..cubicTo(
          w * 0.7346667, h * 0.4546667, w * 0.7386667, h * 0.4393333, w * 0.7386667, h * 0.4230000)
      ..cubicTo(
          w * 0.7386667, h * 0.3966667, w * 0.7293333, h * 0.3740000, w * 0.7103333, h * 0.3556667)
      ..cubicTo(
          w * 0.6913333, h * 0.3373333, w * 0.6686667, h * 0.3280000, w * 0.6420000, h * 0.3280000)
      ..cubicTo(
          w * 0.6233333, h * 0.3280000, w * 0.6063333, h * 0.3330000, w * 0.5910000, h * 0.3426667)
      ..cubicTo(
          w * 0.5930000, h * 0.3346667, w * 0.5936667, h * 0.3256667, w * 0.5936667, h * 0.3163333)
      ..cubicTo(
          w * 0.5936667, h * 0.2843333, w * 0.5823333, h * 0.2570000, w * 0.5593333, h * 0.2343333)
      ..cubicTo(
          w * 0.5363333, h * 0.2116667, w * 0.5086667, h * 0.2006667, w * 0.4763333, h * 0.2006667)
      ..cubicTo(
          w * 0.4450000, h * 0.2006667, w * 0.4180000, h * 0.2116667, w * 0.3953333, h * 0.2330000)
      ..cubicTo(
          w * 0.3726667, h * 0.2543333, w * 0.3606667, h * 0.2810000, w * 0.3596667, h * 0.3120000)
      ..cubicTo(
          w * 0.3590000, h * 0.3120000, w * 0.3580000, h * 0.3120000, w * 0.3570000, h * 0.3120000)
      ..cubicTo(
          w * 0.3556667, h * 0.3120000, w * 0.3546667, h * 0.3120000, w * 0.3540000, h * 0.3120000)
      ..cubicTo(
          w * 0.3276667, h * 0.3120000, w * 0.3053333, h * 0.3213333, w * 0.2863333, h * 0.3400000)
      ..cubicTo(
          w * 0.2673333, h * 0.3586667, w * 0.2580000, h * 0.3816667, w * 0.2580000, h * 0.4076667)
      ..close();
  }

  Path _snowPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1546667, h * 0.5650000)
      ..cubicTo(
          w * 0.1546667, h * 0.5263333, w * 0.1663333, h * 0.4923333, w * 0.1900000, h * 0.4623333)
      ..cubicTo(
          w * 0.2136667, h * 0.4323333, w * 0.2440000, h * 0.4130000, w * 0.2813333, h * 0.4036667)
      ..cubicTo(
          w * 0.2916667, h * 0.3583333, w * 0.3150000, h * 0.3210000, w * 0.3513333, h * 0.2916667)
      ..cubicTo(
          w * 0.3876667, h * 0.2623333, w * 0.4293333, h * 0.2480000, w * 0.4763333, h * 0.2480000)
      ..cubicTo(
          w * 0.5223333, h * 0.2480000, w * 0.5630000, h * 0.2623333, w * 0.5990000, h * 0.2906667)
      ..cubicTo(
          w * 0.6350000, h * 0.3190000, w * 0.6583333, h * 0.3556667, w * 0.6690000, h * 0.4003333)
      ..lineTo(w * 0.6796667, h * 0.4003333)
      ..cubicTo(
          w * 0.7093333, h * 0.4003333, w * 0.7370000, h * 0.4076667, w * 0.7623333, h * 0.4223333)
      ..cubicTo(
          w * 0.7876667, h * 0.4370000, w * 0.8080000, h * 0.4570000, w * 0.8226667, h * 0.4823333)
      ..cubicTo(
          w * 0.8373333, h * 0.5076667, w * 0.8450000, h * 0.5353333, w * 0.8450000, h * 0.5650000)
      ..cubicTo(
          w * 0.8450000, h * 0.6090000, w * 0.8296667, h * 0.6473333, w * 0.7986667, h * 0.6790000)
      ..cubicTo(
          w * 0.7680000, h * 0.7110000, w * 0.7303333, h * 0.7276667, w * 0.6860000, h * 0.7290000)
      ..cubicTo(
          w * 0.6816667, h * 0.7290000, w * 0.6793333, h * 0.7270000, w * 0.6793333, h * 0.7233333)
      ..lineTo(w * 0.6793333, h * 0.6790000)
      ..cubicTo(
          w * 0.6793333, h * 0.6750000, w * 0.6816667, h * 0.6730000, w * 0.6860000, h * 0.6730000)
      ..cubicTo(
          w * 0.7143333, h * 0.6716667, w * 0.7386667, h * 0.6603333, w * 0.7586667, h * 0.6390000)
      ..cubicTo(
          w * 0.7786667, h * 0.6176667, w * 0.7886667, h * 0.5930000, w * 0.7886667, h * 0.5646667)
      ..cubicTo(
          w * 0.7886667, h * 0.5350000, w * 0.7780000, h * 0.5096667, w * 0.7563333, h * 0.4880000)
      ..cubicTo(
          w * 0.7346667, h * 0.4663333, w * 0.7090000, h * 0.4556667, w * 0.6790000, h * 0.4556667)
      ..lineTo(w * 0.6253333, h * 0.4556667)
      ..cubicTo(
          w * 0.6213333, h * 0.4556667, w * 0.6193333, h * 0.4536667, w * 0.6193333, h * 0.4500000)
      ..lineTo(w * 0.6166667, h * 0.4306667)
      ..cubicTo(
          w * 0.6130000, h * 0.3946667, w * 0.5973333, h * 0.3643333, w * 0.5703333, h * 0.3400000)
      ..cubicTo(
          w * 0.5430000, h * 0.3156667, w * 0.5116667, h * 0.3033333, w * 0.4753333, h * 0.3033333)
      ..cubicTo(
          w * 0.4386667, h * 0.3033333, w * 0.4070000, h * 0.3156667, w * 0.3800000, h * 0.3403333)
      ..cubicTo(
          w * 0.3530000, h * 0.3650000, w * 0.3376667, h * 0.3953333, w * 0.3343333, h * 0.4320000)
      ..lineTo(w * 0.3323333, h * 0.4486667)
      ..cubicTo(
          w * 0.3323333, h * 0.4526667, w * 0.3300000, h * 0.4550000, w * 0.3256667, h * 0.4550000)
      ..lineTo(w * 0.3080000, h * 0.4573333)
      ..cubicTo(
          w * 0.2803333, h * 0.4596667, w * 0.2570000, h * 0.4710000, w * 0.2380000, h * 0.4920000)
      ..cubicTo(
          w * 0.2190000, h * 0.5130000, w * 0.2096667, h * 0.5370000, w * 0.2096667, h * 0.5650000)
      ..cubicTo(
          w * 0.2096667, h * 0.5933333, w * 0.2196667, h * 0.6180000, w * 0.2396667, h * 0.6393333)
      ..cubicTo(
          w * 0.2596667, h * 0.6606667, w * 0.2840000, h * 0.6716667, w * 0.3123333, h * 0.6733333)
      ..cubicTo(
          w * 0.3160000, h * 0.6733333, w * 0.3180000, h * 0.6753333, w * 0.3180000, h * 0.6793333)
      ..lineTo(w * 0.3180000, h * 0.7236667)
      ..cubicTo(
          w * 0.3180000, h * 0.7273333, w * 0.3160000, h * 0.7293333, w * 0.3123333, h * 0.7293333)
      ..cubicTo(
          w * 0.2676667, h * 0.7280000, w * 0.2300000, h * 0.7113333, w * 0.1990000, h * 0.6793333)
      ..cubicTo(
          w * 0.1700000, h * 0.6473333, w * 0.1546667, h * 0.6090000, w * 0.1546667, h * 0.5650000)
      ..close()
      ..moveTo(w * 0.3666667, h * 0.7006667)
      ..cubicTo(
          w * 0.3666667, h * 0.6933333, w * 0.3693333, h * 0.6866667, w * 0.3746667, h * 0.6813333)
      ..cubicTo(
          w * 0.3800000, h * 0.6760000, w * 0.3863333, h * 0.6733333, w * 0.3943333, h * 0.6733333)
      ..cubicTo(
          w * 0.4020000, h * 0.6733333, w * 0.4086667, h * 0.6760000, w * 0.4140000, h * 0.6813333)
      ..cubicTo(
          w * 0.4193333, h * 0.6866667, w * 0.4220000, h * 0.6933333, w * 0.4220000, h * 0.7006667)
      ..cubicTo(
          w * 0.4220000, h * 0.7086667, w * 0.4193333, h * 0.7153333, w * 0.4140000, h * 0.7206667)
      ..cubicTo(
          w * 0.4086667, h * 0.7263333, w * 0.4023333, h * 0.7290000, w * 0.3943333, h * 0.7290000)
      ..cubicTo(
          w * 0.3866667, h * 0.7290000, w * 0.3800000, h * 0.7263333, w * 0.3746667, h * 0.7206667)
      ..cubicTo(
          w * 0.3693333, h * 0.7153333, w * 0.3666667, h * 0.7086667, w * 0.3666667, h * 0.7006667)
      ..close()
      ..moveTo(w * 0.3666667, h * 0.8216667)
      ..cubicTo(
          w * 0.3666667, h * 0.8136667, w * 0.3693333, h * 0.8070000, w * 0.3746667, h * 0.8016667)
      ..cubicTo(
          w * 0.3800000, h * 0.7966667, w * 0.3863333, h * 0.7940000, w * 0.3940000, h * 0.7940000)
      ..cubicTo(
          w * 0.4016667, h * 0.7940000, w * 0.4083333, h * 0.7966667, w * 0.4136667, h * 0.8016667)
      ..cubicTo(
          w * 0.4190000, h * 0.8070000, w * 0.4216667, h * 0.8133333, w * 0.4216667, h * 0.8213333)
      ..cubicTo(
          w * 0.4216667, h * 0.8293333, w * 0.4190000, h * 0.8356667, w * 0.4136667, h * 0.8410000)
      ..cubicTo(
          w * 0.4083333, h * 0.8463333, w * 0.4020000, h * 0.8486667, w * 0.3940000, h * 0.8486667)
      ..cubicTo(
          w * 0.3863333, h * 0.8486667, w * 0.3796667, h * 0.8460000, w * 0.3743333, h * 0.8410000)
      ..cubicTo(
          w * 0.3693333, h * 0.8360000, w * 0.3666667, h * 0.8293333, w * 0.3666667, h * 0.8216667)
      ..close()
      ..moveTo(w * 0.4730000, h * 0.7650000)
      ..cubicTo(
          w * 0.4730000, h * 0.7573333, w * 0.4756667, h * 0.7503333, w * 0.4813333, h * 0.7443333)
      ..cubicTo(
          w * 0.4866667, h * 0.7390000, w * 0.4930000, h * 0.7363333, w * 0.5003333, h * 0.7363333)
      ..cubicTo(
          w * 0.5080000, h * 0.7363333, w * 0.5146667, h * 0.7393333, w * 0.5203333, h * 0.7450000)
      ..cubicTo(
          w * 0.5260000, h * 0.7506667, w * 0.5290000, h * 0.7573333, w * 0.5290000, h * 0.7650000)
      ..cubicTo(
          w * 0.5290000, h * 0.7726667, w * 0.5263333, h * 0.7793333, w * 0.5206667, h * 0.7850000)
      ..cubicTo(
          w * 0.5150000, h * 0.7906667, w * 0.5083333, h * 0.7933333, w * 0.5003333, h * 0.7933333)
      ..cubicTo(
          w * 0.4926667, h * 0.7933333, w * 0.4863333, h * 0.7906667, w * 0.4810000, h * 0.7850000)
      ..cubicTo(
          w * 0.4756667, h * 0.7793333, w * 0.4730000, h * 0.7726667, w * 0.4730000, h * 0.7650000)
      ..close()
      ..moveTo(w * 0.4730000, h * 0.6443333)
      ..cubicTo(
          w * 0.4730000, h * 0.6366667, w * 0.4756667, h * 0.6300000, w * 0.4813333, h * 0.6243333)
      ..cubicTo(
          w * 0.4873333, h * 0.6190000, w * 0.4936667, h * 0.6163333, w * 0.5003333, h * 0.6163333)
      ..cubicTo(
          w * 0.5083333, h * 0.6163333, w * 0.5150000, h * 0.6190000, w * 0.5206667, h * 0.6246667)
      ..cubicTo(
          w * 0.5263333, h * 0.6303333, w * 0.5290000, h * 0.6366667, w * 0.5290000, h * 0.6446667)
      ..cubicTo(
          w * 0.5290000, h * 0.6523333, w * 0.5263333, h * 0.6590000, w * 0.5206667, h * 0.6643333)
      ..cubicTo(
          w * 0.5150000, h * 0.6696667, w * 0.5083333, h * 0.6723333, w * 0.5003333, h * 0.6723333)
      ..cubicTo(
          w * 0.4926667, h * 0.6723333, w * 0.4863333, h * 0.6696667, w * 0.4810000, h * 0.6643333)
      ..cubicTo(
          w * 0.4756667, h * 0.6586667, w * 0.4730000, h * 0.6520000, w * 0.4730000, h * 0.6443333)
      ..close()
      ..moveTo(w * 0.4730000, h * 0.8870000)
      ..cubicTo(
          w * 0.4730000, h * 0.8793333, w * 0.4756667, h * 0.8726667, w * 0.4813333, h * 0.8666667)
      ..cubicTo(
          w * 0.4866667, h * 0.8613333, w * 0.4930000, h * 0.8586667, w * 0.5003333, h * 0.8586667)
      ..cubicTo(
          w * 0.5083333, h * 0.8586667, w * 0.5150000, h * 0.8613333, w * 0.5206667, h * 0.8670000)
      ..cubicTo(
          w * 0.5263333, h * 0.8726667, w * 0.5290000, h * 0.8793333, w * 0.5290000, h * 0.8870000)
      ..cubicTo(
          w * 0.5290000, h * 0.8946667, w * 0.5263333, h * 0.9013333, w * 0.5206667, h * 0.9066667)
      ..cubicTo(
          w * 0.5150000, h * 0.9120000, w * 0.5083333, h * 0.9146667, w * 0.5003333, h * 0.9146667)
      ..cubicTo(
          w * 0.4926667, h * 0.9146667, w * 0.4863333, h * 0.9120000, w * 0.4810000, h * 0.9066667)
      ..cubicTo(
          w * 0.4756667, h * 0.9010000, w * 0.4730000, h * 0.8946667, w * 0.4730000, h * 0.8870000)
      ..close()
      ..moveTo(w * 0.5803333, h * 0.7006667)
      ..cubicTo(
          w * 0.5803333, h * 0.6933333, w * 0.5830000, h * 0.6870000, w * 0.5886667, h * 0.6813333)
      ..cubicTo(
          w * 0.5943333, h * 0.6756667, w * 0.6010000, h * 0.6730000, w * 0.6086667, h * 0.6730000)
      ..cubicTo(
          w * 0.6163333, h * 0.6730000, w * 0.6230000, h * 0.6756667, w * 0.6283333, h * 0.6810000)
      ..cubicTo(
          w * 0.6336667, h * 0.6863333, w * 0.6363333, h * 0.6930000, w * 0.6363333, h * 0.7003333)
      ..cubicTo(
          w * 0.6363333, h * 0.7083333, w * 0.6336667, h * 0.7150000, w * 0.6283333, h * 0.7203333)
      ..cubicTo(
          w * 0.6230000, h * 0.7260000, w * 0.6166667, h * 0.7286667, w * 0.6086667, h * 0.7286667)
      ..cubicTo(
          w * 0.6006667, h * 0.7286667, w * 0.5940000, h * 0.7260000, w * 0.5886667, h * 0.7203333)
      ..cubicTo(
          w * 0.5833333, h * 0.7150000, w * 0.5803333, h * 0.7083333, w * 0.5803333, h * 0.7006667)
      ..close()
      ..moveTo(w * 0.5803333, h * 0.8216667)
      ..cubicTo(
          w * 0.5803333, h * 0.8143333, w * 0.5830000, h * 0.8076667, w * 0.5886667, h * 0.8016667)
      ..cubicTo(
          w * 0.5940000, h * 0.7966667, w * 0.6006667, h * 0.7940000, w * 0.6086667, h * 0.7940000)
      ..cubicTo(
          w * 0.6166667, h * 0.7940000, w * 0.6230000, h * 0.7966667, w * 0.6283333, h * 0.8016667)
      ..cubicTo(
          w * 0.6336667, h * 0.8066667, w * 0.6360000, h * 0.8133333, w * 0.6360000, h * 0.8213333)
      ..cubicTo(
          w * 0.6360000, h * 0.8293333, w * 0.6333333, h * 0.8356667, w * 0.6283333, h * 0.8410000)
      ..cubicTo(
          w * 0.6230000, h * 0.8463333, w * 0.6166667, h * 0.8486667, w * 0.6086667, h * 0.8486667)
      ..cubicTo(
          w * 0.6006667, h * 0.8486667, w * 0.5940000, h * 0.8460000, w * 0.5886667, h * 0.8406667)
      ..cubicTo(
          w * 0.5833333, h * 0.8356667, w * 0.5803333, h * 0.8293333, w * 0.5803333, h * 0.8216667)
      ..close();
  }

  Path _snowflakeColdPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.2486667, h * 0.4803333)
      ..cubicTo(
          w * 0.2486667, h * 0.4740000, w * 0.2510000, h * 0.4683333, w * 0.2553333, h * 0.4636667)
      ..cubicTo(
          w * 0.2596667, h * 0.4590000, w * 0.2650000, h * 0.4566667, w * 0.2713333, h * 0.4566667)
      ..cubicTo(
          w * 0.2776667, h * 0.4566667, w * 0.2833333, h * 0.4590000, w * 0.2876667, h * 0.4636667)
      ..cubicTo(
          w * 0.2920000, h * 0.4683333, w * 0.2943333, h * 0.4736667, w * 0.2943333, h * 0.4803333)
      ..cubicTo(
          w * 0.2943333, h * 0.4866667, w * 0.2920000, h * 0.4920000, w * 0.2876667, h * 0.4963333)
      ..cubicTo(
          w * 0.2833333, h * 0.5006667, w * 0.2776667, h * 0.5030000, w * 0.2716667, h * 0.5030000)
      ..cubicTo(
          w * 0.2656667, h * 0.5030000, w * 0.2600000, h * 0.5006667, w * 0.2556667, h * 0.4963333)
      ..cubicTo(
          w * 0.2506667, h * 0.4916667, w * 0.2486667, h * 0.4863333, w * 0.2486667, h * 0.4803333)
      ..close()
      ..moveTo(w * 0.3146667, h * 0.4803333)
      ..cubicTo(
          w * 0.3146667, h * 0.4740000, w * 0.3170000, h * 0.4683333, w * 0.3213333, h * 0.4636667)
      ..cubicTo(
          w * 0.3256667, h * 0.4590000, w * 0.3310000, h * 0.4566667, w * 0.3373333, h * 0.4566667)
      ..lineTo(w * 0.4450000, h * 0.4566667)
      ..lineTo(w * 0.3690000, h * 0.3806667)
      ..cubicTo(
          w * 0.3643333, h * 0.3766667, w * 0.3620000, h * 0.3713333, w * 0.3620000, h * 0.3650000)
      ..cubicTo(
          w * 0.3620000, h * 0.3586667, w * 0.3643333, h * 0.3533333, w * 0.3690000, h * 0.3486667)
      ..cubicTo(
          w * 0.3736667, h * 0.3440000, w * 0.3790000, h * 0.3416667, w * 0.3853333, h * 0.3416667)
      ..cubicTo(
          w * 0.3916667, h * 0.3416667, w * 0.3970000, h * 0.3440000, w * 0.4016667, h * 0.3486667)
      ..lineTo(w * 0.4773333, h * 0.4243333)
      ..lineTo(w * 0.4773333, h * 0.3173333)
      ..cubicTo(
          w * 0.4773333, h * 0.3110000, w * 0.4796667, h * 0.3053333, w * 0.4843333, h * 0.3006667)
      ..cubicTo(
          w * 0.4890000, h * 0.2960000, w * 0.4943333, h * 0.2936667, w * 0.5010000, h * 0.2936667)
      ..cubicTo(
          w * 0.5073333, h * 0.2936667, w * 0.5126667, h * 0.2960000, w * 0.5170000, h * 0.3006667)
      ..cubicTo(
          w * 0.5213333, h * 0.3053333, w * 0.5236667, h * 0.3106667, w * 0.5236667, h * 0.3173333)
      ..lineTo(w * 0.5236667, h * 0.4250000)
      ..lineTo(w * 0.6000000, h * 0.3483333)
      ..cubicTo(
          w * 0.6046667, h * 0.3436667, w * 0.6100000, h * 0.3413333, w * 0.6160000, h * 0.3413333)
      ..cubicTo(
          w * 0.6220000, h * 0.3413333, w * 0.6276667, h * 0.3436667, w * 0.6323333, h * 0.3483333)
      ..cubicTo(
          w * 0.6363333, h * 0.3530000, w * 0.6383333, h * 0.3583333, w * 0.6383333, h * 0.3646667)
      ..cubicTo(
          w * 0.6383333, h * 0.3710000, w * 0.6363333, h * 0.3763333, w * 0.6323333, h * 0.3803333)
      ..lineTo(w * 0.5563333, h * 0.4563333)
      ..lineTo(w * 0.6640000, h * 0.4563333)
      ..cubicTo(
          w * 0.6700000, h * 0.4563333, w * 0.6753333, h * 0.4586667, w * 0.6796667, h * 0.4633333)
      ..cubicTo(
          w * 0.6840000, h * 0.4680000, w * 0.6863333, h * 0.4733333, w * 0.6863333, h * 0.4800000)
      ..cubicTo(
          w * 0.6863333, h * 0.4860000, w * 0.6840000, h * 0.4913333, w * 0.6796667, h * 0.4956667)
      ..cubicTo(
          w * 0.6753333, h * 0.5000000, w * 0.6700000, h * 0.5023333, w * 0.6640000, h * 0.5023333)
      ..lineTo(w * 0.5563333, h * 0.5023333)
      ..lineTo(w * 0.6326667, h * 0.5786667)
      ..cubicTo(
          w * 0.6366667, h * 0.5826667, w * 0.6386667, h * 0.5880000, w * 0.6386667, h * 0.5943333)
      ..cubicTo(
          w * 0.6386667, h * 0.6006667, w * 0.6366667, h * 0.6060000, w * 0.6326667, h * 0.6106667)
      ..cubicTo(
          w * 0.6280000, h * 0.6153333, w * 0.6223333, h * 0.6176667, w * 0.6163333, h * 0.6176667)
      ..cubicTo(
          w * 0.6103333, h * 0.6176667, w * 0.6046667, h * 0.6153333, w * 0.6003333, h * 0.6106667)
      ..lineTo(w * 0.5240000, h * 0.5340000)
      ..lineTo(w * 0.5240000, h * 0.6420000)
      ..cubicTo(
          w * 0.5240000, h * 0.6483333, w * 0.5216667, h * 0.6540000, w * 0.5173333, h * 0.6583333)
      ..cubicTo(
          w * 0.5130000, h * 0.6626667, w * 0.5076667, h * 0.6650000, w * 0.5013333, h * 0.6650000)
      ..cubicTo(
          w * 0.4950000, h * 0.6650000, w * 0.4893333, h * 0.6626667, w * 0.4846667, h * 0.6583333)
      ..cubicTo(
          w * 0.4800000, h * 0.6540000, w * 0.4776667, h * 0.6483333, w * 0.4776667, h * 0.6420000)
      ..lineTo(w * 0.4776667, h * 0.5346667)
      ..lineTo(w * 0.4020000, h * 0.6103333)
      ..cubicTo(
          w * 0.3973333, h * 0.6150000, w * 0.3920000, h * 0.6173333, w * 0.3856667, h * 0.6173333)
      ..cubicTo(
          w * 0.3793333, h * 0.6173333, w * 0.3740000, h * 0.6150000, w * 0.3693333, h * 0.6103333)
      ..cubicTo(
          w * 0.3646667, h * 0.6056667, w * 0.3623333, h * 0.6003333, w * 0.3623333, h * 0.5940000)
      ..cubicTo(
          w * 0.3623333, h * 0.5876667, w * 0.3646667, h * 0.5826667, w * 0.3693333, h * 0.5783333)
      ..lineTo(w * 0.4460000, h * 0.5020000)
      ..lineTo(w * 0.3380000, h * 0.5020000)
      ..cubicTo(
          w * 0.3316667, h * 0.5020000, w * 0.3263333, h * 0.4996667, w * 0.3220000, h * 0.4953333)
      ..cubicTo(
          w * 0.3166667, h * 0.4916667, w * 0.3146667, h * 0.4863333, w * 0.3146667, h * 0.4803333)
      ..close()
      ..moveTo(w * 0.3150000, h * 0.6416667)
      ..cubicTo(
          w * 0.3150000, h * 0.6356667, w * 0.3173333, h * 0.6300000, w * 0.3220000, h * 0.6256667)
      ..cubicTo(
          w * 0.3260000, h * 0.6210000, w * 0.3313333, h * 0.6186667, w * 0.3376667, h * 0.6186667)
      ..cubicTo(
          w * 0.3440000, h * 0.6186667, w * 0.3493333, h * 0.6210000, w * 0.3540000, h * 0.6256667)
      ..cubicTo(
          w * 0.3586667, h * 0.6303333, w * 0.3610000, h * 0.6356667, w * 0.3610000, h * 0.6416667)
      ..cubicTo(
          w * 0.3610000, h * 0.6476667, w * 0.3586667, h * 0.6533333, w * 0.3540000, h * 0.6576667)
      ..cubicTo(
          w * 0.3493333, h * 0.6623333, w * 0.3440000, h * 0.6646667, w * 0.3376667, h * 0.6646667)
      ..cubicTo(
          w * 0.3313333, h * 0.6646667, w * 0.3260000, h * 0.6623333, w * 0.3220000, h * 0.6576667)
      ..cubicTo(
          w * 0.3173333, h * 0.6533333, w * 0.3150000, h * 0.6480000, w * 0.3150000, h * 0.6416667)
      ..close()
      ..moveTo(w * 0.3150000, h * 0.3180000)
      ..cubicTo(
          w * 0.3150000, h * 0.3120000, w * 0.3173333, h * 0.3063333, w * 0.3220000, h * 0.3020000)
      ..cubicTo(
          w * 0.3260000, h * 0.2973333, w * 0.3313333, h * 0.2950000, w * 0.3376667, h * 0.2950000)
      ..cubicTo(
          w * 0.3440000, h * 0.2950000, w * 0.3493333, h * 0.2973333, w * 0.3540000, h * 0.3020000)
      ..cubicTo(
          w * 0.3586667, h * 0.3066667, w * 0.3610000, h * 0.3120000, w * 0.3610000, h * 0.3180000)
      ..cubicTo(
          w * 0.3610000, h * 0.3240000, w * 0.3586667, h * 0.3296667, w * 0.3540000, h * 0.3343333)
      ..cubicTo(
          w * 0.3493333, h * 0.3390000, w * 0.3440000, h * 0.3413333, w * 0.3376667, h * 0.3413333)
      ..cubicTo(
          w * 0.3313333, h * 0.3413333, w * 0.3260000, h * 0.3390000, w * 0.3220000, h * 0.3343333)
      ..cubicTo(
          w * 0.3173333, h * 0.3296667, w * 0.3150000, h * 0.3240000, w * 0.3150000, h * 0.3180000)
      ..close()
      ..moveTo(w * 0.4766667, h * 0.7083333)
      ..cubicTo(
          w * 0.4766667, h * 0.7023333, w * 0.4790000, h * 0.6970000, w * 0.4836667, h * 0.6926667)
      ..cubicTo(
          w * 0.4883333, h * 0.6883333, w * 0.4936667, h * 0.6860000, w * 0.5003333, h * 0.6860000)
      ..cubicTo(
          w * 0.5066667, h * 0.6860000, w * 0.5120000, h * 0.6883333, w * 0.5163333, h * 0.6926667)
      ..cubicTo(
          w * 0.5206667, h * 0.6970000, w * 0.5230000, h * 0.7023333, w * 0.5230000, h * 0.7083333)
      ..cubicTo(
          w * 0.5230000, h * 0.7146667, w * 0.5206667, h * 0.7203333, w * 0.5163333, h * 0.7246667)
      ..cubicTo(
          w * 0.5120000, h * 0.7290000, w * 0.5066667, h * 0.7313333, w * 0.5003333, h * 0.7313333)
      ..cubicTo(
          w * 0.4940000, h * 0.7313333, w * 0.4883333, h * 0.7290000, w * 0.4836667, h * 0.7246667)
      ..cubicTo(
          w * 0.4790000, h * 0.7203333, w * 0.4766667, h * 0.7150000, w * 0.4766667, h * 0.7083333)
      ..close()
      ..moveTo(w * 0.4766667, h * 0.2513333)
      ..cubicTo(
          w * 0.4766667, h * 0.2450000, w * 0.4790000, h * 0.2393333, w * 0.4836667, h * 0.2350000)
      ..cubicTo(
          w * 0.4883333, h * 0.2306667, w * 0.4936667, h * 0.2283333, w * 0.5003333, h * 0.2283333)
      ..cubicTo(
          w * 0.5066667, h * 0.2283333, w * 0.5120000, h * 0.2306667, w * 0.5163333, h * 0.2350000)
      ..cubicTo(
          w * 0.5206667, h * 0.2393333, w * 0.5230000, h * 0.2450000, w * 0.5230000, h * 0.2513333)
      ..cubicTo(
          w * 0.5230000, h * 0.2573333, w * 0.5206667, h * 0.2626667, w * 0.5163333, h * 0.2670000)
      ..cubicTo(
          w * 0.5120000, h * 0.2713333, w * 0.5066667, h * 0.2736667, w * 0.5003333, h * 0.2736667)
      ..cubicTo(
          w * 0.4940000, h * 0.2736667, w * 0.4883333, h * 0.2713333, w * 0.4836667, h * 0.2670000)
      ..cubicTo(
          w * 0.4790000, h * 0.2626667, w * 0.4766667, h * 0.2573333, w * 0.4766667, h * 0.2513333)
      ..close()
      ..moveTo(w * 0.6390000, h * 0.6416667)
      ..cubicTo(
          w * 0.6390000, h * 0.6356667, w * 0.6413333, h * 0.6300000, w * 0.6460000, h * 0.6256667)
      ..cubicTo(
          w * 0.6500000, h * 0.6210000, w * 0.6553333, h * 0.6186667, w * 0.6616667, h * 0.6186667)
      ..cubicTo(
          w * 0.6680000, h * 0.6186667, w * 0.6733333, h * 0.6210000, w * 0.6780000, h * 0.6256667)
      ..cubicTo(
          w * 0.6826667, h * 0.6303333, w * 0.6850000, h * 0.6356667, w * 0.6850000, h * 0.6416667)
      ..cubicTo(
          w * 0.6850000, h * 0.6476667, w * 0.6826667, h * 0.6533333, w * 0.6780000, h * 0.6576667)
      ..cubicTo(
          w * 0.6733333, h * 0.6623333, w * 0.6680000, h * 0.6646667, w * 0.6616667, h * 0.6646667)
      ..cubicTo(
          w * 0.6553333, h * 0.6646667, w * 0.6500000, h * 0.6623333, w * 0.6460000, h * 0.6576667)
      ..cubicTo(
          w * 0.6413333, h * 0.6533333, w * 0.6390000, h * 0.6480000, w * 0.6390000, h * 0.6416667)
      ..close()
      ..moveTo(w * 0.6390000, h * 0.3180000)
      ..cubicTo(
          w * 0.6390000, h * 0.3120000, w * 0.6413333, h * 0.3063333, w * 0.6460000, h * 0.3020000)
      ..cubicTo(
          w * 0.6500000, h * 0.2973333, w * 0.6553333, h * 0.2950000, w * 0.6616667, h * 0.2950000)
      ..cubicTo(
          w * 0.6680000, h * 0.2950000, w * 0.6733333, h * 0.2973333, w * 0.6780000, h * 0.3020000)
      ..cubicTo(
          w * 0.6826667, h * 0.3066667, w * 0.6850000, h * 0.3120000, w * 0.6850000, h * 0.3180000)
      ..cubicTo(
          w * 0.6850000, h * 0.3240000, w * 0.6826667, h * 0.3296667, w * 0.6780000, h * 0.3343333)
      ..cubicTo(
          w * 0.6733333, h * 0.3390000, w * 0.6680000, h * 0.3413333, w * 0.6616667, h * 0.3413333)
      ..cubicTo(
          w * 0.6553333, h * 0.3413333, w * 0.6500000, h * 0.3390000, w * 0.6460000, h * 0.3343333)
      ..cubicTo(
          w * 0.6413333, h * 0.3296667, w * 0.6390000, h * 0.3240000, w * 0.6390000, h * 0.3180000)
      ..close()
      ..moveTo(w * 0.7056667, h * 0.4803333)
      ..cubicTo(
          w * 0.7056667, h * 0.4740000, w * 0.7080000, h * 0.4683333, w * 0.7123333, h * 0.4636667)
      ..cubicTo(
          w * 0.7166667, h * 0.4590000, w * 0.7223333, h * 0.4566667, w * 0.7286667, h * 0.4566667)
      ..cubicTo(
          w * 0.7346667, h * 0.4566667, w * 0.7400000, h * 0.4590000, w * 0.7443333, h * 0.4636667)
      ..cubicTo(
          w * 0.7486667, h * 0.4683333, w * 0.7510000, h * 0.4736667, w * 0.7510000, h * 0.4803333)
      ..cubicTo(
          w * 0.7510000, h * 0.4863333, w * 0.7486667, h * 0.4916667, w * 0.7443333, h * 0.4960000)
      ..cubicTo(
          w * 0.7400000, h * 0.5003333, w * 0.7346667, h * 0.5026667, w * 0.7286667, h * 0.5026667)
      ..cubicTo(
          w * 0.7223333, h * 0.5026667, w * 0.7166667, h * 0.5003333, w * 0.7123333, h * 0.4960000)
      ..cubicTo(
          w * 0.7080000, h * 0.4916667, w * 0.7056667, h * 0.4863333, w * 0.7056667, h * 0.4803333)
      ..close();
  }

  Path _sprinklePath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1546667, h * 0.5636667)
      ..cubicTo(
          w * 0.1546667, h * 0.5253333, w * 0.1666667, h * 0.4913333, w * 0.1906667, h * 0.4613333)
      ..cubicTo(
          w * 0.2146667, h * 0.4313333, w * 0.2450000, h * 0.4123333, w * 0.2816667, h * 0.4036667)
      ..cubicTo(
          w * 0.2920000, h * 0.3583333, w * 0.3153333, h * 0.3210000, w * 0.3516667, h * 0.2920000)
      ..cubicTo(
          w * 0.3880000, h * 0.2630000, w * 0.4300000, h * 0.2483333, w * 0.4770000, h * 0.2483333)
      ..cubicTo(
          w * 0.5230000, h * 0.2483333, w * 0.5636667, h * 0.2626667, w * 0.5996667, h * 0.2906667)
      ..cubicTo(
          w * 0.6353333, h * 0.3190000, w * 0.6590000, h * 0.3553333, w * 0.6700000, h * 0.4000000)
      ..lineTo(w * 0.6803333, h * 0.4000000)
      ..cubicTo(
          w * 0.7100000, h * 0.4000000, w * 0.7376667, h * 0.4073333, w * 0.7630000, h * 0.4216667)
      ..cubicTo(
          w * 0.7883333, h * 0.4360000, w * 0.8086667, h * 0.4560000, w * 0.8233333, h * 0.4810000)
      ..cubicTo(
          w * 0.8380000, h * 0.5060000, w * 0.8456667, h * 0.5336667, w * 0.8456667, h * 0.5633333)
      ..cubicTo(
          w * 0.8456667, h * 0.6080000, w * 0.8303333, h * 0.6463333, w * 0.7996667, h * 0.6783333)
      ..cubicTo(
          w * 0.7690000, h * 0.7103333, w * 0.7313333, h * 0.7273333, w * 0.6870000, h * 0.7286667)
      ..cubicTo(
          w * 0.6826667, h * 0.7286667, w * 0.6803333, h * 0.7266667, w * 0.6803333, h * 0.7230000)
      ..lineTo(w * 0.6803333, h * 0.6786667)
      ..cubicTo(
          w * 0.6803333, h * 0.6746667, w * 0.6826667, h * 0.6726667, w * 0.6870000, h * 0.6726667)
      ..cubicTo(
          w * 0.7156667, h * 0.6713333, w * 0.7396667, h * 0.6600000, w * 0.7596667, h * 0.6386667)
      ..cubicTo(
          w * 0.7796667, h * 0.6173333, w * 0.7896667, h * 0.5923333, w * 0.7896667, h * 0.5633333)
      ..cubicTo(
          w * 0.7896667, h * 0.5343333, w * 0.7790000, h * 0.5093333, w * 0.7570000, h * 0.4880000)
      ..cubicTo(
          w * 0.7353333, h * 0.4666667, w * 0.7096667, h * 0.4560000, w * 0.6800000, h * 0.4560000)
      ..lineTo(w * 0.6266667, h * 0.4560000)
      ..cubicTo(
          w * 0.6226667, h * 0.4560000, w * 0.6203333, h * 0.4540000, w * 0.6203333, h * 0.4503333)
      ..lineTo(w * 0.6180000, h * 0.4310000)
      ..cubicTo(
          w * 0.6143333, h * 0.3953333, w * 0.5990000, h * 0.3650000, w * 0.5720000, h * 0.3406667)
      ..cubicTo(
          w * 0.5446667, h * 0.3163333, w * 0.5130000, h * 0.3040000, w * 0.4770000, h * 0.3040000)
      ..cubicTo(
          w * 0.4406667, h * 0.3040000, w * 0.4086667, h * 0.3160000, w * 0.3816667, h * 0.3403333)
      ..cubicTo(
          w * 0.3546667, h * 0.3646667, w * 0.3393333, h * 0.3946667, w * 0.3356667, h * 0.4306667)
      ..lineTo(w * 0.3336667, h * 0.4486667)
      ..cubicTo(
          w * 0.3336667, h * 0.4526667, w * 0.3313333, h * 0.4546667, w * 0.3270000, h * 0.4546667)
      ..lineTo(w * 0.3093333, h * 0.4556667)
      ..cubicTo(
          w * 0.2820000, h * 0.4570000, w * 0.2590000, h * 0.4680000, w * 0.2396667, h * 0.4890000)
      ..cubicTo(
          w * 0.2203333, h * 0.5100000, w * 0.2110000, h * 0.5346667, w * 0.2110000, h * 0.5630000)
      ..cubicTo(
          w * 0.2110000, h * 0.5920000, w * 0.2210000, h * 0.6170000, w * 0.2410000, h * 0.6383333)
      ..cubicTo(
          w * 0.2610000, h * 0.6596667, w * 0.2853333, h * 0.6710000, w * 0.3136667, h * 0.6723333)
      ..cubicTo(
          w * 0.3173333, h * 0.6723333, w * 0.3193333, h * 0.6743333, w * 0.3193333, h * 0.6783333)
      ..lineTo(w * 0.3193333, h * 0.7226667)
      ..cubicTo(
          w * 0.3193333, h * 0.7263333, w * 0.3173333, h * 0.7283333, w * 0.3136667, h * 0.7283333)
      ..cubicTo(
          w * 0.2690000, h * 0.7263333, w * 0.2313333, h * 0.7093333, w * 0.2003333, h * 0.6773333)
      ..cubicTo(
          w * 0.1693333, h * 0.6453333, w * 0.1546667, h * 0.6080000, w * 0.1546667, h * 0.5636667)
      ..close()
      ..moveTo(w * 0.3523333, h * 0.5930000)
      ..cubicTo(
          w * 0.3523333, h * 0.5850000, w * 0.3563333, h * 0.5740000, w * 0.3646667, h * 0.5600000)
      ..cubicTo(
          w * 0.3726667, h * 0.5460000, w * 0.3803333, h * 0.5350000, w * 0.3873333, h * 0.5263333)
      ..cubicTo(
          w * 0.3943333, h * 0.5183333, w * 0.3986667, h * 0.5136667, w * 0.4000000, h * 0.5123333)
      ..lineTo(w * 0.4120000, h * 0.5256667)
      ..cubicTo(
          w * 0.4206667, h * 0.5350000, w * 0.4286667, h * 0.5460000, w * 0.4360000, h * 0.5596667)
      ..cubicTo(
          w * 0.4433333, h * 0.5730000, w * 0.4470000, h * 0.5843333, w * 0.4470000, h * 0.5930000)
      ..cubicTo(
          w * 0.4470000, h * 0.6060000, w * 0.4426667, h * 0.6170000, w * 0.4336667, h * 0.6256667)
      ..cubicTo(
          w * 0.4246667, h * 0.6343333, w * 0.4136667, h * 0.6386667, w * 0.4003333, h * 0.6386667)
      ..cubicTo(
          w * 0.3873333, h * 0.6386667, w * 0.3760000, h * 0.6343333, w * 0.3666667, h * 0.6253333)
      ..cubicTo(
          w * 0.3570000, h * 0.6166667, w * 0.3523333, h * 0.6056667, w * 0.3523333, h * 0.5930000)
      ..close()
      ..moveTo(w * 0.4516667, h * 0.7260000)
      ..cubicTo(
          w * 0.4516667, h * 0.7166667, w * 0.4543333, h * 0.7063333, w * 0.4596667, h * 0.6940000)
      ..cubicTo(
          w * 0.4650000, h * 0.6816667, w * 0.4713333, h * 0.6706667, w * 0.4793333, h * 0.6600000)
      ..cubicTo(
          w * 0.4853333, h * 0.6513333, w * 0.4926667, h * 0.6420000, w * 0.5016667, h * 0.6320000)
      ..cubicTo(
          w * 0.5103333, h * 0.6220000, w * 0.5170000, h * 0.6146667, w * 0.5216667, h * 0.6103333)
      ..cubicTo(
          w * 0.5240000, h * 0.6083333, w * 0.5266667, h * 0.6056667, w * 0.5296667, h * 0.6026667)
      ..lineTo(w * 0.5376667, h * 0.6103333)
      ..cubicTo(
          w * 0.5503333, h * 0.6213333, w * 0.5643333, h * 0.6376667, w * 0.5800000, h * 0.6590000)
      ..cubicTo(
          w * 0.5880000, h * 0.6700000, w * 0.5943333, h * 0.6816667, w * 0.5996667, h * 0.6936667)
      ..cubicTo(
          w * 0.6050000, h * 0.7056667, w * 0.6073333, h * 0.7163333, w * 0.6073333, h * 0.7260000)
      ..cubicTo(
          w * 0.6073333, h * 0.7473333, w * 0.5996667, h * 0.7656667, w * 0.5846667, h * 0.7810000)
      ..cubicTo(
          w * 0.5696667, h * 0.7963333, w * 0.5510000, h * 0.8036667, w * 0.5293333, h * 0.8036667)
      ..cubicTo(
          w * 0.5080000, h * 0.8036667, w * 0.4896667, h * 0.7960000, w * 0.4743333, h * 0.7813333)
      ..cubicTo(
          w * 0.4590000, h * 0.7660000, w * 0.4516667, h * 0.7476667, w * 0.4516667, h * 0.7260000)
      ..close()
      ..moveTo(w * 0.5006667, h * 0.5040000)
      ..cubicTo(
          w * 0.5006667, h * 0.4900000, w * 0.5113333, h * 0.4723333, w * 0.5330000, h * 0.4506667)
      ..lineTo(w * 0.5410000, h * 0.4590000)
      ..cubicTo(
          w * 0.5470000, h * 0.4660000, w * 0.5520000, h * 0.4740000, w * 0.5570000, h * 0.4826667)
      ..cubicTo(
          w * 0.5616667, h * 0.4913333, w * 0.5643333, h * 0.4983333, w * 0.5643333, h * 0.5040000)
      ..cubicTo(
          w * 0.5643333, h * 0.5126667, w * 0.5613333, h * 0.5200000, w * 0.5550000, h * 0.5260000)
      ..cubicTo(
          w * 0.5490000, h * 0.5320000, w * 0.5416667, h * 0.5353333, w * 0.5330000, h * 0.5353333)
      ..cubicTo(
          w * 0.5240000, h * 0.5353333, w * 0.5163333, h * 0.5323333, w * 0.5100000, h * 0.5260000)
      ..cubicTo(
          w * 0.5036667, h * 0.5200000, w * 0.5006667, h * 0.5126667, w * 0.5006667, h * 0.5040000)
      ..close();
  }

  Path _stormShowersPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1543333, h * 0.5636667)
      ..cubicTo(
          w * 0.1543333, h * 0.6006667, w * 0.1653333, h * 0.6336667, w * 0.1873333, h * 0.6626667)
      ..cubicTo(
          w * 0.2093333, h * 0.6916667, w * 0.2376667, h * 0.7116667, w * 0.2726667, h * 0.7223333)
      ..lineTo(w * 0.2510000, h * 0.7783333)
      ..cubicTo(
          w * 0.2500000, h * 0.7830000, w * 0.2516667, h * 0.7856667, w * 0.2556667, h * 0.7856667)
      ..lineTo(w * 0.3266667, h * 0.7856667)
      ..lineTo(w * 0.2920000, h * 0.9116667)
      ..lineTo(w * 0.3013333, h * 0.9116667)
      ..lineTo(w * 0.4336667, h * 0.7376667)
      ..cubicTo(
          w * 0.4350000, h * 0.7363333, w * 0.4350000, h * 0.7346667, w * 0.4343333, h * 0.7330000)
      ..cubicTo(
          w * 0.4336667, h * 0.7313333, w * 0.4320000, h * 0.7306667, w * 0.4296667, h * 0.7306667)
      ..lineTo(w * 0.3570000, h * 0.7306667)
      ..lineTo(w * 0.4396667, h * 0.5760000)
      ..cubicTo(
          w * 0.4416667, h * 0.5713333, w * 0.4403333, h * 0.5690000, w * 0.4350000, h * 0.5690000)
      ..lineTo(w * 0.3370000, h * 0.5690000)
      ..cubicTo(
          w * 0.3340000, h * 0.5690000, w * 0.3313333, h * 0.5706667, w * 0.3296667, h * 0.5736667)
      ..lineTo(w * 0.2933333, h * 0.6693333)
      ..cubicTo(
          w * 0.2696667, h * 0.6633333, w * 0.2500000, h * 0.6503333, w * 0.2343333, h * 0.6306667)
      ..cubicTo(
          w * 0.2186667, h * 0.6110000, w * 0.2110000, h * 0.5886667, w * 0.2110000, h * 0.5636667)
      ..cubicTo(
          w * 0.2110000, h * 0.5360000, w * 0.2203333, h * 0.5120000, w * 0.2390000, h * 0.4916667)
      ..cubicTo(
          w * 0.2576667, h * 0.4713333, w * 0.2810000, h * 0.4596667, w * 0.3090000, h * 0.4563333)
      ..lineTo(w * 0.3263333, h * 0.4540000)
      ..cubicTo(
          w * 0.3306667, h * 0.4540000, w * 0.3330000, h * 0.4520000, w * 0.3330000, h * 0.4483333)
      ..lineTo(w * 0.3353333, h * 0.4310000)
      ..cubicTo(
          w * 0.3386667, h * 0.3950000, w * 0.3536667, h * 0.3646667, w * 0.3806667, h * 0.3403333)
      ..cubicTo(
          w * 0.4076667, h * 0.3160000, w * 0.4393333, h * 0.3036667, w * 0.4756667, h * 0.3036667)
      ..cubicTo(
          w * 0.5120000, h * 0.3036667, w * 0.5436667, h * 0.3160000, w * 0.5706667, h * 0.3403333)
      ..cubicTo(
          w * 0.5980000, h * 0.3646667, w * 0.6133333, h * 0.3950000, w * 0.6173333, h * 0.4310000)
      ..lineTo(w * 0.6193333, h * 0.4503333)
      ..cubicTo(
          w * 0.6193333, h * 0.4543333, w * 0.6213333, h * 0.4563333, w * 0.6256667, h * 0.4563333)
      ..lineTo(w * 0.6793333, h * 0.4563333)
      ..cubicTo(
          w * 0.7096667, h * 0.4563333, w * 0.7353333, h * 0.4670000, w * 0.7566667, h * 0.4880000)
      ..cubicTo(
          w * 0.7780000, h * 0.5090000, w * 0.7886667, h * 0.5343333, w * 0.7886667, h * 0.5640000)
      ..cubicTo(
          w * 0.7886667, h * 0.5923333, w * 0.7786667, h * 0.6170000, w * 0.7590000, h * 0.6376667)
      ..cubicTo(
          w * 0.7393333, h * 0.6583333, w * 0.7150000, h * 0.6696667, w * 0.6860000, h * 0.6720000)
      ..cubicTo(
          w * 0.6816667, h * 0.6720000, w * 0.6793333, h * 0.6740000, w * 0.6793333, h * 0.6783333)
      ..lineTo(w * 0.6793333, h * 0.7240000)
      ..cubicTo(
          w * 0.6793333, h * 0.7276667, w * 0.6816667, h * 0.7296667, w * 0.6860000, h * 0.7296667)
      ..cubicTo(
          w * 0.7076667, h * 0.7290000, w * 0.7283333, h * 0.7240000, w * 0.7480000, h * 0.7150000)
      ..cubicTo(
          w * 0.7676667, h * 0.7060000, w * 0.7846667, h * 0.6940000, w * 0.7986667, h * 0.6793333)
      ..cubicTo(
          w * 0.8126667, h * 0.6646667, w * 0.8240000, h * 0.6473333, w * 0.8323333, h * 0.6270000)
      ..cubicTo(
          w * 0.8406667, h * 0.6070000, w * 0.8450000, h * 0.5860000, w * 0.8450000, h * 0.5643333)
      ..cubicTo(
          w * 0.8450000, h * 0.5343333, w * 0.8376667, h * 0.5066667, w * 0.8226667, h * 0.4813333)
      ..cubicTo(
          w * 0.8076667, h * 0.4560000, w * 0.7876667, h * 0.4360000, w * 0.7623333, h * 0.4213333)
      ..cubicTo(
          w * 0.7370000, h * 0.4066667, w * 0.7093333, h * 0.3993333, w * 0.6796667, h * 0.3993333)
      ..lineTo(w * 0.6690000, h * 0.3993333)
      ..cubicTo(
          w * 0.6580000, h * 0.3550000, w * 0.6346667, h * 0.3186667, w * 0.5986667, h * 0.2906667)
      ..cubicTo(
          w * 0.5626667, h * 0.2626667, w * 0.5220000, h * 0.2483333, w * 0.4760000, h * 0.2483333)
      ..cubicTo(
          w * 0.4290000, h * 0.2483333, w * 0.3870000, h * 0.2630000, w * 0.3506667, h * 0.2920000)
      ..cubicTo(
          w * 0.3143333, h * 0.3210000, w * 0.2910000, h * 0.3583333, w * 0.2806667, h * 0.4040000)
      ..cubicTo(
          w * 0.2440000, h * 0.4126667, w * 0.2136667, h * 0.4316667, w * 0.1896667, h * 0.4616667)
      ..cubicTo(
          w * 0.1656667, h * 0.4916667, w * 0.1543333, h * 0.5253333, w * 0.1543333, h * 0.5636667)
      ..close()
      ..moveTo(w * 0.4263333, h * 0.8923333)
      ..cubicTo(
          w * 0.4263333, h * 0.8976667, w * 0.4280000, h * 0.9026667, w * 0.4313333, h * 0.9076667)
      ..cubicTo(
          w * 0.4346667, h * 0.9126667, w * 0.4400000, h * 0.9163333, w * 0.4466667, h * 0.9183333)
      ..cubicTo(
          w * 0.4513333, h * 0.9193333, w * 0.4540000, h * 0.9200000, w * 0.4550000, h * 0.9200000)
      ..cubicTo(
          w * 0.4580000, h * 0.9200000, w * 0.4620000, h * 0.9190000, w * 0.4676667, h * 0.9166667)
      ..cubicTo(
          w * 0.4746667, h * 0.9136667, w * 0.4793333, h * 0.9076667, w * 0.4816667, h * 0.8993333)
      ..lineTo(w * 0.4910000, h * 0.8643333)
      ..cubicTo(
          w * 0.4930000, h * 0.8570000, w * 0.4923333, h * 0.8500000, w * 0.4883333, h * 0.8433333)
      ..cubicTo(
          w * 0.4843333, h * 0.8366667, w * 0.4786667, h * 0.8323333, w * 0.4706667, h * 0.8300000)
      ..cubicTo(
          w * 0.4633333, h * 0.8280000, w * 0.4563333, h * 0.8286667, w * 0.4496667, h * 0.8326667)
      ..cubicTo(
          w * 0.4430000, h * 0.8366667, w * 0.4383333, h * 0.8423333, w * 0.4360000, h * 0.8503333)
      ..lineTo(w * 0.4270000, h * 0.8836667)
      ..cubicTo(
          w * 0.4266667, h * 0.8893333, w * 0.4263333, h * 0.8923333, w * 0.4263333, h * 0.8923333)
      ..close()
      ..moveTo(w * 0.4710000, h * 0.7333333)
      ..cubicTo(
          w * 0.4710000, h * 0.7380000, w * 0.4726667, h * 0.7430000, w * 0.4760000, h * 0.7480000)
      ..cubicTo(
          w * 0.4793333, h * 0.7530000, w * 0.4843333, h * 0.7566667, w * 0.4910000, h * 0.7590000)
      ..cubicTo(
          w * 0.4983333, h * 0.7613333, w * 0.5056667, h * 0.7610000, w * 0.5123333, h * 0.7573333)
      ..cubicTo(
          w * 0.5190000, h * 0.7536667, w * 0.5233333, h * 0.7480000, w * 0.5256667, h * 0.7400000)
      ..lineTo(w * 0.5356667, h * 0.7053333)
      ..cubicTo(
          w * 0.5376667, h * 0.6980000, w * 0.5366667, h * 0.6910000, w * 0.5330000, h * 0.6843333)
      ..cubicTo(
          w * 0.5290000, h * 0.6776667, w * 0.5230000, h * 0.6730000, w * 0.5153333, h * 0.6706667)
      ..cubicTo(
          w * 0.5076667, h * 0.6686667, w * 0.5006667, h * 0.6693333, w * 0.4936667, h * 0.6733333)
      ..cubicTo(
          w * 0.4866667, h * 0.6773333, w * 0.4823333, h * 0.6830000, w * 0.4800000, h * 0.6906667)
      ..lineTo(w * 0.4720000, h * 0.7243333)
      ..cubicTo(
          w * 0.4713333, h * 0.7300000, w * 0.4710000, h * 0.7330000, w * 0.4710000, h * 0.7333333)
      ..close()
      ..moveTo(w * 0.5650000, h * 0.7883333)
      ..cubicTo(
          w * 0.5650000, h * 0.7940000, w * 0.5666667, h * 0.7996667, w * 0.5703333, h * 0.8053333)
      ..cubicTo(
          w * 0.5740000, h * 0.8110000, w * 0.5793333, h * 0.8146667, w * 0.5860000, h * 0.8170000)
      ..cubicTo(
          w * 0.5866667, h * 0.8170000, w * 0.5880000, h * 0.8173333, w * 0.5900000, h * 0.8176667)
      ..cubicTo(
          w * 0.5916667, h * 0.8180000, w * 0.5930000, h * 0.8183333, w * 0.5940000, h * 0.8183333)
      ..cubicTo(
          w * 0.5983333, h * 0.8183333, w * 0.6026667, h * 0.8176667, w * 0.6066667, h * 0.8156667)
      ..cubicTo(
          w * 0.6130000, h * 0.8133333, w * 0.6176667, h * 0.8070000, w * 0.6203333, h * 0.7966667)
      ..lineTo(w * 0.6286667, h * 0.7630000)
      ..cubicTo(
          w * 0.6310000, h * 0.7553333, w * 0.6303333, h * 0.7480000, w * 0.6266667, h * 0.7410000)
      ..cubicTo(
          w * 0.6230000, h * 0.7340000, w * 0.6173333, h * 0.7293333, w * 0.6100000, h * 0.7270000)
      ..cubicTo(
          w * 0.6016667, h * 0.7250000, w * 0.5940000, h * 0.7260000, w * 0.5873333, h * 0.7296667)
      ..cubicTo(
          w * 0.5806667, h * 0.7336667, w * 0.5763333, h * 0.7396667, w * 0.5750000, h * 0.7473333)
      ..lineTo(w * 0.5660000, h * 0.7816667)
      ..cubicTo(
          w * 0.5653333, h * 0.7836667, w * 0.5650000, h * 0.7860000, w * 0.5650000, h * 0.7883333)
      ..close()
      ..moveTo(w * 0.6103333, h * 0.6286667)
      ..cubicTo(
          w * 0.6100000, h * 0.6340000, w * 0.6116667, h * 0.6390000, w * 0.6153333, h * 0.6443333)
      ..cubicTo(
          w * 0.6190000, h * 0.6496667, w * 0.6243333, h * 0.6536667, w * 0.6316667, h * 0.6570000)
      ..cubicTo(
          w * 0.6343333, h * 0.6583333, w * 0.6370000, h * 0.6590000, w * 0.6403333, h * 0.6590000)
      ..cubicTo(
          w * 0.6440000, h * 0.6590000, w * 0.6476667, h * 0.6580000, w * 0.6516667, h * 0.6563333)
      ..cubicTo(
          w * 0.6586667, h * 0.6530000, w * 0.6633333, h * 0.6466667, w * 0.6663333, h * 0.6373333)
      ..lineTo(w * 0.6760000, h * 0.6030000)
      ..cubicTo(
          w * 0.6766667, h * 0.5986667, w * 0.6770000, h * 0.5963333, w * 0.6770000, h * 0.5956667)
      ..cubicTo(
          w * 0.6770000, h * 0.5900000, w * 0.6753333, h * 0.5846667, w * 0.6716667, h * 0.5793333)
      ..cubicTo(
          w * 0.6680000, h * 0.5740000, w * 0.6626667, h * 0.5703333, w * 0.6553333, h * 0.5683333)
      ..cubicTo(
          w * 0.6546667, h * 0.5683333, w * 0.6533333, h * 0.5680000, w * 0.6516667, h * 0.5676667)
      ..cubicTo(
          w * 0.6496667, h * 0.5666667, w * 0.6483333, h * 0.5666667, w * 0.6473333, h * 0.5666667)
      ..cubicTo(
          w * 0.6416667, h * 0.5666667, w * 0.6363333, h * 0.5683333, w * 0.6310000, h * 0.5716667)
      ..cubicTo(
          w * 0.6256667, h * 0.5750000, w * 0.6220000, h * 0.5803333, w * 0.6200000, h * 0.5876667)
      ..lineTo(w * 0.6110000, h * 0.6213333)
      ..cubicTo(
          w * 0.6106667, h * 0.6240000, w * 0.6103333, h * 0.6263333, w * 0.6103333, h * 0.6286667)
      ..close();
  }

  Path _strongWindPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1033333, h * 0.5656667)
      ..cubicTo(
          w * 0.1033333, h * 0.5736667, w * 0.1063333, h * 0.5806667, w * 0.1126667, h * 0.5863333)
      ..cubicTo(
          w * 0.1180000, h * 0.5926667, w * 0.1250000, h * 0.5956667, w * 0.1336667, h * 0.5956667)
      ..lineTo(w * 0.6233333, h * 0.5956667)
      ..cubicTo(
          w * 0.6330000, h * 0.5956667, w * 0.6410000, h * 0.5990000, w * 0.6476667, h * 0.6056667)
      ..cubicTo(
          w * 0.6543333, h * 0.6123333, w * 0.6576667, h * 0.6206667, w * 0.6576667, h * 0.6303333)
      ..cubicTo(
          w * 0.6576667, h * 0.6400000, w * 0.6543333, h * 0.6480000, w * 0.6476667, h * 0.6543333)
      ..cubicTo(
          w * 0.6410000, h * 0.6606667, w * 0.6330000, h * 0.6640000, w * 0.6230000, h * 0.6640000)
      ..cubicTo(
          w * 0.6133333, h * 0.6640000, w * 0.6050000, h * 0.6606667, w * 0.5986667, h * 0.6543333)
      ..cubicTo(
          w * 0.5933333, h * 0.6483333, w * 0.5866667, h * 0.6456667, w * 0.5786667, h * 0.6456667)
      ..cubicTo(
          w * 0.5703333, h * 0.6456667, w * 0.5633333, h * 0.6486667, w * 0.5573333, h * 0.6543333)
      ..cubicTo(
          w * 0.5513333, h * 0.6600000, w * 0.5483333, h * 0.6670000, w * 0.5483333, h * 0.6746667)
      ..cubicTo(
          w * 0.5483333, h * 0.6830000, w * 0.5513333, h * 0.6900000, w * 0.5576667, h * 0.6956667)
      ..cubicTo(
          w * 0.5763333, h * 0.7140000, w * 0.5983333, h * 0.7233333, w * 0.6230000, h * 0.7233333)
      ..cubicTo(
          w * 0.6490000, h * 0.7233333, w * 0.6713333, h * 0.7143333, w * 0.6900000, h * 0.6963333)
      ..cubicTo(
          w * 0.7086667, h * 0.6783333, w * 0.7176667, h * 0.6566667, w * 0.7176667, h * 0.6306667)
      ..cubicTo(
          w * 0.7176667, h * 0.6046667, w * 0.7083333, h * 0.5826667, w * 0.6896667, h * 0.5640000)
      ..cubicTo(
          w * 0.6710000, h * 0.5453333, w * 0.6486667, h * 0.5360000, w * 0.6230000, h * 0.5360000)
      ..lineTo(w * 0.1336667, h * 0.5360000)
      ..cubicTo(
          w * 0.1253333, h * 0.5360000, w * 0.1183333, h * 0.5390000, w * 0.1123333, h * 0.5446667)
      ..cubicTo(
          w * 0.1063333, h * 0.5503333, w * 0.1033333, h * 0.5573333, w * 0.1033333, h * 0.5656667)
      ..close()
      ..moveTo(w * 0.1033333, h * 0.4563333)
      ..cubicTo(
          w * 0.1033333, h * 0.4640000, w * 0.1063333, h * 0.4706667, w * 0.1126667, h * 0.4766667)
      ..cubicTo(
          w * 0.1183333, h * 0.4826667, w * 0.1253333, h * 0.4853333, w * 0.1336667, h * 0.4853333)
      ..lineTo(w * 0.8016667, h * 0.4853333)
      ..cubicTo(
          w * 0.8276667, h * 0.4853333, w * 0.8500000, h * 0.4763333, w * 0.8686667, h * 0.4580000)
      ..cubicTo(
          w * 0.8873333, h * 0.4400000, w * 0.8966667, h * 0.4180000, w * 0.8966667, h * 0.3923333)
      ..cubicTo(
          w * 0.8966667, h * 0.3666667, w * 0.8873333, h * 0.3443333, w * 0.8686667, h * 0.3260000)
      ..cubicTo(
          w * 0.8500000, h * 0.3076667, w * 0.8276667, h * 0.2983333, w * 0.8016667, h * 0.2983333)
      ..cubicTo(
          w * 0.7760000, h * 0.2983333, w * 0.7543333, h * 0.3073333, w * 0.7366667, h * 0.3250000)
      ..cubicTo(
          w * 0.7306667, h * 0.3303333, w * 0.7276667, h * 0.3376667, w * 0.7276667, h * 0.3473333)
      ..cubicTo(
          w * 0.7276667, h * 0.3560000, w * 0.7306667, h * 0.3630000, w * 0.7363333, h * 0.3683333)
      ..cubicTo(
          w * 0.7420000, h * 0.3736667, w * 0.7490000, h * 0.3763333, w * 0.7573333, h * 0.3763333)
      ..cubicTo(
          w * 0.7653333, h * 0.3763333, w * 0.7723333, h * 0.3736667, w * 0.7783333, h * 0.3683333)
      ..cubicTo(
          w * 0.7846667, h * 0.3613333, w * 0.7923333, h * 0.3580000, w * 0.8016667, h * 0.3580000)
      ..cubicTo(
          w * 0.8113333, h * 0.3580000, w * 0.8193333, h * 0.3613333, w * 0.8260000, h * 0.3680000)
      ..cubicTo(
          w * 0.8326667, h * 0.3746667, w * 0.8360000, h * 0.3826667, w * 0.8360000, h * 0.3923333)
      ..cubicTo(
          w * 0.8360000, h * 0.4020000, w * 0.8326667, h * 0.4100000, w * 0.8260000, h * 0.4163333)
      ..cubicTo(
          w * 0.8193333, h * 0.4226667, w * 0.8113333, h * 0.4260000, w * 0.8016667, h * 0.4260000)
      ..lineTo(w * 0.1336667, h * 0.4260000)
      ..cubicTo(
          w * 0.1253333, h * 0.4260000, w * 0.1183333, h * 0.4290000, w * 0.1123333, h * 0.4346667)
      ..cubicTo(
          w * 0.1063333, h * 0.4410000, w * 0.1033333, h * 0.4480000, w * 0.1033333, h * 0.4563333)
      ..close();
  }

  Path _thermometerPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.3303333, h * 0.6520000)
      ..cubicTo(
          w * 0.3303333, h * 0.6236667, w * 0.3370000, h * 0.5973333, w * 0.3500000, h * 0.5726667)
      ..cubicTo(
          w * 0.3630000, h * 0.5480000, w * 0.3813333, h * 0.5276667, w * 0.4050000, h * 0.5113333)
      ..lineTo(w * 0.4050000, h * 0.1806667)
      ..cubicTo(
          w * 0.4050000, h * 0.1540000, w * 0.4140000, h * 0.1313333, w * 0.4323333, h * 0.1130000)
      ..cubicTo(w * 0.4506667, h * 0.09466667, w * 0.4733333, h * 0.08500000, w * 0.5000000,
          h * 0.08500000)
      ..cubicTo(w * 0.5270000, h * 0.08500000, w * 0.5496667, h * 0.09433333, w * 0.5680000,
          h * 0.1126667)
      ..cubicTo(
          w * 0.5863333, h * 0.1313333, w * 0.5956667, h * 0.1536667, w * 0.5956667, h * 0.1803333)
      ..lineTo(w * 0.5956667, h * 0.5110000)
      ..cubicTo(
          w * 0.6193333, h * 0.5273333, w * 0.6373333, h * 0.5480000, w * 0.6503333, h * 0.5723333)
      ..cubicTo(
          w * 0.6633333, h * 0.5966667, w * 0.6696667, h * 0.6233333, w * 0.6696667, h * 0.6516667)
      ..cubicTo(
          w * 0.6696667, h * 0.6823333, w * 0.6620000, h * 0.7110000, w * 0.6470000, h * 0.7370000)
      ..cubicTo(
          w * 0.6320000, h * 0.7630000, w * 0.6113333, h * 0.7836667, w * 0.5853333, h * 0.7986667)
      ..cubicTo(
          w * 0.5593333, h * 0.8136667, w * 0.5310000, h * 0.8213333, w * 0.5000000, h * 0.8213333)
      ..cubicTo(
          w * 0.4693333, h * 0.8213333, w * 0.4410000, h * 0.8136667, w * 0.4150000, h * 0.7986667)
      ..cubicTo(
          w * 0.3890000, h * 0.7836667, w * 0.3683333, h * 0.7630000, w * 0.3530000, h * 0.7370000)
      ..cubicTo(
          w * 0.3376667, h * 0.7110000, w * 0.3303333, h * 0.6826667, w * 0.3303333, h * 0.6520000)
      ..close()
      ..moveTo(w * 0.3890000, h * 0.6520000)
      ..cubicTo(
          w * 0.3890000, h * 0.6830000, w * 0.4000000, h * 0.7096667, w * 0.4216667, h * 0.7316667)
      ..cubicTo(
          w * 0.4433333, h * 0.7536667, w * 0.4696667, h * 0.7646667, w * 0.5003333, h * 0.7646667)
      ..cubicTo(
          w * 0.5313333, h * 0.7646667, w * 0.5580000, h * 0.7536667, w * 0.5803333, h * 0.7313333)
      ..cubicTo(
          w * 0.6026667, h * 0.7090000, w * 0.6140000, h * 0.6826667, w * 0.6140000, h * 0.6523333)
      ..cubicTo(
          w * 0.6140000, h * 0.6316667, w * 0.6086667, h * 0.6123333, w * 0.5980000, h * 0.5946667)
      ..cubicTo(
          w * 0.5873333, h * 0.5770000, w * 0.5726667, h * 0.5633333, w * 0.5540000, h * 0.5536667)
      ..lineTo(w * 0.5446667, h * 0.5490000)
      ..cubicTo(
          w * 0.5413333, h * 0.5476667, w * 0.5396667, h * 0.5443333, w * 0.5396667, h * 0.5393333)
      ..lineTo(w * 0.5396667, h * 0.1806667)
      ..cubicTo(
          w * 0.5396667, h * 0.1700000, w * 0.5360000, h * 0.1610000, w * 0.5283333, h * 0.1536667)
      ..cubicTo(
          w * 0.5206667, h * 0.1466667, w * 0.5113333, h * 0.1430000, w * 0.5000000, h * 0.1430000)
      ..cubicTo(
          w * 0.4893333, h * 0.1430000, w * 0.4800000, h * 0.1466667, w * 0.4723333, h * 0.1536667)
      ..cubicTo(
          w * 0.4646667, h * 0.1606667, w * 0.4610000, h * 0.1696667, w * 0.4610000, h * 0.1806667)
      ..lineTo(w * 0.4610000, h * 0.5386667)
      ..cubicTo(
          w * 0.4610000, h * 0.5436667, w * 0.4593333, h * 0.5470000, w * 0.4563333, h * 0.5483333)
      ..lineTo(w * 0.4473333, h * 0.5530000)
      ..cubicTo(
          w * 0.4290000, h * 0.5626667, w * 0.4146667, h * 0.5763333, w * 0.4043333, h * 0.5940000)
      ..cubicTo(
          w * 0.3940000, h * 0.6116667, w * 0.3890000, h * 0.6306667, w * 0.3890000, h * 0.6520000)
      ..close()
      ..moveTo(w * 0.4150000, h * 0.6520000)
      ..cubicTo(
          w * 0.4150000, h * 0.6756667, w * 0.4230000, h * 0.6960000, w * 0.4393333, h * 0.7126667)
      ..cubicTo(
          w * 0.4556667, h * 0.7293333, w * 0.4750000, h * 0.7376667, w * 0.4980000, h * 0.7376667)
      ..cubicTo(
          w * 0.5210000, h * 0.7376667, w * 0.5406667, h * 0.7293333, w * 0.5576667, h * 0.7126667)
      ..cubicTo(
          w * 0.5746667, h * 0.6960000, w * 0.5830000, h * 0.6756667, w * 0.5830000, h * 0.6523333)
      ..cubicTo(
          w * 0.5830000, h * 0.6313333, w * 0.5756667, h * 0.6126667, w * 0.5613333, h * 0.5966667)
      ..cubicTo(
          w * 0.5470000, h * 0.5806667, w * 0.5293333, h * 0.5710000, w * 0.5086667, h * 0.5683333)
      ..lineTo(w * 0.5086667, h * 0.3230000)
      ..cubicTo(
          w * 0.5086667, h * 0.3210000, w * 0.5076667, h * 0.3186667, w * 0.5053333, h * 0.3166667)
      ..cubicTo(
          w * 0.5030000, h * 0.3143333, w * 0.5006667, h * 0.3133333, w * 0.4980000, h * 0.3133333)
      ..cubicTo(
          w * 0.4950000, h * 0.3133333, w * 0.4926667, h * 0.3143333, w * 0.4910000, h * 0.3160000)
      ..cubicTo(
          w * 0.4893333, h * 0.3180000, w * 0.4883333, h * 0.3200000, w * 0.4883333, h * 0.3230000)
      ..lineTo(w * 0.4883333, h * 0.5676667)
      ..cubicTo(
          w * 0.4680000, h * 0.5706667, w * 0.4506667, h * 0.5800000, w * 0.4363333, h * 0.5960000)
      ..cubicTo(
          w * 0.4220000, h * 0.6123333, w * 0.4150000, h * 0.6306667, w * 0.4150000, h * 0.6520000)
      ..close();
  }

  Path _thunderstormPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1543333, h * 0.5636667)
      ..cubicTo(
          w * 0.1543333, h * 0.6006667, w * 0.1653333, h * 0.6336667, w * 0.1873333, h * 0.6626667)
      ..cubicTo(
          w * 0.2093333, h * 0.6916667, w * 0.2380000, h * 0.7116667, w * 0.2733333, h * 0.7223333)
      ..lineTo(w * 0.2513333, h * 0.7783333)
      ..cubicTo(
          w * 0.2503333, h * 0.7830000, w * 0.2520000, h * 0.7856667, w * 0.2560000, h * 0.7856667)
      ..lineTo(w * 0.3270000, h * 0.7856667)
      ..lineTo(w * 0.2943333, h * 0.9290000)
      ..lineTo(w * 0.3036667, h * 0.9290000)
      ..lineTo(w * 0.4343333, h * 0.7373333)
      ..cubicTo(
          w * 0.4356667, h * 0.7360000, w * 0.4356667, h * 0.7343333, w * 0.4346667, h * 0.7326667)
      ..cubicTo(
          w * 0.4336667, h * 0.7310000, w * 0.4320000, h * 0.7303333, w * 0.4296667, h * 0.7303333)
      ..lineTo(w * 0.3570000, h * 0.7303333)
      ..lineTo(w * 0.4396667, h * 0.5756667)
      ..cubicTo(
          w * 0.4420000, h * 0.5710000, w * 0.4403333, h * 0.5683333, w * 0.4350000, h * 0.5683333)
      ..lineTo(w * 0.3370000, h * 0.5683333)
      ..cubicTo(
          w * 0.3340000, h * 0.5683333, w * 0.3313333, h * 0.5700000, w * 0.3293333, h * 0.5733333)
      ..lineTo(w * 0.2936667, h * 0.6690000)
      ..cubicTo(
          w * 0.2700000, h * 0.6630000, w * 0.2503333, h * 0.6500000, w * 0.2346667, h * 0.6303333)
      ..cubicTo(
          w * 0.2190000, h * 0.6106667, w * 0.2113333, h * 0.5883333, w * 0.2113333, h * 0.5633333)
      ..cubicTo(
          w * 0.2113333, h * 0.5356667, w * 0.2206667, h * 0.5116667, w * 0.2396667, h * 0.4910000)
      ..cubicTo(
          w * 0.2586667, h * 0.4706667, w * 0.2820000, h * 0.4586667, w * 0.3096667, h * 0.4553333)
      ..lineTo(w * 0.3273333, h * 0.4530000)
      ..cubicTo(
          w * 0.3316667, h * 0.4530000, w * 0.3340000, h * 0.4510000, w * 0.3340000, h * 0.4470000)
      ..lineTo(w * 0.3363333, h * 0.4300000)
      ..cubicTo(
          w * 0.3400000, h * 0.3940000, w * 0.3550000, h * 0.3636667, w * 0.3820000, h * 0.3393333)
      ..cubicTo(
          w * 0.4090000, h * 0.3150000, w * 0.4406667, h * 0.3026667, w * 0.4770000, h * 0.3026667)
      ..cubicTo(
          w * 0.5133333, h * 0.3026667, w * 0.5450000, h * 0.3150000, w * 0.5720000, h * 0.3393333)
      ..cubicTo(
          w * 0.5993333, h * 0.3636667, w * 0.6146667, h * 0.3940000, w * 0.6186667, h * 0.4300000)
      ..lineTo(w * 0.6210000, h * 0.4493333)
      ..cubicTo(
          w * 0.6210000, h * 0.4530000, w * 0.6230000, h * 0.4550000, w * 0.6270000, h * 0.4550000)
      ..lineTo(w * 0.6803333, h * 0.4550000)
      ..cubicTo(
          w * 0.7106667, h * 0.4550000, w * 0.7363333, h * 0.4656667, w * 0.7576667, h * 0.4866667)
      ..cubicTo(
          w * 0.7790000, h * 0.5076667, w * 0.7900000, h * 0.5333333, w * 0.7900000, h * 0.5626667)
      ..cubicTo(
          w * 0.7900000, h * 0.5910000, w * 0.7800000, h * 0.6156667, w * 0.7603333, h * 0.6363333)
      ..cubicTo(
          w * 0.7406667, h * 0.6570000, w * 0.7160000, h * 0.6686667, w * 0.6870000, h * 0.6710000)
      ..cubicTo(
          w * 0.6826667, h * 0.6710000, w * 0.6803333, h * 0.6730000, w * 0.6803333, h * 0.6770000)
      ..lineTo(w * 0.6803333, h * 0.7226667)
      ..cubicTo(
          w * 0.6803333, h * 0.7263333, w * 0.6826667, h * 0.7283333, w * 0.6870000, h * 0.7283333)
      ..cubicTo(
          w * 0.7313333, h * 0.7270000, w * 0.7690000, h * 0.7100000, w * 0.8000000, h * 0.6780000)
      ..cubicTo(
          w * 0.8310000, h * 0.6460000, w * 0.8463333, h * 0.6076667, w * 0.8463333, h * 0.5630000)
      ..cubicTo(
          w * 0.8463333, h * 0.5330000, w * 0.8390000, h * 0.5053333, w * 0.8240000, h * 0.4800000)
      ..cubicTo(
          w * 0.8093333, h * 0.4546667, w * 0.7890000, h * 0.4346667, w * 0.7636667, h * 0.4200000)
      ..cubicTo(
          w * 0.7380000, h * 0.4053333, w * 0.7103333, h * 0.3980000, w * 0.6803333, h * 0.3980000)
      ..lineTo(w * 0.6700000, h * 0.3980000)
      ..cubicTo(
          w * 0.6590000, h * 0.3536667, w * 0.6353333, h * 0.3173333, w * 0.5996667, h * 0.2893333)
      ..cubicTo(
          w * 0.5640000, h * 0.2613333, w * 0.5230000, h * 0.2470000, w * 0.4770000, h * 0.2470000)
      ..cubicTo(
          w * 0.4300000, h * 0.2470000, w * 0.3880000, h * 0.2616667, w * 0.3516667, h * 0.2906667)
      ..cubicTo(
          w * 0.3153333, h * 0.3196667, w * 0.2920000, h * 0.3570000, w * 0.2816667, h * 0.4026667)
      ..cubicTo(
          w * 0.2446667, h * 0.4113333, w * 0.2143333, h * 0.4303333, w * 0.1903333, h * 0.4603333)
      ..cubicTo(
          w * 0.1663333, h * 0.4903333, w * 0.1543333, h * 0.5253333, w * 0.1543333, h * 0.5636667)
      ..close()
      ..moveTo(w * 0.4256667, h * 0.8873333)
      ..cubicTo(
          w * 0.4256667, h * 0.9003333, w * 0.4320000, h * 0.9090000, w * 0.4450000, h * 0.9130000)
      ..cubicTo(
          w * 0.4453333, h * 0.9130000, w * 0.4466667, h * 0.9130000, w * 0.4486667, h * 0.9133333)
      ..cubicTo(
          w * 0.4506667, h * 0.9136667, w * 0.4523333, h * 0.9136667, w * 0.4533333, h * 0.9136667)
      ..cubicTo(
          w * 0.4590000, h * 0.9136667, w * 0.4643333, h * 0.9120000, w * 0.4696667, h * 0.9086667)
      ..cubicTo(
          w * 0.4750000, h * 0.9053333, w * 0.4786667, h * 0.9000000, w * 0.4803333, h * 0.8926667)
      ..lineTo(w * 0.5553333, h * 0.6030000)
      ..cubicTo(
          w * 0.5573333, h * 0.5950000, w * 0.5566667, h * 0.5880000, w * 0.5530000, h * 0.5813333)
      ..cubicTo(
          w * 0.5493333, h * 0.5750000, w * 0.5440000, h * 0.5706667, w * 0.5363333, h * 0.5683333)
      ..cubicTo(
          w * 0.5306667, h * 0.5676667, w * 0.5276667, h * 0.5673333, w * 0.5276667, h * 0.5673333)
      ..cubicTo(
          w * 0.5223333, h * 0.5673333, w * 0.5170000, h * 0.5690000, w * 0.5120000, h * 0.5723333)
      ..cubicTo(
          w * 0.5070000, h * 0.5756667, w * 0.5033333, h * 0.5806667, w * 0.5016667, h * 0.5873333)
      ..lineTo(w * 0.4263333, h * 0.8780000)
      ..cubicTo(
          w * 0.4260000, h * 0.8813333, w * 0.4256667, h * 0.8843333, w * 0.4256667, h * 0.8873333)
      ..close()
      ..moveTo(w * 0.5643333, h * 0.7853333)
      ..cubicTo(
          w * 0.5643333, h * 0.7896667, w * 0.5653333, h * 0.7940000, w * 0.5676667, h * 0.7980000)
      ..cubicTo(
          w * 0.5723333, h * 0.8053333, w * 0.5780000, h * 0.8103333, w * 0.5846667, h * 0.8126667)
      ..cubicTo(
          w * 0.5883333, h * 0.8136667, w * 0.5916667, h * 0.8143333, w * 0.5946667, h * 0.8143333)
      ..cubicTo(
          w * 0.5976667, h * 0.8143333, w * 0.6013333, h * 0.8136667, w * 0.6053333, h * 0.8116667)
      ..cubicTo(
          w * 0.6123333, h * 0.8086667, w * 0.6170000, h * 0.8023333, w * 0.6193333, h * 0.7926667)
      ..lineTo(w * 0.6673333, h * 0.6036667)
      ..cubicTo(
          w * 0.6683333, h * 0.5990000, w * 0.6690000, h * 0.5960000, w * 0.6690000, h * 0.5946667)
      ..cubicTo(
          w * 0.6690000, h * 0.5896667, w * 0.6673333, h * 0.5846667, w * 0.6636667, h * 0.5796667)
      ..cubicTo(
          w * 0.6600000, h * 0.5746667, w * 0.6550000, h * 0.5710000, w * 0.6483333, h * 0.5690000)
      ..cubicTo(
          w * 0.6426667, h * 0.5683333, w * 0.6396667, h * 0.5680000, w * 0.6396667, h * 0.5680000)
      ..cubicTo(
          w * 0.6340000, h * 0.5680000, w * 0.6286667, h * 0.5696667, w * 0.6240000, h * 0.5730000)
      ..cubicTo(
          w * 0.6193333, h * 0.5763333, w * 0.6160000, h * 0.5813333, w * 0.6140000, h * 0.5880000)
      ..lineTo(w * 0.5653333, h * 0.7780000)
      ..cubicTo(
          w * 0.5653333, h * 0.7786667, w * 0.5653333, h * 0.7796667, w * 0.5650000, h * 0.7816667)
      ..cubicTo(
          w * 0.5643333, h * 0.7833333, w * 0.5643333, h * 0.7843333, w * 0.5643333, h * 0.7853333)
      ..close();
  }

  Path _tornadoPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1376667, h * 0.5063333)
      ..cubicTo(
          w * 0.1376667, h * 0.5293333, w * 0.1496667, h * 0.5490000, w * 0.1736667, h * 0.5653333)
      ..cubicTo(
          w * 0.2176667, h * 0.5963333, w * 0.2840000, h * 0.6116667, w * 0.3730000, h * 0.6116667)
      ..cubicTo(
          w * 0.4130000, h * 0.6116667, w * 0.4500000, h * 0.6083333, w * 0.4843333, h * 0.6013333)
      ..cubicTo(
          w * 0.5203333, h * 0.5936667, w * 0.5500000, h * 0.5813333, w * 0.5726667, h * 0.5646667)
      ..cubicTo(
          w * 0.5953333, h * 0.5480000, w * 0.6070000, h * 0.5286667, w * 0.6070000, h * 0.5060000)
      ..cubicTo(
          w * 0.6070000, h * 0.4990000, w * 0.6056667, h * 0.4923333, w * 0.6030000, h * 0.4853333)
      ..cubicTo(
          w * 0.6493333, h * 0.4740000, w * 0.6856667, h * 0.4586667, w * 0.7120000, h * 0.4393333)
      ..cubicTo(
          w * 0.7383333, h * 0.4200000, w * 0.7516667, h * 0.3976667, w * 0.7516667, h * 0.3726667)
      ..cubicTo(
          w * 0.7516667, h * 0.3663333, w * 0.7506667, h * 0.3596667, w * 0.7486667, h * 0.3526667)
      ..cubicTo(
          w * 0.8250000, h * 0.3256667, w * 0.8630000, h * 0.2893333, w * 0.8630000, h * 0.2433333)
      ..cubicTo(
          w * 0.8630000, h * 0.2140000, w * 0.8463333, h * 0.1880000, w * 0.8133333, h * 0.1653333)
      ..cubicTo(
          w * 0.7483333, h * 0.1220000, w * 0.6530000, h * 0.1003333, w * 0.5273333, h * 0.1003333)
      ..cubicTo(
          w * 0.4680000, h * 0.1003333, w * 0.4143333, h * 0.1056667, w * 0.3663333, h * 0.1160000)
      ..cubicTo(
          w * 0.3140000, h * 0.1266667, w * 0.2720000, h * 0.1433333, w * 0.2400000, h * 0.1660000)
      ..cubicTo(
          w * 0.2080000, h * 0.1886667, w * 0.1920000, h * 0.2146667, w * 0.1920000, h * 0.2436667)
      ..cubicTo(
          w * 0.1920000, h * 0.2610000, w * 0.1973333, h * 0.2766667, w * 0.2080000, h * 0.2910000)
      ..cubicTo(
          w * 0.1686667, h * 0.3133333, w * 0.1490000, h * 0.3406667, w * 0.1490000, h * 0.3730000)
      ..cubicTo(
          w * 0.1490000, h * 0.3980000, w * 0.1613333, h * 0.4200000, w * 0.1856667, h * 0.4390000)
      ..cubicTo(
          w * 0.1536667, h * 0.4576667, w * 0.1376667, h * 0.4800000, w * 0.1376667, h * 0.5063333)
      ..close()
      ..moveTo(w * 0.1576667, h * 0.6563333)
      ..cubicTo(
          w * 0.1576667, h * 0.6806667, w * 0.1726667, h * 0.7000000, w * 0.2026667, h * 0.7136667)
      ..cubicTo(
          w * 0.2326667, h * 0.7273333, w * 0.2706667, h * 0.7343333, w * 0.3163333, h * 0.7343333)
      ..cubicTo(
          w * 0.3626667, h * 0.7343333, w * 0.4006667, h * 0.7273333, w * 0.4310000, h * 0.7136667)
      ..cubicTo(
          w * 0.4613333, h * 0.7000000, w * 0.4763333, h * 0.6806667, w * 0.4763333, h * 0.6563333)
      ..cubicTo(
          w * 0.4763333, h * 0.6473333, w * 0.4733333, h * 0.6396667, w * 0.4676667, h * 0.6333333)
      ..cubicTo(
          w * 0.4620000, h * 0.6270000, w * 0.4543333, h * 0.6240000, w * 0.4453333, h * 0.6240000)
      ..cubicTo(
          w * 0.4380000, h * 0.6240000, w * 0.4313333, h * 0.6266667, w * 0.4253333, h * 0.6316667)
      ..cubicTo(
          w * 0.4193333, h * 0.6366667, w * 0.4156667, h * 0.6433333, w * 0.4140000, h * 0.6506667)
      ..cubicTo(
          w * 0.4073333, h * 0.6560000, w * 0.3953333, h * 0.6606667, w * 0.3773333, h * 0.6650000)
      ..cubicTo(
          w * 0.3593333, h * 0.6693333, w * 0.3390000, h * 0.6716667, w * 0.3163333, h * 0.6716667)
      ..cubicTo(
          w * 0.2796667, h * 0.6716667, w * 0.2496667, h * 0.6663333, w * 0.2270000, h * 0.6560000)
      ..cubicTo(
          w * 0.2323333, h * 0.6506667, w * 0.2350000, h * 0.6440000, w * 0.2356667, h * 0.6360000)
      ..cubicTo(
          w * 0.2363333, h * 0.6280000, w * 0.2343333, h * 0.6210000, w * 0.2306667, h * 0.6153333)
      ..cubicTo(
          w * 0.2253333, h * 0.6083333, w * 0.2186667, h * 0.6036667, w * 0.2103333, h * 0.6020000)
      ..cubicTo(
          w * 0.2020000, h * 0.6003333, w * 0.1943333, h * 0.6020000, w * 0.1870000, h * 0.6063333)
      ..cubicTo(
          w * 0.1673333, h * 0.6200000, w * 0.1576667, h * 0.6363333, w * 0.1576667, h * 0.6563333)
      ..close()
      ..moveTo(w * 0.2003333, h * 0.5063333)
      ..cubicTo(
          w * 0.2003333, h * 0.5060000, w * 0.2023333, h * 0.5040000, w * 0.2066667, h * 0.5003333)
      ..cubicTo(
          w * 0.2096667, h * 0.4973333, w * 0.2160000, h * 0.4936667, w * 0.2253333, h * 0.4890000)
      ..cubicTo(
          w * 0.2346667, h * 0.4843333, w * 0.2456667, h * 0.4806667, w * 0.2573333, h * 0.4773333)
      ..lineTo(w * 0.2613333, h * 0.4753333)
      ..cubicTo(
          w * 0.3153333, h * 0.4933333, w * 0.3783333, h * 0.5023333, w * 0.4503333, h * 0.5023333)
      ..cubicTo(
          w * 0.4820000, h * 0.5023333, w * 0.5106667, h * 0.5006667, w * 0.5363333, h * 0.4970000)
      ..lineTo(w * 0.5450000, h * 0.5046667)
      ..cubicTo(
          w * 0.5420000, h * 0.5100000, w * 0.5350000, h * 0.5153333, w * 0.5240000, h * 0.5213333)
      ..cubicTo(
          w * 0.5106667, h * 0.5283333, w * 0.4900000, h * 0.5350000, w * 0.4620000, h * 0.5403333)
      ..cubicTo(
          w * 0.4340000, h * 0.5456667, w * 0.4043333, h * 0.5486667, w * 0.3730000, h * 0.5486667)
      ..cubicTo(
          w * 0.3416667, h * 0.5486667, w * 0.3120000, h * 0.5460000, w * 0.2840000, h * 0.5403333)
      ..cubicTo(
          w * 0.2560000, h * 0.5346667, w * 0.2350000, h * 0.5283333, w * 0.2213333, h * 0.5213333)
      ..cubicTo(
          w * 0.2100000, h * 0.5166667, w * 0.2030000, h * 0.5116667, w * 0.2003333, h * 0.5063333)
      ..close()
      ..moveTo(w * 0.2040000, h * 0.7870000)
      ..cubicTo(
          w * 0.2040000, h * 0.8080000, w * 0.2160000, h * 0.8243333, w * 0.2400000, h * 0.8356667)
      ..cubicTo(
          w * 0.2640000, h * 0.8470000, w * 0.2936667, h * 0.8526667, w * 0.3290000, h * 0.8526667)
      ..cubicTo(
          w * 0.3650000, h * 0.8526667, w * 0.3953333, h * 0.8470000, w * 0.4196667, h * 0.8356667)
      ..cubicTo(
          w * 0.4440000, h * 0.8243333, w * 0.4563333, h * 0.8080000, w * 0.4563333, h * 0.7870000)
      ..cubicTo(
          w * 0.4563333, h * 0.7786667, w * 0.4533333, h * 0.7710000, w * 0.4470000, h * 0.7646667)
      ..cubicTo(
          w * 0.4406667, h * 0.7583333, w * 0.4333333, h * 0.7550000, w * 0.4250000, h * 0.7550000)
      ..cubicTo(
          w * 0.4093333, h * 0.7550000, w * 0.3990000, h * 0.7630000, w * 0.3943333, h * 0.7790000)
      ..cubicTo(
          w * 0.3813333, h * 0.7870000, w * 0.3596667, h * 0.7913333, w * 0.3290000, h * 0.7913333)
      ..cubicTo(
          w * 0.3023333, h * 0.7913333, w * 0.2810000, h * 0.7873333, w * 0.2650000, h * 0.7790000)
      ..cubicTo(
          w * 0.2600000, h * 0.7630000, w * 0.2500000, h * 0.7550000, w * 0.2343333, h * 0.7550000)
      ..cubicTo(
          w * 0.2260000, h * 0.7550000, w * 0.2186667, h * 0.7580000, w * 0.2130000, h * 0.7643333)
      ..cubicTo(
          w * 0.2073333, h * 0.7706667, w * 0.2040000, h * 0.7780000, w * 0.2040000, h * 0.7870000)
      ..close()
      ..moveTo(w * 0.2110000, h * 0.3730000)
      ..cubicTo(
          w * 0.2110000, h * 0.3703333, w * 0.2126667, h * 0.3673333, w * 0.2160000, h * 0.3636667)
      ..cubicTo(
          w * 0.2240000, h * 0.3536667, w * 0.2400000, h * 0.3436667, w * 0.2633333, h * 0.3343333)
      ..cubicTo(
          w * 0.3273333, h * 0.3686667, w * 0.4153333, h * 0.3856667, w * 0.5270000, h * 0.3856667)
      ..cubicTo(
          w * 0.5840000, h * 0.3856667, w * 0.6376667, h * 0.3803333, w * 0.6876667, h * 0.3700000)
      ..lineTo(w * 0.6876667, h * 0.3730000)
      ..cubicTo(
          w * 0.6876667, h * 0.3780000, w * 0.6846667, h * 0.3830000, w * 0.6783333, h * 0.3880000)
      ..cubicTo(
          w * 0.6646667, h * 0.4000000, w * 0.6393333, h * 0.4113333, w * 0.6020000, h * 0.4223333)
      ..cubicTo(
          w * 0.5616667, h * 0.4343333, w * 0.5110000, h * 0.4403333, w * 0.4500000, h * 0.4403333)
      ..cubicTo(
          w * 0.3886667, h * 0.4403333, w * 0.3380000, h * 0.4343333, w * 0.2976667, h * 0.4223333)
      ..cubicTo(
          w * 0.2590000, h * 0.4116667, w * 0.2333333, h * 0.4003333, w * 0.2203333, h * 0.3883333)
      ..cubicTo(
          w * 0.2140000, h * 0.3833333, w * 0.2110000, h * 0.3783333, w * 0.2110000, h * 0.3730000)
      ..close()
      ..moveTo(w * 0.2543333, h * 0.2436667)
      ..cubicTo(
          w * 0.2543333, h * 0.2376667, w * 0.2583333, h * 0.2313333, w * 0.2660000, h * 0.2240000)
      ..cubicTo(
          w * 0.2810000, h * 0.2100000, w * 0.3110000, h * 0.1966667, w * 0.3553333, h * 0.1836667)
      ..cubicTo(
          w * 0.4030000, h * 0.1696667, w * 0.4600000, h * 0.1626667, w * 0.5266667, h * 0.1626667)
      ..cubicTo(
          w * 0.5936667, h * 0.1626667, w * 0.6513333, h * 0.1696667, w * 0.6996667, h * 0.1836667)
      ..cubicTo(
          w * 0.7446667, h * 0.1966667, w * 0.7743333, h * 0.2103333, w * 0.7890000, h * 0.2243333)
      ..cubicTo(
          w * 0.7963333, h * 0.2316667, w * 0.8003333, h * 0.2383333, w * 0.8003333, h * 0.2440000)
      ..cubicTo(
          w * 0.8003333, h * 0.2496667, w * 0.7966667, h * 0.2556667, w * 0.7890000, h * 0.2626667)
      ..cubicTo(
          w * 0.7743333, h * 0.2766667, w * 0.7446667, h * 0.2903333, w * 0.6996667, h * 0.3036667)
      ..cubicTo(
          w * 0.6513333, h * 0.3176667, w * 0.5940000, h * 0.3246667, w * 0.5266667, h * 0.3246667)
      ..cubicTo(
          w * 0.4600000, h * 0.3246667, w * 0.4026667, h * 0.3176667, w * 0.3553333, h * 0.3036667)
      ..cubicTo(
          w * 0.3106667, h * 0.2903333, w * 0.2806667, h * 0.2766667, w * 0.2660000, h * 0.2623333)
      ..cubicTo(
          w * 0.2583333, h * 0.2553333, w * 0.2543333, h * 0.2493333, w * 0.2543333, h * 0.2436667)
      ..close();
  }

  Path _windDegPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1246667, h * 0.4833333)
      ..cubicTo(
          w * 0.1246667, h * 0.4153333, w * 0.1416667, h * 0.3523333, w * 0.1753333, h * 0.2946667)
      ..cubicTo(
          w * 0.2090000, h * 0.2370000, w * 0.2546667, h * 0.1913333, w * 0.3123333, h * 0.1576667)
      ..cubicTo(
          w * 0.3700000, h * 0.1240000, w * 0.4326667, h * 0.1073333, w * 0.5003333, h * 0.1073333)
      ..cubicTo(
          w * 0.5510000, h * 0.1073333, w * 0.5996667, h * 0.1173333, w * 0.6460000, h * 0.1370000)
      ..cubicTo(
          w * 0.6923333, h * 0.1566667, w * 0.7320000, h * 0.1836667, w * 0.7656667, h * 0.2170000)
      ..cubicTo(
          w * 0.7993333, h * 0.2503333, w * 0.8260000, h * 0.2903333, w * 0.8456667, h * 0.3370000)
      ..cubicTo(
          w * 0.8653333, h * 0.3836667, w * 0.8753333, h * 0.4320000, w * 0.8753333, h * 0.4833333)
      ..cubicTo(
          w * 0.8753333, h * 0.5340000, w * 0.8653333, h * 0.5826667, w * 0.8456667, h * 0.6290000)
      ..cubicTo(
          w * 0.8260000, h * 0.6753333, w * 0.7990000, h * 0.7153333, w * 0.7656667, h * 0.7486667)
      ..cubicTo(
          w * 0.7323333, h * 0.7820000, w * 0.6923333, h * 0.8086667, w * 0.6460000, h * 0.8283333)
      ..cubicTo(
          w * 0.5996667, h * 0.8480000, w * 0.5513333, h * 0.8580000, w * 0.5003333, h * 0.8580000)
      ..cubicTo(
          w * 0.4493333, h * 0.8580000, w * 0.4003333, h * 0.8480000, w * 0.3540000, h * 0.8283333)
      ..cubicTo(
          w * 0.3076667, h * 0.8086667, w * 0.2676667, h * 0.7816667, w * 0.2340000, h * 0.7483333)
      ..cubicTo(
          w * 0.2003333, h * 0.7150000, w * 0.1740000, h * 0.6750000, w * 0.1540000, h * 0.6290000)
      ..cubicTo(
          w * 0.1340000, h * 0.5830000, w * 0.1246667, h * 0.5343333, w * 0.1246667, h * 0.4833333)
      ..close()
      ..moveTo(w * 0.2073333, h * 0.4833333)
      ..cubicTo(
          w * 0.2073333, h * 0.5623333, w * 0.2360000, h * 0.6310000, w * 0.2936667, h * 0.6893333)
      ..cubicTo(
          w * 0.3513333, h * 0.7470000, w * 0.4200000, h * 0.7756667, w * 0.5003333, h * 0.7756667)
      ..cubicTo(
          w * 0.5530000, h * 0.7756667, w * 0.6020000, h * 0.7626667, w * 0.6466667, h * 0.7363333)
      ..cubicTo(
          w * 0.6913333, h * 0.7100000, w * 0.7273333, h * 0.6746667, w * 0.7536667, h * 0.6296667)
      ..cubicTo(
          w * 0.7800000, h * 0.5846667, w * 0.7933333, h * 0.5360000, w * 0.7933333, h * 0.4833333)
      ..cubicTo(
          w * 0.7933333, h * 0.4306667, w * 0.7800000, h * 0.3816667, w * 0.7536667, h * 0.3366667)
      ..cubicTo(
          w * 0.7273333, h * 0.2916667, w * 0.6916667, h * 0.2560000, w * 0.6466667, h * 0.2296667)
      ..cubicTo(
          w * 0.6016667, h * 0.2033333, w * 0.5530000, h * 0.1903333, w * 0.5003333, h * 0.1903333)
      ..cubicTo(
          w * 0.4476667, h * 0.1903333, w * 0.3986667, h * 0.2033333, w * 0.3540000, h * 0.2296667)
      ..cubicTo(
          w * 0.3093333, h * 0.2560000, w * 0.2733333, h * 0.2916667, w * 0.2466667, h * 0.3366667)
      ..cubicTo(
          w * 0.2200000, h * 0.3816667, w * 0.2073333, h * 0.4306667, w * 0.2073333, h * 0.4833333)
      ..close()
      ..moveTo(w * 0.3703333, h * 0.6783333)
      ..lineTo(w * 0.4953333, h * 0.2413333)
      ..cubicTo(
          w * 0.4956667, h * 0.2380000, w * 0.4973333, h * 0.2363333, w * 0.5003333, h * 0.2363333)
      ..cubicTo(
          w * 0.5033333, h * 0.2363333, w * 0.5050000, h * 0.2380000, w * 0.5053333, h * 0.2413333)
      ..lineTo(w * 0.6300000, h * 0.6783333)
      ..cubicTo(
          w * 0.6313333, h * 0.6820000, w * 0.6310000, h * 0.6846667, w * 0.6293333, h * 0.6866667)
      ..cubicTo(
          w * 0.6276667, h * 0.6886667, w * 0.6250000, h * 0.6886667, w * 0.6213333, h * 0.6866667)
      ..lineTo(w * 0.5056667, h * 0.6433333)
      ..cubicTo(
          w * 0.5023333, h * 0.6420000, w * 0.4990000, h * 0.6420000, w * 0.4960000, h * 0.6433333)
      ..lineTo(w * 0.3793333, h * 0.6866667)
      ..cubicTo(
          w * 0.3760000, h * 0.6886667, w * 0.3736667, h * 0.6886667, w * 0.3723333, h * 0.6866667)
      ..cubicTo(
          w * 0.3710000, h * 0.6846667, w * 0.3696667, h * 0.6816667, w * 0.3703333, h * 0.6783333)
      ..close();
  }

  Path _windyPath(Size s) {
    final w = s.width;
    final h = s.height;
    return Path()
      ..moveTo(w * 0.1550000, h * 0.5166667)
      ..cubicTo(
          w * 0.1550000, h * 0.5093333, w * 0.1576667, h * 0.5030000, w * 0.1626667, h * 0.4980000)
      ..cubicTo(
          w * 0.1680000, h * 0.4930000, w * 0.1743333, h * 0.4906667, w * 0.1816667, h * 0.4906667)
      ..lineTo(w * 0.5843333, h * 0.4906667)
      ..cubicTo(
          w * 0.5916667, h * 0.4906667, w * 0.5976667, h * 0.4930000, w * 0.6023333, h * 0.4980000)
      ..cubicTo(
          w * 0.6070000, h * 0.5030000, w * 0.6096667, h * 0.5093333, w * 0.6096667, h * 0.5170000)
      ..cubicTo(
          w * 0.6096667, h * 0.5243333, w * 0.6073333, h * 0.5303333, w * 0.6023333, h * 0.5350000)
      ..cubicTo(
          w * 0.5976667, h * 0.5396667, w * 0.5916667, h * 0.5423333, w * 0.5843333, h * 0.5423333)
      ..lineTo(w * 0.1816667, h * 0.5423333)
      ..cubicTo(
          w * 0.1743333, h * 0.5423333, w * 0.1676667, h * 0.5400000, w * 0.1626667, h * 0.5350000)
      ..cubicTo(
          w * 0.1573333, h * 0.5300000, w * 0.1550000, h * 0.5240000, w * 0.1550000, h * 0.5166667)
      ..close()
      ..moveTo(w * 0.2353333, h * 0.4200000)
      ..cubicTo(
          w * 0.2353333, h * 0.4126667, w * 0.2380000, h * 0.4066667, w * 0.2430000, h * 0.4016667)
      ..cubicTo(
          w * 0.2480000, h * 0.3966667, w * 0.2543333, h * 0.3940000, w * 0.2616667, h * 0.3940000)
      ..lineTo(w * 0.6646667, h * 0.3940000)
      ..cubicTo(
          w * 0.6716667, h * 0.3940000, w * 0.6776667, h * 0.3966667, w * 0.6826667, h * 0.4016667)
      ..cubicTo(
          w * 0.6876667, h * 0.4066667, w * 0.6900000, h * 0.4126667, w * 0.6900000, h * 0.4200000)
      ..cubicTo(
          w * 0.6900000, h * 0.4273333, w * 0.6876667, h * 0.4333333, w * 0.6826667, h * 0.4386667)
      ..cubicTo(
          w * 0.6776667, h * 0.4436667, w * 0.6716667, h * 0.4463333, w * 0.6646667, h * 0.4463333)
      ..lineTo(w * 0.2620000, h * 0.4463333)
      ..cubicTo(
          w * 0.2546667, h * 0.4463333, w * 0.2483333, h * 0.4436667, w * 0.2433333, h * 0.4386667)
      ..cubicTo(
          w * 0.2383333, h * 0.4336667, w * 0.2353333, h * 0.4273333, w * 0.2353333, h * 0.4200000)
      ..close()
      ..moveTo(w * 0.2893333, h * 0.6113333)
      ..cubicTo(
          w * 0.2893333, h * 0.6043333, w * 0.2920000, h * 0.5983333, w * 0.2973333, h * 0.5933333)
      ..cubicTo(
          w * 0.3020000, h * 0.5886667, w * 0.3080000, h * 0.5860000, w * 0.3153333, h * 0.5860000)
      ..lineTo(w * 0.7186667, h * 0.5860000)
      ..cubicTo(
          w * 0.7260000, h * 0.5860000, w * 0.7323333, h * 0.5883333, w * 0.7373333, h * 0.5933333)
      ..cubicTo(
          w * 0.7423333, h * 0.5980000, w * 0.7446667, h * 0.6040000, w * 0.7446667, h * 0.6113333)
      ..cubicTo(
          w * 0.7446667, h * 0.6186667, w * 0.7420000, h * 0.6250000, w * 0.7370000, h * 0.6300000)
      ..cubicTo(
          w * 0.7320000, h * 0.6350000, w * 0.7256667, h * 0.6376667, w * 0.7183333, h * 0.6376667)
      ..lineTo(w * 0.3153333, h * 0.6376667)
      ..cubicTo(
          w * 0.3080000, h * 0.6376667, w * 0.3020000, h * 0.6350000, w * 0.2966667, h * 0.6300000)
      ..cubicTo(
          w * 0.2913333, h * 0.6250000, w * 0.2893333, h * 0.6186667, w * 0.2893333, h * 0.6113333)
      ..close()
      ..moveTo(w * 0.6420000, h * 0.5166667)
      ..cubicTo(
          w * 0.6420000, h * 0.5090000, w * 0.6443333, h * 0.5026667, w * 0.6493333, h * 0.4976667)
      ..cubicTo(
          w * 0.6543333, h * 0.4926667, w * 0.6606667, h * 0.4903333, w * 0.6683333, h * 0.4903333)
      ..lineTo(w * 0.8190000, h * 0.4903333)
      ..cubicTo(
          w * 0.8266667, h * 0.4903333, w * 0.8330000, h * 0.4926667, w * 0.8380000, h * 0.4976667)
      ..cubicTo(
          w * 0.8430000, h * 0.5026667, w * 0.8453333, h * 0.5090000, w * 0.8453333, h * 0.5163333)
      ..cubicTo(
          w * 0.8453333, h * 0.5236667, w * 0.8430000, h * 0.5296667, w * 0.8380000, h * 0.5343333)
      ..cubicTo(
          w * 0.8330000, h * 0.5390000, w * 0.8266667, h * 0.5416667, w * 0.8193333, h * 0.5416667)
      ..lineTo(w * 0.6686667, h * 0.5416667)
      ..cubicTo(
          w * 0.6610000, h * 0.5416667, w * 0.6546667, h * 0.5393333, w * 0.6496667, h * 0.5343333)
      ..cubicTo(
          w * 0.6443333, h * 0.5300000, w * 0.6420000, h * 0.5240000, w * 0.6420000, h * 0.5166667)
      ..close();
  }
}
