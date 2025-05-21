import '../../utils/json_utils.dart' as utils;

class I18nBlurEditor {
  final String bottomNavigationBarText;
  final String back;
  final String done;

  const I18nBlurEditor({
    this.bottomNavigationBarText = 'Blur',
    this.back = 'Back',
    this.done = 'Done',
  });

  factory I18nBlurEditor.fromJson(Map<String, dynamic> json) {
    return I18nBlurEditor(
      bottomNavigationBarText: utils.JsonUtils.parseString(json['bottomNavigationBarText'], 'Blur'),
      back: utils.JsonUtils.parseString(json['back'], 'Back'),
      done: utils.JsonUtils.parseString(json['done'], 'Done'),
    );
  }
}
