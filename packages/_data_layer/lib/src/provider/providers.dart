import 'package:riverpod/riverpod.dart';

import '../layer/data_layer.dart';

/// Data Layer provider
final dataLayerProvider = Provider((_) => DataLayer());

final preferencesRepositoryProvider =
    Provider((ref) => ref.watch(dataLayerProvider).preferencesRepository);

/// CitiesRepository interface implementation provider
final citiesRepositoryProvider = Provider((ref) => ref.watch(dataLayerProvider).citiesRepository);
