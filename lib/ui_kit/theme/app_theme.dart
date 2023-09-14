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
      colorScheme: ColorScheme.fromSeed(
        seedColor: appColors.primaryColor,
        error: appColors.errorColor,
        surface: appColors.supportColor,
        outline: appColors.black,
        background: appColors.white,
      ),
      primaryColor: appColors.primaryColor,
      primaryColorDark: appColors.primaryColorDark,
      primaryColorLight: appColors.primaryColorLight,
      cardColor: appColors.cardColor,
      hintColor: appColors.hintColor,
      highlightColor: Colors.transparent,
      splashColor: appColors.primaryColor.withOpacity(0.12),
      appBarTheme: AppBarTheme(color: appColors.primaryColor),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: appColors.primaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: appColors.primaryColor),
        focusColor: appColors.primaryColor,
      ),
    );

    return theme;
  }

  static ThemeData get green {
    final appColors = AppColors.green();

    final theme = ThemeData(
      textTheme: TextTheme(),
      colorScheme: ColorScheme.fromSeed(
        seedColor: appColors.primaryColor,
        error: appColors.errorColor,
        surface: appColors.supportColor,
        outline: appColors.black,
        background: appColors.white,
      ),
      primaryColor: appColors.primaryColor,
      primaryColorDark: appColors.primaryColorDark,
      primaryColorLight: appColors.primaryColorLight,
      cardColor: appColors.cardColor,
      hintColor: appColors.hintColor,
      highlightColor: Colors.transparent,
      splashColor: appColors.primaryColor.withOpacity(0.12),
      appBarTheme: AppBarTheme(color: appColors.primaryColor),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: appColors.primaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: appColors.primaryColor),
        focusColor: appColors.primaryColor,
      ),
    );

    return theme;
  }
}
