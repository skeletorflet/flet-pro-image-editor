import 'package:flutter/material.dart'; // For BlendMode
import 'package:flet/flet.dart';

class CensorConfigs {
  final double blurSigmaX;
  final double blurSigmaY;
  final double pixelBlockSize;
  final bool enableRoundArea;
  final BlendMode blurBlendMode;
  final BlendMode pixelateBlendMode;

  const CensorConfigs({
    this.blurSigmaX = 14.0,
    this.blurSigmaY = 14.0,
    this.pixelBlockSize = 80.0,
    this.enableRoundArea = false,
    this.blurBlendMode = BlendMode.srcOver,
    this.pixelateBlendMode = BlendMode.srcOver,
  });

  static BlendMode _parseBlendMode(String? modeStr, BlendMode defaultValue) {
    if (modeStr == null) return defaultValue;
    // This is a simplified mapping. A full mapping would include all BlendMode enum values.
    // Based on common Dart BlendMode enum names (camelCase)
    for (BlendMode mode in BlendMode.values) {
        if (mode.toString().split('.').last.toLowerCase() == modeStr.toLowerCase()){
            return mode;
        }
    }
    // Fallback for common historical names if needed
    switch (modeStr.toLowerCase()) {
      case 'srcover': return BlendMode.srcOver;
      case 'srcin': return BlendMode.srcIn;
      // Add other blend modes as needed
      default: return defaultValue;
    }
  }

  factory CensorConfigs.fromJson(Map<String, dynamic> json) {
    return CensorConfigs(
      blurSigmaX: parseDouble(json['blurSigmaX'], 14.0),
      blurSigmaY: parseDouble(json['blurSigmaY'], 14.0),
      pixelBlockSize: parseDouble(json['pixelBlockSize'], 80.0),
      enableRoundArea: parseBool(json['enableRoundArea'], false),
      blurBlendMode: _parseBlendMode(json['blurBlendMode'] as String?, BlendMode.srcOver),
      pixelateBlendMode: _parseBlendMode(json['pixelateBlendMode'] as String?, BlendMode.srcOver),
    );
  }
}
