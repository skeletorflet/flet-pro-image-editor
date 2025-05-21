import '../utils/json_utils.dart' as utils;
import 'dart:convert'; // For jsonDecode if matrix is passed as a string list

class FilterModel {
  final String name;
  final List<double> matrix;

  const FilterModel({
    this.name = "Unknown Filter",
    this.matrix = const [],
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) {
    dynamic matrixData = json['matrix'];
    List<double> parsedMatrix = [];

    if (matrixData is List) {
      parsedMatrix = utils.JsonUtils.parseList<double>(
          matrixData, (item) => utils.JsonUtils.parseDouble(item, 0.0), []);
    } else if (matrixData is String) {
      // If matrixData is a JSON string representation of a list
      try {
        List<dynamic> decodedList = jsonDecode(matrixData);
        parsedMatrix = utils.JsonUtils.parseList<double>(
            decodedList, (item) => utils.JsonUtils.parseDouble(item, 0.0), []);
      } catch (e) {
        // Handle error or assign default
        parsedMatrix = [];
      }
    }

    return FilterModel(
      name: utils.JsonUtils.parseString(json['name'], 'Unknown Filter'),
      matrix: parsedMatrix,
    );
  }
}
