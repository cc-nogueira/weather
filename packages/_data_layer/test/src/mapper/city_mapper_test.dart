import 'package:_data_layer/src/mapper/city_mapper.dart';
import 'package:_data_layer/src/model/city_model.dart';
import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const mapper = CityMapper();

  const emptyEntity = City();
  final emptyModel = CityModel();

  const filledEntity = City(
    id: 10,
    order: 3,
    name: 'Florianópolis',
    state: 'SC',
    country: 'BR',
    location: Location(latitude: 0.123, longitude: 3.21),
    nameTranslations: {'en': 'Florianopolis', 'pt': 'Florianópolis', 'de': 'Guttenblah'},
  );

  final filledModel = CityModel(
    id: 10,
    name: 'Florianópolis',
    state: 'SC',
    country: 'BR',
    order: 3,
    latitude: 0.123,
    longitude: 3.21,
    nameTranslations: '{"en":"Florianopolis","pt":"Florianópolis","de":"Guttenblah"}',
  );

  group('Mapper Entity to Model', () {
    test('empty entity should map to an empty model', () {
      final mappedModel = mapper.mapModel(emptyEntity);

      expect(mappedModel, emptyModel);
    });

    test('filled entity shoud map to filled model', () {
      final mappedModel = mapper.mapModel(filledEntity);

      expect(mappedModel, filledModel);
    });
  });
  group('Mapper Model to Entity', () {
    test('empty model should map to an empty entity', () {
      final mappeEntity = mapper.mapEntity(emptyModel);

      expect(mappeEntity, emptyEntity);
    });

    test('filled entity shoud map to filled model', () {
      final mappeEntity = mapper.mapEntity(filledModel);

      expect(mappeEntity, filledEntity);
    });
  });
}
