import 'package:flutter/material.dart';

class Dimensions {
  // Screen height & width
  static double screenHeight = 0;
  static double screenWidth = 0;

  // Common ratios (use based on 812 x 375 base iPhone design)
  static double baseHeight = 812.0;
  static double baseWidth = 375.0;

  // Initialize dimensions from context
  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
  }

  // Scale height, width, font based on base screen
  static double height(double value) => (screenHeight / baseHeight) * value;
  static double width(double value) => (screenWidth / baseWidth) * value;
  static double font(double value) => height(value);
  static double radius(double value) => height(value);
  static double padding(double value) => height(value);
}