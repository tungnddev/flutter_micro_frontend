import 'app_exception.dart';

enum NetworkExceptionType {
  expiredToken,
  userInvalid,
  moduleError
}

class NetworkException extends AppException {
  NetworkExceptionType type;
  String message;
  String code;

  NetworkException(this.type, this.message, this.code);

  @override
  String toString() {
    return message;
  }
}
