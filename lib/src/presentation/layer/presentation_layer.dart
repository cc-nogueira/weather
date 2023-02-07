import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain_layer.dart';
import '../common/mobile_add/ad_state.dart';
import '../provider/presentation_providers.dart';

/// Presentation layer singleton.
final presentationLayer = PresentationLayer();

/// PresentationLayer watches the AppLifecycle to trigger use case invocation to start and stop metronomes.
class PresentationLayer extends AppLayer with WidgetsBindingObserver {
  late final AppLifecycleUsecase appLifecycleUsecase;
  late final AdState adState;

  @override
  Future<void> init(Ref ref) async {
    appLifecycleUsecase = ref.read(appLifecycleUsecaseProvider);
    adState = ref.read(adStateProvider);
    WidgetsBinding.instance.addObserver(this);
    await adState.init();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      appLifecycleUsecase.onPaused();
    } else if (state == AppLifecycleState.resumed) {
      appLifecycleUsecase.onResumed();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }
}
