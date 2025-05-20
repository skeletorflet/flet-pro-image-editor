import flet as ft
import flet.version
from flet.core.control import Control, OptionalNumber
from flet.core.ref import Ref
from typing import Any, Callable, Optional, Union, List, Dict


class ProImageEditor(ft.Control):
    def __init__(
        self,
        show_status: bool = False,
        on_editing_complete=None,
        on_editing_cancel=None,
        #
        ref: Optional[Ref] = None,
        disabled: Optional[bool] = None,
        visible: Optional[bool] = None,
        data: Any = None,
    ):
        super().__init__(ref=ref, disabled=disabled, visible=visible, data=data)
        self.show_status = show_status
        self._source = None
        self._path = None
        self._crop_ratio = None
        
        # Registrar los manejadores de eventos directamente
        self._add_event_handler("editing_complete", on_editing_complete)
        self._add_event_handler("editing_cancel", on_editing_cancel)

    def _get_control_name(self):
        return "flet_pro_image_editor"

    def _get_children(self):
        return []

    def _before_build_command(self):
        super()._before_build_command()

    def _build(self):
        args = {}
        if self.show_status:
            args["showStatus"] = "true"
        return super()._build() | args

    def open_editor(self, source: str, path: str, crop_ratio: str = None):
        """
        Abre el editor de imágenes con la imagen especificada.

        Args:
            source: Fuente de la imagen ('network', 'file', 'asset')
            path: Ruta a la imagen
            crop_ratio: Relación de aspecto para el recorte (ej. '1.0', '4/3', '16/9')
        """
        self._source = source
        self._path = path
        self._crop_ratio = crop_ratio

        args = {"source": source, "path": path}
        if crop_ratio:
            args["crop_ratio"] = crop_ratio

        return self.invoke_method("open_editor", args)

    def close_editor(self):
        """
        Cierra el editor de imágenes.
        """
        return self.invoke_method("close_editor", {})

    def open(self, dialog):
        """
        Abre el editor de imágenes como un diálogo.

        Args:
            dialog: El control ProImageEditor a abrir
        """
        if not self._source or not self._path:
            raise ValueError(
                "Debe llamar a open_editor primero para configurar la imagen"
            )

        args = {"source": self._source, "path": self._path}
        if self._crop_ratio:
            args["crop_ratio"] = self._crop_ratio

        return self.invoke_method("open", args)

    def close(self, dialog):
        """
        Cierra el editor de imágenes.

        Args:
            dialog: El control ProImageEditor a cerrar
        """
        return self.invoke_method("close", {})
        
    # Implementación simplificada de los manejadores de eventos
    @property
    def on_editing_complete(self):
        return self._get_event_handler("editing_complete")
        
    @on_editing_complete.setter
    def on_editing_complete(self, handler):
        self._add_event_handler("editing_complete", handler)
        
    @property
    def on_editing_cancel(self):
        return self._get_event_handler("editing_cancel")
        
    @on_editing_cancel.setter
    def on_editing_cancel(self, handler):
        self._add_event_handler("editing_cancel", handler)
