import 'package:flutter/material.dart';
import 'package:new_ukm_desk/constants/theme.dart';

class ContentWidget extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const ContentWidget({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Tax Flash',
                        style: darkTextStyle.copyWith(
                            fontSize: 18, fontWeight: bold),
                      ),
                      SizedBox(
                        width: 290,
                        child: Text(
                          title,
                          style: blueTextStyle.copyWith(fontSize: 11),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
