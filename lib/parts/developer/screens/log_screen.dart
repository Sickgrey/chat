part of '../developer_part.dart';

/// {@template logScreen}
/// The widget displays all log records.
/// {@endtemplate}
class LogScreen extends StatefulWidget {
  /// The log records list.
  final List<RenderableRecord> records;

  /// {@macro logScreen}
  const LogScreen({super.key, required this.records});

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final locale = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.log),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () =>
                  context.read<DeveloperLogBloc>().add(DeveloperLogExtracted()),
              child: Icon(
                Icons.upload_file,
                color: theme.colorScheme.background,
                size: 24,
              ),
            ),
          )
        ],
      ),
      body: RefreshIndicator(
        backgroundColor: theme.colorScheme.background,
        onRefresh: () async {
          context.read<DeveloperLogBloc>().add(DeveloperLogRefreshed());
          await context.read<DeveloperLogBloc>().stream.first;
        },
        child: Scrollbar(
          controller: _scrollController,
          child: ListView.separated(
            controller: _scrollController,
            separatorBuilder: (_, __) => const Divider(),
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(20),
              child: widget.records[index].render(context),
            ),
            itemCount: widget.records.length,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<DeveloperLogBloc>().add(DeveloperLogFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
