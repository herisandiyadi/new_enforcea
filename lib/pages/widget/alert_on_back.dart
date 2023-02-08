import 'package:flutter/material.dart';
import 'package:new_ukm_desk/constants/cache_utils.dart';
import 'package:new_ukm_desk/constants/theme.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AlertOnBack {
  Future<bool> onBackPressed(BuildContext context) async {
    await Alert(
        context: context,
        title: 'Confirmation',
        desc: 'Anda yakin ingin keluar?',
        buttons: [
          DialogButton(
              color: redColor,
              child: const Text(
                'Yes',
                style: TextStyle(color: whiteColor),
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/signin', (route) => false);
                CacheUtil.clear();
              }),
          DialogButton(
              color: redColor,
              child: const Text(
                'No',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
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
