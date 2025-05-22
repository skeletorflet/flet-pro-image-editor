import 'package:flutter/material.dart'; // For default Icon names, if needed for reference
import 'package:flet/flet.dart';

class PaintEditorIcons {
  final String moveAndZoom;
  final String changeOpacity;
  final String eraser;
  final String bottomNavBar; // Renamed from bottom_nav_bar to match Python camelCase target
  final String lineWeight;
  final String freeStyle;
  final String arrow;
  final String line;
  final String fill;
  final String noFill;
  final String rectangle;
  final String circle;
  final String dashLine;
  final String pixelate;
  final String blur;
  final String applyChanges;
  final String backButton;
  final String undoAction;
  final String redoAction;

  const PaintEditorIcons({
    this.moveAndZoom = "Icons.pinch_outlined",
    this.changeOpacity = "Icons.opacity_outlined",
    this.eraser = "Icons.delete_forever_outlined",
    this.bottomNavBar = "Icons.edit_outlined",
    this.lineWeight = "Icons.line_weight_rounded",
    this.freeStyle = "Icons.edit",
    this.arrow = "Icons.arrow_right_alt_outlined",
    this.line = "Icons.horizontal_rule",
    this.fill = "Icons.format_color_fill",
    this.noFill = "Icons.format_color_reset",
    this.rectangle = "Icons.crop_free",
    this.circle = "Icons.lens_outlined",
    this.dashLine = "Icons.power_input",
    this.pixelate = "Icons.grid_on",
    this.blur = "Icons.blur_on_rounded",
    this.applyChanges = "Icons.done",
    this.backButton = "Icons.arrow_back",
    this.undoAction = "Icons.undo",
    this.redoAction = "Icons.redo",
  });

  factory PaintEditorIcons.fromJson(Map<String, dynamic> json) {
    return PaintEditorIcons(
      moveAndZoom: json['moveAndZoom'] as String? ?? "Icons.pinch_outlined",
      changeOpacity: json['changeOpacity'] as String? ?? "Icons.opacity_outlined",
      eraser: json['eraser'] as String? ?? "Icons.delete_forever_outlined",
      bottomNavBar: json['bottomNavBar'] as String? ?? "Icons.edit_outlined",
      lineWeight: json['lineWeight'] as String? ?? "Icons.line_weight_rounded",
      freeStyle: json['freeStyle'] as String? ?? "Icons.edit",
      arrow: json['arrow'] as String? ?? "Icons.arrow_right_alt_outlined",
      line: json['line'] as String? ?? "Icons.horizontal_rule",
      fill: json['fill'] as String? ?? "Icons.format_color_fill",
      noFill: json['noFill'] as String? ?? "Icons.format_color_reset",
      rectangle: json['rectangle'] as String? ?? "Icons.crop_free",
      circle: json['circle'] as String? ?? "Icons.lens_outlined",
      dashLine: json['dashLine'] as String? ?? "Icons.power_input",
      pixelate: json['pixelate'] as String? ?? "Icons.grid_on",
      blur: json['blur'] as String? ?? "Icons.blur_on_rounded",
      applyChanges: json['applyChanges'] as String? ?? "Icons.done",
      backButton: json['backButton'] as String? ?? "Icons.arrow_back",
      undoAction: json['undoAction'] as String? ?? "Icons.undo",
      redoAction: json['redoAction'] as String? ?? "Icons.redo",
    );
  }
}
