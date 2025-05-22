import 'package:flet/flet.dart';
import 'package:flutter/material.dart';

class DialogStyle {
  const DialogStyle();

  factory DialogStyle.fromJson(ThemeData? theme, Map<String, dynamic> json) {
    // If this style had color or text style properties, they would be parsed here using `theme`.
    // For example:
    // final Color? backgroundColor = json['backgroundColor'] != null ? parseColor(theme, json['backgroundColor'] as String) : null;
    // TextStyle? titleTextStyle;
    // if (json['titleTextStyle'] is Map) {
    //   final styleMap = Map<String, dynamic>.from(json['titleTextStyle'] as Map);
    //   titleTextStyle = TextStyle(
    //     color: styleMap['color'] != null ? parseColor(theme, styleMap['color'] as String?) : null,
    //     fontFamily: styleMap['fontFamily'] as String?,
    //     fontSize: styleMap['fontSize'] != null ? parseDouble(styleMap['fontSize'], 14.0) : null,
    //   );
    // }
    return const DialogStyle();
  }
}
