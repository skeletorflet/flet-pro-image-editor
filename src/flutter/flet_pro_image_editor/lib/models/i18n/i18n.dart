import '../../utils/json_utils.dart' as utils;
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
          ? I18nLayerInteraction.fromJson(utils.JsonUtils.parseMap(json['layerInteraction']))
          : const I18nLayerInteraction(),
      paintEditor: json['paintEditor'] != null
          ? I18nPaintEditor.fromJson(utils.JsonUtils.parseMap(json['paintEditor']))
          : const I18nPaintEditor(),
      textEditor: json['textEditor'] != null
          ? I18nTextEditor.fromJson(utils.JsonUtils.parseMap(json['textEditor']))
          : const I18nTextEditor(),
      cropRotateEditor: json['cropRotateEditor'] != null
          ? I18nCropRotateEditor.fromJson(utils.JsonUtils.parseMap(json['cropRotateEditor']))
          : const I18nCropRotateEditor(),
      tuneEditor: json['tuneEditor'] != null
          ? I18nTuneEditor.fromJson(utils.JsonUtils.parseMap(json['tuneEditor']))
          : const I18nTuneEditor(),
      filterEditor: json['filterEditor'] != null
          ? I18nFilterEditor.fromJson(utils.JsonUtils.parseMap(json['filterEditor']))
          : const I18nFilterEditor(),
      blurEditor: json['blurEditor'] != null
          ? I18nBlurEditor.fromJson(utils.JsonUtils.parseMap(json['blurEditor']))
          : const I18nBlurEditor(),
      emojiEditor: json['emojiEditor'] != null
          ? I18nEmojiEditor.fromJson(utils.JsonUtils.parseMap(json['emojiEditor']))
          : const I18nEmojiEditor(),
      stickerEditor: json['stickerEditor'] != null
          ? I18nStickerEditor.fromJson(utils.JsonUtils.parseMap(json['stickerEditor']))
          : const I18nStickerEditor(),
      various: json['various'] != null
          ? I18nVarious.fromJson(utils.JsonUtils.parseMap(json['various']))
          : const I18nVarious(),
      importStateHistoryMsg: utils.JsonUtils.parseString(json['importStateHistoryMsg'], 'Initialize Editor'),
      cancel: utils.JsonUtils.parseString(json['cancel'], 'Cancel'),
      undo: utils.JsonUtils.parseString(json['undo'], 'Undo'),
      redo: utils.JsonUtils.parseString(json['redo'], 'Redo'),
      done: utils.JsonUtils.parseString(json['done'], 'Done'),
      remove: utils.JsonUtils.parseString(json['remove'], 'Remove'),
      doneLoadingMsg: utils.JsonUtils.parseString(json['doneLoadingMsg'], 'Changes are being applied'),
    );
  }
}
