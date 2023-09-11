part of login_part;

/// {@template splashScreen}
/// Splash screen.
/// {@endtemplate}
class SplashScreen extends StatelessWidget {
  /// {@macro splashScreen}
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
