import 'package:core/core.dart';

import 'local_service.dart';

class HiveServiceImp extends LocalService {
  @override
  Future<void> saveAccessToken(String accessToken) {
    return Hive.box(prefBox).put(keyAccessToken, accessToken);
  }

  @override
  Future<void> initialize() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    await Hive.openBox(prefBox);
  }

  @override
  String? get accessToken => Hive.box(prefBox).get(keyAccessToken);

  @override
  String? get refreshToken => Hive.box(prefBox).get(keyRefreshToken);

  @override
  Future<void> saveRefreshToken(String refreshToken) {
    return Hive.box(prefBox).put(keyRefreshToken, refreshToken);
  }
}
