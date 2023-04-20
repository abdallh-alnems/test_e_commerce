// ignore_for_file: deprecated_member_use

import 'package:e_commerce/logic/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: TextButton(
            onPressed: () {
              ThemeController().changesTheme();
            },
            child: Text(
              "darkMode",
              style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black),
            )),
      ),
    );
  }
}
