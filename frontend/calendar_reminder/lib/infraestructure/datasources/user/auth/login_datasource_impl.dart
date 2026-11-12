import 'package:calendar_reminder/core/network/tokens_storage.dart';
import 'package:calendar_reminder/helpers/handling/error_handling.dart';
import 'package:dio/dio.dart';
import 'package:calendar_reminder/core/api/response/error_response.dart';
import 'package:calendar_reminder/core/api/response/response_api.dart';
import 'package:calendar_reminder/domain/datasources/user/auth/login_datasource.dart';
import 'package:calendar_reminder/infraestructure/dtos/user/login_dtos.dart';
import 'package:calendar_reminder/infraestructure/models/user/user_with_profile_model_reponse.dart';
import 'package:flutter/material.dart';

class LoginDatasourceImpl implements LoginDatasource {
  final Dio dio;

  LoginDatasourceImpl({required this.dio});

  @override
  Future<ResponseApi<UserWhitProfileModelResponse>> loginUser(
    LoginDtos dtos,
  ) async {
    try {
      final response = await dio.post("/login", data: dtos.toJson());

      final body = response.data;
      final tokens = body["tokens"];

      if (body == null) {
        throw ErrorEntity(
          message: "El servidor devolvió una respuesta vacia.",
          details: "Sin detalles.",
          statusCode: response.statusCode,
        );
      }

      TokensStorage().saveTokens(tokens["accessToken"], tokens["refreshToken"]);

      return ResponseApi(
        message: body["message"] as String? ?? "OK",
        statusCode: response.statusCode,
        data: UserWhitProfileModelResponse.fromJson(
          body["data"] as Map<String, dynamic>,
        ),
      );
    } on DioException catch (e) {
      throw ErrorHandling.mapDioException(e);
    } on TypeError catch (_) {
      throw ErrorHandling.typeError();
    } on FormatException catch (e) {
      debugPrint("FORMAT: ${e.message}");
      throw ErrorHandling.typeError(details: e.message);
    }
  }

  @override
  Future<ResponseApi<UserWhitProfileModelResponse>> getAuth() async {
    try {
      final response = await dio.get("/token");

      final body = response.data;

      if (body == null) {
        throw ErrorEntity(
          message: "El servidor devolvió una respuesta vacia.",
          details: "Sin detalles.",
          statusCode: response.statusCode,
        );
      }

      return ResponseApi(
        message: body["message"] as String? ?? "OK",
        statusCode: response.statusCode,
        data: UserWhitProfileModelResponse.fromJson(
          body["data"] as Map<String, dynamic>,
        ),
      );
    } on DioException catch (e) {
      throw ErrorHandling.mapDioException(e);
    } on TypeError catch (_) {
      throw ErrorHandling.typeError();
    } on FormatException catch (e) {
      debugPrint("FORMAT: ${e.message}");
      throw ErrorHandling.typeError(details: e.message);
    }
  }
}
