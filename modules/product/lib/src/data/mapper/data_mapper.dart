import '../../domain/models/models.dart';
import '../models/models.dart';

class DataMapper {
  ProductItem mapProductItem(ProductItemModel? model) {
    return ProductItem(id: model?.id ?? 0, name: model?.name ?? "");
  }
}
