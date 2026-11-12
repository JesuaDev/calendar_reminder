import 'package:calendar_reminder/core/api/response/response_api.dart';
import 'package:calendar_reminder/infraestructure/dtos/user/login_dtos.dart';
import 'package:calendar_reminder/infraestructure/models/user/user_with_profile_model_reponse.dart';

abstract class LoginDatasource {
  Future<ResponseApi<UserWhitProfileModelResponse>> loginUser(LoginDtos dtos);
  Future<ResponseApi<UserWhitProfileModelResponse>> getAuth(); 
}
