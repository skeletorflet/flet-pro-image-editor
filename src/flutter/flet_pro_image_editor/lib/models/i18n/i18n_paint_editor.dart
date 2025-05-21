import '../../utils/json_utils.dart' as utils;

class I18nPaintEditor {
  final String moveAndZoom;
  final String bottomNavigationBarText;
  final String freestyle;
  final String arrow;
  final String line;
  final String rectangle;
  final String circle;
  final String dashLine;
  final String blur;
  final String pixelate;
  final String lineWidth;
  final String eraser;
  final String toggleFill;
  final String changeOpacity;
  final String undo;
  final String redo;
  final String done;
  final String back;
  final String smallScreenMoreTooltip;

  const I18nPaintEditor({
    this.moveAndZoom = 'Zoom',
    this.bottomNavigationBarText = 'Paint',
    this.freestyle = 'Freestyle',
    this.arrow = 'Arrow',
    this.line = 'Line',
    this.rectangle = 'Rectangle',
    this.circle = 'Circle',
    this.dashLine = 'Dash line',
    this.blur = 'Blur',
    this.pixelate = 'Pixelate',
    this.lineWidth = 'Line width',
    this.eraser = 'Eraser',
    this.toggleFill = 'Toggle fill',
    this.changeOpacity = 'Change opacity',
    this.undo = 'Undo',
    this.redo = 'Redo',
    this.done = 'Done',
    this.back = 'Back',
    this.smallScreenMoreTooltip = 'More',
  });

  factory I18nPaintEditor.fromJson(Map<String, dynamic> json) {
    return I18nPaintEditor(
      moveAndZoom: utils.JsonUtils.parseString(json['moveAndZoom'], 'Zoom'),
      bottomNavigationBarText: utils.JsonUtils.parseString(json['bottomNavigationBarText'], 'Paint'),
      freestyle: utils.JsonUtils.parseString(json['freestyle'], 'Freestyle'),
      arrow: utils.JsonUtils.parseString(json['arrow'], 'Arrow'),
      line: utils.JsonUtils.parseString(json['line'], 'Line'),
      rectangle: utils.JsonUtils.parseString(json['rectangle'], 'Rectangle'),
      circle: utils.JsonUtils.parseString(json['circle'], 'Circle'),
      dashLine: utils.JsonUtils.parseString(json['dashLine'], 'Dash line'),
      blur: utils.JsonUtils.parseString(json['blur'], 'Blur'),
      pixelate: utils.JsonUtils.parseString(json['pixelate'], 'Pixelate'),
      lineWidth: utils.JsonUtils.parseString(json['lineWidth'], 'Line width'),
      eraser: utils.JsonUtils.parseString(json['eraser'], 'Eraser'),
      toggleFill: utils.JsonUtils.parseString(json['toggleFill'], 'Toggle fill'),
      changeOpacity: utils.JsonUtils.parseString(json['changeOpacity'], 'Change opacity'),
      undo: utils.JsonUtils.parseString(json['undo'], 'Undo'),
      redo: utils.JsonUtils.parseString(json['redo'], 'Redo'),
      done: utils.JsonUtils.parseString(json['done'], 'Done'),
      back: utils.JsonUtils.parseString(json['back'], 'Back'),
      smallScreenMoreTooltip: utils.JsonUtils.parseString(json['smallScreenMoreTooltip'], 'More'),
    );
  }
}
