import 'package:flutter/material.dart';
import 'package:pro_image_editor/pro_image_editor.dart';
import 'dart:typed_data';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pro Image Editor Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _openEditor(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => ProImageEditor.network(
              'https://picsum.photos/500/500', // Imagen de prueba desde Picsum
              configs: const ProImageEditorConfigs(),
              callbacks: ProImageEditorCallbacks(
                onImageEditingComplete: (Uint8List editedImage) async {
                  // Aquí puedes guardar, subir o usar la imagen como necesites
                  debugPrint(
                    'Edición completada, bytes recibidos: ${editedImage.length}',
                  );
                  Navigator.pop(context); // Cierra el editor
                },
              ),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editor de Imagen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _openEditor(context),
          child: const Text('Editar imagen desde Picsum'),
        ),
      ),
    );
  }
}
