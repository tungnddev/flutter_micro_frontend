import 'package:auth/src/domain/repository.dart';
import 'package:core/core.dart';

class LoginUseCase {
  final Repository _repository;

  LoginUseCase(this._repository);

  Future<Either<void, AppException>> execute(
      String username, String password) async {
    try {
      await _repository.login(username, password);
      return const Left(null);
    } on AppException catch (e) {
      return Right(e);
    }
  }
}
