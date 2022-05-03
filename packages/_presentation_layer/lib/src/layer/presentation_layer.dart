import 'package:_core_layer/core_layer.dart';
import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';

class PresentationLayer extends AppLayer with WidgetsBindingObserver {
  const PresentationLayer(this.appLifecycleUsecase);

  final AppLifecycleUsecase appLifecycleUsecase;

  @override
  Future<void> init() {
    WidgetsBinding.instance?.addObserver(this);
    return Future.value();
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
    WidgetsBinding.instance?.removeObserver(this);
  }
}
