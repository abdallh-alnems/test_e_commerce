import 'package:e_commerce/models/category_model.dart';
import 'package:e_commerce/models/product_models.dart';
import 'package:e_commerce/utils/my_strings.dart';
import 'package:http/http.dart' as http;

class CategoryServices {
static  Future<List<String>> getCategory() async {
    var response = await http.get(Uri.parse("$baseUrl/products/categories"));

    if (response.statusCode == 200) {
      String jsonData = response.body;
      return categoryModelFromJson(jsonData);
    } else {
      return throw Exception('failed to load product');
    }
  }
}



class AllCategoryServices {
static  Future<List<ProductModels>> getAllCategory(String categoryNames) async {
    var response = await http.get(Uri.parse("$baseUrl/products/category/$categoryNames"));

    if (response.statusCode == 200) {
      String jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception('failed to load product');
    }
  }
}