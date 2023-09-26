part of 'root.dart';

/// The application's root widget.
class App extends StatefulWidget {
  /// The [DependencyContainer] that the application use for the dependency injection.
  final DependencyContainer container;

  /// The [Environment] change callback.
  final EnvironmentChangedCallback onEnvironmentChanged;

  /// Creates the application root widget that uses
  /// the given parameters.
  const App({
    Key? key,
    required this.container,
    required this.onEnvironmentChanged,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (_) => EnvironmentCubit(widget.container.environment),
    //   child: BlocListener<EnvironmentCubit, Environment>(
    //     listener: (context, environment) =>
    //         widget.onEnvironmentChanged(environment),
    //     child: Provider<DependencyContainer>.value(
    //       value: widget.container,
    //       child: const MaterialApp(
    //         localizationsDelegates: AppLocalizations.localizationsDelegates,
    //         supportedLocales: AppLocalizations.supportedLocales,
    //         home: Welcome(),
    //       ),
    //     ),
    //   ),
    // );

    return Provider<DependencyContainer>.value(
      value: widget.container,
      child: BlocProvider<ThemeCubit>(
        create: (context) => ThemeCubit(
          themeRepository: ThemeRepository(),
        )..loadSavedTheme(),
        child: BlocBuilder<ThemeCubit, ThemeType>(
          builder: (context, state) => MaterialApp(
            theme: context.readThemeCubit.theme,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: BlocProvider(
              create: (context) => LoginBloc(logger: widget.container.logger),
              child: const LoginScreen(),
            ),
          ),
        ),
      ),
    );
  }
}
