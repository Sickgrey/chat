part of '../developer_part.dart';

/// {@template environmentManager}
/// The widget is for showing and changing the app's [Environment].
/// {@endtemplate}
class EnvironmentManager extends StatelessWidget {
  /// {@macro environmentManager}
  const EnvironmentManager({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;
    final container = context.read<DependencyContainer>();

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.environment),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(locale.environment),
                DropdownButton<Environment>(
                  value: container.environment,
                  items: Environment.values
                      .map(
                        (e) => DropdownMenuItem<Environment>(
                          value: e,
                          child: Text(describeEnum(e)),
                        ),
                      )
                      .toList(),
                  onChanged: (environment) => context
                      .read<EnvironmentCubit>()
                      .changeEnvironment(environment!),
                )
              ],
            ),
            TextButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (context) => DeveloperLogBloc(
                      loader: container.paginationLogLoader,
                      logger: container.logger,
                    )..add(DeveloperLogFetched()),
                    child: const DeveloperLogBuilder(),
                  ),
                ),
              ),
              child: Text(locale.openLog),
            )
          ],
        ),
      ),
    );
  }
}
