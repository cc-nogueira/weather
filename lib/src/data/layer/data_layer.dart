import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../../../objectbox.g.dart';
import '../../domain_layer.dart';
import '../model/city_model.dart';
import '../model/preference_model.dart';
import '../repository/objectbox_cities_repository.dart';
import '../repository/objectbox_preferences_repository.dart';

/// Data layer singleton.
final dataLayer = DataLayer();

/// DataLayer has the responsibility to provision repository implementaions.
///
/// This layer uses the init() async call to initialize the local store.
class DataLayer extends AppLayer {
  /// Implementations provisioned by the data layer
  late final DataLayerProvision provision;

  /// Private objectbox store.
  late final Store _store;

  /// Initilize this layer object.
  ///
  /// Opens the local ObjectBox Store (async routine).
  @override
  Future<void> init(Ref ref) async {
    provision = DataLayerProvision(
      preferencesRepositoryBuilder: () => ObjectboxPreferencesRepository(box: _store.box<PreferenceModel>()),
      citiesRepositoryBuilder: () => ObjectboxCitiesRepository(box: _store.box<CityModel>()),
    );
    _store = await _openStore();
  }

  /// Dispose this layer object.
  ///
  /// Will close the ObjectBox Store when App is exiting.
  @override
  void dispose() => _store.close();

  /// Internal async routine to open the ObjectBox Store.
  Future<Store> _openStore() async {
    final appDir = await getApplicationDocumentsDirectory();
    final objectboxPath = _isMobile ? '${appDir.path}/objectbox' : '${appDir.path}/objectbox/weather_colors';
    if (Store.isOpen(objectboxPath)) {
      return Store.attach(getObjectBoxModel(), objectboxPath);
    } else {
      return Store(getObjectBoxModel(), directory: objectboxPath);
    }
  }

  bool get _isMobile => Platform.isAndroid || Platform.isIOS;
}
