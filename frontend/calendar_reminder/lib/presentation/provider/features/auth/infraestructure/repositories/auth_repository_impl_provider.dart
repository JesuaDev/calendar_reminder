import 'package:calendar_reminder/infraestructure/repositories/user/auth/auth_repository_impl.dart';
import 'package:calendar_reminder/presentation/provider/features/auth/infraestructure/datasources/auth_datasource_impl_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryImplProvider = Provider<AuthRepositoryImpl>((ref) {
  final datasource = ref.watch(authDatasourceImplProvider);
  return AuthRepositoryImpl(datasource: datasource);
});
