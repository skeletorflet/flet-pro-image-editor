import '../utils/json_utils.dart' as utils;
import './i18n/i18n.dart';
import './main_editor_configs.dart';
import './paint_editor_configs.dart';
import './text_editor_configs.dart';
import './crop_rotate_editor_configs.dart';
import './filter_editor_configs.dart';
import './tune_editor_configs.dart';
import './blur_editor_configs.dart';
import './emoji_editor_configs.dart';
import './sticker_editor_configs.dart';
import './state_history_configs.dart';
import './image_generation_configs.dart';
import './helper_line_configs.dart';
import './layer_interaction_configs.dart';
import './dialog_configs.dart';
import './progress_indicator_configs.dart';
import './video_editor_configs.dart';
import 'package:flutter/material.dart'; // For Color, used in ThemeData placeholder

// Ensure ImageEditorDesignMode enum is also in this file or correctly imported
enum ImageEditorDesignMode { material, cupertino }

// Ensure placeholder ThemeData is also in this file or correctly imported
class ThemeData {
  final Color? primaryColor; // Example field for parsing
  const ThemeData({this.primaryColor});

  factory ThemeData.fromJson(Map<String,dynamic> json) {
    // Example parsing for a potential 'primary_color' key
    return ThemeData(
      primaryColor: json.containsKey('primary_color') ? utils.JsonUtils.parseColor(json['primary_color']) : null
    );
  }
}

class ProImageEditorConfigs {
  final ThemeData? theme;
  final String heroTag;
  final I18n i18n;
  final MainEditorConfigs mainEditor;
  final PaintEditorConfigs paintEditor;
  final TextEditorConfigs textEditor;
  final CropRotateEditorConfigs cropRotateEditor;
  final FilterEditorConfigs filterEditor;
  final TuneEditorConfigs tuneEditor;
  final BlurEditorConfigs blurEditor;
  final EmojiEditorConfigs emojiEditor;
  final StickerEditorConfigs stickerEditor;
  final StateHistoryConfigs stateHistory;
  final ImageGenerationConfigs imageGeneration;
  final HelperLineConfigs helperLines;
  final LayerInteractionConfigs layerInteraction;
  final DialogConfigs dialogConfigs;
  final ProgressIndicatorConfigs progressIndicatorConfigs;
  final VideoEditorConfigs videoEditor;
  final ImageEditorDesignMode designMode;

  const ProImageEditorConfigs({
    this.theme,
    this.heroTag = 'Pro-Image-Editor-Hero',
    this.i18n = const I18n(),
    this.mainEditor = const MainEditorConfigs(),
    this.paintEditor = const PaintEditorConfigs(),
    this.textEditor = const TextEditorConfigs(),
    this.cropRotateEditor = const CropRotateEditorConfigs(),
    this.filterEditor = const FilterEditorConfigs(),
    this.tuneEditor = const TuneEditorConfigs(),
    this.blurEditor = const BlurEditorConfigs(),
    this.emojiEditor = const EmojiEditorConfigs(),
    this.stickerEditor = const StickerEditorConfigs(),
    this.stateHistory = const StateHistoryConfigs(),
    this.imageGeneration = const ImageGenerationConfigs(),
    this.helperLines = const HelperLineConfigs(),
    this.layerInteraction = const LayerInteractionConfigs(),
    this.dialogConfigs = const DialogConfigs(),
    this.progressIndicatorConfigs = const ProgressIndicatorConfigs(),
    this.videoEditor = const VideoEditorConfigs(enabled: false),
    this.designMode = ImageEditorDesignMode.material,
  });

  factory ProImageEditorConfigs.fromJson(Map<String, dynamic> json) {
    ThemeData? parsedTheme;
    if (json['theme'] != null && json['theme'] is Map && (json['theme'] as Map).isNotEmpty) {
      // Ensure ThemeData itself has a fromJson and is imported
      parsedTheme = ThemeData.fromJson(utils.JsonUtils.parseMap(json['theme']));
    }

    return ProImageEditorConfigs(
      theme: parsedTheme,
      heroTag: utils.JsonUtils.parseString(json['heroTag'], 'Pro-Image-Editor-Hero'),
      i18n: json['i18n'] != null ? I18n.fromJson(utils.JsonUtils.parseMap(json['i18n'])) : const I18n(),
      mainEditor: json['mainEditor'] != null ? MainEditorConfigs.fromJson(utils.JsonUtils.parseMap(json['mainEditor'])) : const MainEditorConfigs(),
      paintEditor: json['paintEditor'] != null ? PaintEditorConfigs.fromJson(utils.JsonUtils.parseMap(json['paintEditor'])) : const PaintEditorConfigs(),
      textEditor: json['textEditor'] != null ? TextEditorConfigs.fromJson(utils.JsonUtils.parseMap(json['textEditor'])) : const TextEditorConfigs(),
      cropRotateEditor: json['cropRotateEditor'] != null ? CropRotateEditorConfigs.fromJson(utils.JsonUtils.parseMap(json['cropRotateEditor'])) : const CropRotateEditorConfigs(),
      filterEditor: json['filterEditor'] != null ? FilterEditorConfigs.fromJson(utils.JsonUtils.parseMap(json['filterEditor'])) : const FilterEditorConfigs(),
      tuneEditor: json['tuneEditor'] != null ? TuneEditorConfigs.fromJson(utils.JsonUtils.parseMap(json['tuneEditor'])) : const TuneEditorConfigs(),
      blurEditor: json['blurEditor'] != null ? BlurEditorConfigs.fromJson(utils.JsonUtils.parseMap(json['blurEditor'])) : const BlurEditorConfigs(),
      emojiEditor: json['emojiEditor'] != null ? EmojiEditorConfigs.fromJson(utils.JsonUtils.parseMap(json['emojiEditor'])) : const EmojiEditorConfigs(),
      stickerEditor: json['stickerEditor'] != null ? StickerEditorConfigs.fromJson(utils.JsonUtils.parseMap(json['stickerEditor'])) : const StickerEditorConfigs(),
      stateHistory: json['stateHistory'] != null ? StateHistoryConfigs.fromJson(utils.JsonUtils.parseMap(json['stateHistory'])) : const StateHistoryConfigs(),
      imageGeneration: json['imageGeneration'] != null ? ImageGenerationConfigs.fromJson(utils.JsonUtils.parseMap(json['imageGeneration'])) : const ImageGenerationConfigs(),
      helperLines: json['helperLines'] != null ? HelperLineConfigs.fromJson(utils.JsonUtils.parseMap(json['helperLines'])) : const HelperLineConfigs(),
      layerInteraction: json['layerInteraction'] != null ? LayerInteractionConfigs.fromJson(utils.JsonUtils.parseMap(json['layerInteraction'])) : const LayerInteractionConfigs(),
      dialogConfigs: json['dialogConfigs'] != null ? DialogConfigs.fromJson(utils.JsonUtils.parseMap(json['dialogConfigs'])) : const DialogConfigs(),
      progressIndicatorConfigs: json['progressIndicatorConfigs'] != null ? ProgressIndicatorConfigs.fromJson(utils.JsonUtils.parseMap(json['progressIndicatorConfigs'])) : const ProgressIndicatorConfigs(),
      videoEditor: json['videoEditor'] != null ? VideoEditorConfigs.fromJson(utils.JsonUtils.parseMap(json['videoEditor'])) : const VideoEditorConfigs(enabled: false),
      designMode: utils.JsonUtils.parseEnum(ImageEditorDesignMode.values, json['designMode'], ImageEditorDesignMode.material),
    );
  }
}
