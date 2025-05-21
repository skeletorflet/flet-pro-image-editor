import 'package:flutter/material.dart'; // For Color, TextStyle, SystemUiOverlayStyle etc.
import 'package:flutter/services.dart'; // For SystemUiOverlayStyle
import '../utils/json_utils.dart' as utils;

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

  factory PaintEditorStyle.fromJson(Map<String, dynamic> json) {
    return PaintEditorStyle(
      lineWidthBottomSheetTitle: utils.JsonUtils.parseTextStyle(utils.JsonUtils.parseMap(json['lineWidthBottomSheetTitle'])),
      opacityBottomSheetTitle: utils.JsonUtils.parseTextStyle(utils.JsonUtils.parseMap(json['opacityBottomSheetTitle'])),
      appBarBackground: utils.JsonUtils.parseColor(json['appBarBackground'], const Color(0xFF222222)),
      appBarColor: utils.JsonUtils.parseColor(json['appBarColor'], const Color(0xFFFFFFFF)),
      lineWidthBottomSheetBackground: utils.JsonUtils.parseColor(json['lineWidthBottomSheetBackground'], const Color(0xFF252728)),
      opacityBottomSheetBackground: utils.JsonUtils.parseColor(json['opacityBottomSheetBackground'], const Color(0xFF252728)),
      background: utils.JsonUtils.parseColor(json['background'], const Color(0xFF000000)),
      bottomBarBackground: utils.JsonUtils.parseColor(json['bottomBarBackground'], const Color(0xFF222222)),
      bottomBarActiveItemColor: utils.JsonUtils.parseColor(json['bottomBarActiveItemColor'], Colors.blue),
      bottomBarInactiveItemColor: utils.JsonUtils.parseColor(json['bottomBarInactiveItemColor'], const Color(0xFFEEEEEE)),
      initialStrokeWidth: utils.JsonUtils.parseDouble(json['initialStrokeWidth'], 10.0),
      initialOpacity: utils.JsonUtils.parseDouble(json['initialOpacity'], 1.0),
      uiOverlayStyle: utils.JsonUtils.parseSystemUiOverlayStyle(utils.JsonUtils.parseMap(json['uiOverlayStyle'])),
      initialColor: utils.JsonUtils.parseColor(json['initialColor'], const Color(0xFFFF0000)),
    );
  }
}
