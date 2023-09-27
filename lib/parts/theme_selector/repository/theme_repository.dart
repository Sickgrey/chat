part of '../theme_selector_part.dart';

/// {@template themeRepository}
/// Implementation of [ThemeRepository] with production functionality.
/// {@endtemplate}
class ThemeRepository implements IThemeRepository {
  /// The key is for storing the app's current theme.
  final String themeKey;

  /// {@macro themeRepository}
  const ThemeRepository({required this.themeKey});

  @override
  Future<void> saveTheme({required String themeName}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(themeKey, themeName);
  }

  @override
  Future<String> fetchTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(themeKey) ?? '';
  }
}
