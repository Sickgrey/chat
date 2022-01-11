part of 'app_router.dart';

class AppScreenRouter {
  final rootNavigatorKey = GlobalKey<NavigatorState>();

  Future<T?> pushScreen<T extends Object?>(BuildContext context, Widget screen,
      {RouteSettings? settings, bool rootNavigator = false}) {
    return Navigator.of(context, rootNavigator: rootNavigator)
        .push(_buildRoute<T>(screen, settings));
  }

  Future<T?> replace<T extends Object?>(BuildContext context, Widget screen,
      {RouteSettings? settings, bool rootNavigator = false}) {
    return Navigator.of(context, rootNavigator: rootNavigator)
        .pushReplacement(_buildRoute<T>(screen, settings));
  }

  Future<T?> pushAndPopToRoot<T extends Object?>(
      BuildContext context, Widget screen,
      {RouteSettings? settings}) {
    return Navigator.pushAndRemoveUntil(
        context, _buildRoute<T>(screen, settings), (route) => route.isFirst);
  }

  Future<T?> pushAndRemoveAllBefore<T extends Object?>(
      BuildContext context, Widget screen,
      {RouteSettings? settings}) {
    return Navigator.pushAndRemoveUntil(
        context, _buildRoute<T>(screen, settings), (route) => false);
  }

  void popToRoot(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  Future<bool> mayBePop(BuildContext context, [result]) {
    return Navigator.maybePop(context, result);
  }

  void pop<T>(BuildContext context, [result]) {
    return Navigator.of(context).pop<T>(result);
  }

  Route<T> _buildRoute<T extends Object?>(
    Widget screen, [
    RouteSettings? settings,
    bool fullscreenDialog = false,
  ]) {
    return MaterialPageRoute<T>(
        fullscreenDialog: fullscreenDialog,
        settings: settings ?? RouteSettings(name: '${screen.runtimeType}'),
        builder: (_) => screen);
  }
}
