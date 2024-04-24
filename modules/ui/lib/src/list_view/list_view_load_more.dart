import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewLoadMore<T> extends StatefulWidget {
  final Widget Function(T item, int index) itemBuilder;
  final Function() onLoadMore;
  final Function()? onRefresh;
  final List<T> list;
  final ScrollController? scrollController;
  final bool canLoadMore;

  const ListViewLoadMore(
      {super.key,
      required this.itemBuilder,
      required this.onLoadMore,
      this.onRefresh,
      required this.list,
      this.scrollController,
      required this.canLoadMore});

  @override
  State createState() => _ListViewLoadMoreState<T>();
}

class _ListViewLoadMoreState<T> extends State<ListViewLoadMore<T>> {
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
        SliverList(
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
