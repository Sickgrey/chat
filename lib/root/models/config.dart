part of '../root.dart';

/// {@template config}
/// The application config.
/// {@endtemplate}
class Config {
  /// The backend URL uses as the base URL in Dio.
  final String apiUrl;

  /// The key is for storing the logger's encryption key.
  final String deLogEncryptionKey;

  /// The key is for the logger's hive box name.
  final String deLogBoxKey;

  /// The key is for storing the app's current theme.
  final String themeKey;

  /// {@macro config}
  Config({
    required this.apiUrl,
    required this.deLogEncryptionKey,
    required this.deLogBoxKey,
    required this.themeKey,
  });
}
