import 'package:flet/flet.dart';

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
      remove: parseString(json['remove'] as String?, 'Remove'),
      edit: parseString(json['edit'] as String?, 'Edit'),
      rotateScale: parseString(json['rotateScale'] as String?, 'Rotate and Scale'),
    );
  }
}
