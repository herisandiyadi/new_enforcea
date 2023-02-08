import 'package:flutter/material.dart';
import 'package:new_ukm_desk/constants/theme.dart';

class ReportCardItem extends StatelessWidget {
  final String label;
  final String fileName;
  final Function()? onPressed;
  const ReportCardItem(
      {super.key, required this.fileName, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: darkTextStyle.copyWith(
                            fontSize: 18, fontWeight: bold),
                      ),
                      Text(
                        fileName,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: greyTextStyle,
                      )
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
