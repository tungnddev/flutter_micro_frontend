import 'package:core/core.dart';
import 'package:flutter/widgets.dart';

import 'data/injection.dart';
import 'presentation/auth_controller.dart';
import 'presentation/localization/localization.dart';

part 'auth_module_imp.dart';

abstract class AuthModule extends BaseModule {
  static final AuthModule _instance = _AuthModuleImp();

  static AuthModule get instance {
    return _instance;
  }

  Future<void> start(BuildContext context);

  bool isAuth();
}
