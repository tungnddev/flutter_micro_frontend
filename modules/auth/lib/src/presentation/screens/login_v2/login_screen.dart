import 'package:auth/src/presentation/localization/localization.dart';
import 'package:auth/src/presentation/screens/login_v2/login_form_key.dart';
import 'package:core/core.dart';
import 'package:core/src/presentation/base_bloc/base_navigator/base_navigator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';
import 'login_bloc.dart';

class LoginScreen extends BaseBlocScreen<LoginBloc> {
  final _formKey = GlobalKey<FormBuilderState>();

  LoginScreen({super.key});

  @override
  LoginBloc buildBloc(BaseNavigatorBloc navigatorBloc) =>
      LoginBloc(navigatorBloc);

  @override
  Widget successView<T>(BuildContext context, T data) => const SizedBox();

  @override
  Widget initialView(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              UIFormBuilderTextField.normalRequired(
                key: const Key('loginForm_usernameInput_textField'),
                context: context,
                name: LoginFormKey.username,
                labelText: ModuleLocalization.of(context).lbl_user_name,
              ),
              const SizedBox(
                height: 16,
              ),
              UIFormBuilderTextField.normalRequired(
                  key: const Key('loginForm_passwordInput_textField'),
                  context: context,
                  name: LoginFormKey.password,
                  labelText: ModuleLocalization.of(context).lbl_password,
                  obscureText: false),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    final data = _formKey.currentState?.value ?? {};
                    onSubmit(context, data);
                  }
                },
                child: Text(ModuleLocalization.of(context).btn_login),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
