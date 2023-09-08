part of login_part;

class ErrorScreen extends StatelessWidget {
  final VoidCallback onRetryTapped;

  const ErrorScreen({required this.onRetryTapped});

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
              style: TextStyle(color: Colors.red),
            ),
            OutlinedButton(
              child: Text(locale.tryAgain),
              onPressed: onRetryTapped,
            ),
          ],
        ),
      ),
    );
  }
}
