import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:shooping_app/controller/product_controller.dart';
import 'package:shooping_app/utils/theme.dart';
import 'package:shooping_app/view/widget/text_utils.dart';

class ClothesInfo extends StatelessWidget {
  ClothesInfo(
      {Key? key,
      required this.title,
      required this.productId,
      required this.rate,
      required this.description})
      : super(key: key);

  final int productId;
  final String title;
  final double rate;
  final productController = Get.find<ProductController>();
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ),
              ),
              Obx(() {
                return InkWell(
                  onTap: () {
                    productController.manageFavorites(productId);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? Colors.white.withOpacity(0.9)
                            : Colors.grey.withOpacity(0.4),
                        shape: BoxShape.circle),
                    child: productController.isFavorites(productId)
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 20,
                          )
                        : Icon(
                            Icons.favorite_outline,
                            color: Colors.red,
                            size: 20,
                          ),
                  ),
                );
              })
            ],
          ),
          Row(
            children: [
              TextUtils(
                  fontSize: 14,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  underLine: TextDecoration.none,
                  text: '$rate'),
              SizedBox(
                width: 8,
              ),
              RatingBar.builder(
                initialRating: rate,
                minRating: 1,
                itemSize: 25,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  rating = 5;
                },
              )
            ],
          ),
          SizedBox(
            height: 3,
          ),
          ReadMoreText(
            description,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            trimCollapsedText: "Show More",
            trimExpandedText: "Show Less",
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            style: TextStyle(
                fontSize: 16,
                height: 2,
                color: Get.isDarkMode ? Colors.white : Colors.black),
          )
        ],
      ),
    );
  }
}
