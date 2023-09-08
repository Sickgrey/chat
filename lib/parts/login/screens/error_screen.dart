part of login_part;

class ErrorScreen extends StatelessWidget {
  final VoidCallback onRetryTapped;

  const ErrorScreen({required this.onRetryTapped});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Ошибка, проверьте подключение к интернету',
              style: TextStyle(color: Colors.red),
            ),
            OutlinedButton(
              child: const Text('Еще раз'),
              onPressed: onRetryTapped,
            ),
          ],
        ),
      ),
    );
  }
}
