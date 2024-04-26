import 'package:auth/src/domain/repository.dart';
import 'package:auth/src/domain/use_cases/login_use_case.dart';
import 'package:core/core.dart';
import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.put(LoginUseCase(Get.find<Repository>()));
  }
}
