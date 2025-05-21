import '../../utils/json_utils.dart' as utils;

class I18nLayerInteraction {
  final String remove;
  final String edit;
  final String rotateScale;

  const I18nLayerInteraction({
    this.remove = 'Remove',
    this.edit = 'Edit',
    this.rotateScale = 'Rotate and Scale',
  });

  factory I18nLayerInteraction.fromJson(Map<String, dynamic> json) {
    return I18nLayerInteraction(
      remove: utils.JsonUtils.parseString(json['remove'], 'Remove'),
      edit: utils.JsonUtils.parseString(json['edit'], 'Edit'),
      rotateScale: utils.JsonUtils.parseString(json['rotateScale'], 'Rotate and Scale'),
    );
  }
}
