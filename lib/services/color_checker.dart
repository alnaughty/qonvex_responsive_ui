import 'package:flutter/material.dart';

class ColorChecker {
  static Color check(Color color) {
    return color.computeLuminance() >= 0.5 ? Colors.black : Colors.white;
  }
}