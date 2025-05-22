import 'package:flutter/material.dart'; // For TextStyle
import 'package:flet/flet.dart';
import './editor_safe_area.dart';
import './text_editor_style.dart';
import './text_editor_icons.dart';
import './text_editor_widgets.dart';

// Define enums used by this config class
enum TextAlign {
  left,
  right,
  center,
  justify,
  start,
  end,
}

enum LayerBackgroundMode {
  none,
  background,
  color,
  backgroundAndColor,
}

class TextEditorConfigs {
  final bool enableSuggestions;
  final bool enabled;
  final bool enableAutocorrect;
  final bool showSelectFontStyleBottomBar;
  final bool showTextAlignButton;
  final bool showFontScaleButton;
  final bool showBackgroundModeButton;
  final bool enableMainEditorZoomFactor;
  final double initFontSize;
  final TextAlign initialTextAlign;
  final double initFontScale;
  final double maxFontScale;
  final double minFontScale;
  final double minScale;
  final double maxScale;
  final List<TextStyle> customTextStyles;
  final TextStyle defaultTextStyle;
  final LayerBackgroundMode initialBackgroundColorMode;
  final EditorSafeArea safeArea;
  final TextEditorStyle style;
  final TextEditorIcons icons;
  final TextEditorWidgets widgets;

  const TextEditorConfigs({
    this.enableSuggestions = true,
    this.enabled = true,
    this.enableAutocorrect = true,
    this.showSelectFontStyleBottomBar = false,
    this.showTextAlignButton = true,
    this.showFontScaleButton = true,
    this.showBackgroundModeButton = true,
    this.enableMainEditorZoomFactor = false,
    this.initFontSize = 24.0,
    this.initialTextAlign = TextAlign.center,
    this.initFontScale = 1.0,
    this.maxFontScale = 3.0,
    this.minFontScale = 0.3,
    this.minScale = double.negativeInfinity,
    this.maxScale = double.infinity,
    this.customTextStyles = const [],
    this.defaultTextStyle = const TextStyle(), // Default empty TextStyle
    this.initialBackgroundColorMode = LayerBackgroundMode.backgroundAndColor,
    this.safeArea = const EditorSafeArea(),
    this.style = const TextEditorStyle(),
    this.icons = const TextEditorIcons(),
    this.widgets = const TextEditorWidgets(),
  });

  factory TextEditorConfigs.fromJson(ThemeData? theme, Map<String, dynamic> json) {
    List<TextStyle> tempCustomTextStyles = const [];
    if (json['customTextStyles'] is List) {
      tempCustomTextStyles = (json['customTextStyles'] as List).map((item) {
        if (item is Map) {
          final styleMap = Map<String, dynamic>.from(item);
          return TextStyle(
            color: styleMap['color'] != null ? parseColor(theme, styleMap['color'] as String?) : null,
            fontFamily: styleMap['fontFamily'] as String?,
            fontSize: styleMap['fontSize'] != null ? parseDouble(styleMap['fontSize'], 14.0) : null,
          );
        }
        return const TextStyle();
      }).toList();
    }

    TextStyle tempDefaultTextStyle = const TextStyle();
    if (json['defaultTextStyle'] is Map) {
      final styleMap = Map<String, dynamic>.from(json['defaultTextStyle'] as Map);
      tempDefaultTextStyle = TextStyle(
        color: styleMap['color'] != null ? parseColor(theme, styleMap['color'] as String?) : null,
        fontFamily: styleMap['fontFamily'] as String?,
        fontSize: styleMap['fontSize'] != null ? parseDouble(styleMap['fontSize'], 14.0) : null,
      );
    }
    
    TextAlign tempInitialTextAlign = TextAlign.center;
    dynamic rawAlign = json['initialTextAlign'];
    if (rawAlign is String) {
      tempInitialTextAlign = TextAlign.values.firstWhere(
        (e) => e.toString().split('.').last.toLowerCase() == rawAlign.toLowerCase(),
        orElse: () => TextAlign.center
      );
    } else if (TextAlign.values.contains(rawAlign)) {
      tempInitialTextAlign = rawAlign;
    }

    LayerBackgroundMode tempInitialBgMode = LayerBackgroundMode.backgroundAndColor;
    dynamic rawBgMode = json['initialBackgroundColorMode'];
    if (rawBgMode is String) {
      tempInitialBgMode = LayerBackgroundMode.values.firstWhere(
        (e) => e.toString().split('.').last.toLowerCase() == rawBgMode.toLowerCase(),
        orElse: () => LayerBackgroundMode.backgroundAndColor
      );
    } else if (LayerBackgroundMode.values.contains(rawBgMode)) {
      tempInitialBgMode = rawBgMode;
    }

    return TextEditorConfigs(
      enableSuggestions: parseBool(json['enableSuggestions'], true),
      enabled: parseBool(json['enabled'], true),
      enableAutocorrect: parseBool(json['enableAutocorrect'], true),
      showSelectFontStyleBottomBar: parseBool(json['showSelectFontStyleBottomBar'], false),
      showTextAlignButton: parseBool(json['showTextAlignButton'], true),
      showFontScaleButton: parseBool(json['showFontScaleButton'], true),
      showBackgroundModeButton: parseBool(json['showBackgroundModeButton'], true),
      enableMainEditorZoomFactor: parseBool(json['enableMainEditorZoomFactor'], false),
      initFontSize: parseDouble(json['initFontSize'], 24.0),
      initialTextAlign: tempInitialTextAlign,
      initFontScale: parseDouble(json['initFontScale'], 1.0),
      maxFontScale: parseDouble(json['maxFontScale'], 3.0),
      minFontScale: parseDouble(json['minFontScale'], 0.3),
      minScale: parseDouble(json['minScale'], double.negativeInfinity),
      maxScale: parseDouble(json['maxScale'], double.infinity),
      customTextStyles: tempCustomTextStyles,
      defaultTextStyle: tempDefaultTextStyle,
      initialBackgroundColorMode: tempInitialBgMode,
      safeArea: json['safeArea'] != null ? EditorSafeArea.fromJson(json['safeArea'] is Map ? Map<String, dynamic>.from(json['safeArea'] as Map) : {}) : const EditorSafeArea(),
      style: json['style'] != null ? TextEditorStyle.fromJson(theme, json['style'] is Map ? Map<String, dynamic>.from(json['style'] as Map) : {}) : const TextEditorStyle(),
      icons: json['icons'] != null ? TextEditorIcons.fromJson(json['icons'] is Map ? Map<String, dynamic>.from(json['icons'] as Map) : {}) : const TextEditorIcons(),
      widgets: json['widgets'] != null ? TextEditorWidgets.fromJson(json['widgets'] is Map ? Map<String, dynamic>.from(json['widgets'] as Map) : {}) : const TextEditorWidgets(),
    );
  }
}
