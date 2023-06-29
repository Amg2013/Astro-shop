import 'package:http/http.dart' as http;
import '../utils/my_string.dart';

import '../model/category_model.dart';
import '../model/product_models.dart';

class CategoryServices {
  static Future<List<String>> getCategory() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));
    if (response.statusCode == 200) {
      return categoryModelsFromJson(response.body);
    } else {
      return throw Exception("Failed to load category");
    }
  }
}

class AllCategoryServices {
  static Future<List<ProductModels>> getAllCategory(String categoryType) async {
    var response =
        await http.get(Uri.parse('$baseUrl/products/category/$categoryType'));
    if (response.statusCode == 200) {
      return productModelsFromJson(response.body);
    } else {
      return throw Exception("Failed to load category");
    }
  }
}
