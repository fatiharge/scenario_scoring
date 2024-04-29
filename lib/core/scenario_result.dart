import 'package:scenario_scoring/core/scenario_type.dart';

/// ScenarioResult class
///
/// This class is used to create a ScenarioResult object that contains the
/// results of a scenario.
/// It has three properties:
/// - [score]: The score of the scenario. It is an integer.
/// - [totalScoringTime]: The total time taken to calculate the score. It is an
/// integer.
/// - [type]: The type of the scenario. It is a value from the ScenarioType
/// enum.
///
/// The constructor requires all three properties to be passed as arguments.
class ScenarioResult<T> {
  /// Constructor
  ///
  /// [score] is the score of the scenario.
  /// [totalScoringTime] is the total time taken to calculate the score.
  /// [type] is the type of the scenario.
  ScenarioResult({
    required this.score,
    required this.totalScoringTime,
    required this.type,
  });

  /// The score of the scenario.
  ///
  /// This property represents the score of the scenario. It is an integer value
  /// that is calculated based on the conditions defined in the scenario's
  /// filter.
  /// The higher the score, the better the scenario performed.
  int score;

  /// The total time taken to calculate the score.
  ///
  /// This property represents the total time taken to calculate the score of
  /// the scenario. It is measured in milliseconds. This includes the time
  /// taken to apply the filter and calculate the score based on the
  /// filter's conditions.
  int totalScoringTime;

  /// The type of the scenario.
  ///
  /// This property represents the type of the scenario. It is a value from the
  /// ScenarioType enum. The type of the scenario determines the conditions that
  /// are used in the filter to calculate the score.
  ScenarioType type;

  @override
  String toString() {
    return '##############################################'
        '\nScenarioResult : '
        '\nscore: $score'
        '\ntotalScoringTime: $totalScoringTime'
        '\ntype: $type';
  }
}
