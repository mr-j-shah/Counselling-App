import 'dart:math';
import 'package:flutter/widgets.dart';

class Dimensions {
  static late double screenWidth;
  static late double screenHeight;

  /// Use the actual device’s shorter side as baseWidth,
  /// and longer side as baseHeight, so foldables/tablets work too.
  static late double baseWidth;
  static late double baseHeight;

  /// Call this in your root widget’s build or in a Builder
  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    // On any device/orientation, treat the short side as baseWidth
    // and the long side as baseHeight
    final minSide = min(screenWidth, screenHeight);
    final maxSide = max(screenWidth, screenHeight);
    baseWidth = minSide;
    baseHeight = maxSide;
  }

  /// Scale a height value from the “base” reference to the real screen
  static double height(double value) => (screenHeight / baseHeight) * value;

  /// Scale a width value
  static double width(double value) => (screenWidth / baseWidth) * value;

  /// For fonts, radii, padding, you can pick height‑based or width‑based scaling
  static double font(double value) => height(value);
  static double radius(double value) => height(value);
  static double padding(double value) => height(value);
}