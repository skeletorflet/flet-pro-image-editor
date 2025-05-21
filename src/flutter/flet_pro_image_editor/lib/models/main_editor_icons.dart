import 'package:flutter/material.dart'; // For default Icon names, if needed for reference
import '../utils/json_utils.dart' as utils;

class MainEditorIcons {
  final String closeEditor;
  final String doneIcon;
  final String applyChanges;
  final String backButton;
  final String undoAction;
  final String redoAction;
  final String removeElementZone;

  const MainEditorIcons({
    this.closeEditor = "Icons.clear",
    this.doneIcon = "Icons.done",
    this.applyChanges = "Icons.done",
    this.backButton = "Icons.arrow_back",
    this.undoAction = "Icons.undo",
    this.redoAction = "Icons.redo",
    this.removeElementZone = "Icons.delete_outline_rounded",
  });

  factory MainEditorIcons.fromJson(Map<String, dynamic> json) {
    return MainEditorIcons(
      closeEditor: utils.JsonUtils.parseIconDataPlaceholder(json['closeEditor'], "Icons.clear"),
      doneIcon: utils.JsonUtils.parseIconDataPlaceholder(json['doneIcon'], "Icons.done"),
      applyChanges: utils.JsonUtils.parseIconDataPlaceholder(json['applyChanges'], "Icons.done"),
      backButton: utils.JsonUtils.parseIconDataPlaceholder(json['backButton'], "Icons.arrow_back"),
      undoAction: utils.JsonUtils.parseIconDataPlaceholder(json['undoAction'], "Icons.undo"),
      redoAction: utils.JsonUtils.parseIconDataPlaceholder(json['redoAction'], "Icons.redo"),
      removeElementZone: utils.JsonUtils.parseIconDataPlaceholder(json['removeElementZone'], "Icons.delete_outline_rounded"),
    );
  }
}
