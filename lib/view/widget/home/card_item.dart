import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/controller/product_controller.dart';
import 'package:shooping_app/utils/theme.dart';
import 'package:shooping_app/view/widget/text_utils.dart';

class CardItems extends StatelessWidget {
  CardItems({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
            child: CircularProgressIndicator(
          color: Get.isDarkMode ? pinkClr : mainColor,
        ));
      } else {
        return Expanded(
          child: GridView.builder(
              itemCount: controller.productList.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 9.0,
                  mainAxisSpacing: 6.0,
                  maxCrossAxisExtent: 200),
              itemBuilder: (context, index) {
                return buildCardItems(
                  price: controller.productList[index].price,
                    image: controller.productList[index].image,
                    rate: controller.productList[index].rating.rate,
                    productId: controller.productList[index].id);
              }),
        );
      }
    });
  }

  Widget buildCardItems(
      {required String image,
      required double price,
      required double rate,
      required int productId}) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,
            )
          ],
        ),
        child: Column(
          children: [
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        controller.manageFavorites(productId);
                      },
                      icon: controller.isFavorites(productId)
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                            )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ))
                ],
              );
            }),
            Container(
              width: double.infinity,
              height: 145,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Image.network(image),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$ $price',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 45,
                    height: 20,
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 3, right: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextUtils(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              underLine: TextDecoration.none,
                              text: '$rate'),
                          Icon(
                            Icons.star_border_outlined,
                            color: Colors.white,
                            size: 13,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
