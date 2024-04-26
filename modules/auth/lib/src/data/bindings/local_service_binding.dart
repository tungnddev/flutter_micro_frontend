import 'package:core/core.dart';

import '../local/get_storage_imp.dart';
import '../local/local_service.dart';

class LocalServiceBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<LocalService>(GetStorageImp());
    await Get.find<LocalService>().initialize();
  }
}
