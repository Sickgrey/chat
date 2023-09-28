part of '../developer_part.dart';

/// {@template developerAppVersionInfo}
/// The widget displays the app version and navigates to the [EnvironmentManager] screen.
/// {@endtemplate}
class DeveloperAppVersionInfo extends StatefulWidget {
  /// {@macro developerAppVersionInfo}
  const DeveloperAppVersionInfo({super.key});

  @override
  State<DeveloperAppVersionInfo> createState() =>
      _DeveloperAppVersionInfoState();
}

class _DeveloperAppVersionInfoState extends State<DeveloperAppVersionInfo> {
  int lastTap = DateTime.now().millisecondsSinceEpoch;
  int consecutiveTaps = 0;

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.appVersion),
      ),
      body: Center(
        child: GestureDetector(
          onLongPress: _navigateToDeveloperMenu,
          onTap: () {
            final now = DateTime.now().millisecondsSinceEpoch;
            if (now - lastTap < 500) {
              consecutiveTaps++;
              if (consecutiveTaps > 3) {
                _navigateToDeveloperMenu();
              }
            } else {
              consecutiveTaps = 0;
            }
            lastTap = now;
          },
          child: const AppVersionInfo(),
        ),
      ),
    );
  }

  void _navigateToDeveloperMenu() => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const EnvironmentManager(),
        ),
      );
}

/// {@template appVersionInfo}
/// The widget displays the app version.
/// {@endtemplate}
class AppVersionInfo extends StatelessWidget {
  /// {@macro appVersionInfo}
  const AppVersionInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: snapshot.hasData
            ? Text(
                'ver. ${snapshot.data!.version} (${snapshot.data!.buildNumber})',
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
