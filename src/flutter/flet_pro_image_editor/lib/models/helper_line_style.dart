import 'package:flutter/material.dart'; // For Color
import 'package:flet/flet.dart';

class HelperLineStyle {
  final Color color;
  final double strokeWidth;

  const HelperLineStyle({
    this.color = const Color(0x4BFFFFFF), // Default from Python
    this.strokeWidth = 1.0,
  });

  factory HelperLineStyle.fromJson(ThemeData? theme, Map<String, dynamic> json) {
    return HelperLineStyle(
      color: parseColor(theme, json['color'] as String?, const Color(0x4BFFFFFF)),
      strokeWidth: parseDouble(json['strokeWidth'], 1.0),
    );
  }
}
