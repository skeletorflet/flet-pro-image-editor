import '../utils/json_utils.dart' as utils;
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
      stateHistoryLimit: utils.JsonUtils.parseInt(json['stateHistoryLimit'], 1000),
      initStateHistory: json['initStateHistory'] != null
          ? ImportStateHistory.fromJson(utils.JsonUtils.parseMap(json['initStateHistory']))
          : null, // If it's not provided, keep it null
    );
  }
}
