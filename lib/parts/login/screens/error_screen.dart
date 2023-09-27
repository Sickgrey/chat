part of '../login_part.dart';

/// {@template errorScreen}
/// Error screen.
/// {@endtemplate}
class ErrorScreen extends StatelessWidget {
  /// Retry callback.
  final VoidCallback onRetryTapped;

  /// {@macro errorScreen}
  const ErrorScreen({super.key, required this.onRetryTapped});

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
