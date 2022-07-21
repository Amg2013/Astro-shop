import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/controller/product_controller.dart';

class SearchTextForm extends StatelessWidget {
  SearchTextForm({Key? key}) : super(key: key);

  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (_) {
      return TextField(
        onChanged: (searchName) {
          productController.addSearchToList(searchName);
        },
        controller: productController.searchTextEditingController,
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            fillColor: Colors.white,
            focusColor: Colors.red,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            suffixIcon:
                productController.searchTextEditingController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          productController.clearSearch();
                        },
                        icon: Icon(
                          Icons.close,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                      )
                    : null,
            hintText: 'Search with name & price',
            hintStyle: const TextStyle(
                color: Colors.black45,
                fontSize: 18,
                fontWeight: FontWeight.w500),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10))),
      );
    });
  }
}
