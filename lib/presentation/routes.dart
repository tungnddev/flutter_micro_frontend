import 'package:core/core.dart';

import 'screens/screens.dart';

class MainRouteName {
  static const splash = '/';
  static const home = '/home';
}

class MainRoutePages {
  static final pages = [
    GetPage(
        name: MainRouteName.splash,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: MainRouteName.home,
        page: () => const HomeScreen(),
        transitionDuration: const Duration(seconds: 0)),
  ];
}
