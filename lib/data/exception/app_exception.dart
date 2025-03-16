/// Base class for custom application exceptions.
class AppException implements Exception {
  final String? _message; // Message associated with the exception
  final String _prefix; // Prefix for the exception

  /// Constructor for creating an [AppException] instance.
  ///
  /// The [message] parameter represents the message associated with the exception,
  /// and the [prefix] parameter represents the prefix for the exception.
  AppException([this._message, this._prefix = '']);

  @override
  String toString() {
    // If _message is null or empty, return only the prefix.
    if (_message == null || _message.isEmpty) {
      return _prefix;
    }
    // Otherwise, format the output as "prefix: message".
    return '$_prefix: $_message';
  }
}

class FetchDataException extends AppException {

  FetchDataException([String? message])
    : super(message, 'Error During Communication');
}


class BadRequestException extends AppException {
 
  BadRequestException([String? message]) : super(message, 'Invalid request');
}


class UnauthorisedException extends AppException {
 
  UnauthorisedException([String? message])
    : super(message, 'Unauthorised request');
}

class InvalidInputException extends AppException {

  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}

class NoInternetException extends AppException {

  NoInternetException([String? message])
    : super(message, 'No Internet Connection');
}
