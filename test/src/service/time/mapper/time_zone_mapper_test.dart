import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_colors/src/domain/entity/time_zone/time_zone.dart';
import 'package:weather_colors/src/service/time/mapper/time_zone_mapper.dart';
import 'package:weather_colors/src/service/time/model/time_zone_model.dart';

void main() {
  const mapper = TimeZoneMapper();

  const emptySrc = '{}';

  const timeZoneSrc = '{'
      '  "timeZone": "America/Sao_Paulo",'
      '  "currentLocalTime": "2022-04-12T13:41:48.9984601",'
      '  "currentUtcOffset": {'
      '    "seconds": -10800,'
      '    "milliseconds": -10800000,'
      '    "ticks": -108000000000,'
      '    "nanoseconds": -10800000000000'
      '  },'
      '  "standardUtcOffset": {'
      '    "seconds": -10800,'
      '    "milliseconds": -10800000,'
      '    "ticks": -108000000000,'
      '    "nanoseconds": -10800000000000'
      '  },'
      '  "hasDayLightSaving": false,'
      '  "isDayLightSavingActive": false,'
      '  "dstInterval": null'
      '}';

  const timeZone = TimeZone(
    timeZone: 'America/Sao_Paulo',
    currentLocalTimeMillis: 1649781708998,
    currentUtcOffset: TimeZoneOffset(
      seconds: -10800,
      milliseconds: -10800000,
    ),
    standardUtcOffset: TimeZoneOffset(
      seconds: -10800,
      milliseconds: -10800000,
    ),
    hasDayLightSaving: false,
    isDayLightSavingActive: false,
  );

  test('should return a empty entity when receiveing empty JSON', () {
    final model = TimeZoneModel.fromJson(json.decode(emptySrc));

    final entity = mapper.mapEntity(model);

    expect(entity, const TimeZone());
  });

  test('shoud map JSON to Entity', () {
    final model = TimeZoneModel.fromJson(json.decode(timeZoneSrc));

    final entity = mapper.mapEntity(model);

    expect(entity, timeZone);
  });
}
