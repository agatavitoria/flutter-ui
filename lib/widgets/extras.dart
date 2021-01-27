class Extras {
  static monthToText(int month) {
    final months = [
      "Jan",
      "Fev",
      "Mar",
      "Abr",
      "Mai",
      "Jun",
      "Jul",
      "Ago",
      "Set",
      "Out",
      "Nov",
      "Dez"
    ];

    return months[month - 1];
  }

  static String fromNow(DateTime date) {
    final DateTime currentDate = DateTime.now();

    final mins = currentDate.difference(date).inMinutes;

    if (mins < 60) {
      return "Faz $mins min.";
    } else if (mins >= 60 && mins <= 60 * 23) {
      return "Faz ${(mins / 60).ceil()} min.";
    } else if (mins > 60 * 23 && mins < 60 * 24 * 4) {
      return "Faz ${(mins / (60 * 24)).ceil()} d.";
    } else {
      return "${date.day<10?'0':''}${date.day}/${monthToText(date.month)}/${date.year}";
    }
  }
}
