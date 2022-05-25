import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/helper/hero_flight_shuttle_builder.dart';

class WeatherTitleHero extends ConsumerWidget {
  const WeatherTitleHero({
    super.key,
    required this.city,
    required this.style,
    required this.showCountry,
  });

  final City city;
  final bool showCountry;
  final TextStyle style;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = Localizations.localeOf(context);
    final countrySize = (style.fontSize ?? 24) * 0.8;
    final countryStyle = style.copyWith(fontSize: countrySize);
    return Hero(
      tag: '${city.id}_weatherTitle',
      flightShuttleBuilder: heroTextFlightShuttleBuilder,
      child: FittedBox(
        alignment: Alignment.topLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(city.translation(locale.languageCode), style: style),
            if (showCountry) Text(', ${city.country}', style: countryStyle),
          ],
        ),
      ),
    );
  }
}
