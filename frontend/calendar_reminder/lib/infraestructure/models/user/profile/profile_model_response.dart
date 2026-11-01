class ProfileModelResponse {
  final String? id;
  final String? name;
  final String? nameKeyUser;
  final String? photo;
  final bool? active;

  ProfileModelResponse({
    required this.id,
    required this.name,
    required this.nameKeyUser,
    required this.photo,
    required this.active,
  });

  factory ProfileModelResponse.fromJson(Map<String, dynamic> json) =>
      ProfileModelResponse(
        id: json["_id"] ?? " ",
        name: json["name"] ?? " ",
        nameKeyUser: json["nameKeyUser"] ?? " ",
        photo: json["photo"] ?? " ",
        active: json["active"] ?? false,
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "nameKeyUser": nameKeyUser,
    "photo": photo,
    "active": active,
  };
}
