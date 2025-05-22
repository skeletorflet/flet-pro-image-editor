import 'package:flet/flet.dart';
import 'package:flutter/material.dart';

class EmojiEditorStyle {
  const EmojiEditorStyle();

  factory EmojiEditorStyle.fromJson(ThemeData? theme, Map<String, dynamic> json) {
    // Example properties that would use `theme`:
    // final Color? backgroundColor = json['backgroundColor'] != null ? parseColor(theme, json['backgroundColor'] as String?) : null;
    // TextStyle? categoryTitleTextStyle;
    // if (json['categoryTitleTextStyle'] is Map) {
    //   final styleMap = Map<String, dynamic>.from(json['categoryTitleTextStyle'] as Map);
    //   categoryTitleTextStyle = TextStyle(
    //     color: styleMap['color'] != null ? parseColor(theme, styleMap['color'] as String?) : null,
    //     fontFamily: styleMap['fontFamily'] as String?,
    //     fontSize: styleMap['fontSize'] != null ? parseDouble(styleMap['fontSize'], 14.0) : null,
    //   );
    // }
    // final double? someSize = json['someSize'] != null ? parseDouble(json['someSize'], 10.0) : null;

    return const EmojiEditorStyle();
  }
}
