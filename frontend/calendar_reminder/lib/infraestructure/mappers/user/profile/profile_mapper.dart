import 'package:calendar_reminder/domain/entities/entities.dart';
import 'package:calendar_reminder/infraestructure/models/user/profile/profile_model_response.dart';

class ProfileMapper {
  static ProfileEntity toProfileEntity(ProfileModelResponse? modelResponse) =>
      ProfileEntity(
        id: modelResponse?.id != null && modelResponse?.id != " "
            ? modelResponse!.id
            : "Sin un id.",
        name: modelResponse?.name != null && modelResponse?.name != " "
            ? modelResponse!.name
            : "Sin nombre.",
        photo: modelResponse?.photo != null && modelResponse?.photo != " "
            ? modelResponse?.photo
            : "Sin fotografia.",
        active: modelResponse?.active,
        nameKeyUser:
            modelResponse?.nameKeyUser != null &&
                modelResponse?.nameKeyUser != " "
            ? modelResponse?.nameKeyUser
            : "Sin nombre clave.",
      );
}
