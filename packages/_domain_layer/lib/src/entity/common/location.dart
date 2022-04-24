import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';

@freezed
class Location with _$Location {
  const factory Location({
    @Default(0.0) double latitude,
    @Default(0.0) double longitude,
  }) = _Location;
}
