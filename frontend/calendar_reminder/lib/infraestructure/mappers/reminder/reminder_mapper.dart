import 'package:calendar_reminder/domain/entities/entities.dart';
import 'package:calendar_reminder/infraestructure/mappers/reminder/additionals/tag_mapper.dart';
import 'package:calendar_reminder/infraestructure/models/models.dart';

class ReminderMapper {
  static ReminderEntity reminderToEntity(ReminderModelResponse modelResponse) =>
      ReminderEntity(
        id: modelResponse.id,
        user: modelResponse.user,
        reminder: modelResponse.reminder,
        description: modelResponse.description,
        dateInit: modelResponse.dateInit,
        dateEnd: modelResponse.dateEnd,
        tags: modelResponse.tags
            ?.map((tag) => TagMapper.tagToEntity(tag))
            .toList(),
        isNotified: modelResponse.isNotified,
        daily: modelResponse.daily,
      );
}
