import 'package:flet/flet.dart';

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
      moveAndZoom: parseString(json['moveAndZoom'] as String?, 'Zoom'),
      bottomNavigationBarText: parseString(json['bottomNavigationBarText'] as String?, 'Paint'),
      freestyle: parseString(json['freestyle'] as String?, 'Freestyle'),
      arrow: parseString(json['arrow'] as String?, 'Arrow'),
      line: parseString(json['line'] as String?, 'Line'),
      rectangle: parseString(json['rectangle'] as String?, 'Rectangle'),
      circle: parseString(json['circle'] as String?, 'Circle'),
      dashLine: parseString(json['dashLine'] as String?, 'Dash line'),
      blur: parseString(json['blur'] as String?, 'Blur'),
      pixelate: parseString(json['pixelate'] as String?, 'Pixelate'),
      lineWidth: parseString(json['lineWidth'] as String?, 'Line width'),
      eraser: parseString(json['eraser'] as String?, 'Eraser'),
      toggleFill: parseString(json['toggleFill'] as String?, 'Toggle fill'),
      changeOpacity: parseString(json['changeOpacity'] as String?, 'Change opacity'),
      undo: parseString(json['undo'] as String?, 'Undo'),
      redo: parseString(json['redo'] as String?, 'Redo'),
      done: parseString(json['done'] as String?, 'Done'),
      back: parseString(json['back'] as String?, 'Back'),
      smallScreenMoreTooltip: parseString(json['smallScreenMoreTooltip'] as String?, 'More'),
    );
  }
}
