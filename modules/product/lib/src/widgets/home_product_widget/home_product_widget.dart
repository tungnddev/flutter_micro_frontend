import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';
import '../../domain/models/models.dart';
import 'home_product_controller.dart';

class HomeProductWidget extends BaseWidget<HomeProductController> {
  const HomeProductWidget({super.key});

  @override
  Widget successView(BuildContext context) {
    final controller = Get.find<HomeProductController>();
    return ListViewLoadMore<ProductItem>(
      itemBuilder: (ProductItem item, int index) {
        return _buildItem(context, item);
      },
      onLoadMore: () => controller.loadMore(),
      list: controller.items,
      canLoadMore: controller.canLoadMore,
      onRefresh: () => controller.fetchNewData(),
    );
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
  HomeProductController controller() => HomeProductController();
}
