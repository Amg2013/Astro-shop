import 'package:get/get.dart';
import 'package:shooping_app/model/product_models.dart';
import 'package:shooping_app/services/products_sevices.dart';

class ProductController extends GetxController {
  RxList productList = <ProductModels>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  void getProduct() async {
    try {
      isLoading.value = true;
      var products = await ProductServices.getProduct();
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading.value = false;
    }
  }
}
