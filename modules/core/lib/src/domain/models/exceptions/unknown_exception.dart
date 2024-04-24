import 'app_exception.dart';

class UnknownException extends AppException {
  final Object? error;
  UnknownException(this.error);
}
