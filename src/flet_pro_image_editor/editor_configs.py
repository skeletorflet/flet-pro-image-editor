from enum import Enum
from typing import Any, Optional

class ImageEditorDesignMode(Enum):
    material = "material"
    cupertino = "cupertino"

class I18n:
    def __init__(self):
        # TODO: Add actual i18n fields if any from Dart
        pass

    def to_dict(self):
        # TODO: Populate with actual i18n key-values
        return {}

class MainEditorConfigs:
    def __init__(self):
        # TODO: Add actual fields from Dart's MainEditorConfigs
        pass

    def to_dict(self):
        # TODO: Populate with actual fields
        return {}

class PaintEditorConfigs:
    def __init__(self):
        # TODO: Add actual fields from Dart's PaintEditorConfigs
        pass

    def to_dict(self):
        # TODO: Populate with actual fields
        return {}

class TextEditorConfigs:
    def __init__(self):
        # TODO: Add actual fields from Dart's TextEditorConfigs
        pass

    def to_dict(self):
        # TODO: Populate with actual fields
        return {}

class CropRotateEditorConfigs:
    def __init__(self):
        # TODO: Add actual fields from Dart's CropRotateEditorConfigs
        pass

    def to_dict(self):
        # TODO: Populate with actual fields
        return {}

class FilterEditorConfigs:
    def __init__(self):
        # TODO: Add actual fields from Dart's FilterEditorConfigs
        pass

    def to_dict(self):
        # TODO: Populate with actual fields
        return {}

class TuneEditorConfigs:
    def __init__(self):
        # TODO: Add actual fields from Dart's TuneEditorConfigs
        pass

    def to_dict(self):
        # TODO: Populate with actual fields
        return {}
        
class BlurEditorConfigs:
    def __init__(self):
        # TODO: Add actual fields from Dart's BlurEditorConfigs
        pass

    def to_dict(self):
        # TODO: Populate with actual fields
        return {}

class EmojiEditorConfigs:
    def __init__(self):
        # TODO: Add actual fields from Dart's EmojiEditorConfigs
        pass

    def to_dict(self):
        # TODO: Populate with actual fields
        return {}

class StickerEditorConfigs:
    def __init__(self):
        # TODO: Add actual fields from Dart's StickerEditorConfigs
        pass

    def to_dict(self):
        # TODO: Populate with actual fields
        return {}

class StateHistoryConfigs:
    def __init__(self):
        # TODO: Add actual fields from Dart's StateHistoryConfigs
        pass

    def to_dict(self):
        # TODO: Populate with actual fields
        return {}

class ImageGenerationConfigs:
    def __init__(self):
        # TODO: Add actual fields from Dart's ImageGenerationConfigs
        pass

    def to_dict(self):
        # TODO: Populate with actual fields
        return {}

class HelperLineConfigs:
    def __init__(self):
        # TODO: Add actual fields from Dart's HelperLineConfigs
        pass

    def to_dict(self):
        # TODO: Populate with actual fields
        return {}

class LayerInteractionConfigs:
    def __init__(self):
        # TODO: Add actual fields from Dart's LayerInteractionConfigs
        pass

    def to_dict(self):
        # TODO: Populate with actual fields
        return {}

class DialogConfigs:
    def __init__(self):
        # TODO: Add actual fields from Dart's DialogConfigs
        pass

    def to_dict(self):
        # TODO: Populate with actual fields
        return {}

class ProgressIndicatorConfigs:
    def __init__(self):
        # TODO: Add actual fields from Dart's ProgressIndicatorConfigs
        pass

    def to_dict(self):
        # TODO: Populate with actual fields
        return {}
        
class VideoEditorConfigs:
    def __init__(self):
        # TODO: Add actual fields from Dart's VideoEditorConfigs
        pass

    def to_dict(self):
        # TODO: Populate with actual fields
        return {}

class ProImageEditorConfigs:
    def __init__(self,
                 theme: Any = None,
                 hero_tag: str = "Pro-Image-Editor-Hero",
                 i18n: I18n = I18n(),
                 main_editor: MainEditorConfigs = MainEditorConfigs(),
                 paint_editor: PaintEditorConfigs = PaintEditorConfigs(),
                 text_editor: TextEditorConfigs = TextEditorConfigs(),
                 crop_rotate_editor: CropRotateEditorConfigs = CropRotateEditorConfigs(),
                 filter_editor: FilterEditorConfigs = FilterEditorConfigs(),
                 tune_editor: TuneEditorConfigs = TuneEditorConfigs(),
                 blur_editor: BlurEditorConfigs = BlurEditorConfigs(),
                 emoji_editor: EmojiEditorConfigs = EmojiEditorConfigs(),
                 sticker_editor: StickerEditorConfigs = StickerEditorConfigs(),
                 state_history: StateHistoryConfigs = StateHistoryConfigs(),
                 image_generation: ImageGenerationConfigs = ImageGenerationConfigs(),
                 helper_lines: HelperLineConfigs = HelperLineConfigs(),
                 layer_interaction: LayerInteractionConfigs = LayerInteractionConfigs(),
                 dialog_configs: DialogConfigs = DialogConfigs(),
                 progress_indicator_configs: ProgressIndicatorConfigs = ProgressIndicatorConfigs(),
                 video_editor: VideoEditorConfigs = VideoEditorConfigs(),
                 design_mode: ImageEditorDesignMode = ImageEditorDesignMode.material):
        self.theme = theme
        self.hero_tag = hero_tag
        self.i18n = i18n
        self.main_editor = main_editor
        self.paint_editor = paint_editor
        self.text_editor = text_editor
        self.crop_rotate_editor = crop_rotate_editor
        self.filter_editor = filter_editor
        self.tune_editor = tune_editor
        self.blur_editor = blur_editor
        self.emoji_editor = emoji_editor
        self.sticker_editor = sticker_editor
        self.state_history = state_history
        self.image_generation = image_generation
        self.helper_lines = helper_lines
        self.layer_interaction = layer_interaction
        self.dialog_configs = dialog_configs
        self.progress_indicator_configs = progress_indicator_configs
        self.video_editor = video_editor
        self.design_mode = design_mode

    def to_dict(self):
        # Helper to convert object to dict if it has to_dict, else keep as is (for theme)
        def _to_dict_if_possible(obj):
            if hasattr(obj, 'to_dict'):
                return obj.to_dict()
            return obj

        # Helper to convert enum to value if it's an enum
        def _enum_to_value(obj):
            if isinstance(obj, Enum): # Make sure to import Enum from enum
                return obj.value
            return obj

        return {
            "theme": _to_dict_if_possible(self.theme), # ThemeData might need special handling
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
