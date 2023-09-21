part of ui_kit;

/// Base function for show app design dialog.
Future<T?> showBaseDialog<T>(
  BuildContext context, {
  required Widget dialog,
  bool barrierDismissible = true,
  BorderRadius borderRadius = const BorderRadius.all(
    Radius.circular(20),
  ),
}) async {
  final theme = context.theme;

  return showDialog<T>(
    context: context,
    barrierColor: theme.colorScheme.outline.withOpacity(0.5),
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: theme.colorScheme.background,
            borderRadius: borderRadius,
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.outline.withOpacity(0.14),
                offset: const Offset(0, 16),
                blurRadius: 24,
              ),
              BoxShadow(
                color: theme.colorScheme.outline.withOpacity(0.12),
                offset: const Offset(0, 6),
                blurRadius: 30,
              ),
              BoxShadow(
                color: theme.colorScheme.outline.withOpacity(0.2),
                offset: const Offset(0, 8),
                blurRadius: 10,
              )
            ],
          ),
          child: dialog,
        ),
      );
    },
  );
}
