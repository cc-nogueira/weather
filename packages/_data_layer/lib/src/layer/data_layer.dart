import 'dart:io';

import 'package:_core_layer/core_layer.dart';
import 'package:_domain_layer/domain_layer.dart';

import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../objectbox.g.dart';
import '../model/city_model.dart';
import '../model/preference_model.dart';
import '../repository/objectbox_cities_repository.dart';
import '../repository/objectbox_preferences_repository.dart';

part 'data_layer.g.dart';

/// Data Layer provider
@Riverpod(keepAlive: true)
DataLayer dataLayer(DataLayerRef ref) => DataLayer();

/// PreferencesRepositoy implementation provider
@Riverpod(keepAlive: true)
PreferencesRepository preferencesRepository(PreferencesRepositoryRef ref) =>
    ref.watch(dataLayerProvider).preferencesRepository;

/// CitiesRepository implementation provider
@Riverpod(keepAlive: true)
CitiesRepository citiesRepository(CitiesRepositoryRef ref) =>
    ref.watch(dataLayerProvider).citiesRepository;

/// DataLayer has the responsibility to provide repository implementaions.
///
/// This layer uses the init() async call to open the ObjectBox local store.
/// It requires no configuration after init().
///
/// DataLayer provides repository implementations, also accessible through providers.
/// @see Data Layer providers.dart file.
class DataLayer extends AppLayer {
  /// Private objectbox store.
  late final Store _store;

  /// Initilize this layer object.
  ///
  /// Opens the local ObjectBox Store (async routine).
  @override
  Future<void> init() async {
    _store = await _openStore();
  }

  /// Dispose this layer object.
  ///
  /// Will close the ObjectBox Store when App is exiting.
  @override
  void dispose() => _store.close();

  /// Getter for PreferencesRepository implementation with ObjectBox.
  PreferencesRepository get preferencesRepository =>
      ObjectboxPreferencesRepository(box: _store.box<PreferenceModel>());

  /// Getter for CitiesRepositoty implementation with ObjectBox.
  CitiesRepository get citiesRepository => ObjectboxCitiesRepository(box: _store.box<CityModel>());

  /// Internal async routine to open the ObjectBox Store.
  Future<Store> _openStore() async {
    final appDir = await getApplicationDocumentsDirectory();
    final objectboxPath =
        _isMobile ? '${appDir.path}/objectbox' : '${appDir.path}/objectbox/weather_colors';
    if (Store.isOpen(objectboxPath)) {
      return Store.attach(getObjectBoxModel(), objectboxPath);
    } else {
      return Store(getObjectBoxModel(), directory: objectboxPath);
    }
  }

  bool get _isMobile => Platform.isAndroid || Platform.isIOS;
}
