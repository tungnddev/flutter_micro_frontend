import 'package:flutter_micro_frontend/modules/app_modules.dart';

import 'environment.dart';

class AppEnv extends Environment {
  AppEnv._({
    required super.name,
    required super.baseUrl,
    required super.modules,
  });

  static final dev = AppEnv._(
    name: 'development',
    baseUrl: "https://bbdd19e4-7ba1-4d22-8960-d3f6cf8b2e29.mock.pstmn.io/api/",
    modules: AppModules(),
  );

  static final uat = AppEnv._(
    name: 'uat',
    baseUrl: "https://bbdd19e4-7ba1-4d22-8960-d3f6cf8b2e29.mock.pstmn.io/api/",
    modules: AppModules(),
  );

  static final production = AppEnv._(
    name: 'production',
    baseUrl: "https://bbdd19e4-7ba1-4d22-8960-d3f6cf8b2e29.mock.pstmn.io/api/",
    modules: AppModules(),
  );
}
