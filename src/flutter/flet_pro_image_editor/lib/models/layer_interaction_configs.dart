import 'package:flet/flet.dart';
import 'package:flutter/material.dart'; // For ThemeData and Duration
import './layer_interaction_icons.dart'; // Assuming this was created as a placeholder
import './layer_interaction_widgets.dart'; // Assuming this was created as a placeholder
import './layer_interaction_style.dart'; // Assuming this was created as a placeholder

// Define enums used by this config class
enum LayerInteractionSelectable {
  auto,
  selectable,
  notSelectable,
}

class LayerInteractionConfigs {
  final LayerInteractionSelectable selectable;
  final bool initialSelected;
  final bool hideToolbarOnInteraction;
  final bool hideVideoControlsOnInteraction;
  final Duration videoControlsSwitchDuration;
  final LayerInteractionIcons icons;
  final LayerInteractionWidgets widgets;
  final LayerInteractionStyle style;

  const LayerInteractionConfigs({
    this.selectable = LayerInteractionSelectable.auto,
    this.initialSelected = false,
    this.hideToolbarOnInteraction = false,
    this.hideVideoControlsOnInteraction = true,
    this.videoControlsSwitchDuration = const Duration(milliseconds: 220),
    this.icons = const LayerInteractionIcons(),
    this.widgets = const LayerInteractionWidgets(),
    this.style = const LayerInteractionStyle(),
  });

  factory LayerInteractionConfigs.fromJson(ThemeData? theme, Map<String, dynamic> json) {
    LayerInteractionSelectable tempSelectable = LayerInteractionSelectable.auto;
    dynamic rawSelectable = json['selectable'];
    if (rawSelectable is String) {
      tempSelectable = LayerInteractionSelectable.values.firstWhere(
        (e) => e.toString().split('.').last.toLowerCase() == rawSelectable.toLowerCase(),
        orElse: () => LayerInteractionSelectable.auto
      );
    } else if (LayerInteractionSelectable.values.contains(rawSelectable)) {
      tempSelectable = rawSelectable;
    }

    return LayerInteractionConfigs(
      selectable: tempSelectable,
      initialSelected: parseBool(json['initialSelected'], false),
      hideToolbarOnInteraction: parseBool(json['hideToolbarOnInteraction'], false),
      hideVideoControlsOnInteraction: parseBool(json['hideVideoControlsOnInteraction'], true),
      videoControlsSwitchDuration: parseAnimationDuration(json['videoControlsSwitchDuration'], const Duration(milliseconds: 220)),
      icons: json['icons'] != null ? LayerInteractionIcons.fromJson(json['icons'] is Map ? Map<String, dynamic>.from(json['icons'] as Map) : {}) : const LayerInteractionIcons(),
      widgets: json['widgets'] != null ? LayerInteractionWidgets.fromJson(json['widgets'] is Map ? Map<String, dynamic>.from(json['widgets'] as Map) : {}) : const LayerInteractionWidgets(),
      style: json['style'] != null ? LayerInteractionStyle.fromJson(theme, json['style'] is Map ? Map<String, dynamic>.from(json['style'] as Map) : {}) : const LayerInteractionStyle(),
    );
  }
}
