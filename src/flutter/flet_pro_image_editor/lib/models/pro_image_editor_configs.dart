import '../utils/json_utils.dart' as utils;
import './i18n/i18n.dart'; // Assuming I18n and its sub-models are in models/i18n/
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

// Define enums used by this config class, if not already defined globally
// For example, if pro_image_editor package doesn't directly export these for easy use here.
enum ImageEditorDesignMode {
  material,
  cupertino,
}

// Placeholder for ThemeData - In a real scenario, this would be more complex
// or use Flutter's ThemeData if applicable and parsable.
class ThemeData {
  final Color? primaryColor; // Example field
  const ThemeData({this.primaryColor});

  factory ThemeData.fromJson(Map<String, dynamic> json) {
    // Only parse if specific known keys are present, otherwise it's not a meaningful theme from Python
    if (json.containsKey('primary_color')) { // Example key
      return ThemeData(primaryColor: utils.JsonUtils.parseColor(json['primary_color']));
    }
    // If no recognizable keys, return a default or indication that it's not a valid theme from json
    return const ThemeData(); // Default empty theme
  }
}

class ProImageEditorConfigs {
  final ThemeData? theme; // Nullable, placeholder
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
    this.theme, // Default is null for placeholder
    this.heroTag = 'Pro-Image-Editor-Hero', // kImageEditorHeroTag
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
    this.videoEditor = const VideoEditorConfigs(enabled: false), // Default to disabled
    this.designMode = ImageEditorDesignMode.material,
  });

  factory ProImageEditorConfigs.fromJson(Map<String, dynamic> json) {
    return ProImageEditorConfigs(
      theme: json['theme'] != null && json['theme'] is Map && (json['theme'] as Map).isNotEmpty
        ? ThemeData.fromJson(utils.JsonUtils.parseMap(json['theme'])) // Assumes ThemeData.fromJson exists and can handle the map from Python
        : null, // Explicitly null if not provided or empty map, allowing Dart default to apply.
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
