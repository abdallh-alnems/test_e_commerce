// ignore_for_file: deprecated_member_use

import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/logic/controller/theme_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  ThemeController().changesTheme();
                },
                child: Text(
                  "darkMode",
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                )),
            SizedBox(
              height: 20,
            ),
            GetBuilder<AuthController>(
              builder: (_) {
                return TextButton(
                    onPressed: () {
                      Get.defaultDialog(
                          title: "logout form app",
                          titleStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          middleText: "Are you sure you need to logout",
                          middleTextStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          backgroundColor: Colors.grey,
                          radius: 10,
                          textCancel: "NO",
                          cancelTextColor: Colors.white,
                          textConfirm: "YES",
                          confirmTextColor: Colors.white,
                          onCancel: () {
                            Get.back();
                          },
                          onConfirm: () {
                            controller.signOutFromApp();
                          },
                          buttonColor: Get.isDarkMode? pinkClr : mainColor
                          );

                      //   controller.signOutFromApp();
                    },
                    child: Text(
                      "LogOut",
                      style: TextStyle(
                          color: Get.isDarkMode ? Colors.white : Colors.black),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
