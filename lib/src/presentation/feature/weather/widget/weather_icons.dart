import 'package:flutter/material.dart';

typedef WeatherIconBuilder = Image Function(double size, Color color);

class WeatherIcons {
  WeatherIcons._();

  static final WeatherIcons instance = WeatherIcons._();
  static final WeatherIcons _i = instance;

  static Image forOpenWeather({
    required int openWeatherCode,
    required double size,
    required bool? isDayTime,
    required Color color,
  }) {
    final idx = isDayTime == null ? 0 : (isDayTime ? 1 : 2);
    final builder = _openWeatherToBuilderMap[openWeatherCode]?.elementAt(idx) ?? _i.na;
    return builder(size, color);
  }

  static final Map<int, List<WeatherIconBuilder>> _openWeatherToBuilderMap = {
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

  Image cloudy(double size, Color color) => _image('assets/weather/wi-cloudy.png', size, color);

  Image cloudyGusts(double size, Color color) => _image('assets/weather/wi-cloudy-gusts.png', size, color);

  Image dayCloudy(double size, Color color) => _image('assets/weather/wi-day-cloudy.png', size, color);

  Image dayCloudyGusts(double size, Color color) => _image('assets/weather/wi-day-cloudy-gusts.png', size, color);

  Image dayFog(double size, Color color) => _image('assets/weather/wi-day-fog.png', size, color);

  Image dayHail(double size, Color color) => _image('assets/weather/wi-day-hail.png', size, color);

  Image dayHaze(double size, Color color) => _image('assets/weather/wi-day-haze.png', size, color);

  Image dayLightning(double size, Color color) => _image('assets/weather/wi-day-lightning.png', size, color);

  Image dayRain(double size, Color color) => _image('assets/weather/wi-day-rain.png', size, color);

  Image dayRainMix(double size, Color color) => _image('assets/weather/wi-day-rain-mix.png', size, color);

  Image dayShowers(double size, Color color) => _image('assets/weather/wi-day-showers.png', size, color);

  Image daySleet(double size, Color color) => _image('assets/weather/wi-day-sleet.png', size, color);

  Image daySnow(double size, Color color) => _image('assets/weather/wi-day-snow.png', size, color);

  Image daySprinkle(double size, Color color) => _image('assets/weather/wi-day-sprinkle.png', size, color);

  Image dayStormShowers(double size, Color color) => _image('assets/weather/wi-day-storm-showers.png', size, color);

  Image daySunny(double size, Color color) => _image('assets/weather/wi-day-sunny.png', size, color);

  Image daySunnyOvercast(double size, Color color) => _image('assets/weather/wi-day-sunny-overcast.png', size, color);

  Image dayThunderstorm(double size, Color color) => _image('assets/weather/wi-day-thunderstorm.png', size, color);

  Image dust(double size, Color color) => _image('assets/weather/wi-dust.png', size, color);

  Image fog(double size, Color color) => _image('assets/weather/wi-fog.png', size, color);

  Image hail(double size, Color color) => _image('assets/weather/wi-hail.png', size, color);

  Image hot(double size, Color color) => _image('assets/weather/wi-hot.png', size, color);

  Image hurricane(double size, Color color) => _image('assets/weather/wi-hurricane.png', size, color);

  Image lightning(double size, Color color) => _image('assets/weather/wi-lightning.png', size, color);

  Image na(double size, Color color) => _image('assets/weather/wi-na.png', size, color);

  Image nightCloudy(double size, Color color) => _image('assets/weather/wi-night-alt-cloudy.png', size, color);

  Image nightCloudyGusts(double size, Color color) =>
      _image('assets/weather/wi-night-alt-cloudy-gusts.png', size, color);

  Image nightHail(double size, Color color) => _image('assets/weather/wi-night-alt-hail.png', size, color);

  Image nightLightning(double size, Color color) => _image('assets/weather/wi-night-alt-lightning.png', size, color);

  Image nightRain(double size, Color color) => _image('assets/weather/wi-night-alt-rain.png', size, color);

  Image nightRainMix(double size, Color color) => _image('assets/weather/wi-night-alt-rain-mix.png', size, color);

  Image nightShowers(double size, Color color) => _image('assets/weather/wi-night-alt-showers.png', size, color);

  Image nightSleet(double size, Color color) => _image('assets/weather/wi-night-alt-sleet.png', size, color);

  Image nightSnow(double size, Color color) => _image('assets/weather/wi-night-alt-snow.png', size, color);

  Image nightSprinkle(double size, Color color) => _image('assets/weather/wi-night-alt-sprinkle.png', size, color);

  Image nightStormShowers(double size, Color color) =>
      _image('assets/weather/wi-night-alt-storm-showers.png', size, color);

  Image nightThunderstorm(double size, Color color) =>
      _image('assets/weather/wi-night-alt-thunderstorm.png', size, color);

  Image nightClear(double size, Color color) => _image('assets/weather/wi-night-clear.png', size, color);

  Image nightFog(double size, Color color) => _image('assets/weather/wi-night-fog.png', size, color);

  Image rain(double size, Color color) => _image('assets/weather/wi-rain.png', size, color);

  Image rainMix(double size, Color color) => _image('assets/weather/wi-rain-mix.png', size, color);

  Image showers(double size, Color color) => _image('assets/weather/wi-showers.png', size, color);

  Image sleet(double size, Color color) => _image('assets/weather/wi-sleet.png', size, color);

  Image smoke(double size, Color color) => _image('assets/weather/wi-smoke.png', size, color);

  Image snow(double size, Color color) => _image('assets/weather/wi-snow.png', size, color);

  Image snowflakeCold(double size, Color color) => _image('assets/weather/wi-snowflake-cold.png', size, color);

  Image sprinkle(double size, Color color) => _image('assets/weather/wi-sprinkle.png', size, color);

  Image stormShowers(double size, Color color) => _image('assets/weather/wi-storm-showers.png', size, color);

  Image strongWind(double size, Color color) => _image('assets/weather/wi-strong-wind.png', size, color);

  Image thermometer(double size, Color color) => _image('assets/weather/wi-thermometer.png', size, color);

  Image thunderstorm(double size, Color color) => _image('assets/weather/wi-thunderstorm.png', size, color);

  Image tornado(double size, Color color) => _image('assets/weather/wi-tornado.png', size, color);

  Image windDeg(double size, Color color) => _image('assets/weather/wi-wind-deg.png', size, color);

  Image windy(double size, Color color) => _image('assets/weather/wi-windy.png', size, color);

// ------------------------

  Image _image(String name, double size, Color color) => Image.asset(name, width: size, height: size, color: color);
}
