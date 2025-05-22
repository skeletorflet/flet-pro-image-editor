import 'package:flutter/material.dart'; // For EdgeInsets, Curves
import 'package:flet/flet.dart';
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

  factory MainEditorConfigs.fromJson(ThemeData? theme, Map<String, dynamic> json) {
    EdgeInsets tempBoundaryMargin = EdgeInsets.zero;
    if (json['boundaryMargin'] is Map) {
      final map = Map<String, dynamic>.from(json['boundaryMargin'] as Map);
      tempBoundaryMargin = EdgeInsets.fromLTRB(
        parseDouble(map['left'], 0.0),
        parseDouble(map['top'], 0.0),
        parseDouble(map['right'], 0.0),
        parseDouble(map['bottom'], 0.0),
      );
    }

    return MainEditorConfigs(
      enableZoom: parseBool(json['enableZoom'], false),
      editorMinScale: parseDouble(json['editorMinScale'], 1.0),
      editorMaxScale: parseDouble(json['editorMaxScale'], 5.0),
      enableDoubleTapZoom: parseBool(json['enableDoubleTapZoom'], true),
      doubleTapZoomFactor: parseDouble(json['doubleTapZoomFactor'], 2.0),
      doubleTapZoomDuration: parseAnimationDuration(json['doubleTapZoomDuration'], const Duration(milliseconds: 180)),
      doubleTapZoomCurve: parseCurve(json['doubleTapZoomCurve'] as String?, Curves.easeInOut),
      boundaryMargin: tempBoundaryMargin,
      transformSetup: json['transformSetup'] != null ? MainEditorTransformSetup.fromJson(json['transformSetup'] is Map ? Map<String, dynamic>.from(json['transformSetup'] as Map) : {}) : const MainEditorTransformSetup(),
      enableCloseButton: parseBool(json['enableCloseButton'], true),
      enableEscapeButton: parseBool(json['enableEscapeButton'], true),
      style: json['style'] != null ? MainEditorStyle.fromJson(theme, json['style'] is Map ? Map<String, dynamic>.from(json['style'] as Map) : {}) : const MainEditorStyle(),
      icons: json['icons'] != null ? MainEditorIcons.fromJson(json['icons'] is Map ? Map<String, dynamic>.from(json['icons'] as Map) : {}) : const MainEditorIcons(),
      widgets: json['widgets'] != null ? MainEditorWidgets.fromJson(json['widgets'] is Map ? Map<String, dynamic>.from(json['widgets'] as Map) : {}) : const MainEditorWidgets(),
      safeArea: json['safeArea'] != null ? EditorSafeArea.fromJson(json['safeArea'] is Map ? Map<String, dynamic>.from(json['safeArea'] as Map) : {}) : const EditorSafeArea(),
    );
  }
}
