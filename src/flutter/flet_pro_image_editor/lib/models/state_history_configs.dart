import 'package:flet/flet.dart';
import './import_state_history.dart'; // Placeholder

class StateHistoryConfigs {
  final int stateHistoryLimit;
  final ImportStateHistory? initStateHistory; // Nullable, placeholder

  const StateHistoryConfigs({
    this.stateHistoryLimit = 1000,
    this.initStateHistory, // Nullable
  });

  factory StateHistoryConfigs.fromJson(Map<String, dynamic> json) {
    return StateHistoryConfigs(
      stateHistoryLimit: parseInt(json['stateHistoryLimit'], 1000),
      initStateHistory: json['initStateHistory'] != null
          ? ImportStateHistory.fromJson(json['initStateHistory'] is Map ? Map<String, dynamic>.from(json['initStateHistory'] as Map) : {})
          : null, // If it's not provided, keep it null
    );
  }
}
