import 'package:auth/src/data/bindings/bindings.dart';
import 'package:auth/src/presentation/auth_controller.dart';
import 'package:core/core.dart';

class AuthBinding extends Bindings {
  @override
  Future dependencies() async {
    await LocalServiceBinding().dependencies();
    RemoteServiceBinding().dependencies();
    Get.put<AuthController>(AuthController());
  }
}
