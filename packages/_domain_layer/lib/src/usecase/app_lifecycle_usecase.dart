import 'package:riverpod/riverpod.dart';

import '../../domain_layer.dart';

class AppLifecycleUsecase {
  AppLifecycleUsecase({
    required this.ref,
  });

  final ProviderRef ref;

  void onPaused() {
    ref.invalidate(minuteMetronomeProvider);
    ref.invalidate(currentWeatherMetronomeProvider);
  }

  void onResumed() {}
}
