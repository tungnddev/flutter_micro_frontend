import 'package:flutter_micro_frontend/modules/app_modules.dart';

import 'environment.dart';

class AppEnv extends Environment {
  const AppEnv._(
      {required super.name,
      required super.baseUrl,
      super.modules = const AppModules()});

  static const dev = AppEnv._(
    name: 'development',
    baseUrl:
    "https://bbdd19e4-7ba1-4d22-8960-d3f6cf8b2e29.mock.pstmn.io/api/",
  );

  static const uat = AppEnv._(
    name: 'uat',
    baseUrl:
    "https://bbdd19e4-7ba1-4d22-8960-d3f6cf8b2e29.mock.pstmn.io/api/",
  );

  static const production = AppEnv._(
    name: 'production',
    baseUrl:
    "https://bbdd19e4-7ba1-4d22-8960-d3f6cf8b2e29.mock.pstmn.io/api/",
  );
}
