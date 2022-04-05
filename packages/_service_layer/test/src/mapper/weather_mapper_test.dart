import 'dart:convert';

import 'package:_domain_layer/domain_layer.dart';
import 'package:_service_layer/_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const mapper = WeatherMapper();

  const emptySrc = '{"main": {}, "weather": [{}]}';

  const weatherSrc = '{"coord":{"lon":139,"lat":35.5},'
      '"weather":[{"id":500,"main":"Rain","description":"chuva fraca","icon":"10n"}],'
      '"base":"stations",'
      '"main":{"temp":6.33,"feels_like":4.95,"temp_min":5.59,"temp_max":6.95,"pressure":1017,"humidity":98,"sea_level":1017,"grnd_level":906},'
      '"visibility":390,'
      '"wind":{"speed":1.97,"deg":64,"gust":3.31},'
      '"rain":{"1h":0.36},'
      '"clouds":{"all":100},'
      '"dt":1647524296,'
      '"sys":{"type":1,"id":8060,"country":"JP","sunrise":1647463968,"sunset":1647507137},'
      '"timezone":32400,'
      '"id":1853564,'
      '"name":"Otsuki",'
      '"cod":200}';

  const weather = Weather(
    code: 500,
    title: 'Rain',
    description: 'chuva fraca',
    geo: Geo(
      latitude: 35.5,
      longitude: 139.0,
      dateTimeMillis: 1647524296000,
      timeShiftMillis: 32400000,
      sunriseMillis: 1647463968000,
      sunsetMillis: 1647507137000,
    ),
    humidity: 98,
    temperature: Temperature(feelsLike: 4.95, now: 6.33, min: 5.59, max: 6.95),
    wind: Wind(speed: 1.97, gust: 3.31, directionFrom: 64),
  );

  test('should return a empty entity when receiveing empty JSON', () {
    final model = CurrentWeatherModel.fromJson(json.decode(emptySrc));

    final currentWeather = mapper.mapEntity(model);

    expect(currentWeather, const Weather());
  });

  test('shoud map JSON to Entity', () {
    final model = CurrentWeatherModel.fromJson(json.decode(weatherSrc));

    final currentWeather = mapper.mapEntity(model);

    expect(currentWeather, weather);
  });
}
