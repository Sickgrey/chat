part of '../developer_part.dart';

/// {@template developerLogBuilder}
/// The widget contains the [BlocBuilder] for the [DeveloperLogBloc].
/// {@endtemplate}
class DeveloperLogBuilder extends StatelessWidget {
  /// {@macro developerLogBuilder}
  const DeveloperLogBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final locale = context.l10n;

    return BlocBuilder<DeveloperLogBloc, DeveloperLogState>(
      builder: (context, state) {
        if (state.status == DeveloperLogStatus.success) {
          return LogScreen(records: state.records);
        } else if (state.status == DeveloperLogStatus.failure) {
          return Container(
            alignment: Alignment.center,
            color: theme.colorScheme.background,
            child: Text(locale.failedToOpenLog),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
