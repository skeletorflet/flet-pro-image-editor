import '../utils/json_utils.dart' as utils;
// Import other necessary models if they become non-placeholders
// e.g., TuneEditorStyle, TuneEditorIcons, TuneEditorWidgets

class TuneEditorConfigs {
  final bool enabled;
  // Define other properties based on actual Dart class if it's not a placeholder
  // final TuneEditorStyle style;
  // final TuneEditorIcons icons;
  // final TuneEditorWidgets widgets;

  const TuneEditorConfigs({
    this.enabled = true,
    // this.style = const TuneEditorStyle(), // If style is a class
    // this.icons = const TuneEditorIcons(), // If icons is a class
    // this.widgets = const TuneEditorWidgets(), // If widgets is a class
  });

  factory TuneEditorConfigs.fromJson(Map<String, dynamic> json) {
    return TuneEditorConfigs(
      enabled: utils.JsonUtils.parseBool(json['enabled'], true),
      // style: json['style'] != null ? TuneEditorStyle.fromJson(utils.JsonUtils.parseMap(json['style'])) : const TuneEditorStyle(),
      // icons: json['icons'] != null ? TuneEditorIcons.fromJson(utils.JsonUtils.parseMap(json['icons'])) : const TuneEditorIcons(),
      // widgets: json['widgets'] != null ? TuneEditorWidgets.fromJson(utils.JsonUtils.parseMap(json['widgets'])) : const TuneEditorWidgets(),
    );
  }
}
