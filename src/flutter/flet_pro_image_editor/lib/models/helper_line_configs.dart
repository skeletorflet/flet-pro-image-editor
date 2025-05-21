import '../utils/json_utils.dart' as utils;
import './helper_line_style.dart';

class HelperLineConfigs {
  final bool showVerticalLine;
  final bool showHorizontalLine;
  final bool showRotateLine;
  final HelperLineStyle style;

  const HelperLineConfigs({
    this.showVerticalLine = true,
    this.showHorizontalLine = true,
    this.showRotateLine = true,
    this.style = const HelperLineStyle(),
  });

  factory HelperLineConfigs.fromJson(Map<String, dynamic> json) {
    return HelperLineConfigs(
      showVerticalLine: utils.JsonUtils.parseBool(json['showVerticalLine'], true),
      showHorizontalLine: utils.JsonUtils.parseBool(json['showHorizontalLine'], true),
      showRotateLine: utils.JsonUtils.parseBool(json['showRotateLine'], true),
      style: json['style'] != null ? HelperLineStyle.fromJson(utils.JsonUtils.parseMap(json['style'])) : const HelperLineStyle(),
    );
  }
}
