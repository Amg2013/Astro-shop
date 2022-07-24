import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/utils/theme.dart';
import 'package:shooping_app/view/screens/category_item.dart';

import '../../../controller/category_controller.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);

  final categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        if (categoryController.isCategoryLoading.value) {
          return Center(
              child: CircularProgressIndicator(
            color: Get.isDarkMode ? darkGreyClr : mainColor,
          ));
        }
        return ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  categoryController.getCategoryIndex(index);
                  Get.to(() => CategoryItem(
                      categoryTitle:
                          categoryController.categoryNameList[index]));
                },
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(
                              categoryController.imageCategory[index]),
                          fit: BoxFit.cover)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 10),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        categoryController.categoryNameList[index],
                        style: const TextStyle(
                            backgroundColor: Colors.black38,
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 20,
              );
            },
            itemCount: categoryController.categoryNameList.length);
      }),
    );
  }
}
