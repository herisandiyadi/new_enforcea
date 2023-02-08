import 'package:flutter/material.dart';
import 'package:new_ukm_desk/constants/theme.dart';

class RowMenuItems extends StatelessWidget {
  final Function()? onPressed;
  final IconData? icon;
  final String label;
  const RowMenuItems({
    this.icon,
    required this.label,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        child: SizedBox(
          height: 120,
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: redColor),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    icon,
                    color: whiteColor,
                    size: 36,
                  ),
                ),
              ),
              Text(
                label,
                style: darkTextStyle.copyWith(fontSize: 14, fontWeight: bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
