import 'package:calendar_reminder/domain/entities/entities.dart';

class ReminderEntity {
  final String id;
  final String user;
  final String reminder;
  final String? description;
  final DateTime dateInit;
  final DateTime dateEnd;
  final List<TagEntity>? tags;

  ReminderEntity({
    required this.id,
    required this.user,
    required this.reminder,
    required this.description,
    required this.dateInit,
    required this.dateEnd,
    required this.tags,
  });
}
