import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String toFormattedString({
    String pattern = "dd MMMM yyyy, HH:mm",
  }) {
    return DateFormat(pattern).format(this);
  }
}
