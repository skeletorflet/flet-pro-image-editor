import 'package:flet/flet.dart';
import 'package:flutter/material.dart'; // For ThemeData
import './progress_indicator_widgets.dart'; // Assuming this was created as a placeholder

class ProgressIndicatorConfigs {
  final ProgressIndicatorWidgets widgets;

  const ProgressIndicatorConfigs({
    this.widgets = const ProgressIndicatorWidgets(),
  });

  factory ProgressIndicatorConfigs.fromJson(ThemeData? theme, Map<String, dynamic> json) {
    return ProgressIndicatorConfigs(
      widgets: json['widgets'] != null ? ProgressIndicatorWidgets.fromJson(theme, json['widgets'] is Map ? Map<String, dynamic>.from(json['widgets'] as Map) : {}) : const ProgressIndicatorWidgets(),
    );
  }
}
