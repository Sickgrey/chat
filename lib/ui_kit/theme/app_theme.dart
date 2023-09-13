part of ui_kit;

extension ThemeMethods on BuildContext {
  /// Returns [ThemeData] for the current [BuildContext].
  ThemeData get theme => Theme.of(this);
}

/// Extension for getting [AppColors] for a theme.
extension ThemeColors on ThemeData {
  ///Returns [AppColors] for the current theme's [Brightness].
  AppColors get colors {
    return AppColors.violet();
  }
}

// ignore: avoid_classes_with_only_static_members
/// Class used to store application themes styles.
class AppTheme {
  /// Returns "violet" [ThemeData] for app.
  static ThemeData get violet {
    final appColors = AppColors.violet();

    final theme = ThemeData(
      textTheme: TextTheme(),
      highlightColor: Colors.transparent,
      splashColor: appColors.brandFirst.withOpacity(0.12),
      appBarTheme: AppBarTheme(color: appColors.brandFirst),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: appColors.brandFirst,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: appColors.brandFirst),
        focusColor: appColors.brandFirst,
      ),
    );

    return theme;
  }
}
