import 'package:get/get.dart';

import '../local/get_storage_imp.dart';
import '../local/local_service.dart';

class LocalServiceBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<LocalService>(GetStorageImp());
    await Get.find<LocalService>().initialize();
  }
}
