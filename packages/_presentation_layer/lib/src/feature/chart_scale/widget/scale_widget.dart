import 'package:flutter/material.dart';

import '../../../common/helper/theme_builder.dart';
import '../../../common/translation/noum_gender.dart';
import '../../../l10n/translations.dart';
import '../../weather/widget/color_range_mixin.dart';
import 'scale_intensity.dart';

abstract class ScaleWidget extends StatelessWidget with ColorRangeMixin {
  const ScaleWidget({super.key});

  NoumGender get intensityGender;

  @override
  Widget build(BuildContext context) {
    final translations = Translations.of(context)!;
    final theme = const ThemeBuilder().darkTheme;
    final txtSt = TextStyle(fontSize: 16, color: theme.colorScheme.onSurface);
    final clrs = colors();
    final lightSt = TextStyle(fontWeight: FontWeight.w600, color: clrs[0]);
    final moderateSt = TextStyle(fontWeight: FontWeight.w600, color: clrs[1]);
    final stronSt = TextStyle(fontWeight: FontWeight.w600, color: clrs[2]);
    final stormSt = TextStyle(fontWeight: FontWeight.w600, color: clrs[3]);
    return Material(
      type: MaterialType.transparency,
      child: Theme(
        data: theme,
        child: DefaultTextStyle(
          style: TextStyle(color: theme.colorScheme.onSurface),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  border: Border.all(color: theme.colorScheme.onSurface)),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: txtSt,
                            children: [
                              TextSpan(
                                  text:
                                      translations.scale_chart_header_message(chartName(context))),
                              const TextSpan(text: ' '),
                              TextSpan(
                                  text: ScaleIntensity.light
                                      .translation(translations, intensityGender),
                                  style: lightSt),
                              const TextSpan(text: ',  '),
                              TextSpan(
                                  text: ScaleIntensity.moderate
                                      .translation(translations, intensityGender),
                                  style: moderateSt),
                              const TextSpan(text: ',  '),
                              TextSpan(
                                  text: ScaleIntensity.strong
                                      .translation(translations, intensityGender),
                                  style: stronSt),
                              const TextSpan(text: '  and  '),
                              TextSpan(
                                  text: ScaleIntensity.storm
                                      .translation(translations, intensityGender),
                                  style: stormSt),
                              const TextSpan(text: '.'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(translations.scale_chart_header_sample_message, style: txtSt),
                      ],
                    ),
                  ),
                  chart(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String chartName(BuildContext context);

  List<Color> colors();

  Widget chart(BuildContext context);
}
