import '../utils/json_utils.dart' as utils;
import './layer_interaction_icons.dart'; // Assuming this was created as a placeholder
import './layer_interaction_widgets.dart'; // Assuming this was created as a placeholder
import './layer_interaction_style.dart'; // Assuming this was created as a placeholder
// For Duration, if used directly, import 'package:flutter/material.dart';

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

  factory LayerInteractionConfigs.fromJson(Map<String, dynamic> json) {
    return LayerInteractionConfigs(
      selectable: utils.JsonUtils.parseEnum(LayerInteractionSelectable.values, json['selectable'], LayerInteractionSelectable.auto),
      initialSelected: utils.JsonUtils.parseBool(json['initialSelected'], false),
      hideToolbarOnInteraction: utils.JsonUtils.parseBool(json['hideToolbarOnInteraction'], false),
      hideVideoControlsOnInteraction: utils.JsonUtils.parseBool(json['hideVideoControlsOnInteraction'], true),
      videoControlsSwitchDuration: utils.JsonUtils.parseDuration(json['videoControlsSwitchDuration'], const Duration(milliseconds: 220)),
      icons: json['icons'] != null ? LayerInteractionIcons.fromJson(utils.JsonUtils.parseMap(json['icons'])) : const LayerInteractionIcons(),
      widgets: json['widgets'] != null ? LayerInteractionWidgets.fromJson(utils.JsonUtils.parseMap(json['widgets'])) : const LayerInteractionWidgets(),
      style: json['style'] != null ? LayerInteractionStyle.fromJson(utils.JsonUtils.parseMap(json['style'])) : const LayerInteractionStyle(),
    );
  }
}
