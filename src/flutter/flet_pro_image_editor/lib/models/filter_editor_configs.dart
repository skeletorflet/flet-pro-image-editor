import '../utils/json_utils.dart' as utils;
import './filter_model.dart';
import './editor_safe_area.dart';
import './filter_editor_style.dart'; // Assuming this was created as a placeholder
import './filter_editor_icons.dart'; // Assuming this was created as a placeholder
import './filter_editor_widgets.dart'; // Assuming this was created as a placeholder
// For Duration, if used directly, import 'package:flutter/material.dart';

class FilterEditorConfigs {
  final bool enabled;
  final bool showLayers;
  final List<FilterModel> filterList;
  final EditorSafeArea safeArea;
  final Duration fadeInUpDuration;
  final Duration fadeInUpStaggerDelayDuration;
  final FilterEditorStyle style;
  final FilterEditorIcons icons;
  final FilterEditorWidgets widgets;

  const FilterEditorConfigs({
    this.enabled = true,
    this.showLayers = true,
    this.filterList = const [],
    this.safeArea = const EditorSafeArea(),
    this.fadeInUpDuration = const Duration(milliseconds: 220),
    this.fadeInUpStaggerDelayDuration = const Duration(milliseconds: 25),
    this.style = const FilterEditorStyle(),
    this.icons = const FilterEditorIcons(),
    this.widgets = const FilterEditorWidgets(),
  });

  factory FilterEditorConfigs.fromJson(Map<String, dynamic> json) {
    return FilterEditorConfigs(
      enabled: utils.JsonUtils.parseBool(json['enabled'], true),
      showLayers: utils.JsonUtils.parseBool(json['showLayers'], true),
      filterList: utils.JsonUtils.parseList<FilterModel>(json['filterList'], (item) => FilterModel.fromJson(utils.JsonUtils.parseMap(item)), []),
      safeArea: json['safeArea'] != null ? EditorSafeArea.fromJson(utils.JsonUtils.parseMap(json['safeArea'])) : const EditorSafeArea(),
      fadeInUpDuration: utils.JsonUtils.parseDuration(json['fadeInUpDuration'], const Duration(milliseconds: 220)),
      fadeInUpStaggerDelayDuration: utils.JsonUtils.parseDuration(json['fadeInUpStaggerDelayDuration'], const Duration(milliseconds: 25)),
      style: json['style'] != null ? FilterEditorStyle.fromJson(utils.JsonUtils.parseMap(json['style'])) : const FilterEditorStyle(),
      icons: json['icons'] != null ? FilterEditorIcons.fromJson(utils.JsonUtils.parseMap(json['icons'])) : const FilterEditorIcons(),
      widgets: json['widgets'] != null ? FilterEditorWidgets.fromJson(utils.JsonUtils.parseMap(json['widgets'])) : const FilterEditorWidgets(),
    );
  }
}
