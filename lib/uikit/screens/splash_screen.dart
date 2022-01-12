part of '../uikit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirectToScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const AppLoading();
  }

  Future<void> redirectToScreen() async {
    final userName = await getIt<UserDataProvider>().getUserName();
    userName != null
        ? AppRouter.instance.replace(context, const RoomsFeature())
        : AppRouter.instance.replace(context, const InputName());
  }
}
