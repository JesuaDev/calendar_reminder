import 'package:calendar_reminder/core/network/tokens_storage.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends QueuedInterceptor {
  final Dio dio;
  final TokensStorage storage;
  final void Function() onCloseSession;

  AuthInterceptor({
    required this.dio,
    required this.storage,
    required this.onCloseSession,
  });

  final Dio _refreshDio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:3000',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': "application/json"},
    ),
  );

  static const _publicPaths = ['/login', '/register', '/refresh'];

  bool _isPublic(RequestOptions o) => _publicPaths.any(o.path.contains);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!_isPublic(options)) {
      final token = await storage.accesToken;
      if (token != null) {
        options.headers["Authorization"] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final req = err.requestOptions;
    final bool is401 = err.response?.statusCode == 401;

    if (!is401 || _isPublic(req) || req.extra["retried"] == true) {
      return handler.next(err);
    }

    try {
      final currentToken = await storage.accesToken;
      final sendToken = (req.headers["Authorization"] as String?)?.replaceFirst(
        'Bearer ',
        '',
      );

      if (currentToken != null && currentToken != sendToken) {
        return handler.resolve(await _retry(req, currentToken));
      }

      final refreshToken = await storage.refreshAccesToken;
      if (refreshToken == null) throw Exception("Sin refresh token");

      final res = await _refreshDio.post(
        "/refreshToken",
        data: {"refreshToken": refreshToken},
      );

      final newAccess = res.data["accessToken"] as String;
      final newRefresh = res.data["refreshToken"] as String;

      await storage.saveTokens(newAccess, newRefresh);

      return handler.resolve(await _retry(req, newAccess));
    } catch (_) {
      await storage.deleteTokens();
      onCloseSession();
      return handler.next(err);
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions req, String token) {
    req.headers['Authorization'] = 'Bearer $token';
    req.extra['retried'] = true;
    return dio.fetch(req);
  }
}
