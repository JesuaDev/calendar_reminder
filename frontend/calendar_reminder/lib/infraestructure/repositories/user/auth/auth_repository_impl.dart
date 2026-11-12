import 'package:calendar_reminder/core/api/response/response_api.dart';
import 'package:calendar_reminder/domain/datasources/user/auth/login_datasource.dart';
import 'package:calendar_reminder/infraestructure/dtos/user/login_dtos.dart';

import 'package:calendar_reminder/domain/entities/user/user_with_profile_entity.dart';
import 'package:calendar_reminder/domain/repositories/user/auth/login_repository.dart';
import 'package:calendar_reminder/infraestructure/mappers/user/user_with_profile_mapper.dart';

class AuthRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;

  AuthRepositoryImpl({required this.datasource});

  @override
  Future<ResponseApi<UserWithProfileEntity>> loginUser(LoginDtos dtos) async {
    final response = await datasource.loginUser(dtos);
    return response.map(UserWithProfileMapper.toUserWithProfileEntity);
  }

  @override
  Future<ResponseApi<UserWithProfileEntity>> getAuth() async {
    final response = await datasource.getAuth();
    return response.map(UserWithProfileMapper.toUserWithProfileEntity);
  }
}
