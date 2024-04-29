/// Enum for JsonFilterOperations
///
/// This enum is used to specify the type of operation to be performed by the
/// JsonFilter class.
/// The operations include:
/// - 'greaterThan': This operation checks if the value in the Json object
/// is greater than the specified value.
/// - 'lessThan': This operation checks if the value in the Json object is
/// less than the specified value.
/// - 'equals': This operation checks if the value in the Json object is
/// equal to the specified value.
/// - 'contains': This operation checks if the Json object contains the
/// specified value.
/// - 'notEquals': This operation checks if the value in the Json object
/// is not equal to the specified value.
/// - 'greaterThanOrEqual': This operation checks if the value in the
/// Json object is greater than or equal to the specified value.
/// - 'lessThanOrEqual': This operation checks if the value in the Json
/// object is less than or equal to the specified value.
/// - 'startsWith': This operation checks if the value in the Json object
/// starts with the specified value.
/// - 'endsWith': This operation checks if the value in the Json object ends
/// with the specified value.
/// - 'isNull': This operation checks if the value in the Json object is
/// null.
/// - 'notNull': This operation checks if the value in the Json object is
/// not null.
/// - 'equalsRoundedToTwoDecimals': This operation checks if the value in
/// the Json object, rounded to two decimal places, is equal to the specified
/// value.
/// - 'equalsRounded': This operation checks if the value in the Json object
/// , rounded to the nearest whole number, is equal to the specified value.
enum JsonFilterOperations {
  /// Enum values for JsonFilterOperations
  ///
  /// - 'greaterThan': This operation checks if the value in the Json object
  /// is greater than the specified value.
  greaterThan,

  /// - 'lessThan': This operation checks if the value in the Json object is
  /// less than the specified value.
  lessThan,

  /// - 'equals': This operation checks if the value in the Json object is
  /// equal to the specified value.
  equals,

  /// - 'contains': This operation checks if the Json object contains the
  /// specified value.
  contains,

  /// - 'notEquals': This operation checks if the value in the Json object
  /// is not equal to the specified value.
  notEquals,

  /// - 'greaterThanOrEqual': This operation checks if the value in the
  /// Json object is greater than or equal to the specified value.
  greaterThanOrEqual,

  /// - 'lessThanOrEqual': This operation checks if the value in the Json
  /// object is less than or equal to the specified value.
  lessThanOrEqual,

  /// - 'startsWith': This operation checks if the value in the Json object
  /// starts with the specified value.
  startsWith,

  /// - 'endsWith': This operation checks if the value in the Json object ends
  /// with the specified value.
  endsWith,

  /// - 'isNull': This operation checks if the value in the Json object is
  /// null.
  isNull,

  /// - 'notNull': This operation checks if the value in the Json object is
  /// not null.
  notNull,

  /// - 'equalsRoundedToTwoDecimals': This operation checks if the value in
  /// the Json object, rounded to two decimal places, is equal to the specified
  /// value.
  equalsRoundedToTwoDecimals,

  /// - 'equalsRounded': This operation checks if the value in the Json object
  /// , rounded to the nearest whole number, is equal to the specified value.
  equalsRounded
  // TODO(fatiharge): Aggregation operation will be added
}
