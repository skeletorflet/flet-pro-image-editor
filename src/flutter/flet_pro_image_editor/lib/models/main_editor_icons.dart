import 'package:flutter/material.dart'; // For default Icon names, if needed for reference
import 'package:flet/flet.dart';

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
      closeEditor: json['closeEditor'] as String? ?? "Icons.clear",
      doneIcon: json['doneIcon'] as String? ?? "Icons.done",
      applyChanges: json['applyChanges'] as String? ?? "Icons.done",
      backButton: json['backButton'] as String? ?? "Icons.arrow_back",
      undoAction: json['undoAction'] as String? ?? "Icons.undo",
      redoAction: json['redoAction'] as String? ?? "Icons.redo",
      removeElementZone: json['removeElementZone'] as String? ?? "Icons.delete_outline_rounded",
    );
  }
}
