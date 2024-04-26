abstract class LocalService {
  final String prefBox = "AuthCache";
  final String keyAccessToken = "AccessToken";
  final String keyRefreshToken = "RefreshToken";

  Future<void> initialize();

  String? get accessToken;

  String? get refreshToken;

  Future<void> saveAccessToken(String accessToken);

  Future<void> saveRefreshToken(String refreshToken);
}
