import 'package:e_commerce/models/product_models.dart';
import 'package:e_commerce/utils/my_strings.dart';
import 'package:http/http.dart' as http;

class ProductServices {
static  Future<List<ProductModels>> getProduct() async {
    var response = await http.get(Uri.parse("$baseUrl/products"));

    if (response.statusCode == 200) {
      String jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception('failed to load product');
    }
  }
}
