import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:flutter_micro_frontend/presentation/routes.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashController extends BaseController {
  @override
  void onReady() async {
    super.onReady();
    final isAuth = Auth.isAuth();
    if (isAuth) {
      // do other task
      _goToHome();
      FlutterNativeSplash.remove();
      return;
    }
    FlutterNativeSplash.remove();
    await Auth.start();
    _goToHome();
  }

  void _goToHome() {
    Get.offNamedUntil(MainRouteName.home, (route) => false);
  }
}
