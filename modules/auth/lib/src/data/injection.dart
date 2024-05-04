import 'package:auth/src/data/local/get_storage_imp.dart';
import 'package:core/core.dart';

import '../domain/repository.dart';
import 'local/local_service.dart';
import 'remote/auth_interceptor.dart';
import 'remote/clients/remote_client.dart';
import 'repository_imp.dart';

class DataInjection {
  final _getIt = GetIt.instance;

  Future<void> inject() async {
    await _injectLocalService();
    _injectRemoteService();
  }

  Future<void> _injectLocalService() async {
    _getIt.registerSingleton<LocalService>(GetStorageImp());
    await _getIt.get<LocalService>().initialize();
  }

  void _injectRemoteService() {
    _getIt.registerLazySingleton(() => RemoteClient(_getIt.get<Dio>()));
    _getIt.registerLazySingleton<Repository>(() => AuthRepositoryImp(
        _getIt.get<LocalService>(), _getIt.get<RemoteClient>()));
    _getIt.registerLazySingleton<AuthInterceptor>(
        () => AuthInterceptor(_getIt.get<Dio>(), _getIt.get<Repository>()));

    _getIt.get<Dio>().interceptors.add(_getIt.get<AuthInterceptor>());
  }
}
