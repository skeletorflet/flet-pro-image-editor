import 'package:flutter/material.dart'; // For Color, TextStyle, EdgeInsets
import '../utils/json_utils.dart' as utils;

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

  factory TextEditorStyle.fromJson(Map<String, dynamic> json) {
    return TextEditorStyle(
      fontSizeBottomSheetTitle: utils.JsonUtils.parseTextStyle(utils.JsonUtils.parseMap(json['fontSizeBottomSheetTitle'])),
      textFieldMargin: utils.JsonUtils.parseEdgeInsets(utils.JsonUtils.parseMap(json['textFieldMargin']), const EdgeInsets.only(bottom: 56.0)),
      appBarBackground: utils.JsonUtils.parseColor(json['appBarBackground'], const Color(0xFF222222)),
      appBarColor: utils.JsonUtils.parseColor(json['appBarColor'], const Color(0xFFFFFFFF)),
      bottomBarBackground: utils.JsonUtils.parseColor(json['bottomBarBackground'], const Color(0xFF222222)),
      background: utils.JsonUtils.parseColor(json['background'], const Color(0x9B000000)),
      bottomBarMainAxisAlignment: utils.JsonUtils.parseString(json['bottomBarMainAxisAlignment'], 'spaceEvenly'),
      inputHintColor: utils.JsonUtils.parseColor(json['inputHintColor'], const Color(0xFFBDBDBD)),
      inputCursorColor: utils.JsonUtils.parseColor(json['inputCursorColor'], Colors.blue),
      fontScaleBottomSheetBackground: utils.JsonUtils.parseColor(json['fontScaleBottomSheetBackground'], const Color(0xFF252728)),
    );
  }
}
