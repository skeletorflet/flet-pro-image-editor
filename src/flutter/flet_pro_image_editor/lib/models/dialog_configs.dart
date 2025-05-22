import 'package:flet/flet.dart';
import 'package:flutter/material.dart'; // Added for ThemeData
import './dialog_widgets.dart'; // Assuming this was created as a placeholder
import './dialog_style.dart';   // Assuming this was created as a placeholder

class DialogConfigs {
  final DialogWidgets widgets;
  final DialogStyle style;

  const DialogConfigs({
    this.widgets = const DialogWidgets(),
    this.style = const DialogStyle(),
  });

  factory DialogConfigs.fromJson(ThemeData? theme, Map<String, dynamic> json) {
    return DialogConfigs(
      widgets: json['widgets'] != null ? DialogWidgets.fromJson(json['widgets'] is Map ? Map<String, dynamic>.from(json['widgets'] as Map) : {}) : const DialogWidgets(),
      style: json['style'] != null ? DialogStyle.fromJson(theme, json['style'] is Map ? Map<String, dynamic>.from(json['style'] as Map) : {}) : const DialogStyle(),
    );
  }
}
