import 'package:calendar_reminder/domain/entities/user/user_with_profile_entity.dart';
import 'package:calendar_reminder/infraestructure/mappers/user/profile/profile_mapper.dart';
import 'package:calendar_reminder/infraestructure/models/user/user_with_profile_model_reponse.dart';

class UserWithProfileMapper {
  static UserWithProfileEntity toUserWithProfileEntity(
    UserWhitProfileModelResponse modelResponse,
  ) => UserWithProfileEntity(
    id: modelResponse.id != ' ' ? modelResponse.id : "Sin id.",
    email: modelResponse.email != ' ' ? modelResponse.email : "Sin correo.",
    profile: ProfileMapper.toProfileEntity(modelResponse.profile),
  );
}
