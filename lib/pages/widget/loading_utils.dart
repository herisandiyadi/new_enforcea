import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:new_ukm_desk/constants/theme.dart';

class LoadingIndicate extends StatelessWidget {
  const LoadingIndicate({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            LoadingIndicator(
              strokeWidth: 20,
              indicatorType: Indicator.ballRotateChase,
              colors: [redColor],
            ),
            SizedBox(
              width: 16,
            ),
            Text('Please wait...'),
          ],
        ),
      ),
    );
  }
}
