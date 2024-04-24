class CoreEnvironment {
  CoreEnvironment._();

  static final CoreEnvironment instance = CoreEnvironment._();
  String? _baseUrl;

  void init(String url) {
    _baseUrl = url;
  }

  String get baseUrl {
    if (_baseUrl == null) throw Exception('Base url not set');
    return _baseUrl!;
  }
}
