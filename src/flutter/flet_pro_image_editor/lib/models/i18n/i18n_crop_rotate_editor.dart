import '../../utils/json_utils.dart' as utils;

class I18nCropRotateEditor {
  final String bottomNavigationBarText;
  final String rotate;
  final String flip;
  final String ratio;
  final String back;
  final String done;
  final String cancel;
  final String undo;
  final String redo;
  final String smallScreenMoreTooltip;
  final String reset;

  const I18nCropRotateEditor({
    this.bottomNavigationBarText = 'Crop/ Rotate',
    this.rotate = 'Rotate',
    this.flip = 'Flip',
    this.ratio = 'Ratio',
    this.back = 'Back',
    this.done = 'Done',
    this.cancel = 'Cancel',
    this.undo = 'Undo',
    this.redo = 'Redo',
    this.smallScreenMoreTooltip = 'More',
    this.reset = 'Reset',
  });

  factory I18nCropRotateEditor.fromJson(Map<String, dynamic> json) {
    return I18nCropRotateEditor(
      bottomNavigationBarText: utils.JsonUtils.parseString(json['bottomNavigationBarText'], 'Crop/ Rotate'),
      rotate: utils.JsonUtils.parseString(json['rotate'], 'Rotate'),
      flip: utils.JsonUtils.parseString(json['flip'], 'Flip'),
      ratio: utils.JsonUtils.parseString(json['ratio'], 'Ratio'),
      back: utils.JsonUtils.parseString(json['back'], 'Back'),
      done: utils.JsonUtils.parseString(json['done'], 'Done'),
      cancel: utils.JsonUtils.parseString(json['cancel'], 'Cancel'),
      undo: utils.JsonUtils.parseString(json['undo'], 'Undo'),
      redo: utils.JsonUtils.parseString(json['redo'], 'Redo'),
      smallScreenMoreTooltip: utils.JsonUtils.parseString(json['smallScreenMoreTooltip'], 'More'),
      reset: utils.JsonUtils.parseString(json['reset'], 'Reset'),
    );
  }
}
