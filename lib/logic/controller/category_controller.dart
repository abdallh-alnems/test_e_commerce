import 'package:e_commerce/models/product_models.dart';
import 'package:e_commerce/services/category_services.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxList<String> categoryNameList = <String>[].obs;
  RxList<ProductModels> categoryList = <ProductModels>[].obs;

  RxBool isCategoryLoading = false.obs;
  RxBool isAllCategory = false.obs;

  List<String> imageCategory = [
    "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
    "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg",
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getCategory();
  }




  void getCategory() async {
    List<String> categoryName = await CategoryServices.getCategory();

    try {
      isCategoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  getAllCategory(String nameCategory) async {
    isAllCategory(true);
    categoryList.value =
        await AllCategoryServices.getAllCategory(nameCategory);

    isAllCategory(false);
  }


 getCategoryIndex(int index) async {
    dynamic  categoryAllName = await getAllCategory(categoryNameList[index]);

    if (categoryAllName != null) {
      categoryList.value = categoryAllName;
    }
  }

}
