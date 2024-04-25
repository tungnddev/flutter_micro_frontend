import 'package:flutter/widgets.dart';

import 'presentation/localization/generated/app_localizations.dart';
import 'presentation/localization/localization.dart';

export 'presentation/presentation.dart';
export 'domain/domain.dart';
export 'data/data.dart';

class Core {
  static const LocalizationsDelegate<ModuleLocalizationImp>
      localizationsDelegate = ModuleLocalization.delegate;
}
