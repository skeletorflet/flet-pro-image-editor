import '../utils/json_utils.dart' as utils;
import './progress_indicator_widgets.dart'; // Assuming this was created as a placeholder

class ProgressIndicatorConfigs {
  final ProgressIndicatorWidgets widgets;

  const ProgressIndicatorConfigs({
    this.widgets = const ProgressIndicatorWidgets(),
  });

  factory ProgressIndicatorConfigs.fromJson(Map<String, dynamic> json) {
    return ProgressIndicatorConfigs(
      widgets: json['widgets'] != null ? ProgressIndicatorWidgets.fromJson(utils.JsonUtils.parseMap(json['widgets'])) : const ProgressIndicatorWidgets(),
    );
  }
}
