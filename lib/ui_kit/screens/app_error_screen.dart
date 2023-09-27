part of '../ui_kit.dart';

/// {@template appErrorScreen}
/// Error screen.
/// {@endtemplate}
class AppErrorScreen extends StatelessWidget {
  /// Retry callback.
  final VoidCallback onRetryTapped;

  /// {@macro appErrorScreen}
  const AppErrorScreen({super.key, required this.onRetryTapped});

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              locale.networkConnectionError,
              style: const TextStyle(color: Colors.red),
            ),
            OutlinedButton(
              onPressed: onRetryTapped,
              child: Text(locale.tryAgain),
            ),
          ],
        ),
      ),
    );
  }
}
