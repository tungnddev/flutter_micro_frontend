part of 'product_module.dart';

class _ProductModuleImp extends ProductModule {
  _ProductModuleImp();

  @override
  Future<void> inject() async {
    DataInjection().inject();
  }

  @override
  LocalizationsDelegate get localizationsDelegate =>
      ModuleLocalization.delegate;
}
