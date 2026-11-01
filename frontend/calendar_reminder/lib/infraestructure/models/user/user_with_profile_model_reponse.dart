import 'package:calendar_reminder/infraestructure/models/user/profile/profile_model_response.dart';

class UserWhitProfileModelResponse {
  final String id;
  final String email;
  final ProfileModelResponse? profile;

  UserWhitProfileModelResponse({
    required this.id,
    required this.email,
    this.profile,
  });

  factory UserWhitProfileModelResponse.fromJson(Map<String, dynamic> json) =>
      UserWhitProfileModelResponse(
        id: json["_id"] ?? ' ',
        email: json["email"] ?? ' ',
        profile: ProfileModelResponse.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "profile": profile?.toJson(),
  };
}
