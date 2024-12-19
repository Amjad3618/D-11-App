import 'package:d_11_genrator_app/Widgets/text_form_feilds.dart';
import 'package:d_11_genrator_app/Widgets/text_widget.dart';
import 'package:d_11_genrator_app/bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'singup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailctrl = TextEditingController();
  final _passwrodctlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Logins",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomTextWidget(
                  text: "Welcome back",
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomTextWidget(
                  text: "login with email and password",
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      CustomTextFormField(
                          controller: _emailctrl, hintText: "Email"),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                          controller: _passwrodctlr, hintText: "Password")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomTextWidget(
                      text: "Dont have on account",
                      color: Colors.black,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => const SignupScreen());
                        },
                        child: const Text("SingUp"))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(()=>const BottomBar());
                        },
                        child: const CustomTextWidget(
                          text: "Login",
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        )))
              ],
            ),
          ),
        ));
  }
}
