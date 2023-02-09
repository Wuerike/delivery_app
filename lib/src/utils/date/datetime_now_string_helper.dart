class DateTimeNowStringHelper {
  static String getDate() {
    var startDate = DateTime.now();

    return "${startDate.toLocal().day}/${startDate.toLocal().month}/${startDate.toLocal().year}";
  }
}
