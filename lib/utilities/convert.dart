import 'package:timeago/timeago.dart' as timeago;

String convertDateAgo(int dateUnix) {
  final dateConvert = DateTime.parse(
      DateTime.fromMillisecondsSinceEpoch(dateUnix * 1000).toUtc().toString());

  final dateAgo = timeago.format(dateConvert);
  return dateAgo;
}

String cutUrl(String dateText) {
  if (dateText != 'null') {
    const start = "://";
    const end = "/";
    final startIndex = dateText.indexOf(start);
    final endIndex = dateText.indexOf(end, startIndex + start.length);
    if (endIndex < 0) {
      String finaltext = dateText.substring(startIndex + start.length);
      return finaltext;
    } else {
      String finaltext =
          dateText.substring(startIndex + start.length, endIndex);
      return finaltext;
    }
  } else {
    return '';
  }
}
