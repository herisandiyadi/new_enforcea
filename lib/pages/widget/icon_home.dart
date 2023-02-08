import 'package:flutter/material.dart';
import 'package:new_ukm_desk/constants/theme.dart';

class IconHome extends StatelessWidget {
  final Function() onPressed;
  final String? image;
  final String? label;
  const IconHome(
      {Key? key,
      required this.image,
      required this.label,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          GestureDetector(
            onTap: onPressed,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: whiteColor,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: greyColor,
                        blurRadius: 3,
                        offset: Offset(0.0, 1.0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: SizedBox(
                      height: 23,
                      width: 23,
                      child: Image.asset(
                        image!,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                SizedBox(
                  width: 81,
                  height: 40,
                  child: Text(
                    label!,
                    style: darkTextStyle.copyWith(
                        fontSize: 12, fontWeight: regular),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
