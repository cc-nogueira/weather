import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiver/async.dart';
import 'package:quiver/time.dart';

import '../weather_usecase.dart';

/// minuteMetronome provider subscribes to a Metronome with aMinute interval.
/// This provider is invalidated by AppLifecycleUsecase when App is put in background.
/// It will resume execution when observed next time by the resumed user interface.
///
/// This provider is used to show up to date local time for all locations.
final minuteMetronomeProvider = Provider<DateTime>((ref) {
  final subscription = Metronome.epoch(aMinute).listen((dt) => ref.state = dt);
  ref.onDispose(() => subscription.cancel());
  return DateTime.now();
});

/// hourMetronome provider subscribes to a Metronome with anHour interval.
/// This provider is invalidated by AppLifecycleUsecase when App is put in background.
/// It will resume execution when observed next time by the resumed user interface.
///
/// This provider is used to refresh chart information that is hour based.
final hourMetronomeProvider = Provider<DateTime>((ref) {
  final subscription = Metronome.epoch(anHour).listen((dt) => ref.state = dt);
  ref.onDispose(() => subscription.cancel());
  return DateTime.now();
});

/// currentWeatherMetronome provider subscrive to a Metronome with the interval defined in the Usecase.
/// This provider is invalidated by AppLifecycleUsecase when App is put in background.
/// It will resume execution when observed next time by the resumed user interface.
///
/// This provider is used to refresh current weather for all locations..
final currentWeatherMetronomeProvider = Provider<DateTime>((ref) {
  final subscription = Metronome.periodic(WeatherUsecase.currentWeatherRefreshInterval).listen((dt) => ref.state = dt);
  ref.onDispose(() {
    subscription.cancel();
  });
  return DateTime.now();
});
