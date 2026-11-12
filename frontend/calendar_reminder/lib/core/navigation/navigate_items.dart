import 'package:calendar_reminder/presentation/screens/screens.dart';
import 'package:hugeicons/hugeicons.dart';

class NavigateItems {
  final String path;
  final String namePage;
  final dynamic icon;

  NavigateItems({required this.path, required this.namePage, this.icon});

  static final listNavigations = [
    NavigateItems(
      path: '/${HomeScreen.namePage}',
      namePage: HomeScreen.namePage,
      icon: HugeIcons.strokeRoundedHouse01,
    ),
  ];
}
