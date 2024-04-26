import 'package:auth/src/data/remote/clients/remote_client.dart';
import 'package:auth/src/data/repository_imp.dart';
import 'package:auth/src/domain/repository.dart';
import 'package:core/core.dart';

import '../local/local_service.dart';
import '../remote/auth_interceptor.dart';

class RemoteServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RemoteClient(Get.find<Dio>()));
    Get.put<Repository>(
        AuthRepositoryImp(Get.find<LocalService>(), Get.find<RemoteClient>()));

    Get.put<AuthInterceptor>(
        AuthInterceptor(Get.find<Dio>(), Get.find<Repository>()));

    Get.find<Dio>().interceptors.add(Get.find<AuthInterceptor>());
  }
}
