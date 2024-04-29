/// Filter abstract class
///
/// This abstract class is used to create filter objects that can be used to
/// filter different types of objects. The type of object it filters is
/// defined by the generic parameter [T].
///
/// It has one property:
/// - [successScore]: The score to be returned when the filter is successful.
/// This property represents the score that will be returned by the Scenario's
/// calculateScore method if the filter's conditions are met. It is an integer.
///
/// It has one method:
/// - [filter]: This method is used to filter the object. It takes an object of
/// type [T] as a parameter and returns a boolean indicating whether the object
/// meets the filter's conditions.
///
/// The constructor requires the successScore to be passed as an argument.
abstract class Filter<T> {
  /// Constructor for Filter
  ///
  /// [successScore] is the score to be returned when the filter is successful.
  Filter({
    required this.successScore,
  });

  /// Filter method
  ///
  /// This method is used to filter the object. It takes an object of type [T]
  /// as a parameter and returns a boolean indicating whether the object meets
  /// the filter's conditions.
  bool filter({required T t});

  /// The score to be returned when the filter is successful.
  /// This property represents the score that will be returned by the
  /// Scenario's calculateScore method if the filter's conditions are met.
  int successScore;
}
