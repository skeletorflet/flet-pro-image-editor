import '../utils/json_utils.dart' as utils;

class EditorSafeArea {
  final bool top;
  final bool left;
  final bool right;
  final bool bottom;

  const EditorSafeArea({
    this.top = true,
    this.left = true,
    this.right = true,
    this.bottom = true,
  });

  factory EditorSafeArea.fromJson(Map<String, dynamic> json) {
    return EditorSafeArea(
      top: utils.JsonUtils.parseBool(json['top'], true),
      left: utils.JsonUtils.parseBool(json['left'], true),
      right: utils.JsonUtils.parseBool(json['right'], true),
      bottom: utils.JsonUtils.parseBool(json['bottom'], true),
    );
  }
}
