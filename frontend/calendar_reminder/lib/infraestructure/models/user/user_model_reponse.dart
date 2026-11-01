class UserModelResponde {
  final String id;
  final String email;

  UserModelResponde({required this.id, required this.email});

  factory UserModelResponde.fromJson(Map<String, dynamic> json) =>
      UserModelResponde(id: json["_id"] ?? " ", email: json["email"] ?? " ");

  Map<String, dynamic> toJson() => {"_id": id, "email": email};
}
