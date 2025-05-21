import '../../../utils/json_utils.dart' as utils; // Adjusted relative path

class I18nFilters {
  const I18nFilters(); // Simplest const constructor

  factory I18nFilters.fromJson(Map<String, dynamic> json) {
    // No fields to parse for a true placeholder
    return const I18nFilters();
  }
}
