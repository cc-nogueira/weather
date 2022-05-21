import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../l10n/translations.dart';
import '../../../provider/presentation_providers.dart';
import 'combine_temperature_to_rain_and_snow_switch.dart';
import 'dark_light_mode_switch.dart';
import 'language_dropdown.dart';
import 'precipitation_unit_dropdown.dart';
import 'temperature_unit_dropdown.dart';
import 'wind_speed_unit_dropdown.dart';

class PreferencesWidget extends HookConsumerWidget {
  const PreferencesWidget({super.key, this.top = 0.0});

  final double top;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final duration = ref.watch(preferencesPanelAnimationDurationProvider);
    final curve = ref.watch(preferencesPanelAnimationCurve);
    final controller = useAnimationController(duration: duration);
    final animation = CurvedAnimation(parent: controller, curve: curve);

    final show = ref.watch(showPreferencesPanelProvider);
    if (show) {
      controller.forward();
    } else {
      controller.reverse();
    }
    return _SlidingSettingsPanel(
        top: top,
        animation: animation,
        onDismiss: () => ref.read(showPreferencesPanelProvider.notifier).state = false);
  }
}

class _SlidingSettingsPanel extends AnimatedWidget {
  const _SlidingSettingsPanel({
    Key? key,
    required Animation<double> animation,
    required this.onDismiss,
    required this.top,
  }) : super(key: key, listenable: animation);

  final VoidCallback onDismiss;
  final double top;

  Animation<double> get animation => super.listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    if (animation.isDismissed) {
      return Container();
    }
    return _panelBackdrop(
      Theme.of(context).colorScheme,
      SizeTransition(
        sizeFactor: animation,
        axis: Axis.vertical,
        axisAlignment: -1,
        child: _SettingsPanel(onDismiss: onDismiss),
      ),
    );
  }

  Widget _panelBackdrop(ColorScheme colors, Widget child) {
    final side = BorderSide(width: 1.5, color: colors.onSurface);
    final topSide = BorderSide(width: 1.5, color: colors.surface);
    return Positioned.fill(
      top: top,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onDismiss,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border(top: topSide, left: side, right: side, bottom: side),
                        ),
                        child: child),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsPanel extends StatelessWidget {
  const _SettingsPanel({required this.onDismiss});

  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final translations = Translations.of(context)!;
    final theme = Theme.of(context);
    final itemStyle = theme.textTheme.titleMedium;
    return Container(
      decoration: BoxDecoration(color: theme.scaffoldBackgroundColor.withOpacity(0.95)),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(translations.dark_light_theme_label, style: itemStyle),
              DarkLightModeSwitch(changeCallback: _onChangePreference),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(translations.label_language_selector, style: itemStyle),
              LanguageDropdown(changeCallback: _onChangePreference),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(translations.temp_unit_label, style: itemStyle),
              TemperatureUnitDropdown(changeCallback: _onChangePreference),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(translations.wind_speed_unit_label, style: itemStyle),
              WindSpeedUnitDropdown(changeCallback: _onChangePreference),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(translations.precipitation_unit_label, style: itemStyle),
              PrecipitationUnitDropdown(changeCallback: _onChangePreference),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(translations.add_temp_to_rain_snow_charts_label, style: itemStyle),
              ),
              CombineTemperatureToRainAndSnowSwitch(changeCallback: _onChangePreference),
            ],
          ),
        ],
      ),
    );
  }

  void _onChangePreference() {
    onDismiss();
  }
}
