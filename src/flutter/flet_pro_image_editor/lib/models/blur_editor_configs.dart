import '../utils/json_utils.dart' as utils;
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
      enabled: utils.JsonUtils.parseBool(json['enabled'], true),
      showLayers: utils.JsonUtils.parseBool(json['showLayers'], true),
      maxBlur: utils.JsonUtils.parseDouble(json['maxBlur'], 5.0),
      safeArea: json['safeArea'] != null ? EditorSafeArea.fromJson(utils.JsonUtils.parseMap(json['safeArea'])) : const EditorSafeArea(),
      style: json['style'] != null ? BlurEditorStyle.fromJson(utils.JsonUtils.parseMap(json['style'])) : const BlurEditorStyle(),
      icons: json['icons'] != null ? BlurEditorIcons.fromJson(utils.JsonUtils.parseMap(json['icons'])) : const BlurEditorIcons(),
      widgets: json['widgets'] != null ? BlurEditorWidgets.fromJson(utils.JsonUtils.parseMap(json['widgets'])) : const BlurEditorWidgets(),
    );
  }
}
