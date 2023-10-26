library utils;

import 'package:intl/intl.dart';

class NKDateUtils {
  static final DateFormat _apiDayFormat = DateFormat('yyyy-MM-dd');
  static final DateFormat _commonDayFormat = DateFormat('dd/MM/yyyy');


  static String apiDayFormat(DateTime d) => _apiDayFormat.format(d);

  static String commonDayFormat(DateTime d) => _commonDayFormat.format(d);

  static const DATE_FORMAT = 'dd/MM/yyyy';

  String formattedDate(DateTime dateTime) {
    print('dateTime ($dateTime)');
    return DateFormat(DATE_FORMAT).format(dateTime);
  }

  static DateTime formatStringDateTime(String date) {
    //FORMAT LIKE "Thursday 03 March 2022"
    return DateFormat("dd-MM-yyyy hh:mm:ss").parse(date);
  }

  static DateTime formatStringUTCDateTime(String date) {
    //FORMAT LIKE "Thursday 03 March 2022"
    print("datee>>>>>${date} :: ${DateTime.parse(date).toLocal()} ");
    return DateTime.parse(date).toLocal();
  }


  String getFormattedDate(String date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(date);

    /// outputFormat - convert into format you want to show.
    var outputFormat = DateFormat('dd/MM/yyyy');
    var outputDate = outputFormat.format(inputDate);

    return outputDate.toString();
  }
}
