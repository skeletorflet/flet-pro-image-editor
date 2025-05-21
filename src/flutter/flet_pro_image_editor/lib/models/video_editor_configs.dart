import '../utils/json_utils.dart' as utils;

class VideoEditorConfigs {
  final bool enabled;

  const VideoEditorConfigs({
    this.enabled = false, // Default to false as per Python and prompt
  });

  factory VideoEditorConfigs.fromJson(Map<String, dynamic> json) {
    return VideoEditorConfigs(
      enabled: utils.JsonUtils.parseBool(json['enabled'], false),
    );
  }
}
