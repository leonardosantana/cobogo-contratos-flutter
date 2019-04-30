import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

abstract class _Docked extends FloatingActionButtonLocation {
  const _Docked();

  @protected
  double getDockedY(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double contentBottom = scaffoldGeometry.contentBottom;
    final double bottomSheetHeight = scaffoldGeometry.bottomSheetSize.height;
    final double fabHeight = scaffoldGeometry.floatingActionButtonSize.height;
    final double snackBarHeight = scaffoldGeometry.snackBarSize.height;

    double fabY = contentBottom - fabHeight / 2.0;
    // The FAB should sit with a margin between it and the snack bar.
    if (snackBarHeight > 0.0)
      fabY = math.min(
          fabY,
          contentBottom -
              snackBarHeight -
              fabHeight -
              kFloatingActionButtonMargin);
    // The FAB should sit with its center in front of the top of the bottom sheet.
    if (bottomSheetHeight > 0.0)
      fabY =
          math.min(fabY, contentBottom - bottomSheetHeight - fabHeight / 2.0);

    final double maxFabY = scaffoldGeometry.scaffoldSize.height - fabHeight;
    return math.min(maxFabY, fabY + 8.0);
  }
}

class StartDocked extends _Docked {
  double fabX;
  double additionalMargin;

  StartDocked({
    this.fabX,
    this.additionalMargin,
  });

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    return Offset(fabX, getDockedY(scaffoldGeometry));
  }

  double getOffsetX() {
    fabX = kFloatingActionButtonMargin + additionalMargin;
    return fabX;
  }
}

class CenterDocked extends _Docked {
  double fabX;
  double scaffoldSizeWidth;
  double fabSizeWidth;

  CenterDocked({
    this.fabX,
    this.scaffoldSizeWidth,
    this.fabSizeWidth,
  });

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    fabX = (scaffoldSizeWidth - fabSizeWidth) / 2.0;
    return Offset(fabX, getDockedY(scaffoldGeometry));
  }

  double getOffsetX() {
    fabX = (scaffoldSizeWidth - fabSizeWidth) / 2.0;
    return fabX;
  }
}

class EndDocked extends _Docked {
  double fabX;
  double additionalMargin;
  double scaffoldSizeWidth;
  double fabSizeWidth;

  EndDocked({
    this.fabX,
    this.additionalMargin,
    this.scaffoldSizeWidth,
    this.fabSizeWidth,
  });

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    fabX = scaffoldSizeWidth -
        fabSizeWidth -
        kFloatingActionButtonMargin -
        additionalMargin;
    return Offset(fabX, getDockedY(scaffoldGeometry));
  }

  double getOffsetX() {
    fabX = scaffoldSizeWidth -
        fabSizeWidth -
        kFloatingActionButtonMargin -
        additionalMargin;
    return fabX;
  }
}

abstract class CustomFloatingActionButtonAnimator {
  /// Abstract const constructor. This constructor enables subclasses to provide
  /// const constructors so that they can be used in const expressions.
  const CustomFloatingActionButtonAnimator();

  /// Moves the [FloatingActionButton] by scaling out and then in at a new
  /// [FloatingActionButtonLocation].
  ///
  /// This animator shrinks the [FloatingActionButton] down until it disappears, then
  /// grows it back to full size at its new [FloatingActionButtonLocation].
  ///
  /// This is the default [FloatingActionButton] motion animation.
  static const FloatingActionButtonAnimator scaling = _NullFabMotionAnimator();

  /// Gets the [FloatingActionButton]'s position relative to the origin of the
  /// [Scaffold] based on [progress].
  ///
  /// [begin] is the [Offset] provided by the previous
  /// [FloatingActionButtonLocation].
  ///
  /// [end] is the [Offset] provided by the new
  /// [FloatingActionButtonLocation].
  ///
  /// [progress] is the current progress of the transition animation.
  /// When [progress] is 0.0, the returned [Offset] should be equal to [begin].
  /// when [progress] is 1.0, the returned [Offset] should be equal to [end].
  Offset getOffset({@required Offset begin, @required Offset end, @required double progress});

  /// Animates the scale of the [FloatingActionButton].
  ///
  /// The animation should both start and end with a value of 1.0.
  ///
  /// For example, to create an animation that linearly scales out and then back in,
  /// you could join animations that pass each other:
  ///
  /// ```dart
  ///   @override
  ///   Animation<double> getScaleAnimation({@required Animation<double> parent}) {
  ///     // The animations will cross at value 0, and the train will return to 1.0.
  ///     return TrainHoppingAnimation(
  ///       Tween<double>(begin: 1.0, end: -1.0).animate(parent),
  ///       Tween<double>(begin: -1.0, end: 1.0).animate(parent),
  ///     );
  ///   }
  /// ```
  Animation<double> getScaleAnimation({@required Animation<double> parent});

  /// Animates the rotation of [Scaffold.floatingActionButton].
  ///
  /// The animation should both start and end with a value of 0.0 or 1.0.
  ///
  /// The animation values are a fraction of a full circle, with 0.0 and 1.0
  /// corresponding to 0 and 360 degrees, while 0.5 corresponds to 180 degrees.
  ///
  /// For example, to create a rotation animation that rotates the
  /// [FloatingActionButton] through a full circle:
  ///
  /// ```dart
  /// @override
  /// Animation<double> getRotationAnimation({@required Animation<double> parent}) {
  ///   return Tween<double>(begin: 0.0, end: 1.0).animate(parent);
  /// }
  /// ```
  Animation<double> getRotationAnimation({@required Animation<double> parent});

  /// Gets the progress value to restart a motion animation from when the animation is interrupted.
  ///
  /// [previousValue] is the value of the animation before it was interrupted.
  ///
  /// The restart of the animation will affect all three parts of the motion animation:
  /// offset animation, scale animation, and rotation animation.
  ///
  /// An interruption triggers if the [Scaffold] is given a new [FloatingActionButtonLocation]
  /// while it is still animating a transition between two previous [FloatingActionButtonLocation]s.
  ///
  /// A sensible default is usually 0.0, which is the same as restarting
  /// the animation from the beginning, regardless of the original state of the animation.
  double getAnimationRestart(double previousValue) => 0.0;

  @override
  String toString() => '$runtimeType';
}

class _NullFabMotionAnimator extends FloatingActionButtonAnimator {
  const _NullFabMotionAnimator();

  @override
  Offset getOffset({Offset begin, Offset end, double progress}) {
    if (progress < 0.5) {
      return begin;
    } else {
      return end;
    }
  }

  @override
  Animation<double> getScaleAnimation({Animation<double> parent}) {
    // Animate the scale down from 1 to 0 in the first half of the animation
    // then from 0 back to 1 in the second half.
    const Curve curve = Interval(0.0, 0.0, curve: Curves.decelerate);
    return _AnimationSwap<double>(
      ReverseAnimation(parent.drive(CurveTween(curve: curve.flipped))),
      parent.drive(CurveTween(curve: curve)),
      parent,
      0.5,
    );
  }

  // Because we only see the last half of the rotation tween,
  // it needs to go twice as far.
  /*static final Animatable<double> _rotationTween = Tween<double>(
    begin: 1.0 - kFloatingActionButtonTurnInterval * 2.0,
    end: 1.0,
  );*/

  static final Animatable<double> _rotationTween = Tween<double>(
    begin: 1.0,
    end: 1.0,
  );

  static final Animatable<double> _thresholdCenterTween = CurveTween(curve: const Threshold(0.5));

  @override
  Animation<double> getRotationAnimation({Animation<double> parent}) {
    // This rotation will turn on the way in, but not on the way out.
    return _AnimationSwap<double>(
      parent.drive(_rotationTween),
      ReverseAnimation(parent.drive(_thresholdCenterTween)),
      parent,
      0.5,
    );
  }

  // If the animation was just starting, we'll continue from where we left off.
  // If the animation was finishing, we'll treat it as if we were starting at that point in reverse.
  // This avoids a size jump during the animation.
  @override
  double getAnimationRestart(double previousValue) => math.min(1.0 - previousValue, previousValue);
}

class _AnimationSwap<T> extends CompoundAnimation<T> {
  /// Creates an [_AnimationSwap].
  ///
  /// Both arguments must be non-null. Either can be an [AnimationMin] itself
  /// to combine multiple animations.
  _AnimationSwap(Animation<T> first, Animation<T> next, this.parent, this.swapThreshold): super(first: first, next: next);

  final Animation<double> parent;
  final double swapThreshold;

  @override
  T get value => parent.value < swapThreshold ? first.value : next.value;
}