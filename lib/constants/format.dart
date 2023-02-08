import 'package:intl/intl.dart';

String formatValue(int value) {
  final format =
      NumberFormat.currency(locale: 'ID', symbol: 'Rp ', decimalDigits: 0);
  return format.format(value).toString();
}
