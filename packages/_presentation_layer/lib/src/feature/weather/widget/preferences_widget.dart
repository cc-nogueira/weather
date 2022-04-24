import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../provider/presentation_providers.dart';
import 'dark_light_mode_switch.dart';
import 'temperature_unit_dropdown.dart';
import 'wind_speed_unit_dropdown.dart';

class PreferencesWidget extends HookConsumerWidget {
  const PreferencesWidget({Key? key}) : super(key: key);

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
        animation: animation,
        onTap: () => ref.read(showPreferencesPanelProvider.notifier).state = false);
  }
}

class _SlidingSettingsPanel extends AnimatedWidget {
  const _SlidingSettingsPanel({Key? key, required Animation<double> animation, required this.onTap})
      : super(key: key, listenable: animation);

  final VoidCallback onTap;

  Animation<double> get animation => super.listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    if (animation.isDismissed) {
      return Container();
    }
    return _panelBackdrop(
      SizeTransition(
        sizeFactor: animation,
        axis: Axis.vertical,
        axisAlignment: -1,
        child: const _SettingsPanel(),
      ),
    );
  }

  Widget _panelBackdrop(Widget child) {
    const border = BorderSide(width: 1.5);
    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                        decoration: const BoxDecoration(
                          border: Border(left: border, right: border, bottom: border),
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
  const _SettingsPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final itemStyle = theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold);
    return Container(
      decoration: BoxDecoration(color: theme.colorScheme.surfaceVariant.withOpacity(0.95)),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Dark/Light Theme', style: itemStyle),
              const DarkLightModeSwitch(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Temperature unit', style: itemStyle),
              const TemperatureUnitDropdown(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Wind speed unit', style: itemStyle),
              const WindSpeedUnitDropdown(),
            ],
          ),
        ],
      ),
    );
  }
}
