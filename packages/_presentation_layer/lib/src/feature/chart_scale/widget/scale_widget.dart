import 'package:flutter/material.dart';

import '../../weather/widget/color_range_mixin.dart';

abstract class ScaleWidget extends StatelessWidget with ColorRangeMixin {
  const ScaleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const txtSt = TextStyle(fontSize: 16);
    final clrs = colors();
    final lightSt = TextStyle(fontWeight: FontWeight.w600, color: clrs[0]);
    final moderateSt = TextStyle(fontWeight: FontWeight.w600, color: clrs[1]);
    final stronSt = TextStyle(fontWeight: FontWeight.w600, color: clrs[2]);
    final stormSt = TextStyle(fontWeight: FontWeight.w600, color: clrs[3]);
    return Material(
      type: MaterialType.transparency,
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
                              text: '$chartName scale is defined with four intensity categories: '),
                          TextSpan(text: 'light', style: lightSt),
                          const TextSpan(text: ',  '),
                          TextSpan(text: 'moderate', style: moderateSt),
                          const TextSpan(text: ',  '),
                          TextSpan(text: 'strong', style: stronSt),
                          const TextSpan(text: '  and  '),
                          TextSpan(text: 'storm,', style: stormSt),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('Below sample values painted to scale color.', style: txtSt),
                  ],
                ),
              ),
              chart(),
            ],
          ),
        ),
      ),
    );
  }

  String get chartName;

  List<Color> colors();

  Widget chart();
}
