import 'package:calendar_reminder/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/${LoginScreen.namePage}',
      name: LoginScreen.namePage,
      builder: (context, state) => LoginScreen(),
    ),

    GoRoute(
      path: '/${HomeScreen.namePage}',
      name: HomeScreen.namePage,
      builder: (context, state) => HomeScreen(),
    ),
  ],
);
