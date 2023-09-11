part of login_part;

/// {@template loginFormInput}
/// Login input form.
/// {@endtemplate}
class LoginFormInput extends StatefulWidget {
  /// {@macro loginFormInput}
  const LoginFormInput({super.key});

  @override
  _LoginFormInputState createState() => _LoginFormInputState();
}

class _LoginFormInputState extends State<LoginFormInput> {
  final _formKey = GlobalKey<FormState>();
  var _userName = '';

  void _trySubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
      context.readLoginBloc.add(LoginSubmitted(username: _userName));
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;

    return Scaffold(
        body: Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  autocorrect: true,
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  enableSuggestions: false,
                  validator: (value) {
                    //  TODO: check null value
                    if (!RegExp(r'^[A-Za-z0-9А-ЯЁа-яё -]{3,20}$')
                        .hasMatch(value!))
                      return locale.nicknameValidationError;
                    return null;
                  },
                  decoration: InputDecoration(labelText: locale.username),
                  onSaved: (value) {
                    //  TODO: check null value
                    _userName = value!;
                  },
                ),
                SizedBox(height: 12),
                OutlinedButton(
                  child: Text(locale.login),
                  onPressed: _trySubmit,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
