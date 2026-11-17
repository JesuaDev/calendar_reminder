import 'package:calendar_reminder/core/api/response/response_api.dart';
import 'package:calendar_reminder/domain/entities/entities.dart';

abstract class ReminderRepository {
  Future<ResponseApi<List<ReminderEntity>>> getTodayReminders();
}
