import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.2),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                height: 60,
                width: 190,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5)),
                child: const Center(
                  child: TextUtils(
                    text: "welcome",
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  height: 60,
                  width: 230,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TextUtils(
                        text: "Dega",
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      TextUtils(
                        text: "shop",
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 250,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 40)),
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
                child: const TextUtils(
                    text: 'Get Start',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextUtils(
                      text: "Don't have an Account?",
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                  TextButton(
                      onPressed: () {
                        Get.offNamed(Routes.signUpScreen);
                      },
                      child: const TextUtils(
                        text: "Sign UP",
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        underLine: TextDecoration.underline,
                      ))
                ],
              )
            ],
          ),
        )
      ]),
    ));
  }
}