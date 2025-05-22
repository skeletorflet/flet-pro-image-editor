import 'package:flet/flet.dart';

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
      top: parseBool(json['top'], true),
      left: parseBool(json['left'], true),
      right: parseBool(json['right'], true),
      bottom: parseBool(json['bottom'], true),
    );
  }
}
