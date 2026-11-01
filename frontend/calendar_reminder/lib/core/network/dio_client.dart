import 'package:calendar_reminder/core/network/interceptor/auth_interceptor.dart';
import 'package:calendar_reminder/core/network/tokens_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final globalKey = GlobalKey<NavigatorState>();
final appRouter = GoRouter(navigatorKey: globalKey, routes: []);

class DioClient {
  late final Dio dio;

  DioClient(TokensStorage storage) {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:3000',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': "application/json"},
      ),
    );

    dio.interceptors.add(
      AuthInterceptor(
        dio: dio,
        storage: storage,
        onCloseSession: () => appRouter.go('/login'),
      ),
    );

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
}
