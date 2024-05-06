part of 'auth_module.dart';

class _AuthModuleImp extends AuthModule {
  _AuthModuleImp();

  @override
  Future<void> inject() async {
    await DataInjection().inject();
    GetIt.instance.registerSingleton(AuthController());
  }

  @override
  LocalizationsDelegate get localizationsDelegate =>
      ModuleLocalization.delegate;

  @override
  Future<void> start(BuildContext context) {
    return GetIt.instance.get<AuthController>().auth(context);
  }

  @override
  bool isAuth() {
    return GetIt.instance.get<AuthController>().isAuth();
  }
}
