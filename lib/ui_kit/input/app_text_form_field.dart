part of ui_kit;

/// {@template appTextFormField}
/// App text form field.
/// {@endtemplate}
class AppTextFormField extends StatelessWidget {
  /// Form field validator.
  final String? Function(String?)? validator;

  /// On saved callback.
  final ValueChanged<String?>? onSaved;

  /// {@macro appTextFormField}
  const AppTextFormField({
    super.key,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return TextFormField(
      autocorrect: true,
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      enableSuggestions: false,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: theme.primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: theme.colorScheme.error),
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        fillColor: theme.splashColor,
        filled: true,
      ),
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      onSaved: onSaved,
    );
  }
}
