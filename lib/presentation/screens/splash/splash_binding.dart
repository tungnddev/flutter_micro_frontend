import 'package:core/core.dart';
import 'package:flutter_micro_frontend/presentation/screens/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
