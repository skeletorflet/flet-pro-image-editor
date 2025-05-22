import 'package:flet/flet.dart';

// Consider Flutter's Size if appropriate, but this is a simple data class
class Size { 
  final double width;
  final double height;

  const Size({
    required this.width,
    required this.height,
  });

  factory Size.fromJson(Map<String, dynamic> json) {
    return Size(
      width: parseDouble(json['width'], 0.0),
      height: parseDouble(json['height'], 0.0),
    );
  }
}
