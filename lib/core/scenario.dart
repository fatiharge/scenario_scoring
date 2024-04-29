import 'package:scenario_scoring/core/filter.dart';
import 'package:scenario_scoring/core/scenario_result.dart';
import 'package:scenario_scoring/core/scenario_type.dart';

/// Scenario class
/// This class is used to create a scenario object that uses a filter object
/// for its calculations.
///
/// The [filter] parameter is a Filter object that defines the conditions for
/// the scenario calculation.
/// It is used in the [calculateScore] method to determine the score of the
/// scenario.
class Scenario<T> {
  /// Constructor for Scenario class
  ///
  /// This constructor initializes the [filter] field with the provided Filter
  /// object.
  /// The [filter] field is used in the [calculateScore] method to determine the
  /// score of the scenario.
  ///
  /// The [filter] parameter is a Filter object that defines the conditions for
  /// the scenario calculation.
  Scenario({required this.filter});

  /// Filter method
  ///
  /// This method is used to determine whether the given object [T] meets the
  /// conditions defined by the filter.
  /// It returns true if the conditions are met, and false otherwise.
  Filter<T> filter;

  /// Calculate the score of the scenario
  ///
  /// This method calculates the score of the scenario based on the provided
  /// data.
  /// It first records the start time, then checks if the data meets the
  /// filter's conditions.
  /// If the conditions are met, the filter's success score is used as the
  /// scenario score.
  /// Otherwise, the scenario score is 0.
  /// The method then records the end time and calculates the total scoring
  /// time.
  /// Finally, it returns a ScenarioResult object with the calculated score,
  /// total scoring time, and scenario type.
  ///
  /// The [data] parameter is the data to be used in the scenario calculation.
  /// It is passed to the filter object's filter method to determine whether
  /// the scenario is successful or not.
  ScenarioResult<T> calculateScore(T data) {
    final startTime = getCurrentMillisecondsSinceEpoch();
    final score = filter.filter(t: data) ? filter.successScore : 0;
    final endTime = getCurrentMillisecondsSinceEpoch();
    return ScenarioResult(
      score: score,
      totalScoringTime: endTime - startTime,
      type: ScenarioType.json,
    );
  }

  /// Returns the current time in milliseconds since epoch
  /// This method is used to get the current time in milliseconds since epoch.
  /// It is used in the [calculateScore] method to calculate the total scoring
  /// time.
  int getCurrentMillisecondsSinceEpoch() =>
      DateTime.now().millisecondsSinceEpoch;
}
