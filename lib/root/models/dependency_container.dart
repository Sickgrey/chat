part of '../root.dart';

/// The dependency injection container.
///
/// This container contains all application dependencies.
class DependencyContainer {
  /// The Application config.
  final Config config;

  /// The Application environment.
  final Environment environment;

  /// The [Dio] instance that this container uses.
  final Dio dio;

  /// The logger.
  final AppLogger logger;

  /// The log records loader that the developer_part uses.
  final PaginationLogLoader paginationLogLoader;

  /// Chat repository.
  final IChatRepository iChatRepository;

  /// Rooms repository.
  final IRoomsRepository iRoomsRepository;

  /// Theme repository.
  final IThemeRepository iThemeRepository;

  /// Creates the [DependencyContainer] that uses
  /// the given parameters.
  DependencyContainer({
    required this.config,
    required this.dio,
    required this.environment,
    required this.logger,
    required this.paginationLogLoader,
    required this.iChatRepository,
    required this.iRoomsRepository,
    required this.iThemeRepository,
  });

  /// Frees resources that this container use.
  Future<void> dispose() async {
    await logger.dispose();
  }
}
