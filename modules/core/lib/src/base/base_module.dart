import 'package:flutter/widgets.dart';

abstract class BaseModule {
  LocalizationsDelegate<dynamic> get localizationsDelegate;

  Future<void> inject();
}
