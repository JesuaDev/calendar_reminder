class TagsReminderModelResponse {
  final String id;
  final String name;
  final String description;
  final String ilustration;
  final String color;

  TagsReminderModelResponse({
    required this.name,
    required this.description,
    required this.ilustration,
    required this.color,
    required this.id,
  });

  factory TagsReminderModelResponse.fromJson(Map<String, dynamic> json) =>
      TagsReminderModelResponse(
        id: json['_id'] ?? '',
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        ilustration: json["ilustration"] ?? '',
        color: json["color"] ?? '',
      );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "ilustration": ilustration,
    "color": color,
  };
}
