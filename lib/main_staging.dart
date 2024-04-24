import 'environments/app_environment.dart';
import 'environments/environment.dart';
import 'presentation/app.dart';

void main() {
  FlavorConfig.initValue([AppEnv.dev, AppEnv.uat],
      canAccessDevelopmentMode: true);
  startApp();
}
