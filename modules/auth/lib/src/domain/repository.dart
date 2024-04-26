abstract class Repository {

  String? get cacheAccessToken;

  String? get cacheRefreshToken;

  Future<void> saveCacheAccessToken(String accessToken);

  Future<void> saveCacheRefreshToken(String refreshToken);

  Future<String?> refreshToken();

  Future<void> login(String username, String password);
}
