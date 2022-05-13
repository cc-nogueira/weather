import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/helper/theme_builder.dart';
import '../common/mobile_add/ad_container.dart';

final showPreferencesPanelProvider = StateProvider((_) => false);

final preferencesPanelAnimationDurationProvider =
    StateProvider((_) => const Duration(milliseconds: 600));

final preferencesPanelAnimationProvider = StateProvider.autoDispose
    .family<Animation<double>, AnimationController>(
        (_, controller) => CurvedAnimation(parent: controller, curve: Curves.easeOutSine));

final darkThemeProvider = Provider((_) => const ThemeBuilder().darkTheme);

final lightThemeProvider = Provider((_) => const ThemeBuilder().lightTheme);

final themeProvider = Provider((ref) {
  final mode = ref.watch(themeModeProvider);
  if (mode == ThemeMode.light) {
    return ref.watch(lightThemeProvider);
  }
  return ref.watch(darkThemeProvider);
});

final adAutoReleaseProvider = Provider.autoDispose.family<AdInRowContainer, AdInRowContainer>(
  (ref, adContainer) {
    ref.onDispose(() => adContainer.dispose());
    return adContainer;
  },
);
