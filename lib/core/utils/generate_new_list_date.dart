({List<Map<DateTime, bool>> completeDays, int durationIndays}) generateNewListWithAllDates(
    List<Map<DateTime, bool>> loggedDates,
    ) {
  // Get first and last logged date
  DateTime firstDate = loggedDates.first.keys.first;
  DateTime lastDate = loggedDates.last.keys.first;

  // Calculate the duration
  int durationDays = lastDate.difference(firstDate).inDays + 1;
  print("Duration from first to last day: $durationDays days");

  // Generate a new list with all dates included
  List<Map<DateTime, bool>> completeDates = [];
  for (int i = 0; i < durationDays; i++) {
    DateTime currentDate = firstDate.add(Duration(days: i));

    // Check if this date exists in the original list
    bool isLogged = loggedDates.any((map) => map.containsKey(currentDate));

    completeDates.add({currentDate: isLogged});
  }
  return (completeDays: completeDates, durationIndays: durationDays);
}