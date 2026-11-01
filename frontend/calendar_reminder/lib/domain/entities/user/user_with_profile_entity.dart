import 'package:calendar_reminder/domain/entities/entities.dart';

class UserWithProfileEntity {
  final String id;
  final String email;
  final ProfileEntity profile;

  UserWithProfileEntity({
    required this.profile,
    required this.id,
    required this.email,
  });
}
