part of '../uikit.dart';

class AppFailure extends StatelessWidget {
  const AppFailure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.error,
              size: 64,
              color: Colors.red,
            ),
            Text(
              'Error',
              style: TextStyle(fontSize: 24, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
