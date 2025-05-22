import 'package:flutter/material.dart'; // For EdgeInsets, Curves
import 'package:flet/flet.dart';
import './censor_configs.dart';
import './editor_safe_area.dart';
import './paint_editor_style.dart';
import './paint_editor_icons.dart';
import './paint_editor_widgets.dart';
// Assuming Curve is represented by String for parsing via JsonUtils.parseCurve

enum PaintMode {
  freeStyle,
  arrow,
  line,
  rect,
  circle,
  dashLine,
  blur,
  pixelate,
  eraser,
}

class PaintEditorConfigs {
  final bool enabled;
  final bool enableZoom;
  final double editorMinScale;
  final double editorMaxScale;
  final bool enableDoubleTapZoom;
  final double doubleTapZoomFactor;
  final Duration doubleTapZoomDuration;
  final Curve doubleTapZoomCurve;
  final EdgeInsets boundaryMargin;
  final bool enableModeFreeStyle;
  final bool enableModeArrow;
  final bool enableModeLine;
  final bool enableModeRect;
  final bool enableModeCircle;
  final bool enableModeDashLine;
  final bool enableModeBlur;
  final bool enableModePixelate;
  final bool enableModeEraser;
  final bool showToggleFillButton;
  final bool showLineWidthAdjustmentButton;
  final bool showOpacityAdjustmentButton;
  final bool isInitiallyFilled;
  final bool showLayers;
  final bool enableShareZoomMatrix;
  final double minScale;
  final double maxScale;
  final bool? enableFreeStyleHighPerformanceScaling;
  final bool? enableFreeStyleHighPerformanceMoving;
  final bool enableFreeStyleHighPerformanceHero;
  final PaintMode initialPaintMode;
  final CensorConfigs censorConfigs;
  final EditorSafeArea safeArea;
  final PaintEditorStyle style;
  final PaintEditorIcons icons;
  final PaintEditorWidgets widgets;

  const PaintEditorConfigs({
    this.enabled = true,
    this.enableZoom = false,
    this.editorMinScale = 1.0,
    this.editorMaxScale = 5.0,
    this.enableDoubleTapZoom = true,
    this.doubleTapZoomFactor = 2.0,
    this.doubleTapZoomDuration = const Duration(milliseconds: 180),
    this.doubleTapZoomCurve = Curves.easeInOut,
    this.boundaryMargin = EdgeInsets.zero,
    this.enableModeFreeStyle = true,
    this.enableModeArrow = true,
    this.enableModeLine = true,
    this.enableModeRect = true,
    this.enableModeCircle = true,
    this.enableModeDashLine = true,
    this.enableModeBlur = true,
    this.enableModePixelate = true,
    this.enableModeEraser = true,
    this.showToggleFillButton = true,
    this.showLineWidthAdjustmentButton = true,
    this.showOpacityAdjustmentButton = true,
    this.isInitiallyFilled = false,
    this.showLayers = true,
    this.enableShareZoomMatrix = true,
    this.minScale = double.negativeInfinity,
    this.maxScale = double.infinity,
    this.enableFreeStyleHighPerformanceScaling, // Nullable
    this.enableFreeStyleHighPerformanceMoving,  // Nullable
    this.enableFreeStyleHighPerformanceHero = false,
    this.initialPaintMode = PaintMode.freeStyle,
    this.censorConfigs = const CensorConfigs(),
    this.safeArea = const EditorSafeArea(),
    this.style = const PaintEditorStyle(),
    this.icons = const PaintEditorIcons(),
    this.widgets = const PaintEditorWidgets(),
  });

  factory PaintEditorConfigs.fromJson(ThemeData? theme, Map<String, dynamic> json) {
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

    PaintMode tempInitialPaintMode = PaintMode.freeStyle;
    dynamic rawMode = json['initialPaintMode'];
    if (rawMode is String) {
      tempInitialPaintMode = PaintMode.values.firstWhere(
        (e) => e.toString().split('.').last.toLowerCase() == rawMode.toLowerCase(),
        orElse: () => PaintMode.freeStyle
      );
    } else if (PaintMode.values.contains(rawMode)) {
      tempInitialPaintMode = rawMode;
    }

    return PaintEditorConfigs(
      enabled: parseBool(json['enabled'], true),
      enableZoom: parseBool(json['enableZoom'], false),
      editorMinScale: parseDouble(json['editorMinScale'], 1.0),
      editorMaxScale: parseDouble(json['editorMaxScale'], 5.0),
      enableDoubleTapZoom: parseBool(json['enableDoubleTapZoom'], true),
      doubleTapZoomFactor: parseDouble(json['doubleTapZoomFactor'], 2.0),
      doubleTapZoomDuration: parseAnimationDuration(json['doubleTapZoomDuration'], const Duration(milliseconds: 180)),
      doubleTapZoomCurve: parseCurve(json['doubleTapZoomCurve'] as String?, Curves.easeInOut),
      boundaryMargin: tempBoundaryMargin,
      enableModeFreeStyle: parseBool(json['enableModeFreeStyle'], true),
      enableModeArrow: parseBool(json['enableModeArrow'], true),
      enableModeLine: parseBool(json['enableModeLine'], true),
      enableModeRect: parseBool(json['enableModeRect'], true),
      enableModeCircle: parseBool(json['enableModeCircle'], true),
      enableModeDashLine: parseBool(json['enableModeDashLine'], true),
      enableModeBlur: parseBool(json['enableModeBlur'], true),
      enableModePixelate: parseBool(json['enableModePixelate'], true),
      enableModeEraser: parseBool(json['enableModeEraser'], true),
      showToggleFillButton: parseBool(json['showToggleFillButton'], true),
      showLineWidthAdjustmentButton: parseBool(json['showLineWidthAdjustmentButton'], true),
      showOpacityAdjustmentButton: parseBool(json['showOpacityAdjustmentButton'], true),
      isInitiallyFilled: parseBool(json['isInitiallyFilled'], false),
      showLayers: parseBool(json['showLayers'], true),
      enableShareZoomMatrix: parseBool(json['enableShareZoomMatrix'], true),
      minScale: parseDouble(json['minScale'], double.negativeInfinity),
      maxScale: parseDouble(json['maxScale'], double.infinity),
      enableFreeStyleHighPerformanceScaling: json['enableFreeStyleHighPerformanceScaling'] as bool?,
      enableFreeStyleHighPerformanceMoving: json['enableFreeStyleHighPerformanceMoving'] as bool?,
      enableFreeStyleHighPerformanceHero: parseBool(json['enableFreeStyleHighPerformanceHero'], false),
      initialPaintMode: tempInitialPaintMode,
      censorConfigs: json['censorConfigs'] != null ? CensorConfigs.fromJson(json['censorConfigs'] is Map ? Map<String, dynamic>.from(json['censorConfigs'] as Map) : {}) : const CensorConfigs(),
      safeArea: json['safeArea'] != null ? EditorSafeArea.fromJson(json['safeArea'] is Map ? Map<String, dynamic>.from(json['safeArea'] as Map) : {}) : const EditorSafeArea(),
      style: json['style'] != null ? PaintEditorStyle.fromJson(theme, json['style'] is Map ? Map<String, dynamic>.from(json['style'] as Map) : {}) : const PaintEditorStyle(),
      icons: json['icons'] != null ? PaintEditorIcons.fromJson(json['icons'] is Map ? Map<String, dynamic>.from(json['icons'] as Map) : {}) : const PaintEditorIcons(),
      widgets: json['widgets'] != null ? PaintEditorWidgets.fromJson(json['widgets'] is Map ? Map<String, dynamic>.from(json['widgets'] as Map) : {}) : const PaintEditorWidgets(),
    );
  }
}
