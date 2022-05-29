import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class DateTimeOperations {
  static String getFormattedDateAndTime(DateTime dateTime) =>
      DateFormat('dd MMMM yyyy hh:mm a').format(dateTime);

  static String getFormattedDate(DateTime dateTime) =>
      DateFormat('dd MMMM yyyy').format(dateTime);

  static String getFormattedTime(DateTime dateTime) =>
      DateFormat('hh:mm a').format(dateTime);

  static String getFormattedTimeAgo(DateTime dateTime) =>
      timeago.format(dateTime);
}
