import 'package:core/core.dart';
import 'package:flutter/widgets.dart';

import 'data/injection.dart';
import 'presentation/localization/localization.dart';

export 'environment.dart';

part 'core_module_imp.dart';

abstract class CoreModule extends BaseModule {
  static final CoreModule _instance = _CoreModuleImp();

  static CoreModule newInstance({required CoreEnvironment environment}) {
    GetIt.instance.registerSingleton<CoreEnvironment>(environment);
    return _instance;
  }

  static CoreModule get instance {
    final isRegisEnv = GetIt.instance.isRegistered<CoreEnvironment>();
    if (!isRegisEnv) throw Exception('Core Environment not set');
    return _instance;
  }
}
