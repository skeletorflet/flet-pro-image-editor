import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For SystemUiOverlayStyle
import '../utils/json_utils.dart' as utils;
import './sub_editor_page_style.dart';

class MainEditorStyle {
  final Color background;
  final Color bottomBarColor;
  final Color bottomBarBackground;
  final Color appBarColor;
  final Color appBarBackground;
  final SystemUiOverlayStyle uiOverlayStyle;
  final double outsideCaptureAreaLayerOpacity;
  final SubEditorPageStyle subEditorPage;

  const MainEditorStyle({
    this.background = const Color(0xFF000000), // kImageEditorBackground placeholder
    this.bottomBarColor = const Color(0xFF333333), // kImageEditorBottomBarColor placeholder
    this.bottomBarBackground = const Color(0xFF222222), // kImageEditorBottomBarBackground placeholder
    this.appBarColor = const Color(0xFF333333), // kImageEditorAppBarColor placeholder
    this.appBarBackground = const Color(0xFF222222), // kImageEditorAppBarBackground placeholder
    this.uiOverlayStyle = SystemUiOverlayStyle.light, // Default
    this.outsideCaptureAreaLayerOpacity = 0.5,
    this.subEditorPage = const SubEditorPageStyle(),
  });

  factory MainEditorStyle.fromJson(Map<String, dynamic> json) {
    return MainEditorStyle(
      background: utils.JsonUtils.parseColor(json['background'], const Color(0xFF000000) /* kImageEditorBackground placeholder */),
      bottomBarColor: utils.JsonUtils.parseColor(json['bottomBarColor'], const Color(0xFF333333) /* kImageEditorBottomBarColor placeholder */),
      bottomBarBackground: utils.JsonUtils.parseColor(json['bottomBarBackground'], const Color(0xFF222222) /* kImageEditorBottomBarBackground placeholder */),
      appBarColor: utils.JsonUtils.parseColor(json['appBarColor'], const Color(0xFF333333) /* kImageEditorAppBarColor placeholder */),
      appBarBackground: utils.JsonUtils.parseColor(json['appBarBackground'], const Color(0xFF222222) /* kImageEditorAppBarBackground placeholder */),
      uiOverlayStyle: utils.JsonUtils.parseSystemUiOverlayStyle(utils.JsonUtils.parseMap(json['uiOverlayStyle'])), // Uses default from JsonUtils if map is empty/null
      outsideCaptureAreaLayerOpacity: utils.JsonUtils.parseDouble(json['outsideCaptureAreaLayerOpacity'], 0.5),
      subEditorPage: json['subEditorPage'] != null ? SubEditorPageStyle.fromJson(utils.JsonUtils.parseMap(json['subEditorPage'])) : const SubEditorPageStyle(),
    );
  }
}
