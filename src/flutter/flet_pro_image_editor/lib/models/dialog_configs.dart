import '../utils/json_utils.dart' as utils;
import './dialog_widgets.dart'; // Assuming this was created as a placeholder
import './dialog_style.dart';   // Assuming this was created as a placeholder

class DialogConfigs {
  final DialogWidgets widgets;
  final DialogStyle style;

  const DialogConfigs({
    this.widgets = const DialogWidgets(),
    this.style = const DialogStyle(),
  });

  factory DialogConfigs.fromJson(Map<String, dynamic> json) {
    return DialogConfigs(
      widgets: json['widgets'] != null ? DialogWidgets.fromJson(utils.JsonUtils.parseMap(json['widgets'])) : const DialogWidgets(),
      style: json['style'] != null ? DialogStyle.fromJson(utils.JsonUtils.parseMap(json['style'])) : const DialogStyle(),
    );
  }
}
