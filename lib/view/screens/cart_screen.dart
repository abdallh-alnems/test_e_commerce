// ignore_for_file: deprecated_member_use

import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/cart/cart_product_card.dart';
import 'package:e_commerce/view/widgets/cart/cart_total.dart';
import 'package:e_commerce/view/widgets/cart/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: const Text('Cart Items'),
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          actions: [
            IconButton(
                onPressed: () {
                  controller.clearAllProducts();
                },
                icon: const Icon(Icons.backspace))
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child:  SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Obx(
                () {
                  if (controller.productsMap.isEmpty) {
                    return const EmptyCart();
                  } else {
                    return Column(
                      children: [
                        SizedBox(
                          height: 450,
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return CartProductCard(
                                index: index,
                                productModels:
                                    controller.productsMap.keys.toList()[index],
                                quantity:
                                    controller.productsMap.values.toList()[index],
                              );
                            },
                            separatorBuilder: (context, index) => const SizedBox(
                              height: 20,
                            ),
                            itemCount: controller.productsMap.length,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: CartTotal(),
                        ),
                      ],
                    );
                  }
                },
              ),
          ),
        ),
      ),
    );
  }
}
