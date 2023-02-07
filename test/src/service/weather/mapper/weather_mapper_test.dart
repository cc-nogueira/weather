import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_colors/src/domain/entity/common/location.dart';
import 'package:weather_colors/src/domain/entity/weather/celcius.dart';
import 'package:weather_colors/src/domain/entity/weather/conditions.dart';
import 'package:weather_colors/src/domain/entity/weather/current_weather.dart';
import 'package:weather_colors/src/domain/entity/weather/geo.dart';
import 'package:weather_colors/src/domain/entity/weather/temperatures.dart';
import 'package:weather_colors/src/domain/entity/weather/weather.dart';
import 'package:weather_colors/src/domain/entity/weather/wind.dart';
import 'package:weather_colors/src/service/weather/mapper/current_weather_mapper.dart';
import 'package:weather_colors/src/service/weather/model/current_weather_model.dart';

void main() {
  const mapper = CurrentWeatherMapper();

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

  const currentWeather = CurrentWeather(
    name: 'Otsuki',
    weather: Weather(
      dateTimeMillis: 1647524296000,
      geo: Geo(
        location: Location(latitude: 35.5, longitude: 139.0),
        timeShiftMillis: 32400000,
        sunriseMillis: 1647463968000,
        sunsetMillis: 1647507137000,
      ),
      conditions: Conditions(
        code: 500,
        title: 'Rain',
        description: 'chuva fraca',
        pressure: 1017,
        humidity: 98,
        clouds: 100,
        temperatures: Temperatures(
          feelsLike: Celcius(4.95),
          temperature: Celcius(6.33),
          min: Celcius(5.59),
          max: Celcius(6.95),
        ),
        wind: Wind(speed: 1.97, gust: 3.31, directionFrom: 64),
        rain1h: 0.36,
      ),
    ),
  );

  test('should return a empty entity when receiveing empty JSON', () {
    final model = CurrentWeatherModel.fromJson(json.decode(emptySrc));

    final mappedEntity = mapper.mapEntity(model);

    var emptyWeather = const Weather();
    final temperatures = emptyWeather.conditions.temperatures.copyWith(
      min: const Celcius(0.0),
      max: const Celcius(0.0),
    );
    final conditions = emptyWeather.conditions.copyWith(temperatures: temperatures);
    emptyWeather = emptyWeather.copyWith(conditions: conditions);
    final emptyCurrentWeather = CurrentWeather(weather: emptyWeather);

    expect(mappedEntity, emptyCurrentWeather);
  });

  test('shoud map JSON to Entity', () {
    final model = CurrentWeatherModel.fromJson(json.decode(weatherSrc));

    final mappedEntity = mapper.mapEntity(model);

    expect(mappedEntity, currentWeather);
  });
}
