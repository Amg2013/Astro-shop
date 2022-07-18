import 'package:flutter/material.dart';
import 'package:shooping_app/model/product_models.dart';

import '../widget/products_details/image_slider.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({Key? key, required this.productModels})
      : super(key: key);

  final ProductModels productModels;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageSlider(imageUrl: productModels.image ?? ''),
          ],
        ),
      ),
    );
  }
}
