import 'package:flutter/material.dart';

/// Check background and decide whether you will have a dark or white color
abstract class QonvexColorChecker {
  ///Checks if color's brightness is greater than 0.5 then you will get a dark color
  static Color check(Color color) {
    return color.computeLuminance() >= 0.5 ? Colors.black : Colors.white;
  }

  ///Checks if color's brightness is greater than 0.5 then you will get a light color
  static Color checkNegative(Color color) {
    return color.computeLuminance() < 0.5 ? Colors.black : Colors.white;
  }
}
