import 'package:flutter/material.dart';

import 'package:new_ukm_desk/constants/theme.dart';
import 'package:new_ukm_desk/cubit/auth/auth_cubit.dart';
import 'package:new_ukm_desk/pages/widget/alert_flash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_ukm_desk/pages/widget/loading_utils.dart';
import 'package:new_ukm_desk/pages/widget/loading_widget.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController resetController = TextEditingController();
  TextEditingController passwordController =
      TextEditingController(); //Change end gradient color here
  bool isPasswordVisible = false;
  // final LocalAuthentication auth = LocalAuthentication();
  @override
  void initState() {
    // _auth();
    super.initState();
  }

  // void _auth() async {
  //   List<BiometricType> availableBiometrics =
  //       await auth.getAvailableBiometrics();

  //   if (Platform.isIOS) {
  //     if (availableBiometrics.contains(BiometricType.face)) {
  //       print("Face");
  //       _startBioMetricAuth("Gunakan Face ID untuk melakukan autentikasi.");
  //     } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
  //       print("Finger");
  //       _startBioMetricAuth("Gunakan Touch ID untuk melakukan autentikasi.");
  //     }
  //   } else {
  //     _startBioMetricAuth("Gunakan Fingerprint untuk melakukan autentikasi.");
  //   }
  // }

  // void _startBioMetricAuth(String message) async {
  //   try {
  //     bool didAuthenticate = await auth.authenticate(
  //         localizedReason: message,
  //         options: const AuthenticationOptions(biometricOnly: true));
  //     // await auth.authenticateWithBiometrics(localizedReason: message);

  //     if (didAuthenticate) {
  //       final loginCubit = context.read<AuthCubit>();
  //       loginCubit.login('herisandiyadi88@gmail.com', '12345678');
  //     } else {
  //       null;
  //     }
  //   } on PlatformException catch (e) {
  //     e.toString();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    AlertFlash alertFlash = AlertFlash(context);
    LoadingWidget loading = LoadingWidget(context);
    return Scaffold(
      backgroundColor: redColor,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            loading.loading(true);
          } else if (state is AuthFailed) {
            loading.loading(false);
            alertFlash.showTopFlash(message: state.message);
          } else if (state is AuthLoaded) {
            loading.loading(true);
            loading.loading(false);
            Navigator.pushNamedAndRemoveUntil(
                context, '/homepage', (route) => false);
          }
        },
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5),
                    child: const Image(
                        width: 200,
                        height: 200,
                        image: AssetImage("assets/enforce.png")),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "Sign in".toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                            child: TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                labelText: 'Email Address',
                                prefixIcon: Icon(Icons.person_outline),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                            child: TextField(
                              controller: passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: !isPasswordVisible,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                suffixIcon: setShowHideIcon(
                                  isPasswordVisible,
                                  () {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                  },
                                ),
                                prefixIcon: const Icon(Icons.lock_outline),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                              ),
                            ),
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const SizedBox(),
                              ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.25,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          child: Column(
                                            children: [
                                              const Text('Reset Password'),
                                              TextFormField(
                                                controller: resetController,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'masukkan email anda';
                                                  }
                                                  return null;
                                                },
                                                autovalidateMode:
                                                    AutovalidateMode.always,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      darkTextStyle.copyWith(
                                                    fontSize: 12,
                                                    fontWeight: bold,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(redColor)),
                                                child:
                                                    const Text('Send to Email'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(redColor),
                                ),
                                child: const Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      // ButtonWidget(
                      //     onPressed: () {
                      // final loginCubit = context.read<AuthCubit>();
                      // loginCubit.login(
                      //     emailController.text, passwordController.text);
                      //     },
                      //     label: 'Sign In',
                      //     colorButton: redColor),
                      Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width * 0.7,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          onPressed: () {
                            final loginCubit = context.read<AuthCubit>();
                            loginCubit.login(
                                emailController.text, passwordController.text);
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side:
                                          const BorderSide(color: whiteColor))),
                              elevation: MaterialStateProperty.all(5),
                              backgroundColor:
                                  MaterialStateProperty.all(redColor)),
                          child: const Text('Sign In',
                              style: TextStyle(fontSize: 14)),
                        ),
                      ),
                      // ElevatedButton(
                      //   onPressed: _auth,
                      //   style: ButtonStyle(
                      //       shape: MaterialStateProperty.all(
                      //           RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(18.0),
                      //               side: const BorderSide(color: whiteColor))),
                      //       elevation: MaterialStateProperty.all(5),
                      //       backgroundColor:
                      //           MaterialStateProperty.all(yellowColor)),
                      //   child: const Icon(
                      //     Icons.fingerprint,
                      //     color: whiteColor,
                      //   ),
                      // ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Does not have account?',
                        style: TextStyle(color: whiteColor),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text(
                          ' Sign Up',
                          style: blueTextStyle.copyWith(fontSize: 13),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

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

  IconButton setShowHideIcon(bool isVisible, Function()? onPressed) {
    IconData icon;
    if (isVisible) {
      icon = Icons.visibility;
    } else {
      icon = Icons.visibility_off;
    }
    return IconButton(onPressed: onPressed, icon: Icon(icon));
  }
}
