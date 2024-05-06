import 'package:core/src/domain/models/exceptions/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/ui.dart';

mixin BaseHandleController {
  final loadingDialogTag = "/loadingDialog";

  void showLoadingDialog() {
    Get.dialog(
        Center(
            child: CircularProgressIndicator(
          strokeWidth: 3.0,
          color: Theme.of(Get.context!).primaryColor,
        )),
        barrierDismissible: false,
        barrierColor: const Color(0x88000000),
        name: loadingDialogTag);
  }

  void hideLoadingDialog() {
    Get.until((route) => route.settings.name != loadingDialogTag);
  }

  void showError(AppException exception) {
    if (exception is NoConnectionException) {
      // showNoConnectionDialog(context, onRetry: action);
      return;
    }
    if (exception is NetworkException) {
      if (exception.type == NetworkExceptionType.userInvalid ||
          exception.type == NetworkExceptionType.expiredToken) {
        // showExpiredSessionDialog(context, exception.message, onClose: () {
        // });
        return;
      }
      showMessageDialog(exception.message);
      return;
    }
    if (exception is UnknownException) {
      showMessageDialog('Something went wrong');
      return;
    }
    showMessageDialog(exception.toString());
  }

  void showMessageDialog(String message, {Function()? onDone}) {
    Get.dialog(
        MessageDialog(
            content: message,
            onDone: () {
              onDone?.call();
            }),
        barrierDismissible: false);
  }
}
