import 'dart:async';

import 'package:auth/src/domain/repository.dart';
import 'package:auth/src/domain/use_cases/check_is_logged_in_use_case.dart';
import 'package:auth/src/presentation/routes.dart';
import 'package:core/core.dart';

class AuthController with BaseHandleController {
  late Completer completer;

  Future<void> auth() {
    completer = Completer();
    final result = CheckIsLoggedInUseCase(Get.find<Repository>()).execute();
    result.fold((left) {
      if (left) {
        completer.complete();
      } else {
        Get.offNamedUntil(RouteName.login, (route) => false);
      }
    }, (right) {
      showError(right);
    });
    return completer.future;
  }

  bool isAuth() => CheckIsLoggedInUseCase(Get.find<Repository>())
      .execute()
      .fold((left) => left, (right) => false);

  void loginSuccessfully() {
    if (!completer.isCompleted) {
      completer.complete();
    }
  }
}