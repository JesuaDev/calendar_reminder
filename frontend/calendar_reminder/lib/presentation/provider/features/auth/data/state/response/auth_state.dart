import 'package:calendar_reminder/core/api/response/error_response.dart';
import 'package:calendar_reminder/domain/entities/user/user_with_profile_entity.dart';

class AuthState {
  final bool? isLoading;
  final String? message;
  final int? statusCode;
  final ErrorEntity? error;
  final UserWithProfileEntity? userAuth;

  AuthState({
    this.isLoading = false,
    this.message = " ",
    this.statusCode,
    this.error,
    this.userAuth,
  });

  AuthState copyWith({
    bool? isLoading = false,
    String? message,
    int? statusCode,
    ErrorEntity? error,
    UserWithProfileEntity? userAuth,
  }) => AuthState(
    isLoading: isLoading ?? this.isLoading,
    message: message ?? this.message,
    statusCode: statusCode ?? this.statusCode,
    error: error ?? this.error,
    userAuth: userAuth ?? this.userAuth,
  );
}
