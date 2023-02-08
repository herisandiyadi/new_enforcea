import 'package:flutter/material.dart';
import 'package:new_ukm_desk/constants/theme.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final Color colorButton;
  const ButtonWidget(
      {super.key,
      required this.onPressed,
      required this.label,
      required this.colorButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 500,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: const BorderSide(color: whiteColor))),
            elevation: MaterialStateProperty.all(5),
            backgroundColor: MaterialStateProperty.all(colorButton)),
        child: Text(label.toUpperCase(), style: const TextStyle(fontSize: 14)),
      ),
    );
  }
}
