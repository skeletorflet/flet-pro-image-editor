import 'package:flet/flet.dart';
import 'package:flutter/material.dart'; // For ThemeData and Duration
import './filter_model.dart';
import './editor_safe_area.dart';
import './filter_editor_style.dart'; // Assuming this was created as a placeholder
import './filter_editor_icons.dart'; // Assuming this was created as a placeholder
import './filter_editor_widgets.dart'; // Assuming this was created as a placeholder

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

  factory FilterEditorConfigs.fromJson(ThemeData? theme, Map<String, dynamic> json) {
    List<FilterModel> tempFilterList = const [];
    dynamic rawFilterList = json['filterList'];
    if (rawFilterList is List) {
      tempFilterList = rawFilterList.map((item) {
        return FilterModel.fromJson(item is Map ? Map<String, dynamic>.from(item as Map) : {});
      }).toList().cast<FilterModel>();
    }

    return FilterEditorConfigs(
      enabled: parseBool(json['enabled'], true),
      showLayers: parseBool(json['showLayers'], true),
      filterList: tempFilterList,
      safeArea: json['safeArea'] != null ? EditorSafeArea.fromJson(json['safeArea'] is Map ? Map<String, dynamic>.from(json['safeArea'] as Map) : {}) : const EditorSafeArea(),
      fadeInUpDuration: parseAnimationDuration(json['fadeInUpDuration'], const Duration(milliseconds: 220)),
      fadeInUpStaggerDelayDuration: parseAnimationDuration(json['fadeInUpStaggerDelayDuration'], const Duration(milliseconds: 25)),
      style: json['style'] != null ? FilterEditorStyle.fromJson(theme, json['style'] is Map ? Map<String, dynamic>.from(json['style'] as Map) : {}) : const FilterEditorStyle(),
      icons: json['icons'] != null ? FilterEditorIcons.fromJson(json['icons'] is Map ? Map<String, dynamic>.from(json['icons'] as Map) : {}) : const FilterEditorIcons(),
      widgets: json['widgets'] != null ? FilterEditorWidgets.fromJson(json['widgets'] is Map ? Map<String, dynamic>.from(json['widgets'] as Map) : {}) : const FilterEditorWidgets(),
    );
  }
}
