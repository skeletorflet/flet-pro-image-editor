import 'package:flutter/material.dart'; // For TextStyle
import '../utils/json_utils.dart' as utils;
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

  factory TextEditorConfigs.fromJson(Map<String, dynamic> json) {
    return TextEditorConfigs(
      enableSuggestions: utils.JsonUtils.parseBool(json['enableSuggestions'], true),
      enabled: utils.JsonUtils.parseBool(json['enabled'], true),
      enableAutocorrect: utils.JsonUtils.parseBool(json['enableAutocorrect'], true),
      showSelectFontStyleBottomBar: utils.JsonUtils.parseBool(json['showSelectFontStyleBottomBar'], false),
      showTextAlignButton: utils.JsonUtils.parseBool(json['showTextAlignButton'], true),
      showFontScaleButton: utils.JsonUtils.parseBool(json['showFontScaleButton'], true),
      showBackgroundModeButton: utils.JsonUtils.parseBool(json['showBackgroundModeButton'], true),
      enableMainEditorZoomFactor: utils.JsonUtils.parseBool(json['enableMainEditorZoomFactor'], false),
      initFontSize: utils.JsonUtils.parseDouble(json['initFontSize'], 24.0),
      initialTextAlign: utils.JsonUtils.parseEnum(TextAlign.values, json['initialTextAlign'], TextAlign.center),
      initFontScale: utils.JsonUtils.parseDouble(json['initFontScale'], 1.0),
      maxFontScale: utils.JsonUtils.parseDouble(json['maxFontScale'], 3.0),
      minFontScale: utils.JsonUtils.parseDouble(json['minFontScale'], 0.3),
      minScale: utils.JsonUtils.parseDouble(json['minScale'], double.negativeInfinity),
      maxScale: utils.JsonUtils.parseDouble(json['maxScale'], double.infinity),
      customTextStyles: utils.JsonUtils.parseList<TextStyle>(json['customTextStyles'], (item) => utils.JsonUtils.parseTextStyle(utils.JsonUtils.parseMap(item)), []),
      defaultTextStyle: utils.JsonUtils.parseTextStyle(utils.JsonUtils.parseMap(json['defaultTextStyle']), const TextStyle()),
      initialBackgroundColorMode: utils.JsonUtils.parseEnum(LayerBackgroundMode.values, json['initialBackgroundColorMode'], LayerBackgroundMode.backgroundAndColor),
      safeArea: json['safeArea'] != null ? EditorSafeArea.fromJson(utils.JsonUtils.parseMap(json['safeArea'])) : const EditorSafeArea(),
      style: json['style'] != null ? TextEditorStyle.fromJson(utils.JsonUtils.parseMap(json['style'])) : const TextEditorStyle(),
      icons: json['icons'] != null ? TextEditorIcons.fromJson(utils.JsonUtils.parseMap(json['icons'])) : const TextEditorIcons(),
      widgets: json['widgets'] != null ? TextEditorWidgets.fromJson(utils.JsonUtils.parseMap(json['widgets'])) : const TextEditorWidgets(),
    );
  }
}
