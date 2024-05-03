import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_controller.dart';
import 'base_view_status.dart';

abstract class BaseWidget<T extends BaseController> extends StatelessWidget {
  const BaseWidget(
      {super.key, this.initState, this.dispose, this.didChangeDependencies});

  final void Function(GetBuilderState<T> state)? initState,
      dispose,
      didChangeDependencies;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: controller(),
        initState: initState,
        dispose: dispose,
        didChangeDependencies: didChangeDependencies,
        builder: (T controller) => _buildWidget(controller, context));
  }

  T controller();

  Widget loadingView(BuildContext context) => Center(
          child: SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(
          strokeWidth: 3,
          color: Theme.of(context).primaryColor,
        ),
      ));

  Widget failedView(BuildContext context) =>
      const Center(child: Text('Loaded failed'));

  Widget emptyView(BuildContext context) =>
      const Center(child: Text('Empty view'));

  Widget successView(BuildContext context);

  Widget _buildWidget(T controller, BuildContext context) {
    return switch (controller.viewStatus.value) {
      BaseViewStatus.loading => loadingView(context),
      BaseViewStatus.empty => emptyView(context),
      BaseViewStatus.failed => failedView(context),
      BaseViewStatus.success => successView(context),
    };
  }
}
