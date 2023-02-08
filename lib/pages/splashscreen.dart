import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_ukm_desk/constants/cache_utils.dart';
import 'package:new_ukm_desk/constants/constants.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  Future<Timer> splashScreenStart() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      CacheUtil.getBoolean(cacheIsLogin)
          .then((value) => navigationToSignin(value ?? false));
    });
  }

  void navigationToSignin(bool isLogin) {
    if (isLogin) {
      Navigator.pushNamedAndRemoveUntil(context, '/homepage', (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, '/signin', (route) => false);
    }
  }

  @override
  void initState() {
    splashScreenStart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[800],
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(
            height: 170,
          ),
          const Image(
              width: 200, height: 200, image: AssetImage("assets/enforce.png")),
          const SizedBox(
            height: 170,
          ),
          const Text(
            "Versi 2.1.1",
            style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
          ),
        ],
      )),
    );
  }
}
