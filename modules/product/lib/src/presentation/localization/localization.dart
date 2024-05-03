import 'dart:async';
import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'generated/app_localizations.dart';
import 'generated/app_localizations_en.dart';

/// The actual `Localizations` class is [ModuleLocalizationImp], this class exists only for forward compatibility purposes...

class ModuleLocalization {
  ModuleLocalization._();

  static ModuleLocalizationImp of(BuildContext context) {
    return Localizations.of<ModuleLocalizationImp>(
            context, ModuleLocalizationImp) ??
        _default;
  }

  static const LocalizationsDelegate<ModuleLocalizationImp> delegate =
      ModuleLocalizationsDelegate();
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      ModuleLocalizationImp.localizationsDelegates;

  static const List<Locale> supportedLocales =
      ModuleLocalizationImp.supportedLocales;
  static final _default = ModuleLocalizationImpEn();
  static ModuleLocalizationImp? _current;

  static void setCurrentInstance(ModuleLocalizationImp? current) =>
      _current = current;

  static ModuleLocalizationImp get current => _current ?? _default;
}

class ModuleLocalizationsDelegate
    extends LocalizationsDelegate<ModuleLocalizationImp> {
  const ModuleLocalizationsDelegate();

  @override
  Future<ModuleLocalizationImp> load(Locale locale) {
    final instance = lookupModuleLocalizationImp(locale);
    ModuleLocalization.setCurrentInstance(instance);
    return SynchronousFuture<ModuleLocalizationImp>(instance);
  }

  @override
  bool isSupported(Locale locale) => ModuleLocalizationImp.supportedLocales
      .map((e) => e.languageCode)
      .contains(locale.languageCode);

  @override
  bool shouldReload(ModuleLocalizationsDelegate old) => false;
}

extension GetModuleLocalization on GetInterface {
  ModuleLocalizationImp get moduleLocalization {
    if (context == null) throw Exception('Context is null');
    return ModuleLocalization.of(context!);
  }
}
