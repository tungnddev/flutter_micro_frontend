import 'package:auth/auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_micro_frontend/modules/base_module.dart';
import 'package:core/core.dart';
import 'package:product/product.dart';
import 'package:ui/ui.dart';

import '../environments/environment.dart';

class AppModules extends BaseModule {
  const AppModules();

  @override
  void initEnv() {
    CoreEnvironment.instance.init(FlavorConfig.env.baseUrl);
  }

  @override
  List<LocalizationsDelegate> get localizationsDelegates => [
        Core.localizationsDelegate,
        UI.localizationsDelegate,
        Auth.localizationsDelegate,
        Product.localizationsDelegate
      ];

  @override
  List<GetPage> get pages => [...Auth.pages, ...Product.pages];

  @override
  Future<void> bindingDependencies() async {
    await CoreDataBinding().dependencies();
    await Auth.bindings.dependencies();
    await Product.bindings.dependencies();
  }
}
