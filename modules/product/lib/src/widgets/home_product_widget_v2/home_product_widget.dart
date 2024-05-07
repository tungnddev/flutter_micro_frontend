import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:product/src/domain/models/models.dart';
import 'package:ui/ui.dart';

import 'home_product_bloc.dart';

class HomeProductWidget extends BaseBlocWidget<HomeProductBloc> {
  HomeProductWidget({super.key});

  @override
  Widget customizeStateView(
      BuildContext context, BaseBlocStateScreen stateScreen) {
    if (stateScreen is HomeProductBlocListViewState) {
      return ListViewLoadMore<ProductItem>(
        itemBuilder: (ProductItem item, int index) {
          return _buildItem(context, item);
        },
        onLoadMore: () =>
            onEmitCustomizeEvent(context, HomeProductBlocLoadMore()),
        list: stateScreen.items,
        canLoadMore: stateScreen.canLoadMore,
        onRefresh: () =>
            context.read<HomeProductBloc>().add(BaseBlocEventInitial()),
      );
    }
    return super.customizeStateView(context, stateScreen);
  }

  Widget _buildItem(BuildContext context, ProductItem item) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 19),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              "id: ${item.id}",
              style:
                  Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 16),
            ),
          ],
        ));
  }

  @override
  HomeProductBloc buildBloc(BaseNavigatorBloc navigatorBloc) =>
      HomeProductBloc(navigatorBloc);

  @override
  Widget successView<D>(BuildContext context, D data) {
    return const SizedBox();
  }
}
