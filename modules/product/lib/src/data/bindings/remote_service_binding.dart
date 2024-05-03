import 'package:core/core.dart';
import 'package:product/src/data/mapper/data_mapper.dart';
import 'package:product/src/data/repository_imp.dart';

import '../../domain/utils/module_const.dart';
import '../remote/clients/remote_client.dart';

class RemoteServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RemoteClient(Get.find<Dio>()), tag: ModuleConst.name);
    Get.put<DataMapper>(DataMapper());
    Get.put<Repository>(
        RepositoryImp(Get.find<RemoteClient>(tag: ModuleConst.name), Get.find<DataMapper>()), tag: ModuleConst.name);
  }
}

extension GetModule on GetInterface {
  
}
