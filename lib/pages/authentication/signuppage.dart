import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_ukm_desk/constants/card_number_input.dart';
import 'package:new_ukm_desk/constants/theme.dart';
import 'package:new_ukm_desk/cubit/auth/auth_cubit.dart';
import 'package:new_ukm_desk/pages/widget/alert_flash.dart';
import 'package:new_ukm_desk/pages/widget/alert_on_back.dart';
import 'package:new_ukm_desk/pages/widget/button_widget.dart';
import 'package:new_ukm_desk/services/data_model/auth/register_request.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController companyController = TextEditingController();
  TextEditingController npwpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  final emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  @override
  Widget build(BuildContext context) {
    AlertFlash alertFlash = AlertFlash(context);
    AlertOnBack alertOnBack = AlertOnBack();
    return Scaffold(
      backgroundColor: redColor,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegistLoading) {
            const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RegisFailed) {
            alertFlash.showTopFlash(message: state.message);
          } else if (state is RegisLoaded) {
            alertOnBack.onCenterAlert(context, state.registerResponse.success,
                state.registerResponse.message);
          }
        },
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              child: const Image(
                  width: 150,
                  height: 120,
                  image: AssetImage("assets/enforce.png")),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 24),
              child: Text("Register".toUpperCase(),
                  style:
                      whiteTextStyle.copyWith(fontSize: 15, fontWeight: bold)),
            ),
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                color: whiteColor,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "input your company name";
                          }
                          return null;
                        },
                        controller: companyController,
                        decoration: const InputDecoration(
                          labelText: 'Company Name',
                          prefixIcon: Icon(Icons.account_balance),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "input your company Address";
                          }
                          return null;
                        },
                        controller: addressController,
                        decoration: const InputDecoration(
                          labelText: 'Company Address',
                          prefixIcon: Icon(Icons.map),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                        ),
                      ),
                      TextFormField(
                        controller: npwpController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(15),
                          CardNumberInputFormatter()
                        ],
                        decoration: const InputDecoration(
                          labelText: 'NPWP',
                          prefixIcon: Icon(Icons.credit_card),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                        ),
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (!RegExp(emailRegex).hasMatch(value!)) {
                            return "Email not valid";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                        ),
                      ),
                      TextFormField(
                        controller: phoneNumberController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          prefixIcon: Icon(Icons.phone_android),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                        ),
                      ),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !isPasswordVisible,
                        validator: (value) {
                          if (value!.length < 8) {
                            return 'Password at least 8 characters';
                          }
                          return null;
                        },
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
                      TextFormField(
                        controller: confirmPasswordController,
                        validator: (value) {
                          if (!(value!.compareTo(passwordController.text) ==
                              0)) {
                            return 'Password not match';
                          }
                          return null;
                        },
                        obscureText: !isConfirmPasswordVisible,
                        decoration: InputDecoration(
                          labelText: 'Retype Password',
                          //                      suffixIcon: setShowHideIcon(isConfirmPasswordVisible),
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: setShowHideIcon(
                            isConfirmPasswordVisible,
                            () {
                              setState(() {
                                isConfirmPasswordVisible =
                                    !isConfirmPasswordVisible;
                              });
                            },
                          ),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ButtonWidget(
                          onPressed: () {
                            final regisBloc = context.read<AuthCubit>();
                            regisBloc.register(RegisterRequest(
                                namaPerusahan: companyController.text,
                                npwp: npwpController.text,
                                email: emailController.text,
                                phone: phoneNumberController.text,
                                alamat: addressController.text,
                                password: passwordController.text,
                                passwordConfirm: passwordController.text,
                                pic: "1"));
                          },
                          label: 'Sign Up',
                          colorButton: redColor),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
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
                    Navigator.pushNamed(context, '/signin');
                  },
                  child: Text(
                    ' Sign In',
                    style: blueTextStyle.copyWith(fontSize: 13),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
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
