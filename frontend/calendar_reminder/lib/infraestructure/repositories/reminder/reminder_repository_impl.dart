import 'package:calendar_reminder/core/api/response/response_api.dart';
import 'package:calendar_reminder/domain/datasources/reminders/reminders_datasource.dart';
import 'package:calendar_reminder/domain/entities/reminder/reminder_entity.dart';
import 'package:calendar_reminder/domain/repositories/reminder/reminder_repository.dart';
import 'package:calendar_reminder/infraestructure/mappers/reminder/reminder_mapper.dart';

class ReminderRepositoryImpl implements ReminderRepository {
  final RemindersDatasource datasource;

  ReminderRepositoryImpl({required this.datasource});

  @override
  Future<ResponseApi<List<ReminderEntity>>> getTodayReminders() async {
    final response = await datasource.todayReminders();

    return response.mapList(
      (data) => data.map(ReminderMapper.reminderToEntity).toList(),
    );
  }
}
