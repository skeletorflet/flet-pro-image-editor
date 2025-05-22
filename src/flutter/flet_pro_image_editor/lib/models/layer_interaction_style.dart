import 'package:flet/flet.dart';
import 'package:flutter/material.dart';

class LayerInteractionStyle {
  const LayerInteractionStyle();

  factory LayerInteractionStyle.fromJson(ThemeData? theme, Map<String, dynamic> json) {
    // Example for properties that would use `theme`:
    // final Color? someColor = json['someColor'] != null ? parseColor(theme, json['someColor'] as String?) : null;
    // TextStyle? someTextStyle;
    // if (json['someTextStyle'] is Map) {
    //   final styleMap = Map<String, dynamic>.from(json['someTextStyle'] as Map);
    //   someTextStyle = TextStyle(
    //     color: styleMap['color'] != null ? parseColor(theme, styleMap['color'] as String?) : null,
    //     fontFamily: styleMap['fontFamily'] as String?,
    //     fontSize: styleMap['fontSize'] != null ? parseDouble(styleMap['fontSize'], 14.0) : null,
    //   );
    // }
    return const LayerInteractionStyle();
  }
}
