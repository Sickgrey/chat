part of ui_kit;

enum ThemeType {
  violet,
  green,
}

/// {@template themeCubit}
/// App theme control cubit.
/// {@endtemplate}
class ThemeCubit extends Cubit<ThemeType> {
  /// {@macro themeCubit}
  ThemeCubit() : super(ThemeType.violet);

  ThemeData get theme {
    switch (state) {
      case ThemeType.violet:
        return AppTheme.violet;
      case ThemeType.green:
        return AppTheme.green;
    }
  }

  void setTheme(ThemeType themeType) => emit(themeType);
}

/// Context extension for quick access to [ThemeCubit].
extension ThemeCubitBuildContextX on BuildContext {
  /// Instance of [ThemeCubit].
  ThemeCubit get readThemeCubit => read<ThemeCubit>();
}
