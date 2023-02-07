import 'package:badges/badges.dart' as badge;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/controller/cart_controller.dart';
import 'package:shooping_app/routes/app_routes.dart';
import 'package:shooping_app/utils/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../category/ExampleInstagramFilterSelection.dart';

// ignore: must_be_immutable
class ImageSlider extends StatefulWidget {
  ImageSlider({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  String imageUrl;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int currentPage = 0;
  int currentColor = 0;
  final cartController = Get.find<CartController>();
  final List<Color> colorSelectedList = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
  ];
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
            itemCount: 3,
            carouselController: carouselController,
            itemBuilder: (context, index, realIndex) {
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child:
                    ExampleInstagramFilterSelection(imageUrl: widget.imageUrl),
              );
            },
            options: CarouselOptions(
                height: 500,
                autoPlay: true,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                viewportFraction: 1,
                autoPlayInterval: const Duration(seconds: 3),
                onPageChanged: (index, reson) {
                  currentPage = index;
                  setState(() {});
                })),
        Positioned(
            bottom: 30,
            left: 180,
            child: AnimatedSmoothIndicator(
              activeIndex: currentPage,
              count: 3,
              effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
                  dotColor: Colors.black),
            )),
        /*
        Positioned(
            bottom: 30,
            right: 30,
            child: Container(
              height: 210,
              width: 50,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30)),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        currentColor = index;
                        setState(() {});
                      },
                      child: ColorPicker(
                          outerBorder: currentColor == index,
                          color: colorSelectedList[index]),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 3,
                    );
                  },
                  itemCount: colorSelectedList.length),
            )),
            */
        Container(
          padding: EdgeInsets.only(top: 20, left: 25, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? pinkClr.withOpacity(0.8)
                          : mainColor.withOpacity(0.8),
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.cartScreenRoute);
                },
                child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? pinkClr.withOpacity(0.8)
                            : mainColor.withOpacity(0.8),
                        shape: BoxShape.circle),
                    child: Obx(() {
                      return badge.Badge(
                        padding: EdgeInsets.all(5),
                        position:
                            badge.BadgePosition.topEnd(top: -10, end: -10),
                        animationDuration: Duration(milliseconds: 300),
                        animationType: badge.BadgeAnimationType.slide,
                        badgeContent: Text(
                          '${cartController.quantity()}',
                          style: TextStyle(color: Colors.white),
                        ),
                        child: IconButton(
                            onPressed: () {
                              Get.toNamed(AppRoutes.cartScreenRoute);
                            },
                            icon: Image.asset('assets/images/shop.png')),
                      );
                    })),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
