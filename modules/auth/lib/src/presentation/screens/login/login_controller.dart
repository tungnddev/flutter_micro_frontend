import 'package:auth/src/domain/use_cases/login_use_case.dart';
import 'package:auth/src/presentation/auth_controller.dart';
import 'package:auth/src/presentation/models/field_vm.dart';
import 'package:core/core.dart';

import '../../routes.dart';

class LoginController extends BaseController {
  final Rx<FieldVM> username = FieldVM("").obs;
  final Rx<FieldVM> password = FieldVM("").obs;

  bool get isValid =>
      username.value.validate() == null && password.value.validate() == null;

  void changePassword(String password) {
    this.password.update((val) {
      val?.content = password;
    });
  }

  void changeUsername(String username) {
    this.username.update((val) {
      val?.content = username;
    });
  }

  void startLogin() async {
    showLoadingDialog();
    final Either<void, AppException> result = await Get.find<LoginUseCase>()
        .execute(username.value.content, password.value.content);
    hideLoadingDialog();
    result.fold((left) {
      Get.find<AuthController>().loginSuccessfully();
    }, (right) {
      showError(right);
      return;
    });
  }
}
