/// NonNumericValueException class
///
/// This class implements the Exception class and is used to represent an
/// exception that is thrown when a non-numeric value is encountered.
/// The class contains a message field, which is used to provide a description
/// of the exception.
class NonNumericValueException implements Exception {
  /// Constructor for NonNumericValueException
  ///
  /// This constructor initializes the message field with a default value of
  /// 'Non numeric value'.
  NonNumericValueException([this.message = 'Non numeric value']);

  /// The message describing the exception.
  final String message;

  /// The toString method
  ///
  /// This method overrides the toString method of the Exception class and
  /// returns a string representation of the exception.
  @override
  String toString() => 'NonNumericValueException: $message';
}

/// InvalidArrayTypeException class
///
/// This class implements the Exception class and is used to represent an
/// exception that is thrown when an invalid array type is encountered.
/// The class contains a message field, which is used to provide a description
/// of the exception.
class InvalidArrayTypeException implements Exception {
  /// Constructor for InvalidArrayTypeException
  ///
  /// This constructor initializes the message field with a default value of
  /// 'Invalid array type'.
  InvalidArrayTypeException([this.message = 'Invalid array type']);

  /// The message describing the exception.
  final String message;

  /// The toString method
  ///
  /// This method overrides the toString method of the Exception class and
  /// returns a string representation of the exception.
  @override
  String toString() => 'InvalidArrayTypeException: $message';
}
