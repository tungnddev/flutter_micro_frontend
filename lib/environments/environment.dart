// variable can change during use app
import '../modules/base_module.dart';

abstract class Environment {
  final String name;
  final String baseUrl;
  final BaseModule modules;

  const Environment({
    required this.name,
    required this.baseUrl,
    required this.modules,
  });
}

class FlavorConfig {
  static Environment? _env;
  static bool canAccessDeveloperMode = false;

  static List<Environment> listEnvs = [];

  static initValue(List<Environment> envs,
      {bool canAccessDevelopmentMode = false}) {
    assert(envs.isNotEmpty);
    listEnvs = envs;
    _env = envs[0];
    canAccessDeveloperMode = canAccessDevelopmentMode;
  }

  static Environment get env {
    if (_env == null) throw Exception('Environment not set');
    return _env!;
  }

  static set env(Environment env) {
    _env = env;
  }
}
