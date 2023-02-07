import 'dart:ui';

import 'package:flutter/material.dart';

/// Enumeration of known PathTypes.
enum PathType {
  rect,
  rRect,
  circle,
}

/// Enumeration of possible animation directions.
enum AnimationDirection {
  clockwise,
  counterclockwise,
}

/// AnimatedBorderPainter class.
///
/// Animate the drawing of a border around the contained widget.
/// The border can be customized with
/// - pathType
/// - strokeWidth
/// - strokeColor
/// - radius
/// - startDistancePercentage or startDistance
/// - animationDirection
/// - dissolveOnReverse flag
class AnimatedBorderPainter extends CustomPainter {
  /// Constructor with border style and animation parameters.
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

  /// Required animation parameter.
  /// Animation should run from 0.0 to 1.0 and reverse from 1.0 to 0.0.
  final Animation<double> animation;

  /// Chosen PathType, defaults to PathType.rect.
  final PathType pathType;

  /// Stroke width, defaults to 2.0.
  final double strokeWidth;

  /// Stroke color, defaults to Colors.black.
  final Color strokeColor;

  /// Corner radius, defaults to Radius.circular(4.0).
  final Radius radius;

  /// Start distance percentage, defaults to zero.
  /// Only one start parameter may be defined (different then zero).
  /// Either startDistancePercentage or startDistance.
  final int startDistancePercentage;

  /// Start distance, defaults to zero.
  /// Only one start parameter may be defined (different then zero).
  /// Either startDistancePercentage or startDistance.
  final double startDistance;

  /// Animation direction, defaults to AnimationDirection.clockwise.
  final AnimationDirection animationDirection;

  /// Flag to define with back animation should be a dissolve animation instead of undoing the border
  /// in the reverse direction.
  final bool dissolveOnReverse;

  /// Cached calculated size (defined in _init), used to decide weather to recalculate other instance
  /// values that may be required if the widget size changes mid-animation.
  Size? _calculatedSize;

  /// Cached original path for the border that will be continually drawn during the animation.
  /// Defined in _init method.
  late Path _originalPath;

  /// Cached total length (calculated in _init)
  late double _totalLength;

  /// Paint for drawing
  late final _paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth
    ..color = strokeColor;

  /// Back paint is used to draw or dissolve the border during the reverse animation.
  late final _backPaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth
    ..color = strokeColor;

  /// Animate the painting a border progressevely surrounding this widget.
  /// When the animation is reversed it may animate the drawing of this border back or dissolve the
  /// whole border progressevely.
  ///
  /// Deals with edge cases (animation value 0.0 or 1.0) drawing none or the complete border
  /// respectively.
  ///
  /// Call _init on each frame with the current size. Init should only reinitialize calculated values
  /// when the size changes.
  ///
  /// After _init draw the border up to the percentage corresponding to the animation value.
  /// On the reverse animation it may optionally always draw the whole border, thinner at each frame.
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

  /// Init all calculated values and paths.
  ///
  /// This method recalculates these values only when the widget size changes during animation.
  void _init(Size size) {
    if (_calculatedSize != size) {
      _calculatedSize = size;
      _originalPath = _createOriginalPath(size);

      final pathMetrics = animationDirection == AnimationDirection.clockwise
          ? _originalPath.computeMetrics().toList()
          : _originalPath.computeMetrics().toList().reversed.toList();

      _onOriginalPathCreated(pathMetrics);
    }
  }

  /// Cache values associated with the original border path recently created.
  void _onOriginalPathCreated(List<PathMetric> pathMetrics) {
    _totalLength = pathMetrics.fold(0.0, (double prev, PathMetric metric) => prev + metric.length);
  }

  /// Reconfigure the back paint to be thinned at each frame, proportionally to the animation value.
  void _dissolveBackPaint() {
    final percent = animation.value;
    _backPaint.strokeWidth = percent * strokeWidth;
    if (percent < 0.01) {
      _backPaint.color = Colors.transparent;
    } else {
      _backPaint.color = strokeColor;
    }
  }

  /// Create the original complete border path.
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

  /// Create the original Rectangular border path.
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

  /// Create the original Rounded Rectangular border path.
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

  /// Create the original Circular border path.
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

  /// Creates a path that originates at a shifted percentage point.
  Path _createPathForStartingPercentage(Path originalPath, PathType pathType, [Size? size]) {
    // Assumes that original path consists of one subpath only
    final pathMetrics = originalPath.computeMetrics().first;
    final pathCutoffPoint = (startDistancePercentage / 100) * pathMetrics.length;

    return _createPathForStartingFromCutoffPoint(pathMetrics, pathCutoffPoint, pathType, size);
  }

  /// Creates a path that originates at a shifted length point.
  Path _createPathForStartingLength(Path originalPath, PathType pathType, [Size? size]) {
    // Assumes that original path consists of one subpath only
    final pathMetrics = originalPath.computeMetrics().first;
    if (startDistance >= pathMetrics.length) {
      return originalPath;
    }

    return _createPathForStartingFromCutoffPoint(pathMetrics, startDistance, pathType, size);
  }

  /// Create a path that originates at a shifted cutoff point.
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

  // Create the path that will be drawn for the current animation percentage.
  Path _createAnimatedPath() {
    final currentLength = _totalLength * animation.value;
    return _extractPathUntilLength(currentLength);
  }

  // Create the path that will be drawn for the current animation length.
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

/// AnimetedBorderPainter with Cached Metrics.
///
/// Extends the previous class caching path metrics.
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

  /// Cached path metrics.
  late List<PathMetric> _originalPathMetrics;

  /// Cached path segments.
  late List<Path> _originalPathSegments;

  /// Cache values associated with the original border path recently created.
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

  /// Redifinition of super class method to use cached metrics.
  ///
  /// Create the path that will be drawn for the current animation length.
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
