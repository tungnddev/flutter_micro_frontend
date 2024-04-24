import 'package:flutter_micro_frontend/environments/app_environment.dart';

import 'environments/environment.dart';
import 'presentation/app.dart';

void main() {
  FlavorConfig.initValue([AppEnv.production]);
  startApp();
}
