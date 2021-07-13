import 'package:flutter/material.dart';

abstract class QonvexColorChecker {
  static Color check(Color color) {
    return color.computeLuminance() >= 0.5 ? Colors.black : Colors.white;
  }
  static Color checkNegative(Color color){
    return color.computeLuminance() < 0.5 ? Colors.black : Colors.white;
  }
}