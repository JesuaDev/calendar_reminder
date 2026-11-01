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
      debugPrint("Entro aqui en login ${dtos.toJson()}");
      final response = await dio.post("/login", data: dtos.toJson());

      final body = response.data;
      final tokens = body["tokens"];

      debugPrint("este es el body $body");

      debugPrint("Este es el body data ${body["data"]}");

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
      debugPrint(
        "DIO: ${e.type} | status: ${e.response?.statusCode} | ${e.message}",
      );
      debugPrint("DIO DATA: ${e.response?.data}");
      throw ErrorHandling.mapDioException(e);
    } on TypeError catch (e, st) {
      debugPrint("TYPE ERROR: $e");
      debugPrint("$st");
      throw ErrorHandling.typeError();
    } on FormatException catch (e) {
      debugPrint("FORMAT: ${e.message}");
      throw ErrorHandling.typeError(details: e.message);
    }
  }
}
