import 'package:calendar_reminder/domain/entities/entities.dart';
import 'package:calendar_reminder/infraestructure/models/models.dart';

class TagMapper {
  static TagEntity tagToEntity(TagsReminderModelResponse tagResponse) =>
      TagEntity(
        tagId: tagResponse.id,
        tagName: tagResponse.name,
        descriptionTag: tagResponse.description,
        tagilustration: tagResponse.ilustration,
        colorTag: tagResponse.color,
      );
}
