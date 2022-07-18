import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/model/product_models.dart';
import 'package:shooping_app/view/widget/products_details/clothes_info.dart';
import 'package:shooping_app/view/widget/products_details/size_list.dart';

import '../widget/products_details/add_cart.dart';
import '../widget/products_details/image_slider.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({Key? key, required this.productModels})
      : super(key: key);

  final ProductModels productModels;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ImageSlider(imageUrl: productModels.image ?? ''),
              ClothesInfo(
                title: productModels.title ?? '',
                productId: productModels.id ?? 0,
                rate: productModels.rating?.rate ?? 0.0,
                description: productModels.description ?? '',
              ),
              SizeList(),
              AddCart(
                price: productModels.price ?? 0.0,
                productModels: productModels,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
