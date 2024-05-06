import 'package:auth/src/presentation/localization/localization.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'login_controller.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<LoginController>(LoginController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Align(
          alignment: const Alignment(0, -1 / 3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _UsernameInput(),
              const Padding(padding: EdgeInsets.all(12)),
              _PasswordInput(),
              const Padding(padding: EdgeInsets.all(12)),
              _LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Obx(() {
      return TextField(
        key: const Key('loginForm_usernameInput_textField'),
        onChanged: (username) => controller.changeUsername(username),
        decoration: InputDecoration(
          labelText: Get.moduleLocalization.lbl_user_name,
          errorText: controller.username.value.errorText,
        ),
      );
    });
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Obx(() {
      return TextField(
        key: const Key('loginForm_passwordInput_textField'),
        onChanged: (password) => controller.changePassword(password),
        obscureText: true,
        decoration: InputDecoration(
          labelText: ModuleLocalization.of(context).lbl_password,
          errorText: controller.password.value.errorText,
        ),
      );
    });
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Obx(
      () => ElevatedButton(
        key: const Key('loginForm_continue_raisedButton'),
        onPressed: controller.isValid
            ? () {
                controller.startLogin();
              }
            : null,
        child: Text(ModuleLocalization.of(context).btn_login),
      ),
    );
  }
}
