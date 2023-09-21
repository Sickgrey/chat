part of ui_kit;

/// {@template appOutlinedButton}
/// Designed button.
/// {@endtemplate}
class AppOutlinedButton extends StatelessWidget {
  /// Child widget.
  final Widget child;

  /// Button height.
  final double height;

  /// Button width.
  final double width;

  /// On pressed callback.
  final VoidCallback? onPressed;

  /// {@macro appOutlinedButton}
  const AppOutlinedButton({
    super.key,
    required this.child,
    this.height = 48,
    this.width = 48,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return SizedBox(
      height: height,
      width: width,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          side: BorderSide(color: theme.primaryColor),
          backgroundColor: theme.splashColor,
        ),
        child: child,
      ),
    );
  }
}
