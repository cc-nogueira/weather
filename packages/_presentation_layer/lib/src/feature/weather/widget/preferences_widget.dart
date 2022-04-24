import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../provider/presentation_providers.dart';
import 'dark_light_mode_switch.dart';
import 'temperature_unit_dropdown.dart';
import 'wind_speed_unit_dropdown.dart';

class PreferencesWidget extends HookConsumerWidget {
  const PreferencesWidget({Key? key}) : super(key: key);

  final duration = const Duration(seconds: 1);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final show = ref.watch(showPreferencesProvider);
    final controller = useAnimationController(duration: duration);
    if (show) {
      controller.forward();
    } else {
      controller.reverse();
    }
    return _SlidingSettingsPanel(
        controller: controller,
        onTap: () => ref.read(showPreferencesProvider.notifier).state = false);
  }
}

class _SlidingSettingsPanel extends AnimatedWidget {
  const _SlidingSettingsPanel(
      {Key? key, required AnimationController controller, required this.onTap})
      : super(key: key, listenable: controller);

  final VoidCallback onTap;

  Animation<double> get animation => super.listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    if (animation.isDismissed) {
      return Container();
    }
    return panelContainer(
      context,
      SizeTransition(
        sizeFactor: animation,
        axis: Axis.vertical,
        axisAlignment: -1,
        child: const _SettingsPanel(),
      ),
    );
  }

  Widget panelContainer(BuildContext context, Widget panel) {
    final theme = Theme.of(context);
    final color = Colors.black.withOpacity(0.7);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: color),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: panel,
                    ),
                  ),
                ),
              ],
            ),
          ],
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
    final isDark = theme.colorScheme.brightness == Brightness.dark;
    const border = BorderSide();
    return Container(
      decoration: BoxDecoration(
        border: const Border(left: border, right: border, bottom: border),
        color: theme.colorScheme.surfaceVariant.withOpacity(0.95),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Dark/Light Theme', style: itemStyle),
              DarkLightModeSwitch(
                showIconPosition: isDark ? ShowIconPosition.after : ShowIconPosition.before,
                keepIconSpaces: true,
              ),
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
