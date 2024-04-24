import 'package:core/src/domain/models/exceptions/exceptions.dart';
import 'package:dio/dio.dart';
import '../models/models.dart';

mixin ExceptionMapper {
  AppException mapException(Object e) {
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return NoConnectionException();
        case DioExceptionType.sendTimeout:
          return NoConnectionException();
        case DioExceptionType.receiveTimeout:
          return NoConnectionException();
        case DioExceptionType.badCertificate:
          return UnknownException(e);
        case DioExceptionType.badResponse:
          final data = e.response?.data;
          final errorModel = ErrorModel.fromJson(data);
          var type = NetworkExceptionType.moduleError;
          switch (errorModel.code) {
            case "USER_INVALID":
              type = NetworkExceptionType.userInvalid;
              break;
          }
          if (e.response?.statusCode == 401) {
            type = NetworkExceptionType.expiredToken;
          }
          throw NetworkException(
              type, errorModel.message ?? "", errorModel.code ?? "");
        case DioExceptionType.cancel:
          return UnknownException(e);
        case DioExceptionType.connectionError:
          return NoConnectionException();
        case DioExceptionType.unknown:
          return UnknownException(e);
      }
    }
    return UnknownException(e);
  }
}
