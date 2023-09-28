part of '../rooms_part.dart';

/// {@tempalte settingsButton}
/// Button with popup menu for app settings.
/// {@endtempllate}
class SettingsButton extends StatelessWidget {
  /// {@macro settingsButton}
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final locale = context.l10n;

    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 0,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          height: 32,
          child: _MenuItem(
            icon: Icons.color_lens,
            title: locale.theme,
            color: theme.colorScheme.outline,
          ),
        ),
        const PopupMenuDivider(height: 1),
        PopupMenuItem(
          value: 2,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          height: 32,
          child: _MenuItem(
            icon: Icons.info,
            title: locale.info,
            color: theme.colorScheme.outline,
          ),
        ),
        const PopupMenuDivider(height: 1),
        PopupMenuItem(
          value: 1,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          height: 32,
          child: _MenuItem(
            icon: Icons.logout,
            title: locale.logout,
            color: theme.colorScheme.error,
          ),
        ),
      ],
      onSelected: (value) {
        switch (value) {
          case 0:
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ThemeSelectorScreen(
                  currentTheme: context.readThemeCubit.state,
                ),
              ),
            );
            break;
          case 1:
            context.readLoginBloc.add(const LoginExited());
            break;
          case 2:
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const DeveloperAppVersionInfo(),
              ),
            );
            break;
        }
      },
      padding: const EdgeInsets.symmetric(horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Icon(Icons.settings),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            title,
            style: TextStyle(color: color),
          ),
        ),
      ],
    );
  }
}
