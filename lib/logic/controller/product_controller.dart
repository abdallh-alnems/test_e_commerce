import 'package:e_commerce/models/product_models.dart';
import 'package:e_commerce/services/product_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<ProductModels> productList = <ProductModels>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
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
}
