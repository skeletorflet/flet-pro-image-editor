import 'package:flet/flet.dart';

class AspectRatioItem {
  final String text;
  final double value;

  const AspectRatioItem({
    required this.text,
    required this.value,
  });

  factory AspectRatioItem.fromJson(Map<String, dynamic> json) {
    return AspectRatioItem(
      text: parseString(json['text'] as String?, ''),
      value: parseDouble(json['value'], 0.0),
    );
  }
}
