import '../../utils/json_utils.dart' as utils;
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
      bottomNavigationBarText: utils.JsonUtils.parseString(json['bottomNavigationBarText'], 'Filter'),
      back: utils.JsonUtils.parseString(json['back'], 'Back'),
      done: utils.JsonUtils.parseString(json['done'], 'Done'),
      filters: json['filters'] != null
          ? I18nFilters.fromJson(utils.JsonUtils.parseMap(json['filters']))
          : const I18nFilters(),
    );
  }
}
