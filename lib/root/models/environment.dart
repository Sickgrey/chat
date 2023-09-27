part of '../root.dart';

/// Applications environments.
enum Environment {
  /// Production.
  prod,

  /// Development.
  dev,

  /// Mock.
  mock,
}

/// Extension on the [Environment] to return the [Config]
/// associated with this [Environment].
extension EnvironmentConfig on Environment {
  /// Returns the [Config] that is associated with this.
  Config get config {
    String apiUrl;

    switch (this) {
      case Environment.prod:
        apiUrl = 'https://nane.tada.team/api/';
        break;
      case Environment.dev:
        apiUrl = 'https://nane.tada.team/api/';
        break;
      case Environment.mock:
        apiUrl = 'https://nane.tada.team/api/';
        break;
    }

    return Config(
      apiUrl: apiUrl,
      deLogEncryptionKey: 'deLogEncryptionKey',
      deLogBoxKey: 'deLogBoxKey',
      themeKey: '${name}themeKey',
    );
  }
}
