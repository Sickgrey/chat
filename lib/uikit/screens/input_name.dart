part of '../uikit.dart';

class InputName extends StatefulWidget {
  const InputName({Key? key}) : super(key: key);

  @override
  _InputNameState createState() => _InputNameState();
}

class _InputNameState extends State<InputName> {
  bool isEnabledButton = false;
  String userName = '';

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                locale.welcome,
                style: const TextStyle(fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  autofocus: true,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  onChanged: (value) {
                    setState(() {
                      userName = value;
                    });
                  },
                ),
              ),
              ElevatedButton(
                onPressed: userName.isNotEmpty
                    ? () {
                        getIt<UserDataProvider>().setUserName(userName);
                        AppRouter.instance.replace(
                          context,
                          const RoomsFeature(),
                        );
                      }
                    : null,
                child: Text(locale.ready),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
