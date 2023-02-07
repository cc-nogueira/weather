import 'package:meta/meta.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../provider/providers.dart';

part 'app_lifecycle_usecase.g.dart';

/// AppLifecycleUsecase singleton provider
@Riverpod(keepAlive: true)
AppLifecycleUsecase appLifecycleUsecase(AppLifecycleUsecaseRef ref) => AppLifecycleUsecase(ref: ref);

/// AppLifecycleUsecase instance is called by the PresentationLayer on App Lifecycle changes.
///
/// It is responsible to stop metronomes when the App goes to background.
class AppLifecycleUsecase {
  /// Constructor receives a Riverpod ref used to invalidate metronomes.
  AppLifecycleUsecase({required this.ref});

  /// Internal Riverpod ref used to invalidate metronomes when app goes to background.
  @internal
  final ProviderRef ref;

  /// onPaused event.
  ///
  /// invalidates and therefore pause all background metronome threads.
  void onPaused() {
    ref.invalidate(minuteMetronomeProvider);
    ref.invalidate(hourMetronomeProvider);
    ref.invalidate(currentWeatherMetronomeProvider);
  }

  /// onResumed event.
  ///
  /// No action required. Metronomes are restarted when the user interfaces observes corresponding
  /// providers.
  void onResumed() {}
}
