part of 'de_log_kit.dart';

/// The interceptor logs the network requests with the [DeLog].
class DeLogInterceptor extends Interceptor {
  /// Creates [DeLogInterceptor] that uses given parameters.
  DeLogInterceptor({
    required this.logger,
    this.request = true,
    this.requestHeader = true,
    this.requestBody = true,
    this.responseHeader = true,
    this.responseBody = true,
    this.error = true,
  });

  /// Whether the request [Options] logs.
  final bool request;

  /// Whether the request header [Options.headers] logs.
  final bool requestHeader;

  /// Whether the request data [Options.data] logs.
  final bool requestBody;

  /// Whether the [Response.data] logs.
  final bool responseBody;

  /// Whether the [Response.headers] logs.
  final bool responseHeader;

  /// Whether the error message logs.
  final bool error;

  /// The [DeLog] instance.
  final AppLogger logger;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final json = <String, dynamic>{};
    json['uri'] = options.uri.toString();

    if (request) {
      json['method'] = options.method;
      json['responseType'] = options.responseType.toString();
      json['followRedirects'] = options.followRedirects;
      json['connectTimeout'] = options.connectTimeout;
      json['receiveTimeout'] = options.receiveTimeout;
      json['extra'] = options.extra;
    }
    if (requestHeader) {
      json['headers'] = options.headers;
    }
    if (requestBody) {
      json['data'] = options.data.toString();
    }
    logger.info(
      DeLogRecord(
        jsonEncode(json),
        curl: _cURLRepresentation(options),
        name: 'DeLogInterceptor -> onRequest',
      ),
    );
    handler.next(options);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    final json = <String, dynamic>{};
    if (error && err.type != DioErrorType.cancel) {
      json['uri'] = err.requestOptions.uri.toString();
      json['error'] = err.toString();
      json['stacktrace'] = err.stackTrace.toString();
      if (err.response != null) {
        json['response'] = _formResponseJson(err.response!);
      }
      logger.error(
        DeLogRecord(
          jsonEncode(json),
          name: 'DeLogInterceptor -> onError',
        ),
      );
    }
    handler.next(err);
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    logger.info(
      DeLogRecord(
        jsonEncode(_formResponseJson(response)),
        name: 'DeLogInterceptor -> onResponse',
      ),
    );
    handler.next(response);
  }

  Map<String, dynamic> _formResponseJson(Response<dynamic> response) {
    final json = <String, dynamic>{};
    json['uri'] = response.requestOptions.uri.toString();
    if (responseHeader) {
      json['statusCode'] = response.statusCode;
      if (response.isRedirect == true) {
        json['redirect'] = response.realUri.toString();
      }
      json['headers'] = response.headers.map;
    }
    if (responseBody) {
      json['responseData'] = response.toString();
    }
    return json;
  }

  /// Скопировано из https://pub.dev/packages/curl_logger_dio_interceptor
  /// Сохраняет в лог cUrl запроса
  String? _cURLRepresentation(RequestOptions options) {
    try {
      final List<String> components = ['curl -i'];
      if (options.method.toUpperCase() != 'GET') {
        components.add('-X ${options.method}');
      }

      options.headers.forEach((k, v) {
        if (k != 'Cookie') {
          components.add('-H "$k: $v"');
        }
      });

      if (options.data != null) {
        // FormData can't be JSON-serialized, so return null
        if (options.data is FormData) {
          return null;
        }

        final data = json.encode(options.data); //.replaceAll('"', '\\"');
        components.add('-d $data');
      }

      components.add('${options.uri.toString()}');

      return components.join(' ');
    } catch (err) {
      print('unable to create a CURL representation of the requestOptions');
      return null;
    }
  }
}
