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
    this.startDistancePercentage = 0,
    this.startDistance = 0.0,
    this.animationDirection = AnimationDirection.clockwise,
    this.dissolveOnReverse = true,
  })  : assert(startDistancePercentage == 0 || startDistance == 0.0),
        super(repaint: animation);

  final Animation<double> animation;
  final PathType pathType;
  final double strokeWidth;
  final Color strokeColor;
  final Radius radius;
  final int startDistancePercentage;
  final double startDistance;
  final AnimationDirection animationDirection;
  final bool dissolveOnReverse;

  Size? _calculatedSize;
  late Path _originalPath;
  late double _totalLength;
  late Paint _paint;
  late Paint _backPaint;

  @override
  void paint(Canvas canvas, Size size) {
    if (animation.value == 0.0) {
      return;
    }
    _init(size);
    if (animation.value == 1.0) {
      canvas.drawPath(_originalPath, _paint);
    } else if (animation.status == AnimationStatus.forward || !dissolveOnReverse) {
      final currentPath = _createAnimatedPath();
      canvas.drawPath(currentPath, _paint);
    } else if (animation.status == AnimationStatus.reverse && dissolveOnReverse) {
      _dissolveBackPaint();
      canvas.drawPath(_originalPath, _backPaint);
    }
  }

  void _init(Size size) {
    if (_calculatedSize != size) {
      _calculatedSize = size;
      _originalPath = _createOriginalPath(size);

      final pathMetrics = animationDirection == AnimationDirection.clockwise
          ? _originalPath.computeMetrics().toList()
          : _originalPath.computeMetrics().toList().reversed.toList();

      _onOriginalPathCreated(pathMetrics);

      _paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..color = strokeColor;

      _backPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..color = strokeColor;
    }
  }

  void _onOriginalPathCreated(List<PathMetric> pathMetrics) {
    _totalLength = pathMetrics.fold(0.0, (double prev, PathMetric metric) => prev + metric.length);
  }

  void _dissolveBackPaint() {
    final percent = animation.value;
    _backPaint.strokeWidth = percent * strokeWidth;
    if (percent < 0.01) {
      _backPaint.color = Colors.transparent;
    } else {
      _backPaint.color = strokeColor;
    }
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
    if (startDistancePercentage > 0 && startDistancePercentage < 100) {
      return _createPathForStartingPercentage(originalPath, PathType.rect, size);
    }
    if (startDistance > 0) {
      return _createPathForStartingLength(originalPath, PathType.rect, size);
    }
    return originalPath;
  }

  Path _createOriginalPathRRect(Size size) {
    final originalPath = Path()
      ..addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), radius));
    if (startDistancePercentage > 0 && startDistancePercentage < 100) {
      return _createPathForStartingPercentage(originalPath, PathType.rRect);
    }
    if (startDistance > 0) {
      return _createPathForStartingLength(originalPath, PathType.rRect);
    }
    return originalPath;
  }

  Path _createOriginalPathCircle(Size size) {
    final originalPath = Path()..addOval(Rect.fromLTWH(0, 0, size.width, size.height));
    if (startDistancePercentage > 0 && startDistancePercentage < 100) {
      return _createPathForStartingPercentage(originalPath, PathType.circle);
    }
    if (startDistance > 0) {
      return _createPathForStartingLength(originalPath, PathType.circle);
    }
    return originalPath;
  }

  Path _createPathForStartingPercentage(Path originalPath, PathType pathType, [Size? size]) {
    // Assumes that original path consists of one subpath only
    final pathMetrics = originalPath.computeMetrics().first;
    final pathCutoffPoint = (startDistancePercentage / 100) * pathMetrics.length;

    return _createPathForStartingFromCutoffPoint(pathMetrics, pathCutoffPoint, pathType, size);
  }

  Path _createPathForStartingLength(Path originalPath, PathType pathType, [Size? size]) {
    // Assumes that original path consists of one subpath only
    final pathMetrics = originalPath.computeMetrics().first;
    if (startDistance >= pathMetrics.length) {
      return originalPath;
    }

    return _createPathForStartingFromCutoffPoint(pathMetrics, startDistance, pathType, size);
  }

  Path _createPathForStartingFromCutoffPoint(
    PathMetric pathMetrics,
    double pathCutoffPoint,
    PathType pathType, [
    Size? size,
  ]) {
    // Assumes that original path consists of one subpath only
    final firstSubPath = pathMetrics.extractPath(0, pathCutoffPoint);
    final secondSubPath = pathMetrics.extractPath(pathCutoffPoint, pathMetrics.length);
    if (pathType == PathType.rect) {
      final percentage = startDistancePercentage > 0
          ? startDistancePercentage
          : (startDistance / pathMetrics.length * 100.0).round();
      final path = Path()
        ..addPath(secondSubPath, Offset.zero)
        ..lineTo(0, -(strokeWidth / 2))
        ..addPath(firstSubPath, Offset.zero);
      switch (percentage) {
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

  Path _createAnimatedPath() {
    final currentLength = _totalLength * animation.value;
    return _extractPathUntilLength(currentLength);
  }

  Path _extractPathUntilLength(double length) {
    final path = Path();

    final metricsIterator = animationDirection == AnimationDirection.clockwise
        ? _originalPath.computeMetrics().iterator
        : _originalPath.computeMetrics().toList().reversed.iterator;

    var currentLength = 0.0;
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
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class AnimatedBorderPainterWithCachedMetrics extends AnimatedBorderPainter {
  AnimatedBorderPainterWithCachedMetrics({
    required super.animation,
    super.pathType,
    super.strokeWidth,
    super.strokeColor,
    super.radius,
    super.startDistancePercentage,
    super.startDistance,
    super.animationDirection,
    super.dissolveOnReverse,
  });

  late List<PathMetric> _originalPathMetrics;
  late List<Path> _originalPathSegments;

  @override
  void _onOriginalPathCreated(List<PathMetric> pathMetrics) {
    super._onOriginalPathCreated(pathMetrics);

    // cache metrics
    _originalPathMetrics = pathMetrics;

    // cache path segments
    _originalPathSegments = <Path>[];
    for (final metric in _originalPathMetrics) {
      _originalPathSegments.add(metric.extractPath(0, metric.length));
    }
  }

  @override
  Path _extractPathUntilLength(double length) {
    final path = Path();

    final metricsIterator = _originalPathMetrics.iterator;

    int segmentIndex = 0;
    var currentLength = 0.0;
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
        final pathSegment = _originalPathSegments[segmentIndex];
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
      ++segmentIndex;
    }

    return path;
  }
}
