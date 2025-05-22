import 'package:flet/flet.dart';
import 'package:flutter/material.dart'; // For ThemeData
import './helper_line_style.dart';

class HelperLineConfigs {
  final bool showVerticalLine;
  final bool showHorizontalLine;
  final bool showRotateLine;
  final HelperLineStyle style;

  const HelperLineConfigs({
    this.showVerticalLine = true,
    this.showHorizontalLine = true,
    this.showRotateLine = true,
    this.style = const HelperLineStyle(),
  });

  factory HelperLineConfigs.fromJson(ThemeData? theme, Map<String, dynamic> json) {
    return HelperLineConfigs(
      showVerticalLine: parseBool(json['showVerticalLine'], true),
      showHorizontalLine: parseBool(json['showHorizontalLine'], true),
      showRotateLine: parseBool(json['showRotateLine'], true),
      style: json['style'] != null ? HelperLineStyle.fromJson(theme, json['style'] is Map ? Map<String, dynamic>.from(json['style'] as Map) : {}) : const HelperLineStyle(),
    );
  }
}
