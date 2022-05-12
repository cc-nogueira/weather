import 'dart:ui';

import 'package:flutter/material.dart';

enum PathType {
  rect,
  rRect,
  circle,
}

enum AnimationDirection {
  clockwise,
  counterclockwise,
}

class AnimatedBorderPainter extends CustomPainter {
  AnimatedBorderPainter({
    required this.animation,
    this.pathType = PathType.rect,
    this.strokeWidth = 2.0,
    this.strokeColor = Colors.black,
    this.radius = const Radius.circular(4.0),
    this.startingPercentage = 0,
    this.animationDirection = AnimationDirection.clockwise,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final PathType pathType;
  final double strokeWidth;
  final Color strokeColor;
  final Radius radius;
  final int startingPercentage;
  final AnimationDirection animationDirection;

  late Path _originalPath;
  late Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = animation.value;

    // Construct original path once when animation starts
    if (animationPercent == 0.0) {
      _originalPath = _createOriginalPath(size);
      _paint = Paint()
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..color = strokeColor;
    }

    final currentPath = _createAnimatedPath(
      _originalPath,
      animationPercent,
    );

    canvas.drawPath(currentPath, _paint);
  }

  Path _createOriginalPath(Size size) {
    switch (pathType) {
      case PathType.rect:
        return _createOriginalPathRect(size);
      case PathType.rRect:
        return _createOriginalPathRRect(size);
      case PathType.circle:
        return _createOriginalPathCircle(size);
    }
  }

  Path _createOriginalPathRect(Size size) {
    final originalPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..lineTo(0, -(strokeWidth / 2));
    if (startingPercentage > 0 && startingPercentage < 100) {
      return _createPathForStartingPercentage(originalPath, PathType.rect, size);
    }
    return originalPath;
  }

  Path _createOriginalPathRRect(Size size) {
    final originalPath = Path()
      ..addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), radius));
    if (startingPercentage > 0 && startingPercentage < 100) {
      return _createPathForStartingPercentage(originalPath, PathType.rRect);
    }
    return originalPath;
  }

  Path _createOriginalPathCircle(Size size) {
    final originalPath = Path()..addOval(Rect.fromLTWH(0, 0, size.width, size.height));
    if (startingPercentage > 0 && startingPercentage < 100) {
      return _createPathForStartingPercentage(originalPath, PathType.circle);
    }
    return originalPath;
  }

  Path _createPathForStartingPercentage(Path originalPath, PathType pathType, [Size? size]) {
    // Assumes that original path consists of one subpath only
    final pathMetrics = originalPath.computeMetrics().first;
    final pathCutoffPoint = (startingPercentage / 100) * pathMetrics.length;
    final firstSubPath = pathMetrics.extractPath(0, pathCutoffPoint);
    final secondSubPath = pathMetrics.extractPath(pathCutoffPoint, pathMetrics.length);
    if (pathType == PathType.rect) {
      final path = Path()
        ..addPath(secondSubPath, Offset.zero)
        ..lineTo(0, -(strokeWidth / 2))
        ..addPath(firstSubPath, Offset.zero);
      switch (startingPercentage) {
        case 25:
          path.lineTo(size!.width + strokeWidth / 2, 0);
          break;
        case 50:
          path.lineTo(size!.width - strokeWidth / 2, size.height);
          break;
        case 75:
          path.lineTo(0, size!.height + strokeWidth / 2);
          break;
        default:
      }
      return path;
    }
    return Path()
      ..addPath(secondSubPath, Offset.zero)
      ..addPath(firstSubPath, Offset.zero);
  }

  Path _createAnimatedPath(
    Path originalPath,
    double animationPercent,
  ) {
    // ComputeMetrics can only be iterated once!
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return _extractPathUntilLength(originalPath, currentLength);
  }

  Path _extractPathUntilLength(
    Path originalPath,
    double length,
  ) {
    var currentLength = 0.0;

    final path = Path();

    final metricsIterator = animationDirection == AnimationDirection.clockwise
        ? originalPath.computeMetrics().iterator
        : originalPath.computeMetrics().toList().reversed.iterator;

    while (metricsIterator.moveNext()) {
      final metric = metricsIterator.current;

      final nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = animationDirection == AnimationDirection.clockwise
            ? metric.extractPath(0.0, remainingLength)
            : metric.extractPath(metric.length - remainingLength, metric.length);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        // There might be a more efficient way of extracting an entire path
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
