import 'package:auth/src/domain/repository.dart';
import 'package:core/core.dart';

class CheckIsLoggedInUseCase {
  final Repository _repository;

  CheckIsLoggedInUseCase(this._repository);

  Either<bool, AppException> execute() {
    try {
      final token = _repository.cacheAccessToken;
      return Left(token != null);
    } on AppException catch (e) {
      return Right(e);
    }
  }
}
