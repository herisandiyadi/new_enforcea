import 'package:flutter/material.dart';
import 'package:new_ukm_desk/constants/theme.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AlertLogin {
  Future<bool> onCheckLogin(BuildContext context) async {
    await Alert(
        context: context,
        title: 'Maaf',
        desc: 'Silahkan login terlebih dahulu',
        buttons: [
          DialogButton(
              color: redColor,
              child: const Text(
                'OK',
                style: TextStyle(color: whiteColor),
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/signin', (route) => false);
              }),
        ]).show();
    return false;
  }

  void onCenterAlert(BuildContext context, bool title, String message) async {
    if (!title) {
      await Alert(context: context, title: ' ', desc: message, buttons: [
        DialogButton(
            color: redColor,
            child: const Text(
              'OK',
              style: TextStyle(color: whiteColor),
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ]).show();
    } else {
      await Alert(context: context, desc: message, buttons: [
        DialogButton(
            color: redColor,
            child: const Text(
              'OK',
              style: TextStyle(color: whiteColor),
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/signin', (route) => false);
            }),
      ]).show();
    }
  }
}
