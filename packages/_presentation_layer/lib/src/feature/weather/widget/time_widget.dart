import 'dart:async';

import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimeWidget extends ConsumerWidget {
  TimeWidget(this.location, {Key? key}) : super(key: key);

  final Location location;
  final StateController<TimeZone?> timeZoneController = StateController(null);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final style = textTheme.headline6!.copyWith(color: textTheme.headline4?.color);

    return ref.watch(timeZoneProvider(location)).when(
          loading: () => _LoadingTimeWidget(
            location: location,
            cachedTimeZone: timeZoneController.state,
            style: style,
          ),
          error: (_, __) => Text('--:--', style: style),
          data: (data) {
            timeZoneController.state = data;
            return _TimeWidget(timeZone: data, style: style);
          },
        );
  }
}

class _LoadingTimeWidget extends StatelessWidget {
  const _LoadingTimeWidget({
    Key? key,
    required this.location,
    required this.style,
    this.cachedTimeZone,
  }) : super(key: key);

  final Location location;
  final TextStyle style;
  final TimeZone? cachedTimeZone;

  @override
  Widget build(BuildContext context) {
    if (cachedTimeZone == null) {
      return Text('--:--', style: style);
    }
    final now = DateTime.now().toUtc();
    final localTime = now.add(cachedTimeZone!.currentUtcOffsetDuration);
    final hr = localTime.hour.toString();
    final min = localTime.minute.toString().padLeft(2, '0');
    return Text('$hr:$min', style: style);
  }
}

class _TimeWidget extends StatefulWidget {
  const _TimeWidget({
    Key? key,
    required this.timeZone,
    required this.style,
  }) : super(key: key);

  final TimeZone timeZone;
  final TextStyle style;

  @override
  State<_TimeWidget> createState() => _TimeState();
}

class _TimeState extends State<_TimeWidget> {
  _TimeState();

  Timer? _timer;
  Duration offset = Duration.zero;

  @override
  void initState() {
    super.initState();
    _scheduleRepaints();
  }

  @override
  void didUpdateWidget(_TimeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _scheduleRepaints();
  }

  void _scheduleRepaints() {
    offset = widget.timeZone.currentUtcOffsetDuration;
    _timer?.cancel();
    _scheduleFirstRepaint();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now().toUtc();
    final localTime = now.add(offset);
    final hr = localTime.hour.toString();
    final min = localTime.minute.toString().padLeft(2, '0');
    return Text('$hr:$min', style: widget.style);
  }

  void _scheduleFirstRepaint() {
    Future.delayed(Duration(seconds: 60 - DateTime.now().second), () {
      if (mounted) {
        setState(() {
          _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
            if (mounted) {
              setState(() {});
            }
          });
        });
      }
    });
  }
}
