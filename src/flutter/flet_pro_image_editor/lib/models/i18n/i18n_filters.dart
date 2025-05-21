import '../../utils/json_utils.dart' as utils;

class I18nFilters {
  // Example field, if you had specific filter name translations:
  // final String filterExampleName;

  const I18nFilters({
    // this.filterExampleName = 'Example Filter',
  });

  factory I18nFilters.fromJson(Map<String, dynamic> json) {
    // Assuming I18nFilters might contain specific filter name translations
    // Example:
    // return I18nFilters(
    //   filterExampleName: utils.JsonUtils.parseString(json['filterExampleName'], 'Example Filter'),
    // );
    return const I18nFilters(); // Default if no specific fields yet
  }
}
