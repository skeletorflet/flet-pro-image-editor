import 'package:flet/flet.dart';
import 'package:flutter/material.dart'; // For ThemeData
import './sticker_editor_style.dart'; // Assuming this was created as a placeholder
import './sticker_editor_icons.dart'; // Assuming this was created as a placeholder

class StickerEditorConfigs {
  // final Function? buildStickers; // Placeholder for complex callback, cannot be easily serialized/deserialized from JSON
  final double initWidth;
  final double minScale;
  final double maxScale;
  final bool enabled;
  final StickerEditorStyle style;
  final StickerEditorIcons icons;

  const StickerEditorConfigs({
    // this.buildStickers,
    this.initWidth = 100.0,
    this.minScale = double.negativeInfinity,
    this.maxScale = double.infinity,
    this.enabled = false, // Default to false as per Python
    this.style = const StickerEditorStyle(),
    this.icons = const StickerEditorIcons(),
  });

  factory StickerEditorConfigs.fromJson(ThemeData? theme, Map<String, dynamic> json) {
    return StickerEditorConfigs(
      // buildStickers: null, // Cannot deserialize Python Callable to Dart Function easily
      initWidth: parseDouble(json['initWidth'], 100.0),
      minScale: parseDouble(json['minScale'], double.negativeInfinity),
      maxScale: parseDouble(json['maxScale'], double.infinity),
      enabled: parseBool(json['enabled'], false),
      style: json['style'] != null ? StickerEditorStyle.fromJson(theme, json['style'] is Map ? Map<String, dynamic>.from(json['style'] as Map) : {}) : const StickerEditorStyle(),
      icons: json['icons'] != null ? StickerEditorIcons.fromJson(json['icons'] is Map ? Map<String, dynamic>.from(json['icons'] as Map) : {}) : const StickerEditorIcons(),
    );
  }
}
