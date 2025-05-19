import flet as ft
import base64
from flet_pro_image_editor import ProImageEditor
from io import BytesIO
from PIL import Image


def main(page: ft.Page):
    page.title = "Ejemplo de Pro Image Editor"
    page.padding = 20

    # Contenedor para mostrar la imagen editada
    image_container = ft.Container(
        visible=False,
        width=300,
        height=300,
        border=ft.border.all(1, ft.Colors.GREY_400),
        border_radius=10,
        padding=10,
        alignment=ft.alignment.center,
    )

    # Función para manejar cuando se completa la edición
    def on_editing_complete(e):
        print("ok")
        try:
            print(f"Edición completada, recibidos {len(e.data.split(','))} bytes")
            status_text.value = f"Imagen editada: {len(e.data.split(','))} bytes"

            # Convertir los bytes de la imagen a un objeto binario
            bytes_data = bytes([int(b) for b in e.data.split(",")])

            # Usar Pillow para abrir la imagen desde los bytes
            image = Image.open(BytesIO(bytes_data))

            # Guardar la imagen editada en disco (opcional, puedes comentar si no quieres guardar siempre)
            image.save("edited_image.jpg")

            # Convertir la imagen a base64 usando Pillow
            buffered = BytesIO()
            image.save(buffered, format="JPEG")
            base64_data = base64.b64encode(buffered.getvalue()).decode("utf-8")

            image_container.content = None
            page.update()

            image_container.content = ft.Image(
                src_base64=base64_data,
                width=280,
                height=280,
                fit=ft.ImageFit.CONTAIN,
            )
            image_container.visible = True
            image_label.visible = True
            page.update()
        except Exception as ex:
            print(f"Error al procesar la imagen: {ex}")
            status_text.value = f"Error al procesar la imagen: {ex}"
            page.update()

    # Función para manejar cuando se cancela la edición
    def on_editing_cancel(e):
        print("Edición cancelada")
        status_text.value = "Edición cancelada"
        page.update()

    # Crear el control de editor de imágenes
    editor = ProImageEditor(
        show_status=True,
        on_editing_complete=on_editing_complete,
        on_editing_cancel=on_editing_cancel,
    )

    # Función para abrir el editor con una imagen de picsum de 500x500
    def open_image_editor(e):
        print("Abriendo editor con imagen de picsum 500x500...")
        status_text.value = "Abriendo editor con imagen de picsum 500x500..."
        # Ocultar la imagen previa antes de abrir el editor
        image_container.visible = False
        image_label.visible = False
        page.update()

        # Configurar el editor con la imagen
        editor.open_editor(
            source="network",
            path="https://picsum.photos/500/500",
            crop_ratio="1.0",  # Relación de aspecto cuadrada
        )

        # Abrir el editor como un diálogo
        page.open(editor)

    # Función para abrir el editor con una imagen local
    def open_local_image(e):
        print("Abriendo editor con imagen local...")
        status_text.value = "Abriendo editor con imagen local..."
        image_container.visible = False
        image_label.visible = False
        page.update()

        # Configurar el editor con la imagen local
        editor.open_editor(
            source="file",
            path="C:/Users/Julian/Desktop/flet_extensions/pro_image_editor/examples/flet_pro_image_editor_example/src/assets/sample.jpg",
            crop_ratio="4/3",  # Relación de aspecto 4:3
        )

        # Abrir el editor como un diálogo
        page.open(editor)

    # Función para abrir el editor con un asset
    def open_asset_image(e):
        print("Abriendo editor con asset...")
        status_text.value = "Abriendo editor con asset..."
        image_container.visible = False
        image_label.visible = False
        page.update()

        # Configurar el editor con la imagen de asset
        editor.open_editor(
            source="asset",
            path="assets/sample_asset.jpg",
            crop_ratio="16/9",  # Relación de aspecto 16:9
        )

        # Abrir el editor como un diálogo
        page.open(editor)

    # Función para guardar la imagen editada como archivo
    def save_edited_image(e):
        try:
            # Obtener el control de imagen mostrado
            img_control = image_container.content
            if (
                not img_control
                or not hasattr(img_control, "src_base64")
                or not img_control.src_base64
            ):
                status_text.value = "No hay imagen editada para guardar"
                page.update()
                return

            # Decodificar el base64 y guardar como PNG
            base64_data = img_control.src_base64
            image_data = base64.b64decode(base64_data)
            image = Image.open(BytesIO(image_data))
            image.save("edited_image.png", format="PNG")

            status_text.value = "Imagen guardada como edited_image.png"
            page.update()
        except Exception as ex:
            status_text.value = f"Error al guardar: {ex}"
            page.update()

    # Texto para mostrar el estado
    status_text = ft.Text("Listo para editar imágenes", size=16)

    # Etiqueta para la imagen (creada como control separado para poder referenciarla)
    image_label = ft.Text("Imagen editada:", size=16, visible=False)

    # Añadir el editor al overlay de la página
    page.overlay.append(editor)

    # Añadir los controles a la página
    page.add(
        ft.Text("Ejemplo de Pro Image Editor", size=24, weight="bold"),
        ft.Row(
            [
                ft.Column(
                    [
                        ft.ElevatedButton(
                            "Editar imagen de picsum",
                            on_click=open_image_editor,
                            icon=ft.Icons.EDIT,
                        ),
                        ft.ElevatedButton(
                            "Editar imagen local",
                            on_click=open_local_image,
                            icon=ft.Icons.IMAGE,
                        ),
                        ft.ElevatedButton(
                            "Editar asset",
                            on_click=open_asset_image,
                            icon=ft.Icons.FOLDER,
                        ),
                        ft.ElevatedButton(
                            "Guardar imagen",
                            on_click=save_edited_image,
                            icon=ft.Icons.SAVE,
                        ),
                    ],
                    spacing=10,
                ),
            ],
            spacing=10,
        ),
        status_text,
        ft.Container(height=20),  # Espaciador
        image_label,
        image_container,
    )

    # Mostrar un diálogo de bienvenida al iniciar la aplicación
    page.open(ft.AlertDialog(title=ft.Text("Bienvenido al Pro Image Editor")))


ft.app(target=main)
