void main(List<String> args) {

  /*
    DATE & TIME IN DART:
    DateTime is used to work with dates and time.

    Common Methods:
      DateTime.now()       -> Current date and time
      DateTime(year, ...)  -> Create a date
      DateTime.parse()     -> String to DateTime
      .add(Duration())     -> Add time
      .subtract(Duration()) -> Subtract time
      .difference()        -> Difference between dates

    Common Properties:
      .year, .month, .day
      .hour, .minute, .second
      .weekday             -> Monday = 1, Sunday = 7

    NOTE:
      DateTime is built into Dart.
      No import is required.
  */


  // 1. CURRENT DATE AND TIME:

  DateTime now = DateTime.now();

  print("Current Date & Time: $now");


  // 2. GET INDIVIDUAL DATE AND TIME VALUES:

  print("\nYear: ${now.year}");
  print("Month: ${now.month}");
  print("Day: ${now.day}");

  print("Hour: ${now.hour}");
  print("Minute: ${now.minute}");
  print("Second: ${now.second}");


  // 3. FORMAT DATE AS DD/MM/YYYY:
  // Example: 15/10/2026
  // Dart does not automatically format DateTime this way.
  // padLeft(2, '0') adds a leading zero when needed.

  String formattedDate =
      "${now.day.toString().padLeft(2, '0')}/"
      "${now.month.toString().padLeft(2, '0')}/"
      "${now.year}";

  print("\nFormatted Date: $formattedDate");


  // 4. FORMAT TIME AS HH:MM:SS:
  // Example: 09:05:07 (24-hour format)

  String formattedTime =
      "${now.hour.toString().padLeft(2, '0')}:"
      "${now.minute.toString().padLeft(2, '0')}:"
      "${now.second.toString().padLeft(2, '0')}";

  print("Formatted Time: $formattedTime");


  // 5. CREATE A CUSTOM DATE:

  DateTime birthday = DateTime(2005, 5, 14);

  print("\nBirthday: $birthday");
  print("Birthday Year: ${birthday.year}");


  // 6. CONVERT STRING TO DATETIME:
  // DateTime.parse() expects a supported date format.
  // Use YYYY-MM-DD, not DD/MM/YYYY.

  DateTime myDate = DateTime.parse("2026-10-14");

  print("\nParsed Date: $myDate");
  print("Parsed Day: ${myDate.day}");


  // 7. ADD AND SUBTRACT DAYS:

  DateTime tomorrow = now.add(Duration(days: 1));
  DateTime yesterday = now.subtract(Duration(days: 1));

  print("\nTomorrow: $tomorrow");
  print("Yesterday: $yesterday");


  // 8. ADD HOURS OR MINUTES:

  DateTime later = now.add(
    Duration(hours: 2, minutes: 30),
  );

  print("\nAfter 2 hours 30 minutes: $later");


  // 9. DIFFERENCE BETWEEN TWO DATES:

  DateTime date1 = DateTime(2026, 10, 14);
  DateTime date2 = DateTime(2026, 10, 20);

  Duration difference = date2.difference(date1);

  print("\nDifference in days: ${difference.inDays}");


  // 10. COMPARE TWO DATES:

  if (date1.isBefore(date2)) {
    print("\nDate1 is before Date2");
  }

  if (date2.isAfter(date1)) {
    print("Date2 is after Date1");
  }

  if (date1.isAtSameMomentAs(date2)) {
    print("Both dates represent the same moment");
  }

}
