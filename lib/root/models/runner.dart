part of '../root.dart';

/// The basic runner template.
///
/// This class initializes the [DependencyContainer] for this runner [environment],
/// and runs the application with the [runApplication] method.
abstract class Runner {
  late DependencyContainer _container;

  /// Initializes the [DependencyContainer] and runs the [runApplication] method.
  Future<void> run(EnvironmentChangedCallback onEnvironmentChanged) async {
    _container = await initializeContainer();
    await runApplication(_container, onEnvironmentChanged);
  }

  /// Returns initialized DependencyContainer for the [environment].
  @protected
  Future<DependencyContainer> initializeContainer();

  /// Runs application (the runApp function).
  @protected
  Future<void> runApplication(
    DependencyContainer container,
    EnvironmentChangedCallback onEnvironmentChanged,
  );

  /// Cleans resources that this runner uses.
  @protected
  Future<void> clean() async {
    await _container.dispose();
  }

  /// This runner environment.
  Environment get environment;
}

/// The base [Runner] implementation.
abstract class AppRunner extends Runner {
  @override
  Future<DependencyContainer> initializeContainer() async {
    final config = environment.config;
    final hiveHandler = await initializeHiveLogHandler(config);
    final logger = initializeDeLog(hiveHandler);
    final dio = initializeDio(config.apiUrl, logger);

    return DependencyContainer(
      config: config,
      dio: dio,
      environment: environment,
      logger: logger,
      paginationLogLoader: hiveHandler,
      iChatRepository: ChatRepository(
        chatDataProvider: ChatDataProvider(dio: dio),
      ),
      iRoomsRepository: RoomsRepository(
        roomsDataProvider: RoomsDataProvider(dio: dio),
      ),
      iThemeRepository: ThemeRepository(themeKey: config.themeKey),
    );
  }

  @override
  Future<void> runApplication(
    DependencyContainer container,
    EnvironmentChangedCallback onEnvironmentChanged,
  ) async {
    runApp(
      App(
        key: ValueKey<DependencyContainer>(container),
        container: container,
        onEnvironmentChanged: onEnvironmentChanged,
      ),
    );
  }
}

/// The runner extends the [AppRunner] and adds the error handling functionality.
abstract class ErrorCatchRunner extends AppRunner {
  @override
  Future<void> runApplication(
    DependencyContainer container,
    EnvironmentChangedCallback onEnvironmentChanged,
  ) async {
    FlutterError.onError = (details) async {
      container.logger.error(
        DeLogRecord(
          'The error  caught in FlutterError.onError',
          name: 'FlutterError.onError',
          error: details.exception,
          stackTrace: details.stack,
        ),
      );
    };
    if (!foundation.kIsWeb) {
      Isolate.current.addErrorListener(
        RawReceivePort((dynamic pair) async {
          final isolateError = pair as List<String>;
          container.logger.error(
            DeLogRecord(
              'The error caught in Isolate.current.addErrorListener',
              name: 'Isolate.current.addErrorListener',
              error: isolateError.first,
              stackTrace: StackTrace.fromString(isolateError.last),
            ),
          );
        }).sendPort,
      );
    }
    runZonedGuarded<Future<void>>(
        () => super.runApplication(container, onEnvironmentChanged),
        (error, stackTrace) {
      container.logger.error(
        DeLogRecord(
          'The error caught in runZonedGuarded',
          name: 'runZonedGuarded',
          error: error,
          stackTrace: stackTrace,
        ),
      );
    });
  }
}

/// The [Environment.prod] runner.
class ProdRunner extends ErrorCatchRunner {
  @override
  Environment get environment => Environment.prod;
}

/// The [Environment.dev] runner.
class DevRunner extends ErrorCatchRunner {
  @override
  Environment get environment => Environment.dev;
}

/// The [Environment.mock] runner.
class MockRunner extends ErrorCatchRunner {
  @override
  Environment get environment => Environment.mock;
}
