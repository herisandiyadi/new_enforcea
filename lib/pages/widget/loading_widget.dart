import 'package:flutter/material.dart';
import 'package:new_ukm_desk/constants/theme.dart';
import 'package:new_ukm_desk/pages/widget/loading_utils.dart';

class LoadingWidget {
  BuildContext context;
  LoadingWidget(this.context);
  Future<dynamic> loadingUtils(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
                width: 60,
                height: 60,
                color: transparentColor,
                child: const LoadingIndicate()),
          );
        });
  }

  void loading(bool isOn) {
    if (isOn) {
      loadingUtils(context);
    } else {
      Navigator.pop(context);
    }
  }
}
