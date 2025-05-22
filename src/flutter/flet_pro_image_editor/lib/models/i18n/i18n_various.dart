import 'package:flet/flet.dart';

class I18nVarious {
  final String loadingDialogMsg;
  final String closeEditorWarningTitle;
  final String closeEditorWarningMessage;
  final String closeEditorWarningConfirmBtn;
  final String closeEditorWarningCancelBtn;

  const I18nVarious({
    this.loadingDialogMsg = 'Please wait...',
    this.closeEditorWarningTitle = 'Close Image Editor?',
    this.closeEditorWarningMessage =
        'Are you sure you want to close the Image Editor? Your changes will not be saved.',
    this.closeEditorWarningConfirmBtn = 'OK',
    this.closeEditorWarningCancelBtn = 'Cancel',
  });

  factory I18nVarious.fromJson(Map<String, dynamic> json) {
    return I18nVarious(
      loadingDialogMsg: parseString(json['loadingDialogMsg'] as String?, 'Please wait...'),
      closeEditorWarningTitle:
          parseString(json['closeEditorWarningTitle'] as String?, 'Close Image Editor?'),
      closeEditorWarningMessage: parseString(json['closeEditorWarningMessage'] as String?,
          'Are you sure you want to close the Image Editor? Your changes will not be saved.'),
      closeEditorWarningConfirmBtn:
          parseString(json['closeEditorWarningConfirmBtn'] as String?, 'OK'),
      closeEditorWarningCancelBtn:
          parseString(json['closeEditorWarningCancelBtn'] as String?, 'Cancel'),
    );
  }
}
