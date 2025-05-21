import 'package:flutter/material.dart'; // For Color
import '../utils/json_utils.dart' as utils;

class HelperLineStyle {
  final Color color;
  final double strokeWidth;

  const HelperLineStyle({
    this.color = const Color(0x4BFFFFFF), // Default from Python
    this.strokeWidth = 1.0,
  });

  factory HelperLineStyle.fromJson(Map<String, dynamic> json) {
    return HelperLineStyle(
      color: utils.JsonUtils.parseColor(json['color'], const Color(0x4BFFFFFF)),
      strokeWidth: utils.JsonUtils.parseDouble(json['strokeWidth'], 1.0),
    );
  }
}
