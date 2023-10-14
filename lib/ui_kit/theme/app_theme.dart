part of '../ui_kit.dart';

extension ThemeMethods on BuildContext {
  /// Returns [ThemeData] for the current [BuildContext].
  ThemeData get theme => Theme.of(this);
}

// ignore: avoid_classes_with_only_static_members
/// Class used to store application themes styles.
class AppTheme {
  /// Returns "violet" [ThemeData] for app.
  static ThemeData get violet => _buildThemeData(AppColors.violet());

  /// Returns "green" [ThemeData] for app.
  static ThemeData get green => _buildThemeData(AppColors.green());

  static ThemeData _buildThemeData(AppColors colors) => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: colors.primaryColor,
          error: colors.errorColor,
          surface: colors.supportColor,
          outline: colors.black,
          background: colors.white,
        ),
        primaryColor: colors.primaryColor,
        primaryColorDark: colors.primaryColorDark,
        primaryColorLight: colors.primaryColorLight,
        cardColor: colors.cardColor,
        hintColor: colors.hintColor,
        highlightColor: Colors.transparent,
        splashColor: colors.primaryColor.withOpacity(0.12),
        appBarTheme: AppBarTheme(color: colors.primaryColor),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colors.primaryColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: colors.primaryColor),
          focusColor: colors.primaryColor,
        ),
      );
}
