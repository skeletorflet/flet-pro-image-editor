import 'package:flutter/material.dart'; // For EdgeInsets, Curves
import '../utils/json_utils.dart' as utils;
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

  factory PaintEditorConfigs.fromJson(Map<String, dynamic> json) {
    return PaintEditorConfigs(
      enabled: utils.JsonUtils.parseBool(json['enabled'], true),
      enableZoom: utils.JsonUtils.parseBool(json['enableZoom'], false),
      editorMinScale: utils.JsonUtils.parseDouble(json['editorMinScale'], 1.0),
      editorMaxScale: utils.JsonUtils.parseDouble(json['editorMaxScale'], 5.0),
      enableDoubleTapZoom: utils.JsonUtils.parseBool(json['enableDoubleTapZoom'], true),
      doubleTapZoomFactor: utils.JsonUtils.parseDouble(json['doubleTapZoomFactor'], 2.0),
      doubleTapZoomDuration: utils.JsonUtils.parseDuration(json['doubleTapZoomDuration'], const Duration(milliseconds: 180)),
      doubleTapZoomCurve: utils.JsonUtils.parseCurve(json['doubleTapZoomCurve'] as String?, Curves.easeInOut),
      boundaryMargin: utils.JsonUtils.parseEdgeInsets(utils.JsonUtils.parseMap(json['boundaryMargin']), EdgeInsets.zero),
      enableModeFreeStyle: utils.JsonUtils.parseBool(json['enableModeFreeStyle'], true),
      enableModeArrow: utils.JsonUtils.parseBool(json['enableModeArrow'], true),
      enableModeLine: utils.JsonUtils.parseBool(json['enableModeLine'], true),
      enableModeRect: utils.JsonUtils.parseBool(json['enableModeRect'], true),
      enableModeCircle: utils.JsonUtils.parseBool(json['enableModeCircle'], true),
      enableModeDashLine: utils.JsonUtils.parseBool(json['enableModeDashLine'], true),
      enableModeBlur: utils.JsonUtils.parseBool(json['enableModeBlur'], true),
      enableModePixelate: utils.JsonUtils.parseBool(json['enableModePixelate'], true),
      enableModeEraser: utils.JsonUtils.parseBool(json['enableModeEraser'], true),
      showToggleFillButton: utils.JsonUtils.parseBool(json['showToggleFillButton'], true),
      showLineWidthAdjustmentButton: utils.JsonUtils.parseBool(json['showLineWidthAdjustmentButton'], true),
      showOpacityAdjustmentButton: utils.JsonUtils.parseBool(json['showOpacityAdjustmentButton'], true),
      isInitiallyFilled: utils.JsonUtils.parseBool(json['isInitiallyFilled'], false),
      showLayers: utils.JsonUtils.parseBool(json['showLayers'], true),
      enableShareZoomMatrix: utils.JsonUtils.parseBool(json['enableShareZoomMatrix'], true),
      minScale: utils.JsonUtils.parseDouble(json['minScale'], double.negativeInfinity),
      maxScale: utils.JsonUtils.parseDouble(json['maxScale'], double.infinity),
      enableFreeStyleHighPerformanceScaling: json['enableFreeStyleHighPerformanceScaling'] as bool?,
      enableFreeStyleHighPerformanceMoving: json['enableFreeStyleHighPerformanceMoving'] as bool?,
      enableFreeStyleHighPerformanceHero: utils.JsonUtils.parseBool(json['enableFreeStyleHighPerformanceHero'], false),
      initialPaintMode: utils.JsonUtils.parseEnum(PaintMode.values, json['initialPaintMode'], PaintMode.freeStyle),
      censorConfigs: json['censorConfigs'] != null ? CensorConfigs.fromJson(utils.JsonUtils.parseMap(json['censorConfigs'])) : const CensorConfigs(),
      safeArea: json['safeArea'] != null ? EditorSafeArea.fromJson(utils.JsonUtils.parseMap(json['safeArea'])) : const EditorSafeArea(),
      style: json['style'] != null ? PaintEditorStyle.fromJson(utils.JsonUtils.parseMap(json['style'])) : const PaintEditorStyle(),
      icons: json['icons'] != null ? PaintEditorIcons.fromJson(utils.JsonUtils.parseMap(json['icons'])) : const PaintEditorIcons(),
      widgets: json['widgets'] != null ? PaintEditorWidgets.fromJson(utils.JsonUtils.parseMap(json['widgets'])) : const PaintEditorWidgets(),
    );
  }
}
