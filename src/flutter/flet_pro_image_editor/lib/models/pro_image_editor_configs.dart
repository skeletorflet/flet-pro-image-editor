import 'package:flet/flet.dart';
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

class ProImageEditorConfigs {
  final ThemeData? theme; // This will be populated by the theme from Flet context
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

  factory ProImageEditorConfigs.fromJson(ThemeData? theme, Map<String, dynamic> json) {
    ImageEditorDesignMode tempDesignMode = ImageEditorDesignMode.material;
    dynamic rawDesignMode = json['designMode'];
    if (rawDesignMode is String) {
      tempDesignMode = ImageEditorDesignMode.values.firstWhere(
        (e) => e.toString().split('.').last.toLowerCase() == rawDesignMode.toLowerCase(),
        orElse: () => ImageEditorDesignMode.material
      );
    } else if (ImageEditorDesignMode.values.contains(rawDesignMode)) {
      tempDesignMode = rawDesignMode;
    }

    return ProImageEditorConfigs(
      theme: theme, // Use the theme passed from Flet context
      heroTag: parseString(json['heroTag'] as String?, 'Pro-Image-Editor-Hero'),
      i18n: json['i18n'] != null ? I18n.fromJson(json['i18n'] is Map ? Map<String, dynamic>.from(json['i18n'] as Map) : {}) : const I18n(),
      mainEditor: json['mainEditor'] != null ? MainEditorConfigs.fromJson(theme, json['mainEditor'] is Map ? Map<String, dynamic>.from(json['mainEditor'] as Map) : {}) : const MainEditorConfigs(),
      paintEditor: json['paintEditor'] != null ? PaintEditorConfigs.fromJson(theme, json['paintEditor'] is Map ? Map<String, dynamic>.from(json['paintEditor'] as Map) : {}) : const PaintEditorConfigs(),
      textEditor: json['textEditor'] != null ? TextEditorConfigs.fromJson(theme, json['textEditor'] is Map ? Map<String, dynamic>.from(json['textEditor'] as Map) : {}) : const TextEditorConfigs(),
      cropRotateEditor: json['cropRotateEditor'] != null ? CropRotateEditorConfigs.fromJson(theme, json['cropRotateEditor'] is Map ? Map<String, dynamic>.from(json['cropRotateEditor'] as Map) : {}) : const CropRotateEditorConfigs(),
      filterEditor: json['filterEditor'] != null ? FilterEditorConfigs.fromJson(theme, json['filterEditor'] is Map ? Map<String, dynamic>.from(json['filterEditor'] as Map) : {}) : const FilterEditorConfigs(),
      tuneEditor: json['tuneEditor'] != null ? TuneEditorConfigs.fromJson(theme, json['tuneEditor'] is Map ? Map<String, dynamic>.from(json['tuneEditor'] as Map) : {}) : const TuneEditorConfigs(),
      blurEditor: json['blurEditor'] != null ? BlurEditorConfigs.fromJson(theme, json['blurEditor'] is Map ? Map<String, dynamic>.from(json['blurEditor'] as Map) : {}) : const BlurEditorConfigs(),
      emojiEditor: json['emojiEditor'] != null ? EmojiEditorConfigs.fromJson(theme, json['emojiEditor'] is Map ? Map<String, dynamic>.from(json['emojiEditor'] as Map) : {}) : const EmojiEditorConfigs(),
      stickerEditor: json['stickerEditor'] != null ? StickerEditorConfigs.fromJson(theme, json['stickerEditor'] is Map ? Map<String, dynamic>.from(json['stickerEditor'] as Map) : {}) : const StickerEditorConfigs(),
      stateHistory: json['stateHistory'] != null ? StateHistoryConfigs.fromJson(json['stateHistory'] is Map ? Map<String, dynamic>.from(json['stateHistory'] as Map) : {}) : const StateHistoryConfigs(),
      imageGeneration: json['imageGeneration'] != null ? ImageGenerationConfigs.fromJson(theme, json['imageGeneration'] is Map ? Map<String, dynamic>.from(json['imageGeneration'] as Map) : {}) : const ImageGenerationConfigs(),
      helperLines: json['helperLines'] != null ? HelperLineConfigs.fromJson(theme, json['helperLines'] is Map ? Map<String, dynamic>.from(json['helperLines'] as Map) : {}) : const HelperLineConfigs(),
      layerInteraction: json['layerInteraction'] != null ? LayerInteractionConfigs.fromJson(theme, json['layerInteraction'] is Map ? Map<String, dynamic>.from(json['layerInteraction'] as Map) : {}) : const LayerInteractionConfigs(),
      dialogConfigs: json['dialogConfigs'] != null ? DialogConfigs.fromJson(theme, json['dialogConfigs'] is Map ? Map<String, dynamic>.from(json['dialogConfigs'] as Map) : {}) : const DialogConfigs(),
      progressIndicatorConfigs: json['progressIndicatorConfigs'] != null ? ProgressIndicatorConfigs.fromJson(theme, json['progressIndicatorConfigs'] is Map ? Map<String, dynamic>.from(json['progressIndicatorConfigs'] as Map) : {}) : const ProgressIndicatorConfigs(),
      videoEditor: json['videoEditor'] != null ? VideoEditorConfigs.fromJson(json['videoEditor'] is Map ? Map<String, dynamic>.from(json['videoEditor'] as Map) : {}) : const VideoEditorConfigs(enabled: false),
      designMode: tempDesignMode,
    );
  }
}
