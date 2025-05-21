from enum import Enum
from typing import List, Optional, Any, Callable, Tuple, Union # Added Union

# General Enums
class ImageEditorDesignMode(Enum):
    MATERIAL = "material"
    CUPERTINO = "cupertino"

class TextAlign(Enum):
    LEFT = "left"
    RIGHT = "right"
    CENTER = "center"
    JUSTIFY = "justify"
    START = "start"
    END = "end"

class LayerBackgroundMode(Enum):
    NONE = "none"
    BACKGROUND = "background"
    COLOR = "color"
    BACKGROUND_AND_COLOR = "backgroundAndColor"

class RotateDirection(Enum):
    LEFT = "left"
    RIGHT = "right"
    NONE = "none"

class OutputFormat(Enum):
    JPG = "jpg"
    PNG = "png"

class PngFilter(Enum):
    NONE = "none"
    SUB = "sub"
    UP = "up"
    AVERAGE = "average"
    PAETH = "paeth"

class JpegChroma(Enum):
    YUV420 = "yuv420"
    YUV422 = "yuv422"
    YUV444 = "yuv444"

class LayerInteractionSelectable(Enum):
    AUTO = "auto"
    SELECTABLE = "selectable"
    NOT_SELECTABLE = "notSelectable"

# Auxiliary data classes
class EditorSafeArea:
    def __init__(self, top: bool = True, left: bool = True, right: bool = True, bottom: bool = True):
        self.top = top
        self.left = left
        self.right = right
        self.bottom = bottom

    def to_dict(self):
        return {"top": self.top, "left": self.left, "right": self.right, "bottom": self.bottom}

class AspectRatioItem:
    def __init__(self, text: str, value: float):
        self.text = text
        self.value = value

    def to_dict(self):
        return {"text": self.text, "value": self.value}

class FilterModel: # Placeholder
    def __init__(self, name: str = "Unknown Filter", matrix: Optional[List[float]] = None):
        self.name = name
        self.matrix = matrix if matrix is not None else []
    def to_dict(self):
        return {"name": self.name, "matrix": self.matrix}

class CategoryEmoji: # Placeholder from user feedback; actual structure may vary.
    def __init__(self, category: str = "Default", emojis: Optional[List[str]] = None, locale: Optional[str] = None): # Added locale
        self.category = category
        self.emojis = emojis if emojis is not None else []
        self.locale = locale # For I18nEmojiEditor's locale
    def to_dict(self):
        data = {"category": self.category, "emojis": self.emojis}
        if self.locale:
            data["locale"] = self.locale
        return data


class CensorConfigs:
    def __init__(self,
                 blur_sigma_x: float = 14.0,
                 blur_sigma_y: float = 14.0,
                 pixel_block_size: float = 80.0,
                 enable_round_area: bool = False,
                 blur_blend_mode: str = "srcOver",
                 pixelate_blend_mode: str = "srcOver"):
        self.blur_sigma_x = blur_sigma_x
        self.blur_sigma_y = blur_sigma_y
        self.pixel_block_size = pixel_block_size
        self.enable_round_area = enable_round_area
        self.blur_blend_mode = blur_blend_mode
        self.pixelate_blend_mode = pixelate_blend_mode

    def to_dict(self):
        return {
            "blurSigmaX": self.blur_sigma_x, "blurSigmaY": self.blur_sigma_y,
            "pixelBlockSize": self.pixel_block_size, "enableRoundArea": self.enable_round_area,
            "blurBlendMode": self.blur_blend_mode, "pixelateBlendMode": self.pixelate_blend_mode,
        }

class HelperLineStyle:
    def __init__(self, color: str = "0x4BFFFFFF", stroke_width: float = 1.0):
        self.color = color
        self.stroke_width = stroke_width
    def to_dict(self):
        return {"color": self.color, "strokeWidth": self.stroke_width}

# ThemeData and Curve are complex; simplified for now.
class ThemeData: # Placeholder
    def __init__(self, primary_color: str = "blue"):
        self.primary_color = primary_color
    def to_dict(self):
        return {"primary_color": self.primary_color}

class Curve: # Placeholder
    def __init__(self, name: str = "linear"):
        self.name = name
    def to_dict(self):
        return self.name
        
class SystemUiOverlayStyle: # Placeholder
    def __init__(self, some_property: Optional[str] = None): # Add properties based on actual Dart class
        self.some_property = some_property
    def to_dict(self):
        return {"someProperty": self.some_property} if self.some_property else {}

# Duration to milliseconds helper (Dart Duration is complex)
def _duration_to_milliseconds(duration_obj: Optional[Any]) -> Optional[int]:
    if duration_obj is None:
        return None
    if isinstance(duration_obj, int): # Assuming direct ms if int
        return duration_obj
    if hasattr(duration_obj, 'in_milliseconds'): # Basic duck-typing for a Duration-like obj
        return duration_obj.in_milliseconds()
    # TODO: Find a robust way to represent Duration or require ms as int
    return None # Or raise error


# Helper for object_to_dict
def _to_dict_if_possible(obj):
    if hasattr(obj, 'to_dict'):
        return obj.to_dict()
    return obj

def _enum_to_value(obj):
    if isinstance(obj, Enum):
        return obj.value
    return obj
    
# === I18n Sub-classes ===
class I18nLayerInteraction:
    def __init__(self, remove: str = 'Remove', edit: str = 'Edit', rotate_scale: str = 'Rotate and Scale'):
        self.remove = remove
        self.edit = edit
        self.rotate_scale = rotate_scale
    def to_dict(self):
        return {"remove": self.remove, "edit": self.edit, "rotateScale": self.rotate_scale}

class I18nPaintEditor:
    def __init__(self, move_and_zoom: str = 'Zoom', bottom_navigation_bar_text: str = 'Paint',
                 freestyle: str = 'Freestyle', arrow: str = 'Arrow', line: str = 'Line',
                 rectangle: str = 'Rectangle', circle: str = 'Circle', dash_line: str = 'Dash line',
                 blur: str = 'Blur', pixelate: str = 'Pixelate', line_width: str = 'Line width',
                 eraser: str = 'Eraser', toggle_fill: str = 'Toggle fill',
                 change_opacity: str = 'Change opacity', undo: str = 'Undo', redo: str = 'Redo',
                 done: str = 'Done', back: str = 'Back', small_screen_more_tooltip: str = 'More'):
        self.move_and_zoom = move_and_zoom
        self.bottom_navigation_bar_text = bottom_navigation_bar_text
        self.freestyle, self.arrow, self.line = freestyle, arrow, line
        self.rectangle, self.circle, self.dash_line = rectangle, circle, dash_line
        self.blur, self.pixelate, self.line_width = blur, pixelate, line_width
        self.eraser, self.toggle_fill, self.change_opacity = eraser, toggle_fill, change_opacity
        self.undo, self.redo, self.done, self.back = undo, redo, done, back
        self.small_screen_more_tooltip = small_screen_more_tooltip
    def to_dict(self):
        return {k[0].lower() + k.title().replace("_", "")[1:]: v for k, v in self.__dict__.items()}


class I18nTextEditor:
    def __init__(self, input_hint_text: str = 'Enter text', bottom_navigation_bar_text: str = 'Text',
                 back: str = 'Back', done: str = 'Done', text_align: str = 'Align text',
                 font_scale: str = 'Font scale', background_mode: str = 'Background mode',
                 small_screen_more_tooltip: str = 'More'):
        self.input_hint_text, self.bottom_navigation_bar_text = input_hint_text, bottom_navigation_bar_text
        self.back, self.done, self.text_align = back, done, text_align
        self.font_scale, self.background_mode = font_scale, background_mode
        self.small_screen_more_tooltip = small_screen_more_tooltip
    def to_dict(self):
        return {k[0].lower() + k.title().replace("_", "")[1:]: v for k, v in self.__dict__.items()}

class I18nCropRotateEditor:
    def __init__(self, bottom_navigation_bar_text: str = 'Crop/ Rotate', rotate: str = 'Rotate',
                 flip: str = 'Flip', ratio: str = 'Ratio', back: str = 'Back', done: str = 'Done',
                 cancel: str = 'Cancel', undo: str = 'Undo', redo: str = 'Redo',
                 small_screen_more_tooltip: str = 'More', reset: str = 'Reset'):
        self.bottom_navigation_bar_text, self.rotate, self.flip = bottom_navigation_bar_text, rotate, flip
        self.ratio, self.back, self.done, self.cancel = ratio, back, done, cancel
        self.undo, self.redo, self.small_screen_more_tooltip = undo, redo, small_screen_more_tooltip
        self.reset = reset
    def to_dict(self):
        return {k[0].lower() + k.title().replace("_", "")[1:]: v for k, v in self.__dict__.items()}

class I18nFilters:
    def __init__(self): # Placeholder for specific filter names
        pass
    def to_dict(self):
        return {}

class I18nFilterEditor:
    def __init__(self, bottom_navigation_bar_text: str = 'Filter', back: str = 'Back',
                 done: str = 'Done', filters: Optional[I18nFilters] = None):
        self.bottom_navigation_bar_text, self.back, self.done = bottom_navigation_bar_text, back, done
        self.filters = filters if filters is not None else I18nFilters()
    def to_dict(self):
        return {"bottomNavigationBarText": self.bottom_navigation_bar_text, "back": self.back,
                "done": self.done, "filters": self.filters.to_dict()}

class I18nTuneEditor: # Placeholder - User did not provide specific fields for this
    def __init__(self, bottom_navigation_bar_text: str = "Tune"):
        self.bottom_navigation_bar_text = bottom_navigation_bar_text
    def to_dict(self):
        return {"bottomNavigationBarText": self.bottom_navigation_bar_text}


class I18nBlurEditor:
    def __init__(self, bottom_navigation_bar_text: str = 'Blur', back: str = 'Back', done: str = 'Done'):
        self.bottom_navigation_bar_text, self.back, self.done = bottom_navigation_bar_text, back, done
    def to_dict(self):
        return {"bottomNavigationBarText": self.bottom_navigation_bar_text, "back": self.back, "done": self.done}

class I18nEmojiEditor:
    def __init__(self, bottom_navigation_bar_text: str = 'Emoji', search: str = 'Search',
                 category_recent: str = 'Recent', category_smileys: str = 'Smileys & People',
                 category_animals: str = 'Animals & Nature', category_food: str = 'Food & Drink',
                 category_activities: str = 'Activities', category_travel: str = 'Travel & Places',
                 category_objects: str = 'Objects', category_symbols: str = 'Symbols',
                 category_flags: str = 'Flags', enable_search_auto_i18n: bool = False,
                 locale: Optional[str] = None): # Changed from Locale? to Optional[str]
        self.bottom_navigation_bar_text = bottom_navigation_bar_text
        self.search, self.category_recent, self.category_smileys = search, category_recent, category_smileys
        self.category_animals, self.category_food, self.category_activities = category_animals, category_food, category_activities
        self.category_travel, self.category_objects, self.category_symbols = category_travel, category_objects, category_symbols
        self.category_flags, self.enable_search_auto_i18n = category_flags, enable_search_auto_i18n
        self.locale = locale
    def to_dict(self):
        data = {k[0].lower() + k.title().replace("_", "")[1:]: v for k, v in self.__dict__.items() if k != "locale"}
        if self.locale:
            data["locale"] = self.locale
        return data

class I18nStickerEditor: # Placeholder - User did not provide specific fields for this
    def __init__(self, bottom_navigation_bar_text: str = "Stickers"):
        self.bottom_navigation_bar_text = bottom_navigation_bar_text
    def to_dict(self):
        return {"bottomNavigationBarText": self.bottom_navigation_bar_text}


class I18nVarious:
    def __init__(self, loading_dialog_msg: str = 'Please wait...',
                 close_editor_warning_title: str = 'Close Image Editor?',
                 close_editor_warning_message: str = 'Are you sure you want to close the Image Editor? Your changes will not be saved.',
                 close_editor_warning_confirm_btn: str = 'OK',
                 close_editor_warning_cancel_btn: str = 'Cancel'):
        self.loading_dialog_msg = loading_dialog_msg
        self.close_editor_warning_title = close_editor_warning_title
        self.close_editor_warning_message = close_editor_warning_message
        self.close_editor_warning_confirm_btn = close_editor_warning_confirm_btn
        self.close_editor_warning_cancel_btn = close_editor_warning_cancel_btn
    def to_dict(self):
        return {k[0].lower() + k.title().replace("_", "")[1:]: v for k, v in self.__dict__.items()}

class I18n:
    def __init__(self, layer_interaction: Optional[I18nLayerInteraction] = None,
                 paint_editor: Optional[I18nPaintEditor] = None,
                 text_editor: Optional[I18nTextEditor] = None,
                 crop_rotate_editor: Optional[I18nCropRotateEditor] = None,
                 tune_editor: Optional[I18nTuneEditor] = None, # Added
                 filter_editor: Optional[I18nFilterEditor] = None,
                 blur_editor: Optional[I18nBlurEditor] = None, # Added
                 emoji_editor: Optional[I18nEmojiEditor] = None, # Added
                 sticker_editor: Optional[I18nStickerEditor] = None, # Added
                 various: Optional[I18nVarious] = None,
                 import_state_history_msg: str = 'Initialize Editor', cancel: str = 'Cancel',
                 undo: str = 'Undo', redo: str = 'Redo', done: str = 'Done', remove: str = 'Remove',
                 done_loading_msg: str = 'Changes are being applied'):
        self.layer_interaction = layer_interaction if layer_interaction is not None else I18nLayerInteraction()
        self.paint_editor = paint_editor if paint_editor is not None else I18nPaintEditor()
        self.text_editor = text_editor if text_editor is not None else I18nTextEditor()
        self.crop_rotate_editor = crop_rotate_editor if crop_rotate_editor is not None else I18nCropRotateEditor()
        self.tune_editor = tune_editor if tune_editor is not None else I18nTuneEditor()
        self.filter_editor = filter_editor if filter_editor is not None else I18nFilterEditor()
        self.blur_editor = blur_editor if blur_editor is not None else I18nBlurEditor()
        self.emoji_editor = emoji_editor if emoji_editor is not None else I18nEmojiEditor()
        self.sticker_editor = sticker_editor if sticker_editor is not None else I18nStickerEditor()
        self.various = various if various is not None else I18nVarious()
        self.import_state_history_msg, self.cancel, self.undo = import_state_history_msg, cancel, undo
        self.redo, self.done, self.remove, self.done_loading_msg = redo, done, remove, done_loading_msg

    def to_dict(self):
        return {
            "layerInteraction": self.layer_interaction.to_dict(),
            "paintEditor": self.paint_editor.to_dict(),
            "textEditor": self.text_editor.to_dict(),
            "cropRotateEditor": self.crop_rotate_editor.to_dict(),
            "tuneEditor": self.tune_editor.to_dict(),
            "filterEditor": self.filter_editor.to_dict(),
            "blurEditor": self.blur_editor.to_dict(),
            "emojiEditor": self.emoji_editor.to_dict(),
            "stickerEditor": self.sticker_editor.to_dict(),
            "various": self.various.to_dict(),
            "importStateHistoryMsg": self.import_state_history_msg, "cancel": self.cancel,
            "undo": self.undo, "redo": self.redo, "done": self.done, "remove": self.remove,
            "doneLoadingMsg": self.done_loading_msg,
        }

# === Main Editor Configs ===
# Auxiliary classes for MainEditor
class MainEditorStyle:
    def __init__(self, background: str = "kImageEditorBackground", # Placeholder for actual color value
                 bottom_bar_color: str = "kImageEditorBottomBarColor",
                 bottom_bar_background: str = "kImageEditorBottomBarBackground",
                 app_bar_color: str = "kImageEditorAppBarColor",
                 app_bar_background: str = "kImageEditorAppBarBackground",
                 ui_overlay_style: Optional[SystemUiOverlayStyle] = None, # Placeholder
                 outside_capture_area_layer_opacity: float = 0.5,
                 sub_editor_page: Optional[Any] = None): # Placeholder for SubEditorPageStyle
        self.background = background
        self.bottom_bar_color = bottom_bar_color
        self.bottom_bar_background = bottom_bar_background
        self.app_bar_color = app_bar_color
        self.app_bar_background = app_bar_background
        self.ui_overlay_style = ui_overlay_style if ui_overlay_style is not None else SystemUiOverlayStyle()
        self.outside_capture_area_layer_opacity = outside_capture_area_layer_opacity
        self.sub_editor_page = sub_editor_page # TODO: Define SubEditorPageStyle if necessary
    def to_dict(self):
        return {
            "background": self.background, "bottomBarColor": self.bottom_bar_color,
            "bottomBarBackground": self.bottom_bar_background, "appBarColor": self.app_bar_color,
            "appBarBackground": self.app_bar_background,
            "uiOverlayStyle": self.ui_overlay_style.to_dict(),
            "outsideCaptureAreaLayerOpacity": self.outside_capture_area_layer_opacity,
            "subEditorPage": _to_dict_if_possible(self.sub_editor_page),
        }

class MainEditorIcons:
    def __init__(self, close_editor: str = "Icons.clear", done_icon: str = "Icons.done", # Map to Flet icons later
                 apply_changes: str = "Icons.done", back_button: str = "Icons.arrow_back",
                 undo_action: str = "Icons.undo", redo_action: str = "Icons.redo",
                 remove_element_zone: str = "Icons.delete_outline_rounded"):
        self.close_editor, self.done_icon, self.apply_changes = close_editor, done_icon, apply_changes
        self.back_button, self.undo_action, self.redo_action = back_button, undo_action, redo_action
        self.remove_element_zone = remove_element_zone
    def to_dict(self): # Icon data might need special handling for Flet
        return {k:v for k,v in self.__dict__.items()}

class MainEditorWidgets: # Callbacks/Widgets are complex to map directly
    def __init__(self, close_warning_dialog: Optional[Any] = None, # Callable
                 remove_layer_area: Optional[Any] = None, # Callable
                 wrap_body: Optional[Any] = None, # Callable
                 app_bar: Optional[Any] = None, # Callable
                 bottom_bar: Optional[Any] = None, # Callable
                 body_items: Optional[Any] = None, # Callable
                 body_items_recorded: Optional[Any] = None): # Callable
        # These are complex widget builders or callbacks, hard to represent in Python directly for Flet
        # For now, they are placeholders. Actual implementation would depend on Flet's capabilities
        # to accept Python functions that build Flet controls or map to Dart widget builders.
        pass
    def to_dict(self): # This would be highly dependent on how Flet handles widget builders
        return {}


class MainEditorConfigs:
    def __init__(self, enable_zoom: bool = False, editor_min_scale: float = 1.0,
                 editor_max_scale: float = 5.0, enable_double_tap_zoom: bool = True,
                 double_tap_zoom_factor: float = 2.0,
                 double_tap_zoom_duration_ms: int = 180, # Changed from Duration
                 double_tap_zoom_curve: Optional[Curve] = None, # Placeholder
                 boundary_margin_ltrb: Optional[Tuple[float, float, float, float]] = None, # EdgeInsets.zero
                 transform_setup: Optional[Any] = None, # Placeholder MainEditorTransformSetup
                 enable_close_button: bool = True, enable_escape_button: bool = True,
                 style: Optional[MainEditorStyle] = None,
                 icons: Optional[MainEditorIcons] = None,
                 widgets: Optional[MainEditorWidgets] = None,
                 safe_area: Optional[EditorSafeArea] = None):
        self.enable_zoom = enable_zoom
        self.editor_min_scale = editor_min_scale
        self.editor_max_scale = editor_max_scale
        self.enable_double_tap_zoom = enable_double_tap_zoom
        self.double_tap_zoom_factor = double_tap_zoom_factor
        self.double_tap_zoom_duration_ms = double_tap_zoom_duration_ms
        self.double_tap_zoom_curve = double_tap_zoom_curve if double_tap_zoom_curve is not None else Curve(name="easeInOut")
        self.boundary_margin_ltrb = boundary_margin_ltrb if boundary_margin_ltrb is not None else (0.0,0.0,0.0,0.0)
        self.transform_setup = transform_setup # TODO: Define MainEditorTransformSetup if necessary
        self.enable_close_button = enable_close_button
        self.enable_escape_button = enable_escape_button
        self.style = style if style is not None else MainEditorStyle()
        self.icons = icons if icons is not None else MainEditorIcons()
        self.widgets = widgets if widgets is not None else MainEditorWidgets()
        self.safe_area = safe_area if safe_area is not None else EditorSafeArea()

    def to_dict(self):
        return {
            "enableZoom": self.enable_zoom, "editorMinScale": self.editor_min_scale,
            "editorMaxScale": self.editor_max_scale, "enableDoubleTapZoom": self.enable_double_tap_zoom,
            "doubleTapZoomFactor": self.double_tap_zoom_factor,
            "doubleTapZoomDuration": self.double_tap_zoom_duration_ms, # Changed key for clarity
            "doubleTapZoomCurve": self.double_tap_zoom_curve.to_dict(),
            "boundaryMargin": {"left":self.boundary_margin_ltrb[0], "top":self.boundary_margin_ltrb[1], "right":self.boundary_margin_ltrb[2], "bottom":self.boundary_margin_ltrb[3]},
            "transformSetup": _to_dict_if_possible(self.transform_setup),
            "enableCloseButton": self.enable_close_button, "enableEscapeButton": self.enable_escape_button,
            "style": self.style.to_dict(), "icons": self.icons.to_dict(),
            "widgets": self.widgets.to_dict(), "safeArea": self.safe_area.to_dict(),
        }

# === Paint Editor Configs ===
class PaintMode(Enum): # Added from PaintEditorConfigs
    FREE_STYLE = "freeStyle"
    ARROW = "arrow"
    LINE = "line"
    RECT = "rect"
    CIRCLE = "circle"
    DASH_LINE = "dashLine"
    BLUR = "blur" # If blur is a paint mode
    PIXELATE = "pixelate" # If pixelate is a paint mode
    ERASER = "eraser"
    # Add others if they are distinct paint modes in Dart

class PaintEditorStyle:
    def __init__(self, line_width_bottom_sheet_title_style: Optional[Any] = None, # TextStyle placeholder
                 opacity_bottom_sheet_title_style: Optional[Any] = None, # TextStyle placeholder
                 app_bar_background: str = "kImageEditorAppBarBackground",
                 app_bar_color: str = "kImageEditorAppBarColor",
                 line_width_bottom_sheet_background: str = "#252728",
                 opacity_bottom_sheet_background: str = "#252728",
                 background: str = "kImageEditorBackground",
                 bottom_bar_background: str = "kImageEditorBottomBarBackground",
                 bottom_bar_active_item_color: str = "kImageEditorPrimaryColor",
                 bottom_bar_inactive_item_color: str = "#EEEEEE",
                 initial_stroke_width: float = 10.0,
                 initial_opacity: float = 1.0,
                 ui_overlay_style: Optional[SystemUiOverlayStyle] = None,
                 initial_color: str = "#FFFF0000"): # Format RRGGBB or AARRGGBB
        self.line_width_bottom_sheet_title_style = line_width_bottom_sheet_title_style
        self.opacity_bottom_sheet_title_style = opacity_bottom_sheet_title_style
        self.app_bar_background = app_bar_background
        self.app_bar_color = app_bar_color
        self.line_width_bottom_sheet_background = line_width_bottom_sheet_background
        self.opacity_bottom_sheet_background = opacity_bottom_sheet_background
        self.background = background
        self.bottom_bar_background = bottom_bar_background
        self.bottom_bar_active_item_color = bottom_bar_active_item_color
        self.bottom_bar_inactive_item_color = bottom_bar_inactive_item_color
        self.initial_stroke_width = initial_stroke_width
        self.initial_opacity = initial_opacity
        self.ui_overlay_style = ui_overlay_style if ui_overlay_style is not None else SystemUiOverlayStyle()
        self.initial_color = initial_color
    def to_dict(self):
        return {
            "lineWidthBottomSheetTitle": _to_dict_if_possible(self.line_width_bottom_sheet_title_style), # TextStyle
            "opacityBottomSheetTitle": _to_dict_if_possible(self.opacity_bottom_sheet_title_style), # TextStyle
            "appBarBackground": self.app_bar_background, "appBarColor": self.app_bar_color,
            "lineWidthBottomSheetBackground": self.line_width_bottom_sheet_background,
            "opacityBottomSheetBackground": self.opacity_bottom_sheet_background,
            "background": self.background, "bottomBarBackground": self.bottom_bar_background,
            "bottomBarActiveItemColor": self.bottom_bar_active_item_color,
            "bottomBarInactiveItemColor": self.bottom_bar_inactive_item_color,
            "initialStrokeWidth": self.initial_stroke_width, "initialOpacity": self.initial_opacity,
            "uiOverlayStyle": self.ui_overlay_style.to_dict(), "initialColor": self.initial_color,
        }

class PaintEditorIcons:
    def __init__(self, move_and_zoom: str = "Icons.pinch_outlined", change_opacity: str = "Icons.opacity_outlined",
                 eraser: str = "Icons.delete_forever_outlined", bottom_nav_bar: str = "Icons.edit_outlined",
                 line_weight: str = "Icons.line_weight_rounded", free_style: str = "Icons.edit",
                 arrow: str = "Icons.arrow_right_alt_outlined", line: str = "Icons.horizontal_rule",
                 fill: str = "Icons.format_color_fill", no_fill: str = "Icons.format_color_reset",
                 rectangle: str = "Icons.crop_free", circle: str = "Icons.lens_outlined",
                 dash_line: str = "Icons.power_input", pixelate: str = "Icons.grid_on",
                 blur: str = "Icons.blur_on_rounded", apply_changes: str = "Icons.done",
                 back_button: str = "Icons.arrow_back", undo_action: str = "Icons.undo",
                 redo_action: str = "Icons.redo"):
        self.move_and_zoom, self.change_opacity, self.eraser = move_and_zoom, change_opacity, eraser
        self.bottom_nav_bar, self.line_weight, self.free_style = bottom_nav_bar, line_weight, free_style
        self.arrow, self.line, self.fill, self.no_fill = arrow, line, fill, no_fill
        self.rectangle, self.circle, self.dash_line = rectangle, circle, dash_line
        self.pixelate, self.blur, self.apply_changes = pixelate, blur, apply_changes
        self.back_button, self.undo_action, self.redo_action = back_button, undo_action, redo_action
    def to_dict(self):
        return {k:v for k,v in self.__dict__.items()}


class PaintEditorWidgets: # Callbacks/Widgets are complex
    def __init__(self, app_bar: Optional[Any] = None, bottom_bar: Optional[Any] = None,
                 body_items: Optional[Any] = None, body_items_recorded: Optional[Any] = None,
                 line_width_close_button: Optional[Any] = None,
                 change_opacity_close_button: Optional[Any] = None,
                 slider_line_width: Optional[Any] = None,
                 slider_change_opacity: Optional[Any] = None,
                 color_picker: Optional[Any] = None):
        pass # Placeholder
    def to_dict(self):
        return {}


class PaintEditorConfigs:
    def __init__(self, enabled: bool = True, enable_zoom: bool = False, editor_min_scale: float = 1.0,
                 editor_max_scale: float = 5.0, enable_double_tap_zoom: bool = True,
                 double_tap_zoom_factor: float = 2.0, double_tap_zoom_duration_ms: int = 180,
                 double_tap_zoom_curve: Optional[Curve] = None,
                 boundary_margin_ltrb: Optional[Tuple[float,float,float,float]] = None, # EdgeInsets.zero
                 enable_mode_free_style: bool = True, enable_mode_arrow: bool = True,
                 enable_mode_line: bool = True, enable_mode_rect: bool = True,
                 enable_mode_circle: bool = True, enable_mode_dash_line: bool = True,
                 enable_mode_blur: bool = True, enable_mode_pixelate: bool = True,
                 enable_mode_eraser: bool = True, show_toggle_fill_button: bool = True,
                 show_line_width_adjustment_button: bool = True,
                 show_opacity_adjustment_button: bool = True, is_initially_filled: bool = False,
                 show_layers: bool = True, enable_share_zoom_matrix: bool = True,
                 min_scale: float = -float('inf'), max_scale: float = float('inf'),
                 enable_free_style_high_performance_scaling: Optional[bool] = None,
                 enable_free_style_high_performance_moving: Optional[bool] = None,
                 enable_free_style_high_performance_hero: bool = False,
                 initial_paint_mode: PaintMode = PaintMode.FREE_STYLE,
                 censor_configs: Optional[CensorConfigs] = None,
                 safe_area: Optional[EditorSafeArea] = None,
                 style: Optional[PaintEditorStyle] = None,
                 icons: Optional[PaintEditorIcons] = None,
                 widgets: Optional[PaintEditorWidgets] = None):
        self.enabled = enabled
        self.enable_zoom = enable_zoom
        self.editor_min_scale = editor_min_scale
        self.editor_max_scale = editor_max_scale
        self.enable_double_tap_zoom = enable_double_tap_zoom
        self.double_tap_zoom_factor = double_tap_zoom_factor
        self.double_tap_zoom_duration_ms = double_tap_zoom_duration_ms
        self.double_tap_zoom_curve = double_tap_zoom_curve if double_tap_zoom_curve is not None else Curve(name="easeInOut")
        self.boundary_margin_ltrb = boundary_margin_ltrb if boundary_margin_ltrb is not None else (0.0,0.0,0.0,0.0)
        self.enable_mode_free_style = enable_mode_free_style
        self.enable_mode_arrow = enable_mode_arrow
        self.enable_mode_line = enable_mode_line
        self.enable_mode_rect = enable_mode_rect
        self.enable_mode_circle = enable_mode_circle
        self.enable_mode_dash_line = enable_mode_dash_line
        self.enable_mode_blur = enable_mode_blur
        self.enable_mode_pixelate = enable_mode_pixelate
        self.enable_mode_eraser = enable_mode_eraser
        self.show_toggle_fill_button = show_toggle_fill_button
        self.show_line_width_adjustment_button = show_line_width_adjustment_button
        self.show_opacity_adjustment_button = show_opacity_adjustment_button
        self.is_initially_filled = is_initially_filled
        self.show_layers = show_layers
        self.enable_share_zoom_matrix = enable_share_zoom_matrix
        self.min_scale = min_scale
        self.max_scale = max_scale
        self.enable_free_style_high_performance_scaling = enable_free_style_high_performance_scaling
        self.enable_free_style_high_performance_moving = enable_free_style_high_performance_moving
        self.enable_free_style_high_performance_hero = enable_free_style_high_performance_hero
        self.initial_paint_mode = initial_paint_mode
        self.censor_configs = censor_configs if censor_configs is not None else CensorConfigs()
        self.safe_area = safe_area if safe_area is not None else EditorSafeArea()
        self.style = style if style is not None else PaintEditorStyle()
        self.icons = icons if icons is not None else PaintEditorIcons()
        self.widgets = widgets if widgets is not None else PaintEditorWidgets()

    def to_dict(self):
        data = {k: _enum_to_value(_to_dict_if_possible(v)) for k, v in self.__dict__.items() if k not in ["double_tap_zoom_duration_ms", "boundary_margin_ltrb"]}
        data["doubleTapZoomDuration"] = self.double_tap_zoom_duration_ms
        data["boundaryMargin"] = {"left":self.boundary_margin_ltrb[0], "top":self.boundary_margin_ltrb[1], "right":self.boundary_margin_ltrb[2], "bottom":self.boundary_margin_ltrb[3]}
        # Nullable booleans need to be handled explicitly if Dart expects null vs false
        if self.enable_free_style_high_performance_scaling is None:
            data["enableFreeStyleHighPerformanceScaling"] = None 
        if self.enable_free_style_high_performance_moving is None:
            data["enableFreeStyleHighPerformanceMoving"] = None
        return data


# === Text Editor Configs ===
class TextStyle: # Placeholder for Flutter's TextStyle
    def __init__(self, color: Optional[str] = None, font_family: Optional[str] = None, font_size: Optional[float] = None):
        self.color = color
        self.font_family = font_family
        self.font_size = font_size
    def to_dict(self):
        return {k:v for k,v in self.__dict__.items() if v is not None}

class TextEditorStyle:
    def __init__(self, font_size_bottom_sheet_title_style: Optional[TextStyle] = None, # Placeholder TextStyle
                 text_field_margin_ltrb: Optional[Tuple[float,float,float,float]] = None, # (0,0,0,kBottomNavigationBarHeight)
                 app_bar_background: str = "kImageEditorAppBarBackground",
                 app_bar_color: str = "kImageEditorAppBarColor",
                 bottom_bar_background: str = "kImageEditorBottomBarBackground",
                 background: str = "#9B000000", # Color(0x9B000000)
                 bottom_bar_main_axis_alignment: str = "spaceEvenly", # MainAxisAlignment
                 input_hint_color: str = "#BDBDBD", # Color(0xFFBDBDBD)
                 input_cursor_color: str = "kImageEditorPrimaryColor",
                 font_scale_bottom_sheet_background: str = "#252728"):
        self.font_size_bottom_sheet_title_style = font_size_bottom_sheet_title_style if font_size_bottom_sheet_title_style is not None else TextStyle()
        self.text_field_margin_ltrb = text_field_margin_ltrb if text_field_margin_ltrb is not None else (0,0,0,56.0) # Assuming kBottomNavigationBarHeight = 56
        self.app_bar_background = app_bar_background
        self.app_bar_color = app_bar_color
        self.bottom_bar_background = bottom_bar_background
        self.background = background
        self.bottom_bar_main_axis_alignment = bottom_bar_main_axis_alignment
        self.input_hint_color = input_hint_color
        self.input_cursor_color = input_cursor_color
        self.font_scale_bottom_sheet_background = font_scale_bottom_sheet_background
    def to_dict(self):
        return {
            "fontSizeBottomSheetTitle": self.font_size_bottom_sheet_title_style.to_dict(),
            "textFieldMargin": {"left":self.text_field_margin_ltrb[0], "top":self.text_field_margin_ltrb[1], "right":self.text_field_margin_ltrb[2], "bottom":self.text_field_margin_ltrb[3]},
            "appBarBackground": self.app_bar_background, "appBarColor": self.app_bar_color,
            "bottomBarBackground": self.bottom_bar_background, "background": self.background,
            "bottomBarMainAxisAlignment": self.bottom_bar_main_axis_alignment,
            "inputHintColor": self.input_hint_color, "inputCursorColor": self.input_cursor_color,
            "fontScaleBottomSheetBackground": self.font_scale_bottom_sheet_background,
        }

class TextEditorIcons:
    def __init__(self, bottom_nav_bar: str = "Icons.title_rounded",
                 align_left: str = "Icons.align_horizontal_left_rounded",
                 align_center: str = "Icons.align_horizontal_center_rounded",
                 align_right: str = "Icons.align_horizontal_right_rounded",
                 font_scale: str = "Icons.format_size_rounded",
                 reset_font_scale: str = "Icons.refresh_rounded",
                 background_mode: str = "Icons.layers_rounded",
                 apply_changes: str = "Icons.done", back_button: str = "Icons.arrow_back"):
        self.bottom_nav_bar, self.align_left, self.align_center = bottom_nav_bar, align_left, align_center
        self.align_right, self.font_scale, self.reset_font_scale = align_right, font_scale, reset_font_scale
        self.background_mode, self.apply_changes, self.back_button = background_mode, apply_changes, back_button
    def to_dict(self):
        return {k:v for k,v in self.__dict__.items()}

class TextEditorWidgets: # Callbacks/Widgets are complex
    def __init__(self, app_bar: Optional[Any] = None, bottom_bar: Optional[Any] = None,
                 body_items: Optional[Any] = None, color_picker: Optional[Any] = None,
                 slider_font_size: Optional[Any] = None, font_size_close_button: Optional[Any] = None):
        pass # Placeholder
    def to_dict(self):
        return {}

class TextEditorConfigs:
    def __init__(self, enable_suggestions: bool = True, enabled: bool = True,
                 enable_autocorrect: bool = True, show_select_font_style_bottom_bar: bool = False,
                 show_text_align_button: bool = True, show_font_scale_button: bool = True,
                 show_background_mode_button: bool = True, enable_main_editor_zoom_factor: bool = False,
                 init_font_size: float = 24.0, initial_text_align: TextAlign = TextAlign.CENTER,
                 init_font_scale: float = 1.0, max_font_scale: float = 3.0, min_font_scale: float = 0.3,
                 min_scale: float = -float('inf'), max_scale: float = float('inf'),
                 custom_text_styles: Optional[List[TextStyle]] = None, # List of TextStyle
                 default_text_style: Optional[TextStyle] = None,
                 initial_background_color_mode: LayerBackgroundMode = LayerBackgroundMode.BACKGROUND_AND_COLOR,
                 safe_area: Optional[EditorSafeArea] = None,
                 style: Optional[TextEditorStyle] = None,
                 icons: Optional[TextEditorIcons] = None,
                 widgets: Optional[TextEditorWidgets] = None):
        self.enable_suggestions = enable_suggestions
        self.enabled = enabled
        self.enable_autocorrect = enable_autocorrect
        self.show_select_font_style_bottom_bar = show_select_font_style_bottom_bar
        self.show_text_align_button = show_text_align_button
        self.show_font_scale_button = show_font_scale_button
        self.show_background_mode_button = show_background_mode_button
        self.enable_main_editor_zoom_factor = enable_main_editor_zoom_factor
        self.init_font_size = init_font_size
        self.initial_text_align = initial_text_align
        self.init_font_scale = init_font_scale
        self.max_font_scale = max_font_scale
        self.min_font_scale = min_font_scale
        self.min_scale = min_scale
        self.max_scale = max_scale
        self.custom_text_styles = custom_text_styles if custom_text_styles is not None else []
        self.default_text_style = default_text_style if default_text_style is not None else TextStyle()
        self.initial_background_color_mode = initial_background_color_mode
        self.safe_area = safe_area if safe_area is not None else EditorSafeArea()
        self.style = style if style is not None else TextEditorStyle()
        self.icons = icons if icons is not None else TextEditorIcons()
        self.widgets = widgets if widgets is not None else TextEditorWidgets()

    def to_dict(self):
        return {
            "enableSuggestions": self.enable_suggestions, "enabled": self.enabled,
            "enableAutocorrect": self.enable_autocorrect,
            "showSelectFontStyleBottomBar": self.show_select_font_style_bottom_bar,
            "showTextAlignButton": self.show_text_align_button,
            "showFontScaleButton": self.show_font_scale_button,
            "showBackgroundModeButton": self.show_background_mode_button,
            "enableMainEditorZoomFactor": self.enable_main_editor_zoom_factor,
            "initFontSize": self.init_font_size,
            "initialTextAlign": _enum_to_value(self.initial_text_align),
            "initFontScale": self.init_font_scale, "maxFontScale": self.max_font_scale,
            "minFontScale": self.min_font_scale, "minScale": self.min_scale, "maxScale": self.max_scale,
            "customTextStyles": [_to_dict_if_possible(ts) for ts in self.custom_text_styles],
            "defaultTextStyle": self.default_text_style.to_dict(),
            "initialBackgroundColorMode": _enum_to_value(self.initial_background_color_mode),
            "safeArea": self.safe_area.to_dict(), "style": self.style.to_dict(),
            "icons": self.icons.to_dict(), "widgets": self.widgets.to_dict(),
        }

# === Crop & Rotate Editor Configs ===
class CropRotateEditorStyle: # Placeholder
    def __init__(self): pass
    def to_dict(self): return {}
class CropRotateEditorIcons: # Placeholder
    def __init__(self): pass
    def to_dict(self): return {}
class CropRotateEditorWidgets: # Placeholder
    def __init__(self): pass
    def to_dict(self): return {}

class CropRotateEditorConfigs:
    def __init__(self, desktop_corner_drag_area: float = 7.0,
                 mobile_corner_drag_area: float = 48.0, # kMinInteractiveDimension
                 enabled: bool = True, show_rotate_button: bool = True,
                 show_flip_button: bool = True, show_aspect_ratio_button: bool = True,
                 show_reset_button: bool = True, invert_mouse_scroll: bool = False,
                 invert_drag_direction: bool = False, enable_round_cropper: bool = False,
                 enable_transform_layers: bool = True, enable_provide_image_infos: bool = False,
                 enable_double_tap: bool = True, show_layers: bool = True,
                 init_aspect_ratio: Optional[float] = None,
                 rotate_animation_curve: Optional[Curve] = None,
                 scale_animation_curve: Optional[Curve] = None,
                 crop_drag_animation_curve: Optional[Curve] = None,
                 fade_in_outside_crop_area_animation_curve: Optional[Curve] = None,
                 rotate_direction: RotateDirection = RotateDirection.LEFT,
                 opacity_outside_crop_area_duration_ms: int = 100,
                 animation_duration_ms: int = 250,
                 fade_in_outside_crop_area_animation_duration_ms: int = 350,
                 crop_drag_animation_duration_ms: int = 400,
                 max_scale: float = 7.0, mouse_scale_factor: float = 0.1,
                 double_tap_scale_factor: float = 2.0,
                 aspect_ratios: Optional[List[AspectRatioItem]] = None,
                 safe_area: Optional[EditorSafeArea] = None,
                 style: Optional[CropRotateEditorStyle] = None,
                 icons: Optional[CropRotateEditorIcons] = None,
                 widgets: Optional[CropRotateEditorWidgets] = None,
                 max_width_factor: Optional[float] = None):
        self.desktop_corner_drag_area = desktop_corner_drag_area
        self.mobile_corner_drag_area = mobile_corner_drag_area
        self.enabled = enabled
        self.show_rotate_button = show_rotate_button
        self.show_flip_button = show_flip_button
        self.show_aspect_ratio_button = show_aspect_ratio_button
        self.show_reset_button = show_reset_button
        self.invert_mouse_scroll = invert_mouse_scroll
        self.invert_drag_direction = invert_drag_direction
        self.enable_round_cropper = enable_round_cropper
        self.enable_transform_layers = enable_transform_layers
        self.enable_provide_image_infos = enable_provide_image_infos
        self.enable_double_tap = enable_double_tap
        self.show_layers = show_layers
        self.init_aspect_ratio = init_aspect_ratio
        self.rotate_animation_curve = rotate_animation_curve if rotate_animation_curve is not None else Curve(name="decelerate")
        self.scale_animation_curve = scale_animation_curve if scale_animation_curve is not None else Curve(name="decelerate")
        self.crop_drag_animation_curve = crop_drag_animation_curve if crop_drag_animation_curve is not None else Curve(name="decelerate")
        self.fade_in_outside_crop_area_animation_curve = fade_in_outside_crop_area_animation_curve if fade_in_outside_crop_area_animation_curve is not None else Curve(name="decelerate")
        self.rotate_direction = rotate_direction
        self.opacity_outside_crop_area_duration_ms = opacity_outside_crop_area_duration_ms
        self.animation_duration_ms = animation_duration_ms
        self.fade_in_outside_crop_area_animation_duration_ms = fade_in_outside_crop_area_animation_duration_ms
        self.crop_drag_animation_duration_ms = crop_drag_animation_duration_ms
        self.max_scale = max_scale
        self.mouse_scale_factor = mouse_scale_factor
        self.double_tap_scale_factor = double_tap_scale_factor
        self.aspect_ratios = aspect_ratios if aspect_ratios is not None else [
            AspectRatioItem(text='Free', value=-1), AspectRatioItem(text='Original', value=0.0),
            AspectRatioItem(text='1*1', value=1.0/1.0), AspectRatioItem(text='4*3', value=4.0/3.0),
            AspectRatioItem(text='3*4', value=3.0/4.0), AspectRatioItem(text='16*9', value=16.0/9.0),
            AspectRatioItem(text='9*16', value=9.0/16.0)
        ]
        self.safe_area = safe_area if safe_area is not None else EditorSafeArea()
        self.style = style if style is not None else CropRotateEditorStyle()
        self.icons = icons if icons is not None else CropRotateEditorIcons()
        self.widgets = widgets if widgets is not None else CropRotateEditorWidgets()
        self.max_width_factor = max_width_factor

    def to_dict(self):
        # Simplified to_dict, assuming direct key mapping for most, special handling for durations/curves/enums
        data = {k: _enum_to_value(_to_dict_if_possible(v)) for k, v in self.__dict__.items() if "duration" not in k and "curve" not in k and k != "aspect_ratios"}
        data["rotateAnimationCurve"] = self.rotate_animation_curve.to_dict()
        data["scaleAnimationCurve"] = self.scale_animation_curve.to_dict()
        data["cropDragAnimationCurve"] = self.crop_drag_animation_curve.to_dict()
        data["fadeInOutsideCropAreaAnimationCurve"] = self.fade_in_outside_crop_area_animation_curve.to_dict()
        data["opacityOutsideCropAreaDuration"] = self.opacity_outside_crop_area_duration_ms
        data["animationDuration"] = self.animation_duration_ms
        data["fadeInOutsideCropAreaAnimationDuration"] = self.fade_in_outside_crop_area_animation_duration_ms
        data["cropDragAnimationDuration"] = self.crop_drag_animation_duration_ms
        data["aspectRatios"] = [_to_dict_if_possible(ar) for ar in self.aspect_ratios]
        if self.init_aspect_ratio is None: data["initAspectRatio"] = None # Ensure None is passed
        if self.max_width_factor is None: data["maxWidthFactor"] = None # Ensure None is passed
        return data


# === Filter Editor Configs ===
class FilterEditorStyle: # Placeholder
    def __init__(self): pass
    def to_dict(self): return {}
class FilterEditorIcons: # Placeholder
    def __init__(self): pass
    def to_dict(self): return {}
class FilterEditorWidgets: # Placeholder
    def __init__(self): pass
    def to_dict(self): return {}

class FilterEditorConfigs:
    def __init__(self, enabled: bool = True, show_layers: bool = True,
                 filter_list: Optional[List[FilterModel]] = None, # Placeholder FilterModel
                 safe_area: Optional[EditorSafeArea] = None,
                 fade_in_up_duration_ms: int = 220,
                 fade_in_up_stagger_delay_duration_ms: int = 25,
                 style: Optional[FilterEditorStyle] = None,
                 icons: Optional[FilterEditorIcons] = None,
                 widgets: Optional[FilterEditorWidgets] = None):
        self.enabled = enabled
        self.show_layers = show_layers
        self.filter_list = filter_list if filter_list is not None else []
        self.safe_area = safe_area if safe_area is not None else EditorSafeArea()
        self.fade_in_up_duration_ms = fade_in_up_duration_ms
        self.fade_in_up_stagger_delay_duration_ms = fade_in_up_stagger_delay_duration_ms
        self.style = style if style is not None else FilterEditorStyle()
        self.icons = icons if icons is not None else FilterEditorIcons()
        self.widgets = widgets if widgets is not None else FilterEditorWidgets()

    def to_dict(self):
        data = {k: _enum_to_value(_to_dict_if_possible(v)) for k, v in self.__dict__.items() if "duration" not in k}
        data["fadeInUpDuration"] = self.fade_in_up_duration_ms
        data["fadeInUpStaggerDelayDuration"] = self.fade_in_up_stagger_delay_duration_ms
        return data

# === Tune Editor Configs (Placeholder based on I18nTuneEditor) ===
class TuneEditorConfigs:
    def __init__(self, enabled: bool = True, # Assuming 'enabled' is a common config
                 # TODO: Add actual fields from Dart's TuneEditorConfigs
                ):
        self.enabled = enabled
        # self.style = TuneEditorStyle()
        # self.icons = TuneEditorIcons()
        # self.widgets = TuneEditorWidgets()
        # self.i18n = I18nTuneEditor() # This would be part of the main I18n class
    def to_dict(self):
        return {"enabled": self.enabled} # TODO: Populate with actual fields


# === Blur Editor Configs ===
class BlurEditorStyle: # Placeholder
    def __init__(self): pass
    def to_dict(self): return {}
class BlurEditorIcons: # Placeholder
    def __init__(self): pass
    def to_dict(self): return {}
class BlurEditorWidgets: # Placeholder
    def __init__(self): pass
    def to_dict(self): return {}

class BlurEditorConfigs:
    def __init__(self, enabled: bool = True, show_layers: bool = True, max_blur: float = 5.0,
                 safe_area: Optional[EditorSafeArea] = None,
                 style: Optional[BlurEditorStyle] = None,
                 icons: Optional[BlurEditorIcons] = None,
                 widgets: Optional[BlurEditorWidgets] = None):
        self.enabled = enabled
        self.show_layers = show_layers
        self.max_blur = max_blur
        self.safe_area = safe_area if safe_area is not None else EditorSafeArea()
        self.style = style if style is not None else BlurEditorStyle()
        self.icons = icons if icons is not None else BlurEditorIcons()
        self.widgets = widgets if widgets is not None else BlurEditorWidgets()
    def to_dict(self):
        return {k: _enum_to_value(_to_dict_if_possible(v)) for k, v in self.__dict__.items()}


# === Emoji Editor Configs ===
class EmojiEditorStyle: # Placeholder
    def __init__(self): pass
    def to_dict(self): return {}
class EmojiEditorIcons: # Placeholder
    def __init__(self): pass
    def to_dict(self): return {}

class EmojiEditorConfigs:
    def __init__(self, enabled: bool = True, enable_preload_web_font: bool = True,
                 init_scale: float = 5.0, min_scale: float = -float('inf'),
                 max_scale: float = float('inf'), check_platform_compatibility: bool = True,
                 emoji_set: Optional[List[CategoryEmoji]] = None, # Placeholder CategoryEmoji
                 style: Optional[EmojiEditorStyle] = None,
                 icons: Optional[EmojiEditorIcons] = None):
        self.enabled = enabled
        self.enable_preload_web_font = enable_preload_web_font
        self.init_scale = init_scale
        self.min_scale = min_scale
        self.max_scale = max_scale
        self.check_platform_compatibility = check_platform_compatibility
        self.emoji_set = emoji_set if emoji_set is not None else [] # User may provide Callable in Dart
        self.style = style if style is not None else EmojiEditorStyle()
        self.icons = icons if icons is not None else EmojiEditorIcons()
    def to_dict(self):
        # emoji_set is complex (Callable in Dart), pass as list of dicts for now
        return {
            "enabled": self.enabled, "enablePreloadWebFont": self.enable_preload_web_font,
            "initScale": self.init_scale, "minScale": self.min_scale, "maxScale": self.max_scale,
            "checkPlatformCompatibility": self.check_platform_compatibility,
            "emojiSet": [_to_dict_if_possible(es) for es in self.emoji_set],
            "style": self.style.to_dict(), "icons": self.icons.to_dict(),
        }

# === Sticker Editor Configs ===
class StickerEditorStyle: # Placeholder
    def __init__(self): pass
    def to_dict(self): return {}
class StickerEditorIcons: # Placeholder
    def __init__(self): pass
    def to_dict(self): return {}

class StickerEditorConfigs:
    def __init__(self, build_stickers: Optional[Any] = None, # Callable, complex
                 init_width: float = 100.0, min_scale: float = -float('inf'),
                 max_scale: float = float('inf'), enabled: bool = False,
                 style: Optional[StickerEditorStyle] = None,
                 icons: Optional[StickerEditorIcons] = None):
        self.build_stickers = build_stickers # Placeholder for complex callback
        self.init_width = init_width
        self.min_scale = min_scale
        self.max_scale = max_scale
        self.enabled = enabled
        self.style = style if style is not None else StickerEditorStyle()
        self.icons = icons if icons is not None else StickerEditorIcons()
    def to_dict(self):
        return {
            "buildStickers": None, # Cannot serialize Callable easily
            "initWidth": self.init_width, "minScale": self.min_scale, "maxScale": self.max_scale,
            "enabled": self.enabled, "style": self.style.to_dict(), "icons": self.icons.to_dict(),
        }

# === State History Configs ===
class StateHistoryConfigs:
    def __init__(self, state_history_limit: int = 1000, init_state_history: Optional[Any] = None): # ImportStateHistory placeholder
        self.state_history_limit = state_history_limit
        self.init_state_history = init_state_history # Placeholder, structure unknown
    def to_dict(self):
        return {
            "stateHistoryLimit": self.state_history_limit,
            "initStateHistory": _to_dict_if_possible(self.init_state_history),
        }
        
# === Image Generation Configs ===
class ProcessorConfigs: # Placeholder - from ImageGenerationConfigs
    def __init__(self):
        pass
    def to_dict(self):
        return {}
        
class Size: # Helper for maxOutputSize, maxThumbnailSize
    def __init__(self, width: float, height: float):
        self.width = width
        self.height = height
    def to_dict(self):
        return {"width": self.width, "height": self.height}

class ImageGenerationConfigs:
    def __init__(self, crop_to_image_bounds: bool = True, crop_to_drawing_bounds: bool = True,
                 allow_empty_editing_completion: bool = True, enable_isolate_generation: bool = True,
                 enable_background_generation: bool = True, # Simplified from !kIsWeb || !kDebugMode
                 enable_use_original_bytes: bool = True, single_frame: bool = False,
                 custom_pixel_ratio: Optional[float] = None, jpeg_quality: int = 100,
                 png_level: int = 6, png_filter: PngFilter = PngFilter.NONE,
                 jpeg_chroma: JpegChroma = JpegChroma.YUV444,
                 jpeg_background_color: str = "#FFFFFFFF", # Color(0xFFFFFFFF)
                 output_format: OutputFormat = OutputFormat.JPG,
                 processor_configs: Optional[ProcessorConfigs] = None, # Placeholder
                 max_output_size: Optional[Size] = None,
                 max_thumbnail_size: Optional[Size] = None):
        self.crop_to_image_bounds = crop_to_image_bounds
        self.crop_to_drawing_bounds = crop_to_drawing_bounds
        self.allow_empty_editing_completion = allow_empty_editing_completion
        self.enable_isolate_generation = enable_isolate_generation
        self.enable_background_generation = enable_background_generation
        self.enable_use_original_bytes = enable_use_original_bytes
        self.single_frame = single_frame
        self.custom_pixel_ratio = custom_pixel_ratio
        self.jpeg_quality = jpeg_quality
        self.png_level = png_level
        self.png_filter = png_filter
        self.jpeg_chroma = jpeg_chroma
        self.jpeg_background_color = jpeg_background_color
        self.output_format = output_format
        self.processor_configs = processor_configs if processor_configs is not None else ProcessorConfigs()
        self.max_output_size = max_output_size if max_output_size is not None else Size(2000,2000)
        self.max_thumbnail_size = max_thumbnail_size if max_thumbnail_size is not None else Size(100,100)

    def to_dict(self):
        data = {k: _enum_to_value(_to_dict_if_possible(v)) for k, v in self.__dict__.items()}
        if self.custom_pixel_ratio is None: data["customPixelRatio"] = None # Ensure None is passed
        return data

# === Helper Line Configs ===
class HelperLineConfigs:
    def __init__(self, show_vertical_line: bool = True, show_horizontal_line: bool = True,
                 show_rotate_line: bool = True, style: Optional[HelperLineStyle] = None):
        self.show_vertical_line = show_vertical_line
        self.show_horizontal_line = show_horizontal_line
        self.show_rotate_line = show_rotate_line
        self.style = style if style is not None else HelperLineStyle()
    def to_dict(self):
        return {k: _enum_to_value(_to_dict_if_possible(v)) for k, v in self.__dict__.items()}

# === Layer Interaction Configs ===
class LayerInteractionIcons: # Placeholder
    def __init__(self): pass
    def to_dict(self): return {}
class LayerInteractionWidgets: # Placeholder
    def __init__(self): pass
    def to_dict(self): return {}
class LayerInteractionStyle: # Placeholder
    def __init__(self): pass
    def to_dict(self): return {}
    
class LayerInteractionConfigs:
    def __init__(self, selectable: LayerInteractionSelectable = LayerInteractionSelectable.AUTO,
                 initial_selected: bool = False, hide_toolbar_on_interaction: bool = False,
                 hide_video_controls_on_interaction: bool = True,
                 video_controls_switch_duration_ms: int = 220,
                 icons: Optional[LayerInteractionIcons] = None, # Placeholder
                 widgets: Optional[LayerInteractionWidgets] = None, # Placeholder
                 style: Optional[LayerInteractionStyle] = None): # Placeholder
        self.selectable = selectable
        self.initial_selected = initial_selected
        self.hide_toolbar_on_interaction = hide_toolbar_on_interaction
        self.hide_video_controls_on_interaction = hide_video_controls_on_interaction
        self.video_controls_switch_duration_ms = video_controls_switch_duration_ms
        self.icons = icons if icons is not None else LayerInteractionIcons()
        self.widgets = widgets if widgets is not None else LayerInteractionWidgets()
        self.style = style if style is not None else LayerInteractionStyle()

    def to_dict(self):
        data = {k: _enum_to_value(_to_dict_if_possible(v)) for k, v in self.__dict__.items() if "duration" not in k}
        data["videoControlsSwitchDuration"] = self.video_controls_switch_duration_ms
        return data

# === Dialog Configs ===
class DialogWidgets: # Placeholder
    def __init__(self): pass
    def to_dict(self): return {}
class DialogStyle: # Placeholder
    def __init__(self): pass
    def to_dict(self): return {}

class DialogConfigs:
    def __init__(self, widgets: Optional[DialogWidgets] = None, # Placeholder
                 style: Optional[DialogStyle] = None): # Placeholder
        self.widgets = widgets if widgets is not None else DialogWidgets()
        self.style = style if style is not None else DialogStyle()
    def to_dict(self):
        return {"widgets": self.widgets.to_dict(), "style": self.style.to_dict()}

# === Progress Indicator Configs ===
class ProgressIndicatorWidgets: # Placeholder
    def __init__(self): pass
    def to_dict(self): return {}

class ProgressIndicatorConfigs:
    def __init__(self, widgets: Optional[ProgressIndicatorWidgets] = None): # Placeholder
        self.widgets = widgets if widgets is not None else ProgressIndicatorWidgets()
    def to_dict(self):
        return {"widgets": self.widgets.to_dict()}

# === Video Editor Configs (Ignored as per user request) ===
class VideoEditorConfigs:
    def __init__(self, enabled: bool = False): # Minimal placeholder
        self.enabled = enabled
    def to_dict(self):
        return {"enabled": self.enabled}


# === Main ProImageEditorConfigs ===
class ProImageEditorConfigs:
    def __init__(self,
                 theme: Optional[ThemeData] = None, # Placeholder ThemeData
                 hero_tag: str = "Pro-Image-Editor-Hero", # kImageEditorHeroTag
                 i18n: Optional[I18n] = None,
                 main_editor: Optional[MainEditorConfigs] = None,
                 paint_editor: Optional[PaintEditorConfigs] = None,
                 text_editor: Optional[TextEditorConfigs] = None,
                 crop_rotate_editor: Optional[CropRotateEditorConfigs] = None,
                 filter_editor: Optional[FilterEditorConfigs] = None,
                 tune_editor: Optional[TuneEditorConfigs] = None, # Added
                 blur_editor: Optional[BlurEditorConfigs] = None,
                 emoji_editor: Optional[EmojiEditorConfigs] = None,
                 sticker_editor: Optional[StickerEditorConfigs] = None,
                 state_history: Optional[StateHistoryConfigs] = None,
                 image_generation: Optional[ImageGenerationConfigs] = None,
                 helper_lines: Optional[HelperLineConfigs] = None,
                 layer_interaction: Optional[LayerInteractionConfigs] = None,
                 dialog_configs: Optional[DialogConfigs] = None,
                 progress_indicator_configs: Optional[ProgressIndicatorConfigs] = None,
                 video_editor: Optional[VideoEditorConfigs] = None, # Ignored but kept for structure
                 design_mode: ImageEditorDesignMode = ImageEditorDesignMode.MATERIAL):
        self.theme = theme if theme is not None else ThemeData()
        self.hero_tag = hero_tag
        self.i18n = i18n if i18n is not None else I18n()
        self.main_editor = main_editor if main_editor is not None else MainEditorConfigs()
        self.paint_editor = paint_editor if paint_editor is not None else PaintEditorConfigs()
        self.text_editor = text_editor if text_editor is not None else TextEditorConfigs()
        self.crop_rotate_editor = crop_rotate_editor if crop_rotate_editor is not None else CropRotateEditorConfigs()
        self.filter_editor = filter_editor if filter_editor is not None else FilterEditorConfigs()
        self.tune_editor = tune_editor if tune_editor is not None else TuneEditorConfigs()
        self.blur_editor = blur_editor if blur_editor is not None else BlurEditorConfigs()
        self.emoji_editor = emoji_editor if emoji_editor is not None else EmojiEditorConfigs()
        self.sticker_editor = sticker_editor if sticker_editor is not None else StickerEditorConfigs()
        self.state_history = state_history if state_history is not None else StateHistoryConfigs()
        self.image_generation = image_generation if image_generation is not None else ImageGenerationConfigs()
        self.helper_lines = helper_lines if helper_lines is not None else HelperLineConfigs()
        self.layer_interaction = layer_interaction if layer_interaction is not None else LayerInteractionConfigs()
        self.dialog_configs = dialog_configs if dialog_configs is not None else DialogConfigs()
        self.progress_indicator_configs = progress_indicator_configs if progress_indicator_configs is not None else ProgressIndicatorConfigs()
        self.video_editor = video_editor if video_editor is not None else VideoEditorConfigs(enabled=False) # Explicitly disable if not used
        self.design_mode = design_mode

    def to_dict(self):
        return {
            "theme": self.theme.to_dict(),
            "heroTag": self.hero_tag,
            "i18n": self.i18n.to_dict(),
            "mainEditor": self.main_editor.to_dict(),
            "paintEditor": self.paint_editor.to_dict(),
            "textEditor": self.text_editor.to_dict(),
            "cropRotateEditor": self.crop_rotate_editor.to_dict(),
            "filterEditor": self.filter_editor.to_dict(),
            "tuneEditor": self.tune_editor.to_dict(),
            "blurEditor": self.blur_editor.to_dict(),
            "emojiEditor": self.emoji_editor.to_dict(),
            "stickerEditor": self.sticker_editor.to_dict(),
            "stateHistory": self.state_history.to_dict(),
            "imageGeneration": self.image_generation.to_dict(),
            "helperLines": self.helper_lines.to_dict(),
            "layerInteraction": self.layer_interaction.to_dict(),
            "dialogConfigs": self.dialog_configs.to_dict(),
            "progressIndicatorConfigs": self.progress_indicator_configs.to_dict(),
            "videoEditor": self.video_editor.to_dict(),
            "designMode": _enum_to_value(self.design_mode),
        }
