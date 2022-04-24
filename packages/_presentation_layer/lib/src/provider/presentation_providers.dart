import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final showPreferencesPanelProvider = StateProvider((_) => false);

final preferencesPanelAnimationDurationProvider =
    StateProvider((_) => const Duration(milliseconds: 600));

final preferencesPanelAnimationProvider = StateProvider.autoDispose
    .family<Animation<double>, AnimationController>(
        (_, controller) => CurvedAnimation(parent: controller, curve: Curves.easeOutSine));
