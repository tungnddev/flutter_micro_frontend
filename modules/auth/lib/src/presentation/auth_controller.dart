import 'dart:async';

import 'package:auth/src/domain/repository.dart';
import 'package:auth/src/domain/use_cases/check_is_logged_in_use_case.dart';
import 'package:auth/src/presentation/routes.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

class AuthController with BaseHandleView {
  late Completer completer;

  Future<void> auth(BuildContext context) {
    completer = Completer();
    final result = CheckIsLoggedInUseCase(GetIt.instance.get<Repository>()).execute();
    result.fold((left) {
      if (left) {
        completer.complete();
      } else {
        Navigator.pushAndRemoveUntil(context, Routes.checkPhone(), (route) => false);
      }
    }, (right) {
      showError(context, right);
    });
    return completer.future;
  }

  void loginSuccessfully() {
    if (!completer.isCompleted) {
      completer.complete();
    }
  }

  bool isAuth() => CheckIsLoggedInUseCase(GetIt.instance.get<Repository>())
      .execute()
      .fold((left) => left, (right) => false);


}
