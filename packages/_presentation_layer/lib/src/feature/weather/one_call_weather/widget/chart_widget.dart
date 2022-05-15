import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class ChartWidget extends ConsumerWidget {
  const ChartWidget({
    super.key,
    double? height,
    EdgeInsets? margin,
    EdgeInsets? padding,
  })  : height = height ?? 200,
        margin = const EdgeInsets.symmetric(vertical: 4.0),
        padding = const EdgeInsets.all(10.0),
        backgroundColor = Colors.black87;

  final double height;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = chartTitle(context);
    return DecoratedBox(
      decoration: BoxDecoration(color: backgroundColor),
      child: Padding(
        padding: margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              Padding(
                padding:
                    EdgeInsets.only(left: padding.left, right: padding.right, top: padding.top),
                child: title,
              ),
            chart(context),
          ],
        ),
      ),
    );
  }

  Widget chart(BuildContext context);

  Widget? chartTitle(BuildContext context) => null;

  TextStyle? titleStyle(BuildContext context) => const TextStyle(
        fontSize: 15.0,
        fontFamily: 'Segoe UI',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
      );

  TextStyle? titleUnitsStyle(BuildContext context) => const TextStyle(
        fontSize: 15.0,
        fontFamily: 'Segoe UI',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        color: Color(0xbeffffff),
      );

  Widget helpButton(BuildContext context, WidgetBuilder widgetBuilder) => Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: InkWell(
          child: const Icon(Icons.help, size: 20),
          onTap: () {
            showGeneralDialog(
              context: context,
              barrierColor: const Color(0x80FFFFFF),
              barrierLabel: 'Label',
              barrierDismissible: true,
              transitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (_, __, ___) => widgetBuilder(context),
            );
          },
        ),
      );
}
