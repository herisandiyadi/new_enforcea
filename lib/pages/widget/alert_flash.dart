import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_ukm_desk/constants/theme.dart';

class AlertFlash {
  BuildContext context;
  AlertFlash(this.context);
  void showTopFlash({
    FlashBehavior style = FlashBehavior.fixed,
    String? message,
  }) {
    showFlash(
        context: context,
        duration: const Duration(seconds: 2),
        builder: (context, controller) {
          return Flash(
            controller: controller,
            backgroundColor: whiteColor,
            boxShadows: const [BoxShadow(blurRadius: 4)],
            behavior: style,
            position: FlashPosition.top,
            child: FlashBar(
              content: Text(
                message!,
                style: redTextSytle.copyWith(fontWeight: semiBold),
              ),
            ),
          );
        });
  }
}
