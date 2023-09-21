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
    final theme = context.theme;
    final locale = context.l10n;

    return Scaffold(
        body: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                locale.welcome,
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: theme.primaryColorDark,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Text(
                  locale.enterUsername,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.primaryColorDark,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: AppTextFormField(
                  validator: (value) {
                    //  TODO: check null value
                    if (!RegExp(r'^[A-Za-z0-9А-ЯЁа-яё -]{3,20}$')
                        .hasMatch(value!))
                      return locale.nicknameValidationError;
                    return null;
                  },
                  onSaved: (value) {
                    //  TODO: check null value
                    _userName = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: AppOutlinedButton(
                  width: double.infinity,
                  child: Text(locale.login),
                  onPressed: _trySubmit,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
