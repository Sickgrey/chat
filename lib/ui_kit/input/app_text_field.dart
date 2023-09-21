part of ui_kit;

/// {@template appTextField}
/// App text input field.
/// {@endtemplate}
class AppTextField extends StatelessWidget {
  /// Controls the text being edited.
  final TextEditingController? controller;

  /// Hint text.
  final String? hintText;

  /// The maximum number of lines to show at one time.
  final int? maxLines;

  /// {@macro appTextField}
  const AppTextField({
    super.key,
    this.controller,
    this.hintText,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      maxLines: maxLines ?? 1,
      minLines: 1,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: theme.primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        fillColor: theme.splashColor,
        filled: true,
      ),
    );
  }
}
