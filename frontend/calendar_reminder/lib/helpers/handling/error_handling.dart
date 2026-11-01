import 'package:calendar_reminder/core/api/response/error_response.dart';
import 'package:dio/dio.dart';

class ErrorHandling {
  static ErrorEntity mapDioException(DioException e) {
    final data = e.response?.data;

    final map = data is Map<String, dynamic> ? data : null;

    return ErrorEntity(
      statusCode: e.response?.statusCode,
      message: map?['message'] as String? ?? _messageFromType(e.type),
      details: map?['details'] as String? ?? 'No hay detalles del error',
    );
  }

  static String _messageFromType(DioExceptionType type) {
    switch (type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Tiempo de espera agotado, intenta de nuevo.';
      case DioExceptionType.connectionError:
        return 'No hay conexión con el servidor.';
      case DioExceptionType.cancel:
        return 'La solicitud fue cancelada.';
      default:
        return 'Ocurrió un error inesperado.';
    }
  }

  static ErrorEntity typeError({String? message, String? details}) {
    return ErrorEntity(
      statusCode: null,
      message: message ?? "Respuesta del servidor con formato inválido.",
      details: details ?? "No hay detalles en este error.",
    );
  }
}
