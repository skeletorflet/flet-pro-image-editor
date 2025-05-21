import 'package:flutter/material.dart'; // For default Icon names, if needed for reference
import '../utils/json_utils.dart' as utils;

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
      moveAndZoom: utils.JsonUtils.parseIconDataPlaceholder(json['moveAndZoom'], "Icons.pinch_outlined"),
      changeOpacity: utils.JsonUtils.parseIconDataPlaceholder(json['changeOpacity'], "Icons.opacity_outlined"),
      eraser: utils.JsonUtils.parseIconDataPlaceholder(json['eraser'], "Icons.delete_forever_outlined"),
      bottomNavBar: utils.JsonUtils.parseIconDataPlaceholder(json['bottomNavBar'], "Icons.edit_outlined"),
      lineWeight: utils.JsonUtils.parseIconDataPlaceholder(json['lineWeight'], "Icons.line_weight_rounded"),
      freeStyle: utils.JsonUtils.parseIconDataPlaceholder(json['freeStyle'], "Icons.edit"),
      arrow: utils.JsonUtils.parseIconDataPlaceholder(json['arrow'], "Icons.arrow_right_alt_outlined"),
      line: utils.JsonUtils.parseIconDataPlaceholder(json['line'], "Icons.horizontal_rule"),
      fill: utils.JsonUtils.parseIconDataPlaceholder(json['fill'], "Icons.format_color_fill"),
      noFill: utils.JsonUtils.parseIconDataPlaceholder(json['noFill'], "Icons.format_color_reset"),
      rectangle: utils.JsonUtils.parseIconDataPlaceholder(json['rectangle'], "Icons.crop_free"),
      circle: utils.JsonUtils.parseIconDataPlaceholder(json['circle'], "Icons.lens_outlined"),
      dashLine: utils.JsonUtils.parseIconDataPlaceholder(json['dashLine'], "Icons.power_input"),
      pixelate: utils.JsonUtils.parseIconDataPlaceholder(json['pixelate'], "Icons.grid_on"),
      blur: utils.JsonUtils.parseIconDataPlaceholder(json['blur'], "Icons.blur_on_rounded"),
      applyChanges: utils.JsonUtils.parseIconDataPlaceholder(json['applyChanges'], "Icons.done"),
      backButton: utils.JsonUtils.parseIconDataPlaceholder(json['backButton'], "Icons.arrow_back"),
      undoAction: utils.JsonUtils.parseIconDataPlaceholder(json['undoAction'], "Icons.undo"),
      redoAction: utils.JsonUtils.parseIconDataPlaceholder(json['redoAction'], "Icons.redo"),
    );
  }
}
