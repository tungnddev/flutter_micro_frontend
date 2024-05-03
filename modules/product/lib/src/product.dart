import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:product/src/product_binding.dart';

import 'presentation/localization/generated/app_localizations.dart';
import 'presentation/localization/localization.dart';
import 'presentation/routes.dart';

class Product {
  static const LocalizationsDelegate<ModuleLocalizationImp>
      localizationsDelegate = ModuleLocalization.delegate;

  static List<GetPage> get pages => RoutePages.pages;

  static ProductBinding get bindings => ProductBinding();
}
