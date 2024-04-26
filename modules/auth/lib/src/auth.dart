import 'package:auth/src/presentation/auth_controller.dart';
import 'package:auth/src/presentation/localization/generated/app_localizations.dart';
import 'package:auth/src/presentation/localization/localization.dart';
import 'package:auth/src/presentation/routes.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

import 'auth_binding.dart';

class Auth {
  static Future<void> start() {
    return Get.find<AuthController>().auth();
  }

  static bool isAuth() {
    return Get.find<AuthController>().isAuth();
  }

  static const LocalizationsDelegate<ModuleLocalizationImp>
      localizationsDelegate = ModuleLocalization.delegate;

  static List<GetPage> get pages => RoutePages.pages;

  static AuthBinding get bindings => AuthBinding();
}
