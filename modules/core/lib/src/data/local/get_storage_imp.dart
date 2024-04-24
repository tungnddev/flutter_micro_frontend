import 'package:get_storage/get_storage.dart';

import 'local_service.dart';

class GetStorageImp extends LocalService {
  @override
  Future<void> initialize() {
    return GetStorage.init(prefBox);
  }
}
