import '../entity/common/preference.dart';
import 'entity_repository.dart';

abstract class PreferencesRepository implements EntityRepository<Preference> {
  Preference? getByKey(String key);
  Preference saveByKey(Preference preference);
}
