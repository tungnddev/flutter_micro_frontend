import 'package:core/core.dart';
import 'package:flutter/foundation.dart';

class DataInjection {
  void inject(CoreEnvironment coreEnvironment) {
    final getIt = GetIt.instance;
    getIt.registerSingleton<BaseOptions>(
        BaseOptions(baseUrl: coreEnvironment.baseUrl));
    getIt.registerSingleton<Dio>(Dio(getIt.get<BaseOptions>()));
    if (kDebugMode) {
      getIt.get<Dio>().interceptors.add(LogInterceptor(requestBody: true));
    }
  }
}
