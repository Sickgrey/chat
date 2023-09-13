part of ui_kit;

//ignore_for_file: avoid_field_initializers_in_const_classes
///Set of application colors.
class AppColors {
  /// Brand-01.
  final Color brandFirst;

  /// Ui-01.
  final Color uiFirst;

  /// Ui-02.
  final Color uiSecond;

  /// Ui-03.
  final Color uiThird;

  /// Support-01.
  final Color supportFirst;

  /// Support-02.
  final Color supportSecond;

  /// Text-01.
  final Color textFirst;

  /// White color.
  final Color white;

  /// Black color.
  final Color black;

  /// Hint color.
  final Color hintTextColor;

  /// "Violet" version of app colors.
  AppColors.violet()
      : brandFirst = const Color(0xFF796EA8),
        uiFirst = const Color(0xFF554D74),
        uiSecond = const Color(0xFFA6A9C8),
        uiThird = const Color(0xFFD3D9E9),
        supportFirst = const Color(0xFF5EB14A),
        supportSecond = const Color(0xFFDE3452),
        textFirst = const Color(0xFF31293F),
        white = const Color(0xFFFFFFFF),
        black = const Color(0xFF000000),
        hintTextColor = const Color(0xFF8B8B8B);

  /// "Green" version of app colors.
  AppColors.green()
      : brandFirst = const Color(0xFF5AAD6E), // 500
        uiFirst = const Color(0xFF417B4E), // 800
        uiSecond = const Color(0xFFA9D5B5), // 200
        uiThird = const Color(0xFFE9F5EC), // 50
        supportFirst = const Color(0xFF3A85DE),
        supportSecond = const Color(0xFFDE3452),
        textFirst = const Color(0xFF31293F),
        white = const Color(0xFFFFFFFF),
        black = const Color(0xFF000000),
        hintTextColor = const Color(0xFF8B8B8B);
}
