from typing import Any, Optional, Dict, List, Union, Callable

from flet.core.constrained_control import ConstrainedControl
from flet.core.control import OptionalNumber, Control
from flet.core.types import OptionalControlEventCallable


class ProImageEditor(ConstrainedControl):
    """
    Un control para editar imágenes utilizando el paquete pro_image_editor de Flutter.

    Este control permite abrir un editor de imágenes avanzado para modificar imágenes
    desde diferentes fuentes (red, archivo local o asset). El editor proporciona
    herramientas como recorte, rotación, filtros y más.

    Ejemplo:
    ```python
    import flet as ft
    from flet_pro_image_editor import ProImageEditor

    def main(page: ft.Page):
        def on_editing_complete(e):
            # e.data contiene los bytes de la imagen editada como string separado por comas
            print(f"Edición completada, tamaño: {len(e.data.split(','))} bytes")
            # Aquí puedes convertir e.data a bytes si lo necesitas
            # bytes_data = bytes([int(b) for b in e.data.split(',')])

        def on_editing_cancel(e):
            print("Edición cancelada")

        def edit_image_clicked(e):
            # Abrir el editor con una imagen de la red
            editor.open_editor(
                source="network",
                path="https://picsum.photos/500/500",
                crop_ratio="1.0"
            )

        editor = ProImageEditor(
            show_status=True,
            on_editing_complete=on_editing_complete,
            on_editing_cancel=on_editing_cancel
        )

        page.add(
            editor,
            ft.ElevatedButton("Editar imagen", on_click=edit_image_clicked)
        )

    ft.app(target=main)
    ```
    """

    def __init__(
        self,
        #
        # Control
        #
        ref=None,
        key: Optional[str] = None,
        width: OptionalNumber = None,
        height: OptionalNumber = None,
        expand: Union[None, bool, int] = None,
        opacity: OptionalNumber = None,
        tooltip: Optional[str] = None,
        visible: Optional[bool] = None,
        disabled: Optional[bool] = None,
        data: Any = None,
        #
        # ConstrainedControl
        #
        left: OptionalNumber = None,
        top: OptionalNumber = None,
        right: OptionalNumber = None,
        bottom: OptionalNumber = None,
        #
        # ProImageEditor specific
        #
        show_status: Optional[bool] = None,
        on_editing_complete: OptionalControlEventCallable = None,
        on_editing_cancel: OptionalControlEventCallable = None,
    ):
        ConstrainedControl.__init__(
            self,
            ref=ref,
            key=key,
            width=width,
            height=height,
            expand=expand,
            opacity=opacity,
            tooltip=tooltip,
            visible=visible,
            disabled=disabled,
            data=data,
            left=left,
            top=top,
            right=right,
            bottom=bottom,
        )

        self.show_status = show_status
        self.on_editing_complete = on_editing_complete
        self.on_editing_cancel = on_editing_cancel

    def _get_control_name(self):
        return "flet_pro_image_editor"

    # show_status
    @property
    def show_status(self) -> Optional[bool]:
        """
        Determina si se muestra un indicador visual del estado del editor.

        Si es True, se mostrará un widget con información sobre el estado actual
        del editor (listo, editando, o imagen editada). Si es False, el control
        será invisible.

        Returns:
            Optional[bool]: True si se muestra el estado, False si no.
        """
        return self._get_attr("show_status", data_type="bool")

    @show_status.setter
    def show_status(self, value: Optional[bool]):
        self._set_attr("show_status", value)

    # on_editing_complete
    @property
    def on_editing_complete(self) -> OptionalControlEventCallable:
        """
        Evento que se dispara cuando se completa la edición de una imagen.

        El evento contiene en su propiedad `data` una cadena de texto con los bytes
        de la imagen editada, separados por comas. Estos bytes pueden convertirse
        a un objeto bytes de Python si es necesario.

        Returns:
            OptionalControlEventCallable: El manejador de eventos actual.
        """
        return self._get_event_handler("editing_complete")

    @on_editing_complete.setter
    def on_editing_complete(self, handler: OptionalControlEventCallable):
        self._add_event_handler("editing_complete", handler)

    # on_editing_cancel
    @property
    def on_editing_cancel(self) -> OptionalControlEventCallable:
        """
        Evento que se dispara cuando se cancela la edición de una imagen.

        Returns:
            OptionalControlEventCallable: El manejador de eventos actual.
        """
        return self._get_event_handler("editing_cancel")

    @on_editing_cancel.setter
    def on_editing_cancel(self, handler: OptionalControlEventCallable):
        self._add_event_handler("editing_cancel", handler)

    def open_editor(
        self, source: str, path: str, crop_ratio: Optional[str] = None
    ) -> None:
        """
        Abre el editor de imágenes con la imagen especificada.

        Args:
            source: La fuente de la imagen. Puede ser "network", "file" o "asset".
            path: La ruta a la imagen, dependiendo de la fuente:
                - Para "network": URL de la imagen
                - Para "file": Ruta al archivo local
                - Para "asset": Ruta al asset en el paquete
            crop_ratio: Relación de aspecto opcional para el recorte (por ejemplo, "1.0" para cuadrado)

        Raises:
            ValueError: Si source no es válido o path está vacío.
        """
        if not source or not path:
            raise ValueError("Se requieren source y path")

        if source not in ["network", "file", "asset"]:
            raise ValueError("source debe ser 'network', 'file' o 'asset'")

        args = {
            "source": source,
            "path": path,
        }

        if crop_ratio is not None:
            args["crop_ratio"] = crop_ratio

        self.invoke_method("open_editor", args)

    def close_editor(self) -> None:
        """
        Cierra el editor de imágenes si está abierto y oculta el control.

        Este método debe llamarse cuando se desea cerrar explícitamente el editor,
        o puede usarse en los manejadores de eventos on_editing_complete y on_editing_cancel
        para asegurar que el control se oculte correctamente.
        """
        self.invoke_method("close_editor", {})
