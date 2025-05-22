import 'package:flet/flet.dart';

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
      bottomNavigationBarText: parseString(json['bottomNavigationBarText'] as String?, 'Crop/ Rotate'),
      rotate: parseString(json['rotate'] as String?, 'Rotate'),
      flip: parseString(json['flip'] as String?, 'Flip'),
      ratio: parseString(json['ratio'] as String?, 'Ratio'),
      back: parseString(json['back'] as String?, 'Back'),
      done: parseString(json['done'] as String?, 'Done'),
      cancel: parseString(json['cancel'] as String?, 'Cancel'),
      undo: parseString(json['undo'] as String?, 'Undo'),
      redo: parseString(json['redo'] as String?, 'Redo'),
      smallScreenMoreTooltip: parseString(json['smallScreenMoreTooltip'] as String?, 'More'),
      reset: parseString(json['reset'] as String?, 'Reset'),
    );
  }
}
