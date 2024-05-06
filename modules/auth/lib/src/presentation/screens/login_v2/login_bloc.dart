import 'package:auth/src/domain/repository.dart';
import 'package:auth/src/domain/use_cases/login_use_case.dart';
import 'package:auth/src/presentation/auth_controller.dart';
import 'package:auth/src/presentation/screens/login_v2/login_form_key.dart';
import 'package:core/core.dart';

class LoginBloc extends BaseBloc {
  LoginBloc(super.navigatorBloc);

  @override
  Future<void> onInitialLoad(Emitter<BaseBlocState> emit) async {}

  @override
  Future<void> onSubmit(Emitter<BaseBlocState> emit, data) async {
    showLoadingDialog();
    final dataMap = data as Map<String, dynamic>;
    final Either<void, AppException> result =
    await LoginUseCase(GetIt.instance.get<Repository>())
        .execute(
        dataMap[LoginFormKey.username], dataMap[LoginFormKey.password]);
    hideLoadingDialog();
    result.fold((left) {
      GetIt.instance.get<AuthController>().loginSuccessfully();
    }, (right) {
      showErrorDialog(right);
      return;
    });
  }
}
