import 'package:intl/intl.dart';

class TimeUtils {
  String getFormattedTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  String getFormattedDate(DateTime dateTime) {
    return DateFormat('dd.MM.yyyy').format(dateTime);
  }

  String getTurkishDayName(int weekday) {
    switch (weekday) {
      case 1:
        return "Pzt";
      case 2:
        return "Sal";
      case 3:
        return "Çar";
      case 4:
        return "Per";
      case 5:
        return "Cum";
      case 6:
        return "Cmt";
      case 7:
        return "Paz";
      default:
        return "";
    }
  }

  String getTurkishMonthName(int month) {
    switch (month) {
      case 1:
        return "Ocak";
      case 2:
        return "Şubat";
      case 3:
        return "Mart";
      case 4:
        return "Nisan";
      case 5:
        return "Mayıs";
      case 6:
        return "Haziran";
      case 7:
        return "Temmuz";
      case 8:
        return "Ağustos";
      case 9:
        return "Eylül";
      case 10:
        return "Ekim";
      case 11:
        return "Kasım";
      case 12:
        return "Aralık";
      default:
        return "";
    }
  }
}
