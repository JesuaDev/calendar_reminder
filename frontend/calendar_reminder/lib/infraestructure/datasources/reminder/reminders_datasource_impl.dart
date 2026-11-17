import 'package:calendar_reminder/core/api/response/response_api.dart';
import 'package:calendar_reminder/domain/datasources/reminders/reminders_datasource.dart';
import 'package:calendar_reminder/helpers/handling/error_handling.dart';
import 'package:calendar_reminder/infraestructure/models/models.dart';
import 'package:dio/dio.dart';

class RemindersDatasourceImpl implements RemindersDatasource {
  final Dio dio;

  RemindersDatasourceImpl({required this.dio});

  @override
  Future<ResponseApi<List<ReminderModelResponse>>> todayReminders() async {
    try {
      final remindersResponse = await dio.get('/reminders/today');

      final body = remindersResponse.data;
      final List<Map<String, dynamic>> reminders = body["data"];

      final remindersModels = reminders
          .map((reminder) => ReminderModelResponse.fromJson(reminder))
          .toList();

      return ResponseApi(data: remindersModels);
    } on DioException catch (e) {
      throw ErrorHandling.mapDioException(e);
    } on TypeError catch (_) {
      throw ErrorHandling.typeError();
    } on FormatException catch (e) {
      throw ErrorHandling.typeError(details: e.message);
    }
  }
}
