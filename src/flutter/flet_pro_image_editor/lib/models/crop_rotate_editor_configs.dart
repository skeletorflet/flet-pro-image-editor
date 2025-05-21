import 'package:flutter/material.dart'; // For Curves
import '../utils/json_utils.dart' as utils;
import './aspect_ratio_item.dart';
import './editor_safe_area.dart';
import './crop_rotate_editor_style.dart'; // Assuming this was created as a placeholder
import './crop_rotate_editor_icons.dart'; // Assuming this was created as a placeholder
import './crop_rotate_editor_widgets.dart'; // Assuming this was created as a placeholder

// Define enums used by this config class
enum RotateDirection {
  left,
  right,
  none,
}

class CropRotateEditorConfigs {
  final double desktopCornerDragArea;
  final double mobileCornerDragArea;
  final bool enabled;
  final bool showRotateButton;
  final bool showFlipButton;
  final bool showAspectRatioButton;
  final bool showResetButton;
  final bool invertMouseScroll;
  final bool invertDragDirection;
  final bool enableRoundCropper;
  final bool enableTransformLayers;
  final bool enableProvideImageInfos;
  final bool enableDoubleTap;
  final bool showLayers;
  final double? initAspectRatio; // Nullable
  final Curve rotateAnimationCurve;
  final Curve scaleAnimationCurve;
  final Curve cropDragAnimationCurve;
  final Curve fadeInOutsideCropAreaAnimationCurve;
  final RotateDirection rotateDirection;
  final Duration opacityOutsideCropAreaDuration;
  final Duration animationDuration;
  final Duration fadeInOutsideCropAreaAnimationDuration;
  final Duration cropDragAnimationDuration;
  final double maxScale;
  final double mouseScaleFactor;
  final double doubleTapScaleFactor;
  final List<AspectRatioItem> aspectRatios;
  final EditorSafeArea safeArea;
  final CropRotateEditorStyle style;
  final CropRotateEditorIcons icons;
  final CropRotateEditorWidgets widgets;
  final double? maxWidthFactor; // Nullable

  const CropRotateEditorConfigs({
    this.desktopCornerDragArea = 7.0,
    this.mobileCornerDragArea = 48.0,
    this.enabled = true,
    this.showRotateButton = true,
    this.showFlipButton = true,
    this.showAspectRatioButton = true,
    this.showResetButton = true,
    this.invertMouseScroll = false,
    this.invertDragDirection = false,
    this.enableRoundCropper = false,
    this.enableTransformLayers = true,
    this.enableProvideImageInfos = false,
    this.enableDoubleTap = true,
    this.showLayers = true,
    this.initAspectRatio, // Nullable
    this.rotateAnimationCurve = Curves.decelerate,
    this.scaleAnimationCurve = Curves.decelerate,
    this.cropDragAnimationCurve = Curves.decelerate,
    this.fadeInOutsideCropAreaAnimationCurve = Curves.decelerate,
    this.rotateDirection = RotateDirection.left,
    this.opacityOutsideCropAreaDuration = const Duration(milliseconds: 100),
    this.animationDuration = const Duration(milliseconds: 250),
    this.fadeInOutsideCropAreaAnimationDuration = const Duration(milliseconds: 350),
    this.cropDragAnimationDuration = const Duration(milliseconds: 400),
    this.maxScale = 7.0,
    this.mouseScaleFactor = 0.1,
    this.doubleTapScaleFactor = 2.0,
    this.aspectRatios = const [
      AspectRatioItem(text: 'Free', value: -1),
      AspectRatioItem(text: 'Original', value: 0.0),
      AspectRatioItem(text: '1*1', value: 1.0 / 1.0),
      AspectRatioItem(text: '4*3', value: 4.0 / 3.0),
      AspectRatioItem(text: '3*4', value: 3.0 / 4.0),
      AspectRatioItem(text: '16*9', value: 16.0 / 9.0),
      AspectRatioItem(text: '9*16', value: 9.0 / 16.0)
    ],
    this.safeArea = const EditorSafeArea(),
    this.style = const CropRotateEditorStyle(),
    this.icons = const CropRotateEditorIcons(),
    this.widgets = const CropRotateEditorWidgets(),
    this.maxWidthFactor, // Nullable
  });

  factory CropRotateEditorConfigs.fromJson(Map<String, dynamic> json) {
    return CropRotateEditorConfigs(
      desktopCornerDragArea: utils.JsonUtils.parseDouble(json['desktopCornerDragArea'], 7.0),
      mobileCornerDragArea: utils.JsonUtils.parseDouble(json['mobileCornerDragArea'], 48.0),
      enabled: utils.JsonUtils.parseBool(json['enabled'], true),
      showRotateButton: utils.JsonUtils.parseBool(json['showRotateButton'], true),
      showFlipButton: utils.JsonUtils.parseBool(json['showFlipButton'], true),
      showAspectRatioButton: utils.JsonUtils.parseBool(json['showAspectRatioButton'], true),
      showResetButton: utils.JsonUtils.parseBool(json['showResetButton'], true),
      invertMouseScroll: utils.JsonUtils.parseBool(json['invertMouseScroll'], false),
      invertDragDirection: utils.JsonUtils.parseBool(json['invertDragDirection'], false),
      enableRoundCropper: utils.JsonUtils.parseBool(json['enableRoundCropper'], false),
      enableTransformLayers: utils.JsonUtils.parseBool(json['enableTransformLayers'], true),
      enableProvideImageInfos: utils.JsonUtils.parseBool(json['enableProvideImageInfos'], false),
      enableDoubleTap: utils.JsonUtils.parseBool(json['enableDoubleTap'], true),
      showLayers: utils.JsonUtils.parseBool(json['showLayers'], true),
      initAspectRatio: json['initAspectRatio'] as double?,
      rotateAnimationCurve: utils.JsonUtils.parseCurve(json['rotateAnimationCurve'] as String?, Curves.decelerate),
      scaleAnimationCurve: utils.JsonUtils.parseCurve(json['scaleAnimationCurve'] as String?, Curves.decelerate),
      cropDragAnimationCurve: utils.JsonUtils.parseCurve(json['cropDragAnimationCurve'] as String?, Curves.decelerate),
      fadeInOutsideCropAreaAnimationCurve: utils.JsonUtils.parseCurve(json['fadeInOutsideCropAreaAnimationCurve'] as String?, Curves.decelerate),
      rotateDirection: utils.JsonUtils.parseEnum(RotateDirection.values, json['rotateDirection'], RotateDirection.left),
      opacityOutsideCropAreaDuration: utils.JsonUtils.parseDuration(json['opacityOutsideCropAreaDuration'], const Duration(milliseconds: 100)),
      animationDuration: utils.JsonUtils.parseDuration(json['animationDuration'], const Duration(milliseconds: 250)),
      fadeInOutsideCropAreaAnimationDuration: utils.JsonUtils.parseDuration(json['fadeInOutsideCropAreaAnimationDuration'], const Duration(milliseconds: 350)),
      cropDragAnimationDuration: utils.JsonUtils.parseDuration(json['cropDragAnimationDuration'], const Duration(milliseconds: 400)),
      maxScale: utils.JsonUtils.parseDouble(json['maxScale'], 7.0),
      mouseScaleFactor: utils.JsonUtils.parseDouble(json['mouseScaleFactor'], 0.1),
      doubleTapScaleFactor: utils.JsonUtils.parseDouble(json['doubleTapScaleFactor'], 2.0),
      aspectRatios: utils.JsonUtils.parseList<AspectRatioItem>(json['aspectRatios'], (item) => AspectRatioItem.fromJson(utils.JsonUtils.parseMap(item)), const [
          AspectRatioItem(text: 'Free', value: -1), AspectRatioItem(text: 'Original', value: 0.0),
          AspectRatioItem(text: '1*1', value: 1.0 / 1.0), AspectRatioItem(text: '4*3', value: 4.0 / 3.0),
          AspectRatioItem(text: '3*4', value: 3.0 / 4.0), AspectRatioItem(text: '16*9', value: 16.0 / 9.0),
          AspectRatioItem(text: '9*16', value: 9.0 / 16.0)
        ]),
      safeArea: json['safeArea'] != null ? EditorSafeArea.fromJson(utils.JsonUtils.parseMap(json['safeArea'])) : const EditorSafeArea(),
      style: json['style'] != null ? CropRotateEditorStyle.fromJson(utils.JsonUtils.parseMap(json['style'])) : const CropRotateEditorStyle(),
      icons: json['icons'] != null ? CropRotateEditorIcons.fromJson(utils.JsonUtils.parseMap(json['icons'])) : const CropRotateEditorIcons(),
      widgets: json['widgets'] != null ? CropRotateEditorWidgets.fromJson(utils.JsonUtils.parseMap(json['widgets'])) : const CropRotateEditorWidgets(),
      maxWidthFactor: json['maxWidthFactor'] as double?,
    );
  }
}
