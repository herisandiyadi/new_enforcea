import 'package:flutter/material.dart';
import 'package:new_ukm_desk/constants/theme.dart';

class CardExpertise extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  const CardExpertise({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Card(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height * 0.085,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      label,
                      style: darkTextStyle.copyWith(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
