import '../entity/weather/city.dart';
import 'entity_stream_repository.dart';

/// Cities Repository interface.
///
/// This repository defines a Stream type API (in contrast to a Notifier API).
abstract class CitiesRepository extends EntityStreamRepository<City> {}
