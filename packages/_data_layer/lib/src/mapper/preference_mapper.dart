import 'package:_domain_layer/domain_layer.dart';

import '../model/preference_model.dart';
import 'entity_mapper.dart';

class PreferenceMapper extends EntityMapper<Preference, PreferenceModel> {
  const PreferenceMapper();

  @override
  Preference mapEntity(PreferenceModel model) =>
      Preference(id: model.id, key: model.key, value: model.value);

  @override
  PreferenceModel mapModel(Preference entity) =>
      PreferenceModel(id: entity.id, key: entity.key, value: entity.value);
}
