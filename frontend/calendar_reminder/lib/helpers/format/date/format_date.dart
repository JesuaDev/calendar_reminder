import 'package:intl/intl.dart';

class FormatDate {
  static String formatDay() {
    final DateTime now = DateTime.now();
    return DateFormat('EEEE', 'es').format(now);
  }

  static String formatHour() {
    final DateTime now = DateTime.now();
    final String hour = DateFormat("HH").format(now);
    final String minutes = DateFormat("mm").format(now);

    return "$hour.$minutes";
  }

  static String formatMonth() {
    final DateTime now = DateTime.now();
    return DateFormat("MMM", 'es').format(now);
  }
}
