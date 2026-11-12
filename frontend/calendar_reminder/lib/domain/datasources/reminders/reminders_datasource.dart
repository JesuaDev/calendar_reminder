import 'package:calendar_reminder/core/api/response/response_api.dart';
import 'package:calendar_reminder/infraestructure/models/models.dart';

abstract class RemindersDatasource {
  Future<ResponseApi<TagsReminderModelResponse>> todayReminders();
}
