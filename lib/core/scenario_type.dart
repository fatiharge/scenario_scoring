/// ScenarioType enum
///
/// This enum is used to define the type of the scenario.
/// It has three possible values:
/// - [json]: Represents a scenario where the data is in JSON format.
/// - [array]: Represents a scenario where the data is an array.
/// - [concatenate]: Represents a scenario where the data is a string that
/// needs to be concatenated.
enum ScenarioType {
  /// Represents a scenario where the data is in JSON format.
  ///
  /// In this scenario, the data is expected to be in JSON format. The filter
  /// and scoring methods for this scenario type will be designed to handle
  /// JSON data.
  json,

  /// Represents a scenario where the data is an array.
  ///
  /// In this scenario, the data is expected to be an array. The filter
  /// and scoring methods for this scenario type will be designed to handle
  /// array data.
  array,

  /// Represents a scenario where the data is a string that needs to be
  /// concatenated.
  ///
  /// In this scenario, the data is expected to be a string. The filter
  /// and scoring methods for this scenario type will be designed to handle
  /// string data and perform concatenation operations.
  concatenate,
}
