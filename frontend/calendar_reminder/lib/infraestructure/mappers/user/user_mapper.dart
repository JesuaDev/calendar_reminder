import 'package:calendar_reminder/domain/entities/entities.dart';
import 'package:calendar_reminder/infraestructure/models/user/user_model_reponse.dart';

class UserMapper {
  static UserEntity toUserEntity(UserModelResponde modelResponse) =>
      UserEntity(id: modelResponse.id, email: modelResponse.email);
}
