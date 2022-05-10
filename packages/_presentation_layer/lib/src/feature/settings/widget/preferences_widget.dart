import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../provider/presentation_providers.dart';
import 'dark_light_mode_switch.dart';
import 'temperature_unit_dropdown.dart';
import 'wind_speed_unit_dropdown.dart';

class PreferencesWidget extends HookConsumerWidget {
  const PreferencesWidget({
    Key? key,
    this.top = 0.0,
    this.showChartOptions = false,
  }) : super(key: key);

  final double top;
  final bool showChartOptions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final duration = ref.watch(preferencesPanelAnimationDurationProvider);
    final controller = useAnimationController(duration: duration);
    final animation = ref.watch(preferencesPanelAnimationProvider(controller));

    final show = ref.watch(showPreferencesPanelProvider);
    if (show) {
      controller.forward();
    } else {
      controller.reverse();
    }
    return _SlidingSettingsPanel(
        top: top,
        showChartOptions: showChartOptions,
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
    required this.showChartOptions,
  }) : super(key: key, listenable: animation);

  final VoidCallback onDismiss;
  final double top;
  final bool showChartOptions;

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
        child: _SettingsPanel(
          showChartOptions: showChartOptions,
          onDismiss: onDismiss,
        ),
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
  const _SettingsPanel({Key? key, required this.showChartOptions, required this.onDismiss})
      : super(key: key);

  final bool showChartOptions;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
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
              Text('Dark/Light Theme', style: itemStyle),
              DarkLightModeSwitch(changeCallback: _onChangePreference),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Temperature unit', style: itemStyle),
              TemperatureUnitDropdown(changeCallback: _onChangePreference),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Wind speed unit', style: itemStyle),
              WindSpeedUnitDropdown(changeCallback: _onChangePreference),
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
