import 'package:flet/flet.dart';

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
      bottomNavigationBarText: parseString(json['bottomNavigationBarText'] as String?, 'Blur'),
      back: parseString(json['back'] as String?, 'Back'),
      done: parseString(json['done'] as String?, 'Done'),
    );
  }
}
