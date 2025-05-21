import '../../utils/json_utils.dart' as utils;

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
      inputHintText: utils.JsonUtils.parseString(json['inputHintText'], 'Enter text'),
      bottomNavigationBarText: utils.JsonUtils.parseString(json['bottomNavigationBarText'], 'Text'),
      back: utils.JsonUtils.parseString(json['back'], 'Back'),
      done: utils.JsonUtils.parseString(json['done'], 'Done'),
      textAlign: utils.JsonUtils.parseString(json['textAlign'], 'Align text'),
      fontScale: utils.JsonUtils.parseString(json['fontScale'], 'Font scale'),
      backgroundMode: utils.JsonUtils.parseString(json['backgroundMode'], 'Background mode'),
      smallScreenMoreTooltip: utils.JsonUtils.parseString(json['smallScreenMoreTooltip'], 'More'),
    );
  }
}
