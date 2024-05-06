import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:flutter_micro_frontend/presentation/routes.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashController extends BaseController {
  @override
  void onReady() async {
    super.onReady();
    final isAuth = AuthModule.instance.isAuth();
    if (isAuth) {
      // do other task
      _goToHome();
      FlutterNativeSplash.remove();
      return;
    }
    FlutterNativeSplash.remove();
    await AuthModule.instance.start(Get.context!);
    _goToHome();
  }

  void _goToHome() {
    Get.offNamedUntil(MainRouteName.home, (route) => false);
  }
}
