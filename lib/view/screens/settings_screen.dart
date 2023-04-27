// ignore_for_file: deprecated_member_use

import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/setting/dark_mode_widget.dart';
import 'package:e_commerce/view/widgets/setting/language_widget.dart';
import 'package:e_commerce/view/widgets/setting/logout_widget.dart';
import 'package:e_commerce/view/widgets/setting/profile_widget.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ProfileWidget(),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey,
          ),
          const SizedBox(
            height: 20,
          ),
          TextUtils(
            text: "GENERAL".tr,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
          DarkModeWidget(),
          const SizedBox(
            height: 20,
          ),
          LanguageWidget(),
          LogOutWidget(),
        ],
      ),
    );
  }
}
