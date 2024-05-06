import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_controller.dart';
import 'base_view_status.dart';

abstract class BaseScreen<T extends BaseController> extends GetWidget<T> {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App bar'),
      ),
      body: SafeArea(child: Obx(() => _buildWidget(context))),
    );
  }

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

  Widget _buildWidget(BuildContext context) {
    return switch (controller.viewStatus.value) {
      BaseViewStatus.loading => loadingView(context),
      BaseViewStatus.empty => emptyView(context),
      BaseViewStatus.failed => failedView(context),
      BaseViewStatus.success => successView(context),
    };
  }
}
