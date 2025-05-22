import 'package:flet/flet.dart';
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
      parsedMatrix = matrixData.map((item) => parseDouble(item, 0.0)).toList().cast<double>();
    } else if (matrixData is String) {
      // If matrixData is a JSON string representation of a list
      try {
        List<dynamic> decodedList = jsonDecode(matrixData);
        parsedMatrix = decodedList.map((item) => parseDouble(item, 0.0)).toList().cast<double>();
      } catch (e) {
        // Handle error or assign default
        parsedMatrix = [];
      }
    }

    return FilterModel(
      name: parseString(json['name'] as String?, 'Unknown Filter'),
      matrix: parsedMatrix,
    );
  }
}
