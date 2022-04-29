import 'package:flutter/material.dart';

import '../../../settings/widget/settings_app_bar.dart';
import 'order_dropdown.dart';

class WeatherListAppBar extends SettingsAppBar {
  WeatherListAppBar({Key? key}) : super(key: key);

  @override
  Widget get title => Row(
        textBaseline: TextBaseline.alphabetic,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          super.title,
          const SizedBox(width: 25),
          const OrderDropdown(),
        ],
      );
}
