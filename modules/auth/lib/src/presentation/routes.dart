import 'package:core/core.dart';

import 'screens/screens.dart';

class RouteName {
  static const prefix = "/auth";
  static const login = "${prefix}_login";
}

class RoutePages {
  static final List<GetPage> pages = [
    GetPage(
      name: RouteName.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
      transitionDuration: const Duration(seconds: 0)
    ),
  ];
}
