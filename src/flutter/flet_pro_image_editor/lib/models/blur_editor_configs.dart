import 'package:flet/flet.dart';
import './editor_safe_area.dart';
import './blur_editor_style.dart'; // Assuming this was created as a placeholder
import './blur_editor_icons.dart'; // Assuming this was created as a placeholder
import './blur_editor_widgets.dart'; // Assuming this was created as a placeholder

class BlurEditorConfigs {
  final bool enabled;
  final bool showLayers;
  final double maxBlur;
  final EditorSafeArea safeArea;
  final BlurEditorStyle style;
  final BlurEditorIcons icons;
  final BlurEditorWidgets widgets;

  const BlurEditorConfigs({
    this.enabled = true,
    this.showLayers = true,
    this.maxBlur = 5.0,
    this.safeArea = const EditorSafeArea(),
    this.style = const BlurEditorStyle(),
    this.icons = const BlurEditorIcons(),
    this.widgets = const BlurEditorWidgets(),
  });

  factory BlurEditorConfigs.fromJson(Map<String, dynamic> json) {
    return BlurEditorConfigs(
      enabled: parseBool(json['enabled'], true),
      showLayers: parseBool(json['showLayers'], true),
      maxBlur: parseDouble(json['maxBlur'], 5.0),
      safeArea: json['safeArea'] != null ? EditorSafeArea.fromJson(json['safeArea'] is Map ? Map<String, dynamic>.from(json['safeArea'] as Map) : {}) : const EditorSafeArea(),
      style: json['style'] != null ? BlurEditorStyle.fromJson(json['style'] is Map ? Map<String, dynamic>.from(json['style'] as Map) : {}) : const BlurEditorStyle(),
      icons: json['icons'] != null ? BlurEditorIcons.fromJson(json['icons'] is Map ? Map<String, dynamic>.from(json['icons'] as Map) : {}) : const BlurEditorIcons(),
      widgets: json['widgets'] != null ? BlurEditorWidgets.fromJson(json['widgets'] is Map ? Map<String, dynamic>.from(json['widgets'] as Map) : {}) : const BlurEditorWidgets(),
    );
  }
}
