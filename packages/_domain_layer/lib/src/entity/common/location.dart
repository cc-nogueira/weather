import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';

/// Location entity.
///
/// Stores a geo location with latitude and longitude.
/// It is referenced by other entities, services, mappers, etc.
@freezed
class Location with _$Location {
  const factory Location({
    @Default(0.0) double latitude,
    @Default(0.0) double longitude,
  }) = _Location;
}
