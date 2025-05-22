import 'package:flet/flet.dart';

class I18nStickerEditor {
  final String bottomNavigationBarText;
  // Add other fields if they exist in the Dart class definition

  const I18nStickerEditor({
    this.bottomNavigationBarText = 'Stickers',
    // Initialize other fields here
  });

  factory I18nStickerEditor.fromJson(Map<String, dynamic> json) {
    return I18nStickerEditor(
      bottomNavigationBarText: parseString(json['bottomNavigationBarText'] as String?, 'Stickers'),
      // Add other fields if they exist in the Dart class definition
    );
  }
}
