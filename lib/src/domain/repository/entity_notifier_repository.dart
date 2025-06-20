import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entity/common/entity.dart';
import 'entity_repository.dart';

/// Generic interface of a EntityRepository with StateNotifier API for [List<Entity>].
///
/// State update notifications are triggered by StateNotifier superclass.
/// An instance of this class may be watched by StateNotifierProvider.
abstract class EntityNotifierRepository<T extends Entity> implements EntityRepository<T>, StateNotifier<List<T>> {}
