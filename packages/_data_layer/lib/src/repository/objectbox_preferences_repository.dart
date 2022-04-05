import 'package:_domain_layer/domain_layer.dart';

import '../../objectbox.g.dart';
import '../mapper/preference_mapper.dart';
import '../model/preference_model.dart';
import 'objectbox_repository.dart';

class ObjectboxPreferencesRepository
    extends ObjectboxRepository<Preference, PreferenceModel>
    implements PreferencesRepository {
  ObjectboxPreferencesRepository({required Box<PreferenceModel> box})
      : super(box: box, mapper: const PreferenceMapper());

  @override
  get idProperty => PreferenceModel_.id;

  @override
  Preference? getByKey(String key) {
    final model = _getModelByKey(key);
    if (model == null) {
      return null;
    }
    return mapper.mapEntity(model);
  }

  @override
  Preference saveByKey(Preference preference) {
    final key = preference.key;
    final model = _getModelByKey(key) ?? PreferenceModel(key: key);
    model.value = preference.value;
    box.put(model);
    return mapper.mapEntity(model);
  }

  PreferenceModel? _getModelByKey(String key) =>
      box.query(PreferenceModel_.key.equals(key)).build().findFirst();
}
