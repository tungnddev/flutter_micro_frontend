import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewLoadMore<T> extends StatefulWidget {
  final Widget Function(T item, int index) itemBuilder;
  final Function() onLoadMore;
  final Function()? onRefresh;
  final List<T> list;
  final ScrollController? scrollController;
  final SliverGridDelegateWithFixedCrossAxisCount? gridDelegate;
  final bool canLoadMore;

  const GridViewLoadMore(
      {super.key,
      required this.itemBuilder,
      required this.onLoadMore,
      this.onRefresh,
      required this.list,
      this.scrollController,
      this.gridDelegate,
      required this.canLoadMore});

  @override
  State createState() => _GridViewLoadMoreState<T>();
}

class _GridViewLoadMoreState<T> extends State<GridViewLoadMore<T>> {
  bool _canLoadMore = false;
  bool _loading = false;
  final double _endReachedThreshold = 200;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _canLoadMore = widget.canLoadMore;
    _scrollController = widget.scrollController ?? ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients || _loading || !_canLoadMore) return;

    final thresholdReached =
        _scrollController.position.extentAfter < _endReachedThreshold;

    if (thresholdReached) {
      widget.onLoadMore();
      _loading = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    _loading = false;
    if (_canLoadMore != widget.canLoadMore) {
      _canLoadMore = widget.canLoadMore;
    }
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: () async {
            widget.onRefresh?.call();
          },
        ),
        SliverGrid(
          gridDelegate: widget.gridDelegate ??
              const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 24,
              ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              T item = widget.list[index];
              return widget.itemBuilder(item, index);
            },
            childCount: widget.list.length,
          ),
        ),
        SliverToBoxAdapter(
          child: _canLoadMore
              ? const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: SizedBox(
                        height: 23.0,
                        width: 23.0,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    )
                  ],
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
