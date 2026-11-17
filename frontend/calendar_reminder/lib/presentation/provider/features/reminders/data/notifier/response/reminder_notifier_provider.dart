import 'package:calendar_reminder/core/api/response/error_response.dart';
import 'package:calendar_reminder/presentation/provider/features/reminders/infraestructure/datasource/reminder_repository_impl_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calendar_reminder/presentation/provider/features/reminders/data/state/response/reminder_state.dart';

final reminderNotiferProvider =
    NotifierProvider<ReminderNotifier, ReminderState>(ReminderNotifier.new);

class ReminderNotifier extends Notifier<ReminderState> {
  @override
  build() => throw UnimplementedError();

  Future<void> loadTodayReminders() async {
    try {
      final minLoadingTime = const Duration(milliseconds: 800);

      state = state.copyWith(isLoading: true, error: null);
      final DateTime start = DateTime.now();

      final repository = ref.read(reminderRepositoryImplProvider);
      final response = await repository.getTodayReminders();

      final elapsed = DateTime.now().difference(start);

      if (elapsed < minLoadingTime) {
        await Future.delayed(minLoadingTime - elapsed);
      }

      state = state.copyWith(
        isLoading: false,
        statusCode: response.statusCode,
        message: response.message,
        todaysReminder: response.data,
      );
    } on ErrorEntity catch (e) {
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
