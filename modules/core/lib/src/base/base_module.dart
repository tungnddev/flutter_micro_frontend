import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/get_navigation.dart';

abstract class BaseModule {
  LocalizationsDelegate<dynamic> get localizationsDelegate;

  Future<void> inject();

  List<GetPage> get pages;
}
