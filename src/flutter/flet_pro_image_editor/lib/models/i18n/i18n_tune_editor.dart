import 'package:flet/flet.dart';

class I18nTuneEditor {
  final String bottomNavigationBarText;
  // Add other fields if they exist in the Dart class definition

  const I18nTuneEditor({
    this.bottomNavigationBarText = 'Tune',
    // Initialize other fields here
  });

  factory I18nTuneEditor.fromJson(Map<String, dynamic> json) {
    return I18nTuneEditor(
      bottomNavigationBarText: parseString(json['bottomNavigationBarText'] as String?, 'Tune'),
      // Add other fields if they exist in the Dart class definition
    );
  }
}
