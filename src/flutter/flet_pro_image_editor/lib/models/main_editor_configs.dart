import 'package:flutter/material.dart'; // For EdgeInsets, Curves
import '../utils/json_utils.dart' as utils;
import './main_editor_style.dart';
import './main_editor_icons.dart';
import './main_editor_widgets.dart';
import './editor_safe_area.dart';
import './main_editor_transform_setup.dart'; // Placeholder

// Assuming Curve is represented by String for parsing via JsonUtils.parseCurve
// If Curve is a specific class, it would need its own fromJson or custom parsing.

class MainEditorConfigs {
  final bool enableZoom;
  final double editorMinScale;
  final double editorMaxScale;
  final bool enableDoubleTapZoom;
  final double doubleTapZoomFactor;
  final Duration doubleTapZoomDuration;
  final Curve doubleTapZoomCurve; // Parsed as string then converted to Curve
  final EdgeInsets boundaryMargin;
  final MainEditorTransformSetup transformSetup; // Placeholder
  final bool enableCloseButton;
  final bool enableEscapeButton;
  final MainEditorStyle style;
  final MainEditorIcons icons;
  final MainEditorWidgets widgets; // Placeholder
  final EditorSafeArea safeArea;

  const MainEditorConfigs({
    this.enableZoom = false,
    this.editorMinScale = 1.0,
    this.editorMaxScale = 5.0,
    this.enableDoubleTapZoom = true,
    this.doubleTapZoomFactor = 2.0,
    this.doubleTapZoomDuration = const Duration(milliseconds: 180),
    this.doubleTapZoomCurve = Curves.easeInOut,
    this.boundaryMargin = EdgeInsets.zero,
    this.transformSetup = const MainEditorTransformSetup(), // Placeholder
    this.enableCloseButton = true,
    this.enableEscapeButton = true,
    this.style = const MainEditorStyle(),
    this.icons = const MainEditorIcons(),
    this.widgets = const MainEditorWidgets(), // Placeholder
    this.safeArea = const EditorSafeArea(),
  });

  factory MainEditorConfigs.fromJson(Map<String, dynamic> json) {
    return MainEditorConfigs(
      enableZoom: utils.JsonUtils.parseBool(json['enableZoom'], false),
      editorMinScale: utils.JsonUtils.parseDouble(json['editorMinScale'], 1.0),
      editorMaxScale: utils.JsonUtils.parseDouble(json['editorMaxScale'], 5.0),
      enableDoubleTapZoom: utils.JsonUtils.parseBool(json['enableDoubleTapZoom'], true),
      doubleTapZoomFactor: utils.JsonUtils.parseDouble(json['doubleTapZoomFactor'], 2.0),
      doubleTapZoomDuration: utils.JsonUtils.parseDuration(json['doubleTapZoomDuration'], const Duration(milliseconds: 180)),
      doubleTapZoomCurve: utils.JsonUtils.parseCurve(json['doubleTapZoomCurve'] as String?, Curves.easeInOut),
      boundaryMargin: utils.JsonUtils.parseEdgeInsets(utils.JsonUtils.parseMap(json['boundaryMargin']), EdgeInsets.zero),
      transformSetup: json['transformSetup'] != null ? MainEditorTransformSetup.fromJson(utils.JsonUtils.parseMap(json['transformSetup'])) : const MainEditorTransformSetup(),
      enableCloseButton: utils.JsonUtils.parseBool(json['enableCloseButton'], true),
      enableEscapeButton: utils.JsonUtils.parseBool(json['enableEscapeButton'], true),
      style: json['style'] != null ? MainEditorStyle.fromJson(utils.JsonUtils.parseMap(json['style'])) : const MainEditorStyle(),
      icons: json['icons'] != null ? MainEditorIcons.fromJson(utils.JsonUtils.parseMap(json['icons'])) : const MainEditorIcons(),
      widgets: json['widgets'] != null ? MainEditorWidgets.fromJson(utils.JsonUtils.parseMap(json['widgets'])) : const MainEditorWidgets(),
      safeArea: json['safeArea'] != null ? EditorSafeArea.fromJson(utils.JsonUtils.parseMap(json['safeArea'])) : const EditorSafeArea(),
    );
  }
}
