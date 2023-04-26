


// ignore_for_file: deprecated_member_use

import 'package:e_commerce/models/product_models.dart';
import 'package:e_commerce/view/widgets/productDetails/add_cart.dart';
import 'package:e_commerce/view/widgets/productDetails/clothes_info.dart';
import 'package:e_commerce/view/widgets/productDetails/image_sliders.dart';
import 'package:e_commerce/view/widgets/productDetails/size_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModels productModels;
  const ProductDetailsScreen({super.key, required this.productModels});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(
                imageUrl: productModels.image,
              ),
              ClothesInfo(
                title: productModels.title,
                productId: productModels.id,
                rate: productModels.rating.rate,
                description: productModels.description,
              ),
              const SizeList(),
              AddCart(
                price: productModels.price,
                productModels: productModels,
              ),
            ],
          ),
        ),
      ),
    );
  }
}