import 'package:flet/flet.dart';
import 'package:flutter/material.dart';
import 'package:pro_image_editor/pro_image_editor.dart' hide ProImageEditorConfigs, ImageEditorDesignMode, ThemeData; // Hide to avoid conflict with local models
import 'dart:typed_data';
import '../models/pro_image_editor_configs.dart'; // Crucial: Verify this path!

class FletProImageEditorControl extends StatefulWidget {
  final Control? parent;
  final Control control;
  final List<Control> children;
  final bool parentDisabled;
  final bool? parentAdaptive;
  final FletControlBackend backend;

  const FletProImageEditorControl({
    super.key,
    required this.parent,
    required this.control,
    required this.children,
    required this.parentDisabled,
    required this.parentAdaptive,
    required this.backend,
  });

  @override
  State<FletProImageEditorControl> createState() =>
      _FletProImageEditorControlState();
}

class _FletProImageEditorControlState extends State<FletProImageEditorControl> {
  bool _isEditing = false;
  Uint8List? _editedImage;
  bool _isOpen = false;
  ProImageEditorConfigs _editorConfigs = const ProImageEditorConfigs();

  @override
  void initState() {
    super.initState();
    widget.backend.subscribeMethods(widget.control.id, _handleMethodCall);
  }

  @override
  void dispose() {
    widget.backend.unsubscribeMethods(widget.control.id);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final rawConfigs = widget.control.attrs["configs"];
    if (rawConfigs is Map) {
      final configsMap = Map<String, dynamic>.from(rawConfigs);
      setState(() {
        _editorConfigs = ProImageEditorConfigs.fromJson(Theme.of(context), configsMap); // This is the call
      });
    } else {
      // _editorConfigs remains its default
    }
  }

  Future<String?> _handleMethodCall(
      String methodName, Map<String, String> args) async {
    switch (methodName) {
      case "open_editor":
        return _openEditor(args);
      case "close_editor":
        return _closeEditor();
      case "open":
        return _openDialog(args);
      case "close":
        return _closeDialog();
      default:
        return null;
    }
  }

  Future<String?> _openDialog(Map<String, String> args) async {
    if (_isOpen && context.mounted) {
      Navigator.of(context, rootNavigator: true).pop();
    }
    setState(() { _isOpen = true; });

    String? imageSource = args["source"];
    String? imagePath = args["path"];
    if (imageSource == null || imagePath == null) return "error: Se requiere source y path";

    // Use the _editorConfigs from state
    final ProImageEditorConfigs currentConfigs = _editorConfigs;

    Widget editorWidget;
    if (imageSource == "network") {
      editorWidget = ProImageEditor.network(imagePath, configs: currentConfigs, callbacks: ProImageEditorCallbacks(onImageEditingComplete: _handleEditingComplete, onCloseEditor: (_) async => await _handleEditingCancel()));
    } else if (imageSource == "file") {
      editorWidget = ProImageEditor.file(imagePath, configs: currentConfigs, callbacks: ProImageEditorCallbacks(onImageEditingComplete: _handleEditingComplete, onCloseEditor: (_) async => await _handleEditingCancel()));
    } else if (imageSource == "asset") {
      editorWidget = ProImageEditor.asset(imagePath, configs: currentConfigs, callbacks: ProImageEditorCallbacks(onImageEditingComplete: _handleEditingComplete, onCloseEditor: (_) async => await _handleEditingCancel()));
    } else {
      return "error: Fuente de imagen no válida. Use 'network', 'file' o 'asset'";
    }

    if (context.mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => PopScope(
          canPop: false,
          onPopInvoked: (didPop) async { if (!didPop) await _handleEditingCancel(); },
          child: Dialog(insetPadding: EdgeInsets.zero, child: Container(width: double.infinity, height: double.infinity, color: Colors.black, child: editorWidget)),
        ),
      );
    }
    return "success";
  }

  Future<String?> _closeDialog() async {
    if (_isOpen && context.mounted) {
      Navigator.of(context, rootNavigator: true).pop();
      setState(() { _isOpen = false; });
    }
    return "success";
  }

  Future<String?> _openEditor(Map<String, String> args) async {
    setState(() { _isEditing = true; _editedImage = null; });
    await Future.delayed(Duration.zero);

    try {
      String? imageSource = args["source"];
      String? imagePath = args["path"];
      if (imageSource == null || imagePath == null) return "error: Se requiere source y path";

      // Use the _editorConfigs from state
      final ProImageEditorConfigs currentConfigs = _editorConfigs;

      Widget editorWidget;
      if (imageSource == "network") {
        editorWidget = ProImageEditor.network(imagePath, configs: currentConfigs, callbacks: ProImageEditorCallbacks(onImageEditingComplete: _handleEditingComplete, onCloseEditor: (_) async => await _handleEditingCancel()));
      } else if (imageSource == "file") {
        editorWidget = ProImageEditor.file(imagePath, configs: currentConfigs, callbacks: ProImageEditorCallbacks(onImageEditingComplete: _handleEditingComplete, onCloseEditor: (_) async => await _handleEditingCancel()));
      } else if (imageSource == "asset") {
        editorWidget = ProImageEditor.asset(imagePath, configs: currentConfigs, callbacks: ProImageEditorCallbacks(onImageEditingComplete: _handleEditingComplete, onCloseEditor: (_) async => await _handleEditingCancel()));
      } else {
        return "error: Fuente de imagen no válida. Use 'network', 'file' o 'asset'";
      }

      await Navigator.push(context, MaterialPageRoute(builder: (context) => editorWidget));
      return "success";
    } catch (e) {
      debugPrint("Error al abrir el editor: $e");
      setState(() { _isEditing = false; });
      return "error: $e";
    }
  }

  Future<void> _handleEditingComplete(Uint8List editedImage) async {
    List<int> bytesList = editedImage.toList();
    String bytesString = bytesList.join(',');
    widget.backend.triggerControlEvent(widget.control.id, "editing_complete", bytesString);
    setState(() { _editedImage = editedImage; _isEditing = false; });
    if (_isOpen && context.mounted) {
      Navigator.of(context, rootNavigator: true).pop();
      setState(() { _isOpen = false; });
    }
  }

  Future<void> _handleEditingCancel() async {
    widget.backend.triggerControlEvent(widget.control.id, "editing_cancel", "");
    setState(() { _isEditing = false; });
    if (_isOpen && context.mounted) {
      Navigator.of(context, rootNavigator: true).pop();
      setState(() { _isOpen = false; });
    }
    if (Navigator.of(context).canPop() && context.mounted) {
      Navigator.of(context).pop();
    }
  }

  Future<String?> _closeEditor() async {
    if (context.mounted && Navigator.of(context).canPop()) Navigator.of(context).pop();
    if (_isOpen && context.mounted) {
      Navigator.of(context, rootNavigator: true).pop();
      setState(() { _isOpen = false; });
    }
    setState(() { _isEditing = false; _editedImage = null; });
    await Future.delayed(Duration.zero);
    return "success";
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
