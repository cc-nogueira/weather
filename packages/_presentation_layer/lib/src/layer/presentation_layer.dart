import 'package:_core_layer/core_layer.dart';
import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';

import '../common/mobile_add/ad_state.dart';

class PresentationLayer extends AppLayer with WidgetsBindingObserver {
  const PresentationLayer({required this.appLifecycleUsecase, required this.adState});

  final AppLifecycleUsecase appLifecycleUsecase;
  final AdState adState;

  @override
  Future<void> init() async {
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
