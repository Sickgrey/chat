part of theme_selector;

/// {@template iChatRepository}
/// Chat repository interface.
/// {@endtemplate}
abstract class IThemeRepository {
  /// Save theme name to local storage.
  Future<void> saveTheme({required String themeName});

  /// Fetch theme name from local storage.
  Future<String> fetchTheme();
}
