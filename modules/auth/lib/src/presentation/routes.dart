import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'screens/screens.dart';

class RouteName {
  static const _prefix = "/auth";
  static const login = "${_prefix}_login";
}

class Routes {
  static PageRoute checkPhone() => MaterialPageRoute(
      builder: (context) => LoginScreen(),
      settings: const RouteSettings(name: RouteName.login));
}
