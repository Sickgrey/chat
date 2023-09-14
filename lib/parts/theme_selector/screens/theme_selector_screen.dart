part of theme_selector;

/// {@tempalte themeSelectorScreen}
/// Screen with theme selection.
/// {@endtempllate}
class ThemeSelectorScreen extends StatefulWidget {
  /// Current app theme.
  final ThemeType currentTheme;

  /// {@macro themeSelectorScreen}
  const ThemeSelectorScreen({super.key, required this.currentTheme});

  @override
  State<ThemeSelectorScreen> createState() => _ThemeSelectorScreenState();
}

class _ThemeSelectorScreenState extends State<ThemeSelectorScreen> {
  final themeTypes = ThemeType.values;
  late ThemeType selectedTheme = widget.currentTheme;

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.theme),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            itemCount: themeTypes.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(themeTypes[index].name),
                  Radio<ThemeType>(
                      value: themeTypes[index],
                      groupValue: selectedTheme,
                      onChanged: (newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedTheme = newValue;
                          });
                          context.readThemeCubit.setTheme(newValue);
                        }
                      })
                ],
              );
            }),
      ),
    );
  }
}
