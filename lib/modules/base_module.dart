import 'package:core/core.dart';
import 'package:flutter/material.dart';

abstract class BaseModules {
  const BaseModules();

  List<LocalizationsDelegate<dynamic>> get localizationsDelegates;

  void initEnv();

  List<GetPage> get pages;

  Future<void> inject();
}
