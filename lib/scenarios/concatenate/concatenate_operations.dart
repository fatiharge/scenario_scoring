/// Enum for ConcatenateOperations
///
/// This enum is used to specify the type of operation to be performed by the
/// ConcatenateFilter class.
/// The operations include:
/// - 'and': This operation returns true if all filters return true.
/// - 'or': This operation returns true if at least one filter returns true.
enum ConcatenateOperations {
  /// 'and' operation
  ///
  /// When this operation is selected, the ConcatenateFilter will return true
  /// only if all filters return true.
  and,

  /// 'or' operation
  ///
  /// When this operation is selected, the ConcatenateFilter will return true
  /// if at least one filter returns true.
  or,
}
