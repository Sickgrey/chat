part of theme_selector;

enum ThemeType {
  violet,
  green,
}

/// {@template themeCubit}
/// App theme control cubit.
/// {@endtemplate}
class ThemeCubit extends Cubit<ThemeType> {
  /// Instance of [IThemeRepository].
  final IThemeRepository themeRepository;

  /// {@macro themeCubit}
  ThemeCubit({required this.themeRepository}) : super(ThemeType.violet);

  ThemeData get theme {
    switch (state) {
      case ThemeType.violet:
        return AppTheme.violet;
      case ThemeType.green:
        return AppTheme.green;
    }
  }

  Future<void> setTheme(ThemeType themeType) async {
    emit(themeType);
    await themeRepository.saveTheme(themeName: themeType.name);
  }

  Future<void> loadSavedTheme() async {
    final themeName = await themeRepository.fetchTheme();
    final list =
        ThemeType.values.where((element) => element.name == themeName).toList();

    if (list.isNotEmpty) {
      emit(list.first);
    } else {
      emit(ThemeType.violet);
    }
  }
}

/// Context extension for quick access to [ThemeCubit].
extension ThemeCubitBuildContextX on BuildContext {
  /// Instance of [ThemeCubit].
  ThemeCubit get readThemeCubit => read<ThemeCubit>();
}
