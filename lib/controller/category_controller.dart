import 'package:get/get.dart';
import 'package:shooping_app/model/product_models.dart';
import 'package:shooping_app/services/category_services.dart';

class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var categoryList = <ProductModels>[].obs;
  var isCategoryLoading = false.obs;
  var isAllCategoryLoading = false.obs;
  List<String> imageCategory = [
    "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
    "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg"
  ];

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  void getCategories() async {
    var categoryName = await CategoryServices.getCategory();
    try {
      if (categoryName.isNotEmpty) {
        isCategoryLoading.value = true;
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCategoryLoading.value = false;
    }
  }

  getAllProductFromOneCategory(String categoryType) async {
    isAllCategoryLoading.value = true;
    categoryList.value = await AllCategoryServices.getAllCategory(categoryType);
    isAllCategoryLoading.value = false;
  }

  getCategoryIndex(int index) async {
    var categoryName =
        await getAllProductFromOneCategory(categoryNameList[index]);
    if (categoryName != null) {
      categoryList.value = categoryName;
    }
  }
}
