import 'package:core/src/domain/models/exceptions/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

mixin BaseHandleView {
  final loadingDialogTag = "/loadingDialog";

  void showLoadingDialog(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute == loadingDialogTag) return;
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: const Color(0x88000000),
        routeSettings: RouteSettings(name: loadingDialogTag),
        pageBuilder: (_, __, ___) => Center(
                child: CircularProgressIndicator(
              strokeWidth: 3.0,
              color: Theme.of(context).primaryColor,
            )));
  }

  void hideLoadingDialog(BuildContext context) {
    Navigator.popUntil(
        context, (route) => route.settings.name != loadingDialogTag);
  }

  void showError(BuildContext context, AppException exception) {
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
      showMessageDialog(context, exception.message);
      return;
    }
    if (exception is UnknownException) {
      showMessageDialog(context, 'Something went wrong');
      return;
    }
    showMessageDialog(context, exception.toString());
  }

  showMessageDialog(BuildContext context, String message,
      {Function()? onDone}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => MessageDialog(
          content: message,
          onDone: () {
            onDone?.call();
          }),
    );
  }
}
