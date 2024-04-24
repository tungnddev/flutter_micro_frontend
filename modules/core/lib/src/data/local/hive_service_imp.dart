import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'local_service.dart';

class HiveServiceImp extends LocalService {
  @override
  Future<void> initialize() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    await Hive.openBox(prefBox);
  }
}
