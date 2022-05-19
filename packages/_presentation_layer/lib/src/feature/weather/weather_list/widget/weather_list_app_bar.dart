import 'package:flutter/material.dart';

import '../../../settings/widget/settings_app_bar.dart';
import 'order_dropdown.dart';

class WeatherListAppBar extends SettingsAppBar {
  WeatherListAppBar({super.key, required super.title});

  @override
  Widget title(BuildContext context) => Row(
        textBaseline: TextBaseline.alphabetic,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          super.title(context),
          const SizedBox(width: 25),
          const OrderDropdown(),
        ],
      );
}
