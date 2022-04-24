import 'package:flutter/material.dart';

import 'preferences_button.dart';
import 'weather_order_dropdown.dart';

class WeatherListAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WeatherListAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) => AppBar(
      title: Row(
        textBaseline: TextBaseline.alphabetic,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: const [
          Text('Weather'),
          SizedBox(width: 25),
          WeatherOrderDropdown(),
        ],
      ),
      actions: const [PreferencesButton()]);
}
