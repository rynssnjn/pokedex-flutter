class AppConfig {
  static final AppConfig _instance = AppConfig._internal();

  factory AppConfig() => _instance;

  AppConfig._internal();

  final _config = _Config.configure();

  String get pokeApiBaseURL => _config.pokeApiBaseURL;
}

class _Config {
  _Config._({
    this.pokeApiBaseURL,
  });

  factory _Config.configure() => _Config._(
        pokeApiBaseURL: 'https://pokeapi.co/api/v2/',
      );

  final String pokeApiBaseURL;
}
