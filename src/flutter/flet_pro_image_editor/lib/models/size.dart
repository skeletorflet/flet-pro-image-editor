import '../utils/json_utils.dart' as utils;

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
      width: utils.JsonUtils.parseDouble(json['width'], 0.0),
      height: utils.JsonUtils.parseDouble(json['height'], 0.0),
    );
  }
}
