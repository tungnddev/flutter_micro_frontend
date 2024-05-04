import 'package:core/core.dart';
import 'package:product/src/data/mapper/data_mapper.dart';
import 'package:product/src/data/repository_imp.dart';

import 'remote/clients/remote_client.dart';

class DataInjection {
  final _getIt = GetIt.instance;

  void inject() {
    _getIt.registerLazySingleton<RemoteClient>(
        () => RemoteClient(_getIt.get<Dio>()));
    _getIt.registerLazySingleton(() => DataMapper());
    _getIt.registerLazySingleton<Repository>(() =>
        RepositoryImp(_getIt.get<RemoteClient>(), _getIt.get<DataMapper>()));
  }
}
