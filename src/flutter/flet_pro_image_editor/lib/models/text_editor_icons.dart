import 'package:flutter/material.dart'; // For default Icon names, if needed for reference
import 'package:flet/flet.dart';

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
      bottomNavBar: json['bottomNavBar'] as String? ?? "Icons.title_rounded",
      alignLeft: json['alignLeft'] as String? ?? "Icons.align_horizontal_left_rounded",
      alignCenter: json['alignCenter'] as String? ?? "Icons.align_horizontal_center_rounded",
      alignRight: json['alignRight'] as String? ?? "Icons.align_horizontal_right_rounded",
      fontScale: json['fontScale'] as String? ?? "Icons.format_size_rounded",
      resetFontScale: json['resetFontScale'] as String? ?? "Icons.refresh_rounded",
      backgroundMode: json['backgroundMode'] as String? ?? "Icons.layers_rounded",
      applyChanges: json['applyChanges'] as String? ?? "Icons.done",
      backButton: json['backButton'] as String? ?? "Icons.arrow_back",
    );
  }
}
