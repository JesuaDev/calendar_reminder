import 'package:calendar_reminder/infraestructure/repositories/reminder/reminder_repository_impl.dart';
import 'package:calendar_reminder/presentation/provider/features/reminders/infraestructure/repository/reminder_datasource_impl_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reminderRepositoryImplProvider = Provider<ReminderRepositoryImpl>((ref) {
  final datasource = ref.watch(reminderDatasourceImplProvider);

  return ReminderRepositoryImpl(datasource: datasource);
});
