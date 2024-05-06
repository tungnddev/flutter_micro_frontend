import 'package:auth/auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_micro_frontend/modules/base_module.dart';
import 'package:core/core.dart';
import 'package:product/product.dart';
import 'package:ui/ui.dart';

import '../environments/environment.dart';

class AppModules extends BaseModules {
  AppModules();

  final List<BaseModule> modules = [];

  @override
  void initEnv() {
    modules.addAll([
      CoreModule.newInstance(
          environment: CoreEnvironment(baseUrl: FlavorConfig.env.baseUrl)),
      AuthModule.instance,
      ProductModule.instance
    ]);
  }

  @override
  List<LocalizationsDelegate> get localizationsDelegates => [
        ...modules.map((e) => e.localizationsDelegate).toList(),
        UI.localizationsDelegate
      ];

  @override
  Future<void> inject() async {
    await Future.wait(modules.map((e) => e.inject()).toList());
  }
}
