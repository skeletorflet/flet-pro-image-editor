import 'package:flutter/material.dart'; // For Color, TextStyle, SystemUiOverlayStyle etc.
import 'package:flutter/services.dart'; // For SystemUiOverlayStyle
import 'package:flet/flet.dart';

class PaintEditorStyle {
  final TextStyle? lineWidthBottomSheetTitle;
  final TextStyle? opacityBottomSheetTitle;
  final Color appBarBackground;
  final Color appBarColor;
  final Color lineWidthBottomSheetBackground;
  final Color opacityBottomSheetBackground;
  final Color background;
  final Color bottomBarBackground;
  final Color bottomBarActiveItemColor;
  final Color bottomBarInactiveItemColor;
  final double initialStrokeWidth;
  final double initialOpacity;
  final SystemUiOverlayStyle uiOverlayStyle;
  final Color initialColor;

  const PaintEditorStyle({
    this.lineWidthBottomSheetTitle, // Default is null, JsonUtils.parseTextStyle handles null
    this.opacityBottomSheetTitle,  // Default is null
    this.appBarBackground = const Color(0xFF222222), // Placeholder
    this.appBarColor = const Color(0xFFFFFFFF),      // Placeholder
    this.lineWidthBottomSheetBackground = const Color(0xFF252728),
    this.opacityBottomSheetBackground = const Color(0xFF252728),
    this.background = const Color(0xFF000000), // Placeholder
    this.bottomBarBackground = const Color(0xFF222222), // Placeholder
    this.bottomBarActiveItemColor = Colors.blue, // Placeholder for kImageEditorPrimaryColor
    this.bottomBarInactiveItemColor = const Color(0xFFEEEEEE),
    this.initialStrokeWidth = 10.0,
    this.initialOpacity = 1.0,
    this.uiOverlayStyle = SystemUiOverlayStyle.light, // Default
    this.initialColor = const Color(0xFFFF0000), // Default Red
  });

  factory PaintEditorStyle.fromJson(ThemeData? theme, Map<String, dynamic> json) {
    TextStyle? parseTextStyleLocal(ThemeData? currentTheme, dynamic map) {
      if (map is Map) {
        final m = Map<String, dynamic>.from(map);
        return TextStyle(
          color: m['color'] != null ? parseColor(currentTheme, m['color'] as String?) : null,
          fontFamily: m['fontFamily'] as String?,
          fontSize: m['fontSize'] != null ? parseDouble(m['fontSize'], 14.0) : null,
          // Add other TextStyle properties as needed
        );
      }
      return null;
    }

    SystemUiOverlayStyle tempUiOverlayStyle = SystemUiOverlayStyle.light; // Default
    if (json['uiOverlayStyle'] is Map) {
      final uiMap = Map<String, dynamic>.from(json['uiOverlayStyle'] as Map);
      Brightness? parseBrightnessLocal(String? val) {
        if (val == 'dark') return Brightness.dark;
        if (val == 'light') return Brightness.light;
        return null;
      }
      tempUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: uiMap['statusBarColor'] != null ? parseColor(theme, uiMap['statusBarColor'] as String?) : null,
        statusBarBrightness: parseBrightnessLocal(uiMap['statusBarBrightness'] as String?),
        statusBarIconBrightness: parseBrightnessLocal(uiMap['statusBarIconBrightness'] as String?),
        systemNavigationBarColor: uiMap['systemNavigationBarColor'] != null ? parseColor(theme, uiMap['systemNavigationBarColor'] as String?) : null,
        systemNavigationBarDividerColor: uiMap['systemNavigationBarDividerColor'] != null ? parseColor(theme, uiMap['systemNavigationBarDividerColor'] as String?) : null,
        systemNavigationBarIconBrightness: parseBrightnessLocal(uiMap['systemNavigationBarIconBrightness'] as String?),
      );
    }

    return PaintEditorStyle(
      lineWidthBottomSheetTitle: parseTextStyleLocal(theme, json['lineWidthBottomSheetTitle']),
      opacityBottomSheetTitle: parseTextStyleLocal(theme, json['opacityBottomSheetTitle']),
      appBarBackground: parseColor(theme, json['appBarBackground'] as String?, const Color(0xFF222222)),
      appBarColor: parseColor(theme, json['appBarColor'] as String?, const Color(0xFFFFFFFF)),
      lineWidthBottomSheetBackground: parseColor(theme, json['lineWidthBottomSheetBackground'] as String?, const Color(0xFF252728)),
      opacityBottomSheetBackground: parseColor(theme, json['opacityBottomSheetBackground'] as String?, const Color(0xFF252728)),
      background: parseColor(theme, json['background'] as String?, const Color(0xFF000000)),
      bottomBarBackground: parseColor(theme, json['bottomBarBackground'] as String?, const Color(0xFF222222)),
      bottomBarActiveItemColor: parseColor(theme, json['bottomBarActiveItemColor'] as String?, Colors.blue),
      bottomBarInactiveItemColor: parseColor(theme, json['bottomBarInactiveItemColor'] as String?, const Color(0xFFEEEEEE)),
      initialStrokeWidth: parseDouble(json['initialStrokeWidth'], 10.0),
      initialOpacity: parseDouble(json['initialOpacity'], 1.0),
      uiOverlayStyle: tempUiOverlayStyle,
      initialColor: parseColor(theme, json['initialColor'] as String?, const Color(0xFFFF0000)),
    );
  }
}
