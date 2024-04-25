import 'package:core/core.dart';
import 'package:flutter_micro_frontend/presentation/routes.dart';

class SplashController extends BaseController {
  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 5));
    Get.offNamed(MainRouteName.home);
  }
}
