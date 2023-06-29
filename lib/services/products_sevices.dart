import 'package:http/http.dart' as http;
import '../utils/my_string.dart';

import '../model/product_models.dart';

class ProductServices {
  static Future<List<ProductModels>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      return productModelsFromJson(response.body);
    } else {
      return throw Exception("Failed to load products");
    }
  }
}
