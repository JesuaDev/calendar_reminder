import 'package:calendar_reminder/core/api/response/error_response.dart';
import 'package:calendar_reminder/domain/entities/entities.dart';

class ReminderState {
  final bool? isLoading;
  final int? statusCode;
  final String? message;
  final ErrorEntity? error;
  final List<ReminderEntity>? todaysReminders;

  ReminderState({
    this.isLoading = false,
    this.statusCode,
    this.message = " ",
    this.error,
    this.todaysReminders = const [],
  });

  ReminderState copyWith({
    bool? isLoading = false,
    String? message,
    int? statusCode,
    ErrorEntity? error,
    List<ReminderEntity>? todaysReminder,
  }) => ReminderState(
    isLoading: isLoading ?? this.isLoading,
    message: message ?? this.message,
    statusCode: statusCode ?? this.statusCode,
    error: error ?? this.error,
    todaysReminders: todaysReminder ?? todaysReminders,
  );
}
