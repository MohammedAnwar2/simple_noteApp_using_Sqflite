import 'package:intl/intl.dart';
class ConvertDate{
  static String convertTimeFromDateTimeToString(DateTime date) {
    String currentDate = DateFormat("MMM d h:mm a").format(date);
    return currentDate;
  }
  static DateTime convertTimeFromStringToDateTime(String timeString) {
    DateFormat format = DateFormat("MMM d h:mm a");
    return format.parse(timeString);
  }
}