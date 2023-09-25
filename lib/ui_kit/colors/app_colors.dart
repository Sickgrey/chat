part of '../ui_kit.dart';

//ignore_for_file: avoid_field_initializers_in_const_classes
///Set of application colors.
class AppColors {
  final Color primaryColor;
  final Color primaryColorDark;
  final Color primaryColorLight;
  final Color cardColor;
  final Color supportColor;
  final Color errorColor;
  final Color white;
  final Color black;
  final Color hintColor;

  /// "Violet" version of app colors.
  AppColors.violet()
      : primaryColor = const Color(0xFF796EA8),
        primaryColorDark = const Color(0xFF554D74),
        primaryColorLight = const Color(0xFFA6A9C8),
        cardColor = const Color(0xFFD3D9E9),
        supportColor = const Color(0xFF5EB14A),
        errorColor = const Color(0xFFDE3452),
        white = const Color(0xFFFFFFFF),
        black = const Color(0xFF000000),
        hintColor = const Color(0xFF8B8B8B);

  /// "Green" version of app colors.
  AppColors.green()
      : primaryColor = const Color(0xFF5AAD6E), // 500
        primaryColorDark = const Color(0xFF417B4E), // 800
        primaryColorLight = const Color(0xFFA9D5B5), // 200
        cardColor = const Color(0xFFE9F5EC), // 50
        supportColor = const Color(0xFF3A85DE),
        errorColor = const Color(0xFFDE3452),
        white = const Color(0xFFFFFFFF),
        black = const Color(0xFF000000),
        hintColor = const Color(0xFF8B8B8B);
}
