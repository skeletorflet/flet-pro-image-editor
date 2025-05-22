import 'package:flet/flet.dart';
import './i18n_filters.dart'; // Import for I18nFilters

class I18nFilterEditor {
  final String bottomNavigationBarText;
  final String back;
  final String done;
  final I18nFilters filters;

  const I18nFilterEditor({
    this.bottomNavigationBarText = 'Filter',
    this.back = 'Back',
    this.done = 'Done',
    this.filters = const I18nFilters(),
  });

  factory I18nFilterEditor.fromJson(Map<String, dynamic> json) {
    return I18nFilterEditor(
      bottomNavigationBarText: parseString(json['bottomNavigationBarText'] as String?, 'Filter'),
      back: parseString(json['back'] as String?, 'Back'),
      done: parseString(json['done'] as String?, 'Done'),
      filters: json['filters'] != null
          ? I18nFilters.fromJson(json['filters'] is Map ? Map<String, dynamic>.from(json['filters'] as Map) : {})
          : const I18nFilters(),
    );
  }
}
