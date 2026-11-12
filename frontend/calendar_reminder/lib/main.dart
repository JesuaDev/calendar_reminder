import 'package:calendar_reminder/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:calendar_reminder/helpers/router/go_router.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
 

void main() {
  initializeDateFormatting('es', null).then((_) {
    runApp(ProviderScope(child: const MainApp()));

  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.themeDark,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
