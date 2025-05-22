import 'package:flet/flet.dart';
import './i18n_layer_interaction.dart';
import './i18n_paint_editor.dart';
import './i18n_text_editor.dart';
import './i18n_crop_rotate_editor.dart';
import './i18n_filter_editor.dart';
import './i18n_tune_editor.dart';
import './i18n_blur_editor.dart';
import './i18n_emoji_editor.dart';
import './i18n_sticker_editor.dart';
import './i18n_various.dart';

class I18n {
  final I18nLayerInteraction layerInteraction;
  final I18nPaintEditor paintEditor;
  final I18nTextEditor textEditor;
  final I18nCropRotateEditor cropRotateEditor;
  final I18nTuneEditor tuneEditor;
  final I18nFilterEditor filterEditor;
  final I18nBlurEditor blurEditor;
  final I18nEmojiEditor emojiEditor;
  final I18nStickerEditor stickerEditor;
  final I18nVarious various;
  final String importStateHistoryMsg;
  final String cancel;
  final String undo;
  final String redo;
  final String done;
  final String remove;
  final String doneLoadingMsg;

  const I18n({
    this.layerInteraction = const I18nLayerInteraction(),
    this.paintEditor = const I18nPaintEditor(),
    this.textEditor = const I18nTextEditor(),
    this.cropRotateEditor = const I18nCropRotateEditor(),
    this.tuneEditor = const I18nTuneEditor(),
    this.filterEditor = const I18nFilterEditor(),
    this.blurEditor = const I18nBlurEditor(),
    this.emojiEditor = const I18nEmojiEditor(),
    this.stickerEditor = const I18nStickerEditor(),
    this.various = const I18nVarious(),
    this.importStateHistoryMsg = 'Initialize Editor',
    this.cancel = 'Cancel',
    this.undo = 'Undo',
    this.redo = 'Redo',
    this.done = 'Done',
    this.remove = 'Remove',
    this.doneLoadingMsg = 'Changes are being applied',
  });

  factory I18n.fromJson(Map<String, dynamic> json) {
    return I18n(
      layerInteraction: json['layerInteraction'] != null
          ? I18nLayerInteraction.fromJson(json['layerInteraction'] is Map ? Map<String, dynamic>.from(json['layerInteraction'] as Map) : {})
          : const I18nLayerInteraction(),
      paintEditor: json['paintEditor'] != null
          ? I18nPaintEditor.fromJson(json['paintEditor'] is Map ? Map<String, dynamic>.from(json['paintEditor'] as Map) : {})
          : const I18nPaintEditor(),
      textEditor: json['textEditor'] != null
          ? I18nTextEditor.fromJson(json['textEditor'] is Map ? Map<String, dynamic>.from(json['textEditor'] as Map) : {})
          : const I18nTextEditor(),
      cropRotateEditor: json['cropRotateEditor'] != null
          ? I18nCropRotateEditor.fromJson(json['cropRotateEditor'] is Map ? Map<String, dynamic>.from(json['cropRotateEditor'] as Map) : {})
          : const I18nCropRotateEditor(),
      tuneEditor: json['tuneEditor'] != null
          ? I18nTuneEditor.fromJson(json['tuneEditor'] is Map ? Map<String, dynamic>.from(json['tuneEditor'] as Map) : {})
          : const I18nTuneEditor(),
      filterEditor: json['filterEditor'] != null
          ? I18nFilterEditor.fromJson(json['filterEditor'] is Map ? Map<String, dynamic>.from(json['filterEditor'] as Map) : {})
          : const I18nFilterEditor(),
      blurEditor: json['blurEditor'] != null
          ? I18nBlurEditor.fromJson(json['blurEditor'] is Map ? Map<String, dynamic>.from(json['blurEditor'] as Map) : {})
          : const I18nBlurEditor(),
      emojiEditor: json['emojiEditor'] != null
          ? I18nEmojiEditor.fromJson(json['emojiEditor'] is Map ? Map<String, dynamic>.from(json['emojiEditor'] as Map) : {})
          : const I18nEmojiEditor(),
      stickerEditor: json['stickerEditor'] != null
          ? I18nStickerEditor.fromJson(json['stickerEditor'] is Map ? Map<String, dynamic>.from(json['stickerEditor'] as Map) : {})
          : const I18nStickerEditor(),
      various: json['various'] != null
          ? I18nVarious.fromJson(json['various'] is Map ? Map<String, dynamic>.from(json['various'] as Map) : {})
          : const I18nVarious(),
      importStateHistoryMsg: parseString(json['importStateHistoryMsg'] as String?, 'Initialize Editor'),
      cancel: parseString(json['cancel'] as String?, 'Cancel'),
      undo: parseString(json['undo'] as String?, 'Undo'),
      redo: parseString(json['redo'] as String?, 'Redo'),
      done: parseString(json['done'] as String?, 'Done'),
      remove: parseString(json['remove'] as String?, 'Remove'),
      doneLoadingMsg: parseString(json['doneLoadingMsg'] as String?, 'Changes are being applied'),
    );
  }
}
