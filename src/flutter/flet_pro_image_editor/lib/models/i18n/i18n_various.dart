import '../../utils/json_utils.dart' as utils;

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
      loadingDialogMsg: utils.JsonUtils.parseString(json['loadingDialogMsg'], 'Please wait...'),
      closeEditorWarningTitle:
          utils.JsonUtils.parseString(json['closeEditorWarningTitle'], 'Close Image Editor?'),
      closeEditorWarningMessage: utils.JsonUtils.parseString(json['closeEditorWarningMessage'],
          'Are you sure you want to close the Image Editor? Your changes will not be saved.'),
      closeEditorWarningConfirmBtn:
          utils.JsonUtils.parseString(json['closeEditorWarningConfirmBtn'], 'OK'),
      closeEditorWarningCancelBtn:
          utils.JsonUtils.parseString(json['closeEditorWarningCancelBtn'], 'Cancel'),
    );
  }
}
