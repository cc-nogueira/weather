import 'dart:io';

import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/helper/theme_builder.dart';
import '../common/mobile_add/ad_state.dart';
import '../common/mobile_add/ad_unit_ids.dart';
import '../common/mobile_add/weather_ad_unit_ids.dart';

// -- Google AdMob:

/// AdUnitIds for the right Platform
final adUnitIds = Provider<AdUnitIds>(
  (_) => Platform.isAndroid
      ? const WeatherAndroidAdUnitIds()
      : Platform.isIOS
          ? const WeatherIosAdUnitIds()
          : NoAdUnitIds(),
);

/// AdState for Mobile or FakeAdState for Desktop
final adStateProvider = Provider(
  (ref) => Platform.isAndroid || Platform.isIOS
      ? MobileAdState(adUnitIds: ref.watch(adUnitIds), useTestAdUnit: true)
      : FakeAdState(),
);

// -- Preferences Panel:

/// Currently showing preferences panel
final showPreferencesPanelProvider = StateProvider((_) => false);

/// Shared duration for panel animations
final preferencesPanelAnimationDurationProvider =
    StateProvider((_) => const Duration(milliseconds: 600));

/// Shared curve for panel animations
final preferencesPanelAnimationCurve = StateProvider((_) => Curves.easeOutSine);

// -- Theme:

/// dark theme
final darkThemeProvider = Provider((_) => const ThemeBuilder().darkTheme);

/// light theme
final lightThemeProvider = Provider((_) => const ThemeBuilder().lightTheme);

/// theme prvider
final themeProvider = Provider((ref) {
  final mode = ref.watch(themeModeProvider);
  if (mode == ThemeMode.light) {
    return ref.watch(lightThemeProvider);
  }
  return ref.watch(darkThemeProvider);
});
