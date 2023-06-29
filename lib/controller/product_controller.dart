import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../model/product_models.dart';
import '../services/products_sevices.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var isLoading = true.obs;
  var isFavorite = false.obs;
  RxList favoriteList = <ProductModels>[].obs;
  var boxStorage = GetStorage();

  // search variables
  var searchList = <ProductModels>[].obs;
  TextEditingController searchTextEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    List? storageShoppings = boxStorage.read<List>('isFavoritesList');
    if (storageShoppings != null) {
      favoriteList = storageShoppings
          .map<ProductModels>((e) => ProductModels.fromJson(e))
          .toList()
          .obs;
    }
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

  void manageFavorites(int productId) async {
    int index = favoriteList.indexWhere((element) => element.id == productId);
    if (favoriteList.any((element) => element.id == productId)) {
      favoriteList.removeAt(index);
      await boxStorage.remove('isFavoritesList');
    } else {
      favoriteList
          .add(productList.firstWhere((element) => element.id == productId));
      await boxStorage.write('isFavoritesList', favoriteList);
    }
  }

  bool isFavorites(int productId) {
    return favoriteList.any((element) => element.id == productId);
  }

  //search bar logic

  void addSearchToList(String searchName) {
    searchName = searchName.toString();
    searchList.value = productList.where((item) {
      var searchTitle = item.title?.toLowerCase();
      var searchPrice = item.price.toString().toLowerCase();
      return searchTitle!.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();
    update();
  }

  void clearSearch() {
    searchTextEditingController.clear();
    addSearchToList('');
  }
}
