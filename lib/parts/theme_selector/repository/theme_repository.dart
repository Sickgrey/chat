part of theme_selector;

/// {@template themeRepository}
/// Implementation of [ThemeRepository] with production functionality.
/// {@endtemplate}
class ThemeRepository extends IThemeRepository {
  final _themeKey = 'themeKey';

  @override
  Future<void> saveTheme({required String themeName}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, themeName);
  }

  @override
  Future<String> fetchTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_themeKey) ?? '';
  }
}
