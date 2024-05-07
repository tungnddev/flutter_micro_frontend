import 'package:core/core.dart';

import '../../data/repository_imp.dart';
import '../../domain/models/models.dart';
import '../../domain/use_cases/home_product_use_case.dart';

class HomeProductBloc extends BaseBloc {
  List<ProductItem> items = <ProductItem>[];

  final limit = 10;
  int currentPage = 1;

  HomeProductBloc(super.navigatorBloc);

  Future<void> fetchNewData(Emitter<BaseBlocState> emit) async {
    items.clear();
    currentPage = 1;
    emit.loadingView();
    await fetchData(emit);
  }

  Future<void> loadMore(Emitter<BaseBlocState> emit) async {
    currentPage++;
    await fetchData(emit);
  }

  Future<void> fetchData(Emitter<BaseBlocState> emit) async {
    final result = await HomeProductUseCase(GetIt.instance.get<Repository>())
        .execute(currentPage, limit);
    result.fold((left) {
      bool canLoadMore = left.length == limit;
      items.addAll(left);
      emit.customizeState(HomeProductBlocListViewState(items, canLoadMore));
    }, (right) {
      showErrorDialog(right);
    });
  }

  @override
  Future<void> onInitialLoad(Emitter<BaseBlocState> emit) {
    return fetchNewData(emit);
  }

  @override
  Future<void> onEventCustomize(
      Emitter<BaseBlocState> emit, BaseBlocEventScreen event) async {
    if (event is HomeProductBlocLoadMore) {
      await loadMore(emit);
    }
  }
}

class HomeProductBlocLoadMore extends BaseBlocEventScreen {}

class HomeProductBlocListViewState extends BaseBlocStateScreen {
  List<ProductItem> items;
  bool canLoadMore;

  HomeProductBlocListViewState(this.items, this.canLoadMore);
}
