import 'package:calendar_reminder/infraestructure/models/models.dart';

class ReminderModelResponse {
  final String id;
  final String user;
  final String reminder;
  final String? description;
  final DateTime dateInit;
  final DateTime dateEnd;
  final List<TagsReminderModelResponse>? tags;

  ReminderModelResponse({
    required this.user,
    required this.reminder,
    required this.description,
    required this.dateInit,
    required this.dateEnd,
    required this.tags,
    required this.id,
  });

  factory ReminderModelResponse.fromJson(Map<String, dynamic> json) =>
      ReminderModelResponse(
        id: json['_id'] ?? '',
        user: json["user"] ?? '',
        reminder: json["reminder"] ?? 'not reminder',
        description: json["description"] ?? 'not description',
        dateInit: json["dateInit"] != null
            ? DateTime.parse(json["dateInit"])
            : DateTime.now(),
        dateEnd: json["dateEnd"] != null
            ? DateTime.parse(json["dateEnd"])
            : DateTime.now(),
        tags: json['tags'] != null
            ? json["tags"].map(
                (tag) => TagsReminderModelResponse.fromJson(json),
              )
            : 'not tags',
      );

  Map<String, dynamic> toJson() => {
    "user": user,
    "reminder": reminder,
    "description": description,
    "dateInit": dateInit,
    "dateEnd": dateEnd,
    "tags": List<dynamic>.from(tags!.map((x) => x.toJson())),
  };
}
