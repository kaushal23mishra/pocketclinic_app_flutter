import 'package:intl/intl.dart';

String formatDate(String dateString) {
  // Parse the date string
  DateTime date = DateTime.parse(dateString);

  // Get the current date
  DateTime currentDate = DateTime.now();

  // Calculate the difference in months
  int monthsDiff =
      (currentDate.year - date.year) * 12 + currentDate.month - date.month;

  // Construct the output string
  String output =
      '$monthsDiff months (${DateFormat("MMM dd, yyyy").format(date)} - ${DateFormat("MMM dd, yyyy").format(currentDate)})';

  return output;
}
