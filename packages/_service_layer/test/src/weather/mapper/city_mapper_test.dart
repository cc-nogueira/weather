import 'dart:convert';

import 'package:_domain_layer/domain_layer.dart';
import 'package:_service_layer/src/weather/mapper/city_mapper.dart';
import 'package:_service_layer/src/weather/model/city_location_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const mapper = CityMapper();

  const simpleSrc = '{'
      '"name": "Florianópolis",'
      '"lat": -0.3366151,'
      '"lon": -63.8845021,'
      '"country": "BR",'
      '"state": "Amazonas"}';

  const simpleCity = City(
    name: 'Florianópolis',
    location: Location(latitude: -0.3366151, longitude: -63.8845021),
    country: 'BR',
    state: 'Amazonas',
  );

  const completeSrc = '{'
      '"name": "Florianópolis",'
      '"local_names": {'
      '"zh": "弗洛里亚诺波利斯",'
      '"uz": "Florianopolis",'
      '"ja": "フロリアノーポリス",'
      '"th": "โฟลเรียนอโปลิส"'
      '},'
      '"lat": -27.5973002,'
      '"lon": -48.5496098,'
      '"country": "BR",'
      '"state": "Santa Catarina"}';

  const completeCity = City(
    name: 'Florianópolis',
    location: Location(latitude: -27.5973002, longitude: -48.5496098),
    country: 'BR',
    state: 'Santa Catarina',
    nameTranslations: {
      'zh': '弗洛里亚诺波利斯',
      'uz': 'Florianopolis',
      'ja': 'フロリアノーポリス',
      'th': 'โฟลเรียนอโปลิส',
    },
  );

  test('simple source should map to simple entity', () {
    final model = CityLocationModel.fromJson(json.decode(simpleSrc));
    final entity = mapper.mapEntity(model);
    expect(entity, simpleCity);
  });

  test('complete source should map to complete entity', () {
    final model = CityLocationModel.fromJson(json.decode(completeSrc));
    final entity = mapper.mapEntity(model);
    expect(entity, completeCity);
  });
}
