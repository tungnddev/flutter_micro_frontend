import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'generated/app_localizations.dart';
import 'generated/app_localizations_en.dart';

/// The actual `Localizations` class is [AppLocalizationImp], this class exists only for forward compatibility purposes...

class AppLocalization {
  AppLocalization._();

  static AppLocalizationImp of(BuildContext context) {
    return Localizations.of<AppLocalizationImp>(
            context, AppLocalizationImp) ??
        _default;
  }

  static const LocalizationsDelegate<AppLocalizationImp> delegate =
      AppLocalizationsDelegate();
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      AppLocalizationImp.localizationsDelegates;

  static const List<Locale> supportedLocales =
      AppLocalizationImp.supportedLocales;
  static final _default = AppLocalizationImpEn();
  static AppLocalizationImp? _current;

  static void setCurrentInstance(AppLocalizationImp? current) =>
      _current = current;

  static AppLocalizationImp get current => _current ?? _default;
}

class AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizationImp> {
  const AppLocalizationsDelegate();

  @override
  Future<AppLocalizationImp> load(Locale locale) {
    final instance = lookupAppLocalizationImp(locale);
    AppLocalization.setCurrentInstance(instance);
    return SynchronousFuture<AppLocalizationImp>(instance);
  }

  @override
  bool isSupported(Locale locale) => AppLocalizationImp.supportedLocales
      .map((e) => e.languageCode)
      .contains(locale.languageCode);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
