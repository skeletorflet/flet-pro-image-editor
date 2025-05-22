import 'package:flutter/material.dart'; // For Curves
import 'package:flet/flet.dart';
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
    RotateDirection tempRotateDirection = RotateDirection.left; // Default
    dynamic rawRotateDirection = json['rotateDirection'];
    if (rawRotateDirection is String) {
      tempRotateDirection = RotateDirection.values.firstWhere(
        (e) => e.toString().split('.').last.toLowerCase() == rawRotateDirection.toLowerCase(),
        orElse: () => RotateDirection.left
      );
    } else if (RotateDirection.values.contains(rawRotateDirection)) {
      tempRotateDirection = rawRotateDirection;
    }

    List<AspectRatioItem> tempAspectRatios = const [ // Default
      AspectRatioItem(text: 'Free', value: -1), AspectRatioItem(text: 'Original', value: 0.0),
      AspectRatioItem(text: '1*1', value: 1.0 / 1.0), AspectRatioItem(text: '4*3', value: 4.0 / 3.0),
      AspectRatioItem(text: '3*4', value: 3.0 / 4.0), AspectRatioItem(text: '16*9', value: 16.0 / 9.0),
      AspectRatioItem(text: '9*16', value: 9.0 / 16.0)
    ];
    dynamic rawList = json['aspectRatios'];
    if (rawList is List) {
      tempAspectRatios = rawList.map((item) {
        return AspectRatioItem.fromJson(item as Map<String,dynamic>);
      }).toList().cast<AspectRatioItem>();
    }

    return CropRotateEditorConfigs(
      desktopCornerDragArea: parseDouble(json['desktopCornerDragArea'], 7.0),
      mobileCornerDragArea: parseDouble(json['mobileCornerDragArea'], 48.0),
      enabled: parseBool(json['enabled'], true),
      showRotateButton: parseBool(json['showRotateButton'], true),
      showFlipButton: parseBool(json['showFlipButton'], true),
      showAspectRatioButton: parseBool(json['showAspectRatioButton'], true),
      showResetButton: parseBool(json['showResetButton'], true),
      invertMouseScroll: parseBool(json['invertMouseScroll'], false),
      invertDragDirection: parseBool(json['invertDragDirection'], false),
      enableRoundCropper: parseBool(json['enableRoundCropper'], false),
      enableTransformLayers: parseBool(json['enableTransformLayers'], true),
      enableProvideImageInfos: parseBool(json['enableProvideImageInfos'], false),
      enableDoubleTap: parseBool(json['enableDoubleTap'], true),
      showLayers: parseBool(json['showLayers'], true),
      initAspectRatio: json['initAspectRatio'] as double?,
      rotateAnimationCurve: parseCurve(json['rotateAnimationCurve'] as String?, Curves.decelerate),
      scaleAnimationCurve: parseCurve(json['scaleAnimationCurve'] as String?, Curves.decelerate),
      cropDragAnimationCurve: parseCurve(json['cropDragAnimationCurve'] as String?, Curves.decelerate),
      fadeInOutsideCropAreaAnimationCurve: parseCurve(json['fadeInOutsideCropAreaAnimationCurve'] as String?, Curves.decelerate),
      rotateDirection: tempRotateDirection,
      opacityOutsideCropAreaDuration: parseAnimationDuration(json['opacityOutsideCropAreaDuration'], const Duration(milliseconds: 100)),
      animationDuration: parseAnimationDuration(json['animationDuration'], const Duration(milliseconds: 250)),
      fadeInOutsideCropAreaAnimationDuration: parseAnimationDuration(json['fadeInOutsideCropAreaAnimationDuration'], const Duration(milliseconds: 350)),
      cropDragAnimationDuration: parseAnimationDuration(json['cropDragAnimationDuration'], const Duration(milliseconds: 400)),
      maxScale: parseDouble(json['maxScale'], 7.0),
      mouseScaleFactor: parseDouble(json['mouseScaleFactor'], 0.1),
      doubleTapScaleFactor: parseDouble(json['doubleTapScaleFactor'], 2.0),
      aspectRatios: tempAspectRatios,
      safeArea: json['safeArea'] != null ? EditorSafeArea.fromJson(json['safeArea'] is Map ? Map<String, dynamic>.from(json['safeArea'] as Map) : {}) : const EditorSafeArea(),
      style: json['style'] != null ? CropRotateEditorStyle.fromJson(json['style'] is Map ? Map<String, dynamic>.from(json['style'] as Map) : {}) : const CropRotateEditorStyle(),
      icons: json['icons'] != null ? CropRotateEditorIcons.fromJson(json['icons'] is Map ? Map<String, dynamic>.from(json['icons'] as Map) : {}) : const CropRotateEditorIcons(),
      widgets: json['widgets'] != null ? CropRotateEditorWidgets.fromJson(json['widgets'] is Map ? Map<String, dynamic>.from(json['widgets'] as Map) : {}) : const CropRotateEditorWidgets(),
      maxWidthFactor: json['maxWidthFactor'] as double?,
    );
  }
}
