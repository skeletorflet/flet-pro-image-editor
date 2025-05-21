import '../utils/json_utils.dart' as utils;

class AspectRatioItem {
  final String text;
  final double value;

  const AspectRatioItem({
    required this.text,
    required this.value,
  });

  factory AspectRatioItem.fromJson(Map<String, dynamic> json) {
    return AspectRatioItem(
      text: utils.JsonUtils.parseString(json['text'], ''),
      value: utils.JsonUtils.parseDouble(json['value'], 0.0),
    );
  }
}
