import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For SystemUiOverlayStyle
import 'package:flet/flet.dart';
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

  factory MainEditorStyle.fromJson(ThemeData? theme, Map<String, dynamic> json) {
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

    return MainEditorStyle(
      background: parseColor(theme, json['background'] as String?, const Color(0xFF000000) /* kImageEditorBackground placeholder */),
      bottomBarColor: parseColor(theme, json['bottomBarColor'] as String?, const Color(0xFF333333) /* kImageEditorBottomBarColor placeholder */),
      bottomBarBackground: parseColor(theme, json['bottomBarBackground'] as String?, const Color(0xFF222222) /* kImageEditorBottomBarBackground placeholder */),
      appBarColor: parseColor(theme, json['appBarColor'] as String?, const Color(0xFF333333) /* kImageEditorAppBarColor placeholder */),
      appBarBackground: parseColor(theme, json['appBarBackground'] as String?, const Color(0xFF222222) /* kImageEditorAppBarBackground placeholder */),
      uiOverlayStyle: tempUiOverlayStyle,
      outsideCaptureAreaLayerOpacity: parseDouble(json['outsideCaptureAreaLayerOpacity'], 0.5),
      subEditorPage: json['subEditorPage'] != null ? SubEditorPageStyle.fromJson(theme, json['subEditorPage'] is Map ? Map<String, dynamic>.from(json['subEditorPage'] as Map) : {}) : const SubEditorPageStyle(),
    );
  }
}
