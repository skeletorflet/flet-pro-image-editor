import 'package:flutter/material.dart'; // For default Icon names, if needed for reference
import '../utils/json_utils.dart' as utils;

class TextEditorIcons {
  final String bottomNavBar;
  final String alignLeft;
  final String alignCenter;
  final String alignRight;
  final String fontScale;
  final String resetFontScale;
  final String backgroundMode;
  final String applyChanges;
  final String backButton;

  const TextEditorIcons({
    this.bottomNavBar = "Icons.title_rounded",
    this.alignLeft = "Icons.align_horizontal_left_rounded",
    this.alignCenter = "Icons.align_horizontal_center_rounded",
    this.alignRight = "Icons.align_horizontal_right_rounded",
    this.fontScale = "Icons.format_size_rounded",
    this.resetFontScale = "Icons.refresh_rounded",
    this.backgroundMode = "Icons.layers_rounded",
    this.applyChanges = "Icons.done",
    this.backButton = "Icons.arrow_back",
  });

  factory TextEditorIcons.fromJson(Map<String, dynamic> json) {
    return TextEditorIcons(
      bottomNavBar: utils.JsonUtils.parseIconDataPlaceholder(json['bottomNavBar'], "Icons.title_rounded"),
      alignLeft: utils.JsonUtils.parseIconDataPlaceholder(json['alignLeft'], "Icons.align_horizontal_left_rounded"),
      alignCenter: utils.JsonUtils.parseIconDataPlaceholder(json['alignCenter'], "Icons.align_horizontal_center_rounded"),
      alignRight: utils.JsonUtils.parseIconDataPlaceholder(json['alignRight'], "Icons.align_horizontal_right_rounded"),
      fontScale: utils.JsonUtils.parseIconDataPlaceholder(json['fontScale'], "Icons.format_size_rounded"),
      resetFontScale: utils.JsonUtils.parseIconDataPlaceholder(json['resetFontScale'], "Icons.refresh_rounded"),
      backgroundMode: utils.JsonUtils.parseIconDataPlaceholder(json['backgroundMode'], "Icons.layers_rounded"),
      applyChanges: utils.JsonUtils.parseIconDataPlaceholder(json['applyChanges'], "Icons.done"),
      backButton: utils.JsonUtils.parseIconDataPlaceholder(json['backButton'], "Icons.arrow_back"),
    );
  }
}
