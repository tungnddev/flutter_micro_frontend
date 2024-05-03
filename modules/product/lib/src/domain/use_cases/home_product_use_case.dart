import 'package:core/core.dart';
import '../models/models.dart';
import '../repository.dart';

class HomeProductUseCase {
  final Repository _repository;

  HomeProductUseCase(this._repository);

  Future<Either<List<ProductItem>, AppException>> execute(
      int page, int limit) async {
    try {
      final result = await _repository.fetchProductItems(page, limit);
      return Left(result);
    } on AppException catch (e) {
      return Right(e);
    }
  }
}
