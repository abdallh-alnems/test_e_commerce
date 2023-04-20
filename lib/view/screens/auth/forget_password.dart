// ignore_for_file: deprecated_member_use

import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/utils/my_strings.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/auth/auth_button.dart';
import 'package:e_commerce/view/widgets/auth/auth_text_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          title: Text(
            "Forget Password",
            style: TextStyle(color: Get.isDarkMode ? pinkClr : mainColor),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? Colors.black : Colors.white,
            ),
          ),
        ),
          backgroundColor: context.theme.backgroundColor,
        body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "if you want to recover your account , then please provider your email ID below",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      'assets/images/forgetpass copy.png',
                      width: 250,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    AuthTextFormFiled(
                      controller: emailController,
                      obscureText: false,
                      validator: (value) {
                        if (!RegExp(validationEmail).hasMatch(value)) {
                          return "invalid email";
                        } else {
                          return null;
                        }
                      },
                      prefixIcon: Get.isDarkMode
                          ? 
                           Icon(
                              Icons.email,
                              color: pinkClr,
                              size: 30,
                            ) : Image.asset('assets/images/email.png'),
                      suffixIcon: const Text(""),
                      hintText: "Email",
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GetBuilder<AuthController>(builder: (_) {
                      return AuthButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            String email = emailController.text.trim();
                            controller
                                .resetPassword(email);
                          }
                        },
                        text: "SEND",
                      );
                    })
                  ],
                ),
              ),
            )),
      ),
    );
  }
}