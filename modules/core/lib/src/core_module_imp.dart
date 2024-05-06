part of 'core_module.dart';

class _CoreModuleImp extends CoreModule {
  _CoreModuleImp();

  @override
  Future<void> inject() async {
    DataInjection().inject(GetIt.instance.get<CoreEnvironment>());
  }

  @override
  LocalizationsDelegate get localizationsDelegate =>
      ModuleLocalization.delegate;
}
