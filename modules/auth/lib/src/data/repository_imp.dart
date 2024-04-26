import 'package:auth/src/data/remote/clients/remote_client.dart';
import 'package:auth/src/domain/repository.dart';
import 'package:core/core.dart';

import 'local/local_service.dart';
import 'models/models.dart';

class AuthRepositoryImp extends Repository with ExceptionMapper {
  LocalService localService;
  RemoteClient authClient;

  AuthRepositoryImp(this.localService, this.authClient);

  @override
  String? get cacheAccessToken => localService.accessToken;

  @override
  String? get cacheRefreshToken => localService.refreshToken;

  @override
  Future<void> saveCacheAccessToken(String accessToken) =>
      localService.saveAccessToken(accessToken);

  @override
  Future<void> saveCacheRefreshToken(String refreshToken) =>
      localService.saveRefreshToken(refreshToken);

  @override
  Future<String?> refreshToken() async {
    final refreshToken = localService.refreshToken;
    if (refreshToken == null) return null;
    final newToken = await authClient.refreshToken(refreshToken);
    if (newToken.data != null) {
      await saveCacheAccessToken(newToken.data!);
    }
    return newToken.data;
  }

  @override
  Future<void> login(String username, String password) async {
    try {
      final response =
          await authClient.login(LoginRequestModel(username, password));
      if (response.data != null) {
        await saveCacheAccessToken(response.data!.accessToken);
        await saveCacheRefreshToken(response.data!.refreshToken);
      }
    } catch (e) {
      throw mapException(e);
    }
  }
}
