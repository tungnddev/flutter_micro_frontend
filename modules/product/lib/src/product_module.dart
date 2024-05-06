import 'package:core/core.dart';
import 'package:flutter/widgets.dart';

import 'data/injection.dart';
import 'presentation/localization/localization.dart';

part 'product_module_imp.dart';

abstract class ProductModule extends BaseModule {
  static final ProductModule _instance = _ProductModuleImp();

  static ProductModule get instance {
    return _instance;
  }
}
