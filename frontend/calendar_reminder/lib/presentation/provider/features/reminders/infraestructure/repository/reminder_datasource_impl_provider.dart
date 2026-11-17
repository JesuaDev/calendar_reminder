import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:calendar_reminder/infraestructure/datasources/reminder/reminders_datasource_impl.dart';
import 'package:calendar_reminder/presentation/provider/config/network/dio/dio_provider.dart';

final reminderDatasourceImplProvider = Provider<RemindersDatasourceImpl>((ref) {
  final Dio dio = ref.watch(dioProvider);
  return RemindersDatasourceImpl(dio: dio);
});
