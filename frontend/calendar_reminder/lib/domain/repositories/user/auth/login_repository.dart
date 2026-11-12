import 'package:calendar_reminder/core/api/response/response_api.dart';
import 'package:calendar_reminder/domain/entities/user/user_with_profile_entity.dart';
import 'package:calendar_reminder/infraestructure/dtos/user/login_dtos.dart';

abstract class LoginRepository {
  Future<ResponseApi<UserWithProfileEntity>> loginUser(LoginDtos dtos);
  Future<ResponseApi<UserWithProfileEntity>> getAuth(); 
}
