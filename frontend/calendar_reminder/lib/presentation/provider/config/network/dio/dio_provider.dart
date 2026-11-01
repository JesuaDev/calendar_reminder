import 'package:calendar_reminder/core/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calendar_reminder/presentation/provider/config/network/dio/token_storage_provider.dart';

final dioProvider = Provider<Dio>((ref) {
  final storage = ref.watch(tokenStorageProvider);
  return DioClient(storage).dio;
});
