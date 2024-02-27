/// Exception thrown when the request is invalid.
/// Can be used for throwing [NoInternetException].
class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

/// Exception thrown when the user is unauthorized.
class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

/// Exception thrown when the input is invalid.
class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

/// Exception thrown when there is a socket error.
class SocketExceptions extends AppException {
  SocketExceptions([String? message])
      : super(message, "Something Went Wrong....");
}

/// Exception thrown when the requested page is not found.
class PageNotFoundException extends AppException {
  PageNotFoundException([String? message]) : super(message, "Page Not Found: ");
}

/// Base class for all application exceptions.
class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

/// Exception thrown when there is an error during communication with the server.
class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}
