import 'package:flet/flet.dart';
import 'package:flutter/material.dart'; // For ThemeData
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

  factory EmojiEditorConfigs.fromJson(ThemeData? theme, Map<String, dynamic> json) {
    List<CategoryEmoji> tempEmojiSet = const [];
    dynamic rawEmojiSet = json['emojiSet'];
    if (rawEmojiSet is List) {
      tempEmojiSet = rawEmojiSet.map((item) {
        return CategoryEmoji.fromJson(item is Map ? Map<String, dynamic>.from(item) : {});
      }).toList().cast<CategoryEmoji>();
    }

    return EmojiEditorConfigs(
      enabled: parseBool(json['enabled'], true),
      enablePreloadWebFont: parseBool(json['enablePreloadWebFont'], true),
      initScale: parseDouble(json['initScale'], 5.0),
      minScale: parseDouble(json['minScale'], double.negativeInfinity),
      maxScale: parseDouble(json['maxScale'], double.infinity),
      checkPlatformCompatibility: parseBool(json['checkPlatformCompatibility'], true),
      emojiSet: tempEmojiSet,
      style: json['style'] != null ? EmojiEditorStyle.fromJson(theme, json['style'] is Map ? Map<String, dynamic>.from(json['style'] as Map) : {}) : const EmojiEditorStyle(),
      icons: json['icons'] != null ? EmojiEditorIcons.fromJson(json['icons'] is Map ? Map<String, dynamic>.from(json['icons'] as Map) : {}) : const EmojiEditorIcons(),
    );
  }
}
