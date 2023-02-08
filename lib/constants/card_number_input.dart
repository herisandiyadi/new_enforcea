import 'package:flutter/services.dart';

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      // if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
      //   buffer.write('  '); // Add double spaces.
      // }

      switch (nonZeroIndex) {
        case 2:
          buffer.write('.');
          break;
        case 5:
          buffer.write('.');
          break;
        case 8:
          buffer.write('.');
          break;
        case 9:
          buffer.write('-');
          break;
        case 12:
          buffer.write('.');
          break;
        default:
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
