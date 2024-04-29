/// NullException class
///
/// This class implements the Exception class and is used to represent an
/// exception that is thrown when a null value is encountered where it is
/// not expected.
/// The class contains a message field, which is used to provide a description
/// of the exception.
class NullException implements Exception {
  /// Constructor for NullException
  ///
  /// This constructor initializes the message field with a default value of
  /// 'Value must not be null'.
  NullException([
    this.message = 'Value must not be null',
  ]);

  /// The message describing the exception.
  final String message;

  /// The toString method
  ///
  /// This method overrides the toString method of the Exception class and
  /// returns a string representation of the exception.
  @override
  String toString() => 'NullException: $message';
}
