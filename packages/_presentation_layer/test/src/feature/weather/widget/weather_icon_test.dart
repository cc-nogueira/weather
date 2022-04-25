import 'package:_presentation_layer/src/feature/weather/widget/weather_icon.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_icons/weather_icons.dart';

void main() {
  const fallback = IconData(0);

  test('weather icons', () {
    for (final entry in WeatherIcon.openWeatherToWeatherIconsMap.entries) {
      for (final name in entry.value) {
        final icon = WeatherIcons.fromString('wi-$name', fallback: fallback);

        expect(icon, isNot(same(fallback)), reason: 'No icon for ${entry.key}: $name');
      }
    }
  });
}
