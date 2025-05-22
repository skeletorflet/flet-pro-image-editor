import 'package:flet/flet.dart';

class I18nTextEditor {
  final String inputHintText;
  final String bottomNavigationBarText;
  final String back;
  final String done;
  final String textAlign;
  final String fontScale;
  final String backgroundMode;
  final String smallScreenMoreTooltip;

  const I18nTextEditor({
    this.inputHintText = 'Enter text',
    this.bottomNavigationBarText = 'Text',
    this.back = 'Back',
    this.done = 'Done',
    this.textAlign = 'Align text',
    this.fontScale = 'Font scale',
    this.backgroundMode = 'Background mode',
    this.smallScreenMoreTooltip = 'More',
  });

  factory I18nTextEditor.fromJson(Map<String, dynamic> json) {
    return I18nTextEditor(
      inputHintText: parseString(json['inputHintText'] as String?, 'Enter text'),
      bottomNavigationBarText: parseString(json['bottomNavigationBarText'] as String?, 'Text'),
      back: parseString(json['back'] as String?, 'Back'),
      done: parseString(json['done'] as String?, 'Done'),
      textAlign: parseString(json['textAlign'] as String?, 'Align text'),
      fontScale: parseString(json['fontScale'] as String?, 'Font scale'),
      backgroundMode: parseString(json['backgroundMode'] as String?, 'Background mode'),
      smallScreenMoreTooltip: parseString(json['smallScreenMoreTooltip'] as String?, 'More'),
    );
  }
}
