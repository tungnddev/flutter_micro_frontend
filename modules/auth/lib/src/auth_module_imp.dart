part of 'auth_module.dart';

class _AuthModuleImp extends AuthModule {
  _AuthModuleImp();

  @override
  Future<void> inject() async {
    await DataInjection().inject();
    Get.put<AuthController>(AuthController());
  }

  @override
  LocalizationsDelegate get localizationsDelegate =>
      ModuleLocalization.delegate;

  @override
  Future<void> start() {
    return Get.find<AuthController>().auth();
  }

  @override
  bool isAuth() {
    return Get.find<AuthController>().isAuth();
  }

  @override
  List<GetPage> get pages => RoutePages.pages;
}
