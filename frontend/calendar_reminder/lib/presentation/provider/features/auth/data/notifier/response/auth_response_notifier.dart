import 'package:calendar_reminder/core/api/response/error_response.dart';
import 'package:calendar_reminder/infraestructure/dtos/user/login_dtos.dart';
import 'package:calendar_reminder/presentation/provider/features/auth/data/state/response/auth_state.dart';
import 'package:calendar_reminder/presentation/provider/features/auth/infraestructure/repositories/auth_repository_impl_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authResponseNotifier = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() => AuthState();

  Future<void> authResponse(LoginDtos dtos) async {
    try {
      final minLoadingTime = const Duration(milliseconds: 800);

      state = state.copyWith(isLoading: true, error: null);
      final DateTime start = DateTime.now();

      final repository = ref.read(authRepositoryImplProvider);
      final response = await repository.loginUser(dtos);

      final elapsed = DateTime.now().difference(start);

      if (elapsed < minLoadingTime) {
        await Future.delayed(minLoadingTime - elapsed);
      }

      state = state.copyWith(
        isLoading: false,
        statusCode: response.statusCode,
        message: response.message,
        userAuth: response.data,
      );
    } on ErrorEntity catch (e, st) {
      debugPrint("ERROR: $e");
      debugPrint("Error details $st"); 
      state = state.copyWith(
        error: ErrorEntity(
          statusCode: e.statusCode,
          message: e.message,
          details: e.details,
        ),
      );
    }
  }

  Future<void> verifyToken() async {
    try {
      final minLoadingTime = const Duration(milliseconds: 800);

      state = state.copyWith(isLoading: true, error: null);
      final DateTime start = DateTime.now();

      final repository = ref.read(authRepositoryImplProvider);
      final response = await repository.getAuth();

      final elapsed = DateTime.now().difference(start);

      if (elapsed < minLoadingTime) {
        await Future.delayed(minLoadingTime - elapsed);
      }

      state = state.copyWith(
        isLoading: false,
        statusCode: response.statusCode,
        message: response.message,
        userAuth: response.data,
      );
    } on ErrorEntity catch (e, st) {
      debugPrint("ERROR: $e");
      debugPrint("Error details $st");
      state = state.copyWith(
        error: ErrorEntity(
          statusCode: e.statusCode,
          message: e.message,
          details: e.details,
        ),
      );
    }
  }
}
