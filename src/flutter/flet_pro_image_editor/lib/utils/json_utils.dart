import 'package:flutter/material.dart'; // For Color, Curves, TextStyle, EdgeInsets, SystemUiOverlayStyle
import 'dart:ui' show lerpDouble; // For SystemUiOverlayStyle brightness
import 'package:flet/src/utils/colors.dart' as flet_colors;
import 'package:flet/src/utils/animations.dart' as flet_animations;

// Helper class for JSON deserialization
class JsonUtils {
  static Color parseColor(dynamic value, [Color? defaultValue]) {
    if (value is String) {
      // Using Flet's parseColor utility.
      // Passing null for theme, assuming it works for hex/named colors.
      // If theme context is strictly required for all cases by flet_colors.parseColor,
      // this might need adjustment (e.g. by passing ThemeData down or using a default theme).
      Color? parsed = flet_colors.parseColor(null, value, defaultValue);
      return parsed ?? defaultValue ?? Colors.transparent;
    }
    return defaultValue ?? Colors.transparent;
  }

  static double parseDouble(dynamic value, double defaultValue) {
    if (value is num) {
      return value.toDouble();
    }
    if (value is String) {
      return double.tryParse(value) ?? defaultValue;
    }
    return defaultValue;
  }

  static int parseInt(dynamic value, int defaultValue) {
    if (value is num) {
      return value.toInt();
    }
    if (value is String) {
      return int.tryParse(value) ?? defaultValue;
    }
    return defaultValue;
  }

  static bool parseBool(dynamic value, bool defaultValue) {
    if (value is bool) {
      return value;
    }
    if (value is String) {
      if (value.toLowerCase() == 'true') return true;
      if (value.toLowerCase() == 'false') return false;
    }
    return defaultValue;
  }

  static Duration parseDuration(dynamic ms, [Duration? defaultValue]) {
    if (ms is int) {
      return Duration(milliseconds: ms);
    }
    return defaultValue ?? Duration.zero;
  }

  static EdgeInsets parseEdgeInsets(dynamic map, [EdgeInsets? defaultValue]) {
    if (map is Map) {
      final m = Map<String, dynamic>.from(map);
      return EdgeInsets.fromLTRB(
        parseDouble(m['left'], 0.0),
        parseDouble(m['top'], 0.0),
        parseDouble(m['right'], 0.0),
        parseDouble(m['bottom'], 0.0),
      );
    }
    return defaultValue ?? EdgeInsets.zero;
  }

  static T parseEnum<T extends Enum>(List<T> enumValues, dynamic value, T defaultValue) {
    if (value is String) {
      for (T enumVal in enumValues) {
        if (enumVal.toString().split('.').last.toLowerCase() == value.toLowerCase()) {
          return enumVal;
        }
      }
    }
    // If value is already of the enum type (e.g. from default constructor)
    if (enumValues.contains(value)) {
        return value;
    }
    return defaultValue;
  }
  
  static Brightness? _parseBrightness(String? value) {
    if (value == 'dark') return Brightness.dark;
    if (value == 'light') return Brightness.light;
    return null;
  }

  static SystemUiOverlayStyle parseSystemUiOverlayStyle(dynamic map, [SystemUiOverlayStyle? defaultValue]) {
    if (map is Map) {
      final m = Map<String, dynamic>.from(map);
      // This is a simplified version. A full SystemUiOverlayStyle has many properties.
      return SystemUiOverlayStyle(
        statusBarColor: m['statusBarColor'] != null ? parseColor(m['statusBarColor']) : null,
        statusBarBrightness: _parseBrightness(m['statusBarBrightness'] as String?),
        statusBarIconBrightness: _parseBrightness(m['statusBarIconBrightness'] as String?),
        systemNavigationBarColor: m['systemNavigationBarColor'] != null ? parseColor(m['systemNavigationBarColor']) : null,
        systemNavigationBarDividerColor: m['systemNavigationBarDividerColor'] != null ? parseColor(m['systemNavigationBarDividerColor']) : null,
        systemNavigationBarIconBrightness: _parseBrightness(m['systemNavigationBarIconBrightness'] as String?),
      );
    }
    return defaultValue ?? SystemUiOverlayStyle.light; // Or sensible default
  }


  static Curve parseCurve(String? curveName, [Curve defaultValue = Curves.linear]) {
    // Using Flet's parseCurve utility.
    return flet_animations.parseCurve(curveName, defaultValue) ?? defaultValue;
  }

  static TextStyle parseTextStyle(dynamic map, [TextStyle? defaultValue]) {
    if (map is Map) {
      final m = Map<String, dynamic>.from(map);
      // Simplified TextStyle parsing
      return TextStyle(
        color: m['color'] != null ? parseColor(m['color']) : null,
        fontFamily: m['fontFamily'] as String?,
        fontSize: m['fontSize'] != null ? parseDouble(m['fontSize'], 14.0) : null,
        // Add other TextStyle properties as needed: fontWeight, fontStyle, letterSpacing, etc.
      );
    }
    return defaultValue ?? const TextStyle();
  }

  static Map<String, dynamic> parseMap(dynamic value, [Map<String, dynamic>? defaultValue]) {
    if (value is Map) {
      return Map<String, dynamic>.from(value);
    }
    return defaultValue ?? {};
  }

  static List<T> parseList<T>(dynamic listValue, T Function(dynamic itemJson) itemParser, [List<T>? defaultValue]) {
    if (listValue is List) {
      return listValue.map((item) => itemParser(item)).toList().cast<T>();
    }
    return defaultValue ?? [];
  }

  static String parseString(dynamic value, String defaultValue) {
    if (value is String) {
      return value;
    }
    return defaultValue;
  }

  static String parseIconDataPlaceholder(dynamic value, String defaultValue) {
    if (value is String) return value;
    return defaultValue; // Returns string identifier
  }
}
