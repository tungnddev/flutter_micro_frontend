import 'package:core/core.dart';
import 'package:flutter/material.dart';

abstract class BaseModule {
  const BaseModule();

  List<LocalizationsDelegate<dynamic>> get localizationsDelegates;

  void initEnv();

  List<GetPage> get pages;
}
