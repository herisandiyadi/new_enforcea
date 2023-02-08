import 'package:flutter/material.dart';
import 'package:new_ukm_desk/constants/theme.dart';

class MoreItem extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final IconData icon;
  const MoreItem(
      {super.key,
      required this.label,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: softGreyColor, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: redColor,
                size: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(label),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
