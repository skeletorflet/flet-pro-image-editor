import 'package:flutter/material.dart'; // For Color, TextStyle, EdgeInsets
import 'package:flet/flet.dart';

class TextEditorStyle {
  final TextStyle? fontSizeBottomSheetTitle;
  final EdgeInsets textFieldMargin;
  final Color appBarBackground;
  final Color appBarColor;
  final Color bottomBarBackground;
  final Color background;
  final String bottomBarMainAxisAlignment; // Representing MainAxisAlignment as String
  final Color inputHintColor;
  final Color inputCursorColor;
  final Color fontScaleBottomSheetBackground;

  const TextEditorStyle({
    this.fontSizeBottomSheetTitle, // Default is null
    this.textFieldMargin = const EdgeInsets.only(bottom: 56.0), // Default based on Python
    this.appBarBackground = const Color(0xFF222222), // Placeholder
    this.appBarColor = const Color(0xFFFFFFFF),      // Placeholder
    this.bottomBarBackground = const Color(0xFF222222), // Placeholder
    this.background = const Color(0x9B000000),
    this.bottomBarMainAxisAlignment = "spaceEvenly",
    this.inputHintColor = const Color(0xFFBDBDBD),
    this.inputCursorColor = Colors.blue, // Placeholder for kImageEditorPrimaryColor
    this.fontScaleBottomSheetBackground = const Color(0xFF252728),
  });

  factory TextEditorStyle.fromJson(ThemeData? theme, Map<String, dynamic> json) {
    TextStyle? parseTextStyleLocal(ThemeData? currentTheme, dynamic map) {
      if (map is Map) {
        final m = Map<String, dynamic>.from(map);
        return TextStyle(
          color: m['color'] != null ? parseColor(currentTheme, m['color'] as String?) : null,
          fontFamily: m['fontFamily'] as String?,
          fontSize: m['fontSize'] != null ? parseDouble(m['fontSize'], 14.0) : null,
        );
      }
      return null;
    }

    EdgeInsets tempTextFieldMargin = const EdgeInsets.only(bottom: 56.0);
    if (json['textFieldMargin'] is Map) {
      final map = Map<String, dynamic>.from(json['textFieldMargin'] as Map);
      tempTextFieldMargin = EdgeInsets.fromLTRB(
        parseDouble(map['left'], 0.0),
        parseDouble(map['top'], 0.0),
        parseDouble(map['right'], 0.0),
        parseDouble(map['bottom'], 0.0),
      );
    }

    return TextEditorStyle(
      fontSizeBottomSheetTitle: parseTextStyleLocal(theme, json['fontSizeBottomSheetTitle']),
      textFieldMargin: tempTextFieldMargin,
      appBarBackground: parseColor(theme, json['appBarBackground'] as String?, const Color(0xFF222222)),
      appBarColor: parseColor(theme, json['appBarColor'] as String?, const Color(0xFFFFFFFF)),
      bottomBarBackground: parseColor(theme, json['bottomBarBackground'] as String?, const Color(0xFF222222)),
      background: parseColor(theme, json['background'] as String?, const Color(0x9B000000)),
      bottomBarMainAxisAlignment: parseString(json['bottomBarMainAxisAlignment'] as String?, 'spaceEvenly'),
      inputHintColor: parseColor(theme, json['inputHintColor'] as String?, const Color(0xFFBDBDBD)),
      inputCursorColor: parseColor(theme, json['inputCursorColor'] as String?, Colors.blue),
      fontScaleBottomSheetBackground: parseColor(theme, json['fontScaleBottomSheetBackground'] as String?, const Color(0xFF252728)),
    );
  }
}
