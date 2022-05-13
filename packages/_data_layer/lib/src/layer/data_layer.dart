import 'package:_core_layer/core_layer.dart';
import 'package:_domain_layer/domain_layer.dart';

import 'package:path_provider/path_provider.dart';

import '../../objectbox.g.dart';
import '../model/city_model.dart';
import '../model/preference_model.dart';
import '../repository/objectbox_cities_repository.dart';
import '../repository/objectbox_preferences_repository.dart';

/// DataLayer has the responsibility to provide repository implementaions.
///
/// Provides all repository implementations, also accessible through providers.
class DataLayer extends AppLayer {
  late final Store _store;

  PreferencesRepository get preferencesRepository =>
      ObjectboxPreferencesRepository(box: _store.box<PreferenceModel>());

  CitiesRepository get citiesRepository => ObjectboxCitiesRepository(box: _store.box<CityModel>());

  @override
  Future<void> init() async {
    _store = await _openStore();
  }

  @override
  void dispose() => _store.close();

  Future<Store> _openStore() async {
    final appDir = await getApplicationDocumentsDirectory();
    final objectboxPath = '${appDir.path}/objectbox';
    if (Store.isOpen(objectboxPath)) {
      return Store.attach(getObjectBoxModel(), objectboxPath);
    } else {
      return Store(getObjectBoxModel(), directory: objectboxPath);
    }
  }
}
