import 'models/models.dart';

abstract class Repository {
  Future<List<ProductItem>> fetchProductItems(int page, int limit);
}
