import 'package:core/core.dart';

import '../../data/repository_imp.dart';
import '../../domain/models/models.dart';
import '../../domain/use_cases/home_product_use_case.dart';
import '../../domain/utils/module_const.dart';

class HomeProductController extends BaseController {
  List<ProductItem> items = <ProductItem>[];
  bool canLoadMore = true;

  final limit = 10;
  int currentPage = 1;

  @override
  void onInit() {
    super.onInit();
    Get.put(HomeProductUseCase(Get.find<Repository>(tag: ModuleConst.name)));
    fetchNewData();
  }

  void fetchNewData() async {
    items.clear();
    currentPage = 1;
    canLoadMore = true;
    viewStatus.value = BaseViewStatus.loading;
    await fetchData();
    viewStatus.value = BaseViewStatus.success;
  }

  void loadMore() async {
    currentPage++;
    await fetchData();
  }

  Future<void> fetchData() async {
    final result =
        await Get.find<HomeProductUseCase>().execute(currentPage, limit);
    result.fold((left) {
      canLoadMore = left.length == limit;
      items.addAll(left);
      update();
    }, (right) {
      showError(right);
    });
  }
}
