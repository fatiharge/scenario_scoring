/// UnhandledException class
///
/// This class implements the Exception class and is used to represent an
/// exception that is thrown when an unexpected error occurs.
/// The class contains a message field, which is used to provide a description
/// of the exception.
class UnhandledException implements Exception {
  /// Constructor for UnhandledException
  ///
  /// This constructor initializes the message field with a default value of
  /// 'Unhandled exception'.
  UnhandledException([
    this.message = 'Unhandled exception',
  ]);

  /// The message describing the exception.
  final String message;

  /// The toString method
  ///
  /// This method overrides the toString method of the Exception class and
  /// returns a string representation of the exception.
  @override
  String toString() => 'UnhandledException: $message';
}
