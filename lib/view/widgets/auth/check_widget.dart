import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GetBuilder<AuthController>(
          builder: (_) => InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: controller.isCheckBox ? Get.isDarkMode
                  ?
                const   Icon(
                      Icons.done,
                      color: pinkClr,
                      size: 30,
                    ) : Image.asset("assets/images/check.png")
                    : Container(),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Row(
          children: [
            TextUtils(
                text: "I accept ",
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Get.isDarkMode ? Colors.white : Colors.black) ,                
            TextUtils(
              text: "terms & conditions",
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              underLine: TextDecoration.underline,
            ),
          ],
        )
      ],
    );
  }
}