import 'package:flet/flet.dart';
import 'package:flutter/material.dart';
import 'package:pro_image_editor/pro_image_editor.dart';
import 'dart:typed_data';

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
    // Cerrar cualquier diálogo existente primero
    if (_isOpen && context.mounted) {
      Navigator.of(context, rootNavigator: true).pop();
    }

    setState(() {
      _isOpen = true;
    });

    // Obtener configuraciones del editor
    String? imageSource = args["source"];
    String? imagePath = args["path"];

    if (imageSource == null || imagePath == null) {
      return "error: Se requiere source y path";
    }

    // Configuraciones del editor
    ProImageEditorConfigs configs = ProImageEditorConfigs(
      cropRotateEditor: args["crop_ratio"] != null
          ? CropRotateEditorConfigs(
              initAspectRatio: double.tryParse(args["crop_ratio"]!),
            )
          : const CropRotateEditorConfigs(),
      mainEditor: const MainEditorConfigs(),
    );

    // Crear el widget del editor según la fuente
    Widget editorWidget;
    if (imageSource == "network") {
      editorWidget = ProImageEditor.network(
        imagePath,
        configs: configs,
        callbacks: ProImageEditorCallbacks(
          onImageEditingComplete: _handleEditingComplete,
          onCloseEditor: (_) async => await _handleEditingCancel(),
        ),
      );
    } else if (imageSource == "file") {
      editorWidget = ProImageEditor.file(
        imagePath,
        configs: configs,
        callbacks: ProImageEditorCallbacks(
          onImageEditingComplete: _handleEditingComplete,
          onCloseEditor: (_) async => await _handleEditingCancel(),
        ),
      );
    } else if (imageSource == "asset") {
      editorWidget = ProImageEditor.asset(
        imagePath,
        configs: configs,
        callbacks: ProImageEditorCallbacks(
          onImageEditingComplete: _handleEditingComplete,
          onCloseEditor: (_) async => await _handleEditingCancel(),
        ),
      );
    } else {
      return "error: Fuente de imagen no válida. Use 'network', 'file' o 'asset'";
    }

    // Mostrar el editor como un diálogo
    if (context.mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return PopScope(
            canPop: false,
            onPopInvoked: (didPop) async {
              if (!didPop) {
                await _handleEditingCancel();
              }
            },
            child: Dialog(
              insetPadding: EdgeInsets.zero,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black,
                child: editorWidget,
              ),
            ),
          );
        },
      );
    }

    return "success";
  }

  Future<String?> _closeDialog() async {
    if (_isOpen && context.mounted) {
      Navigator.of(context, rootNavigator: true).pop();
      setState(() {
        _isOpen = false;
      });
    }
    return "success";
  }

  Future<String?> _openEditor(Map<String, String> args) async {
    // Asegurarse de que el estado se reinicie correctamente antes de abrir el editor
    // Limpiar explícitamente la imagen editada y establecer el estado de edición
    setState(() {
      _isEditing = true;
      _editedImage = null;
    });

    // Asegurar que cualquier cambio de estado se aplique antes de continuar
    await Future.delayed(Duration.zero);

    try {
      // Determinar la fuente de la imagen
      String? imageSource = args["source"];
      String? imagePath = args["path"];

      if (imageSource == null || imagePath == null) {
        return "error: Se requiere source y path";
      }

      // Configuraciones del editor
      ProImageEditorConfigs configs = ProImageEditorConfigs(
        // Configuración de CropRotateEditor para manejar la relación de aspecto
        cropRotateEditor: args["crop_ratio"] != null
            ? CropRotateEditorConfigs(
                initAspectRatio: double.tryParse(args["crop_ratio"]!),
              )
            : const CropRotateEditorConfigs(),
        // Configuración de MainEditor
        mainEditor: const MainEditorConfigs(),
      );

      // Nota: Las propiedades availableOperations e initialOperation ya no están disponibles en la API actual

      // Abrir el editor según la fuente
      Widget editorWidget;
      if (imageSource == "network") {
        editorWidget = ProImageEditor.network(
          imagePath,
          configs: configs,
          callbacks: ProImageEditorCallbacks(
            onImageEditingComplete: _handleEditingComplete,
            onCloseEditor: (_) async => await _handleEditingCancel(),
          ),
        );
      } else if (imageSource == "file") {
        editorWidget = ProImageEditor.file(
          imagePath,
          configs: configs,
          callbacks: ProImageEditorCallbacks(
            onImageEditingComplete: _handleEditingComplete,
            onCloseEditor: (_) async => await _handleEditingCancel(),
          ),
        );
      } else if (imageSource == "asset") {
        editorWidget = ProImageEditor.asset(
          imagePath,
          configs: configs,
          callbacks: ProImageEditorCallbacks(
            onImageEditingComplete: _handleEditingComplete,
            onCloseEditor: (_) async => await _handleEditingCancel(),
          ),
        );
      } else {
        return "error: Fuente de imagen no válida. Use 'network', 'file' o 'asset'";
      }

      // Mostrar el editor en una nueva página
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => editorWidget),
      );

      return "success";
    } catch (e) {
      debugPrint("Error al abrir el editor: $e");
      setState(() {
        _isEditing = false;
      });
      return "error: $e";
    }
  }

  // Asegurarse de que los eventos se disparen con el nombre correcto
  Future<void> _handleEditingComplete(Uint8List editedImage) async {
    // Primero disparamos el evento antes de cerrar el diálogo
    List<int> bytesList = editedImage.toList();
    String bytesString = bytesList.join(',');

    // Disparar el evento con el nombre correcto
    widget.backend.triggerControlEvent(
        widget.control.id, "editing_complete", bytesString);

    // Luego actualizamos el estado
    setState(() {
      _editedImage = editedImage;
      _isEditing = false;
    });

    // Cerrar el diálogo si está abierto
    if (_isOpen && context.mounted) {
      Navigator.of(context, rootNavigator: true).pop();
      setState(() {
        _isOpen = false;
      });
    }
  }

  Future<void> _handleEditingCancel() async {
    // Primero disparamos el evento antes de cerrar el diálogo
    widget.backend.triggerControlEvent(widget.control.id, "editing_cancel", "");

    // Luego actualizamos el estado
    setState(() {
      _isEditing = false;
    });

    // Cerrar el diálogo si está abierto
    if (_isOpen && context.mounted) {
      Navigator.of(context, rootNavigator: true).pop();
      setState(() {
        _isOpen = false;
      });
    }

    // Asegurarse de cerrar la página del editor si está abierta
    if (Navigator.of(context).canPop() && context.mounted) {
      Navigator.of(context).pop();
    }
  }

  Future<String?> _closeEditor() async {
    // Cerrar la página del editor si está abierta
    if (context.mounted && Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }

    // Cerrar el diálogo si está abierto
    if (_isOpen && context.mounted) {
      Navigator.of(context, rootNavigator: true).pop();
      setState(() {
        _isOpen = false;
      });
    }

    // Actualizar el estado local y limpiar la imagen editada
    setState(() {
      _isEditing = false;
      _editedImage = null; // Asegurarse de limpiar la imagen editada
    });

    // Asegurar que los cambios de estado se apliquen completamente
    await Future.delayed(Duration.zero);

    return "success";
  }

  // Nota: Los métodos _parseAvailableOperations y _parseInitialOperation han sido eliminados
  // ya que las propiedades availableOperations e initialOperation no están disponibles en la API actual

  @override
  Widget build(BuildContext context) {
    // Este control no tiene representación visual directa

    return const SizedBox.shrink(); // Control invisible
  }
}
