/// Enum for ArrayFilterOperations
///
/// This enum is used to specify the type of operation to be performed on an
/// array by the ArrayFilter class.
/// The operations include:
/// - 'summing': This operation sums up all the numeric values in the array.
/// - 'contains': This operation checks if a specific value is present in the
/// array.
/// - 'numberAggregation': This operation performs a number aggregation
/// operation on the array.
/// - 'stringAggregation': This operation performs a string aggregation
/// operation on the array.
enum ArrayFilterOperations {
  /// 'summing' operation
  ///
  /// When this operation is selected, the numeric values in the array will
  /// be summed up.
  summing,

  /// 'contains' operation
  ///
  /// When this operation is selected, the array will be checked for the
  /// presence of a specific value.
  contains,

  /// 'numberAggregation' operation
  ///
  /// When this operation is selected, a number aggregation operation will
  /// be performed on the array.
  numberAggregation,

  /// 'stringAggregation' operation
  ///
  /// When this operation is selected, a string aggregation operation will
  /// be performed on the array.
  stringAggregation,

  /// 'notContains' operation
  ///
  /// When this operation is selected, the array will be checked for the
  /// absence of a specific value. If the value is not found in the array,
  /// the operation will return true.
  notContains,
  // TODO(fatiharge): json operation will be added
}
