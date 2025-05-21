import '../utils/json_utils.dart' as utils;
import './category_emoji.dart';
import './emoji_editor_style.dart'; // Assuming this was created as a placeholder
import './emoji_editor_icons.dart'; // Assuming this was created as a placeholder

class EmojiEditorConfigs {
  final bool enabled;
  final bool enablePreloadWebFont;
  final double initScale;
  final double minScale;
  final double maxScale;
  final bool checkPlatformCompatibility;
  final List<CategoryEmoji> emojiSet;
  final EmojiEditorStyle style;
  final EmojiEditorIcons icons;

  const EmojiEditorConfigs({
    this.enabled = true,
    this.enablePreloadWebFont = true,
    this.initScale = 5.0,
    this.minScale = double.negativeInfinity,
    this.maxScale = double.infinity,
    this.checkPlatformCompatibility = true,
    this.emojiSet = const [],
    this.style = const EmojiEditorStyle(),
    this.icons = const EmojiEditorIcons(),
  });

  factory EmojiEditorConfigs.fromJson(Map<String, dynamic> json) {
    return EmojiEditorConfigs(
      enabled: utils.JsonUtils.parseBool(json['enabled'], true),
      enablePreloadWebFont: utils.JsonUtils.parseBool(json['enablePreloadWebFont'], true),
      initScale: utils.JsonUtils.parseDouble(json['initScale'], 5.0),
      minScale: utils.JsonUtils.parseDouble(json['minScale'], double.negativeInfinity),
      maxScale: utils.JsonUtils.parseDouble(json['maxScale'], double.infinity),
      checkPlatformCompatibility: utils.JsonUtils.parseBool(json['checkPlatformCompatibility'], true),
      emojiSet: utils.JsonUtils.parseList<CategoryEmoji>(json['emojiSet'], (item) => CategoryEmoji.fromJson(utils.JsonUtils.parseMap(item)), []),
      style: json['style'] != null ? EmojiEditorStyle.fromJson(utils.JsonUtils.parseMap(json['style'])) : const EmojiEditorStyle(),
      icons: json['icons'] != null ? EmojiEditorIcons.fromJson(utils.JsonUtils.parseMap(json['icons'])) : const EmojiEditorIcons(),
    );
  }
}
