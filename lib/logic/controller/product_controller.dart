import 'package:e_commerce/models/product_models.dart';
import 'package:e_commerce/services/product_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  RxList<ProductModels> productList = <ProductModels>[].obs;
  RxList<ProductModels> favourtesList = <ProductModels>[].obs;
  RxBool isLoading = true.obs;
  GetStorage storage = GetStorage();
RxList<ProductModels> searchList = <ProductModels>[].obs;
TextEditingController searchTextController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    List? storedShoppings = storage.read<List>('isFavourtesList');

    if (storedShoppings != null) {
      favourtesList =
          storedShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts() async {
    List<ProductModels> products = await ProductServices.getProduct();

    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

// logic for favourites screen
  void mangeFavourites(int productId) async {
    var exitingIndex = favourtesList.indexWhere(
      (element) => element.id == productId,
    );

    if (exitingIndex >= 0) {
      favourtesList.removeAt(exitingIndex);
      await storage.remove('isFavourtesList');
    } else {
      favourtesList
          .add(productList.firstWhere((element) => element.id == productId));
      await storage.write("isFavourtesList", favourtesList);
    }
  }

  bool isFavourtes(int productId) {
    return favourtesList.any((element) => element.id == productId);
  }


void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();

    searchList.value = productList.where((search) {
      String  searchTitle = search.title.toLowerCase();
      String  searchPrice = search.price.toString().toLowerCase();

      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();

    update();
  }


 void clearSearch() {
    searchTextController.clear();
    addSearchToList("");
  }

}
