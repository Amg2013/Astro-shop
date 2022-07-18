import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/utils/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  ImageSlider({Key? key, required this.imageUrl}) : super(key: key);

  String imageUrl;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  CarouselController carouselController = CarouselController();

  int currentPage = 0;

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
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.imageUrl,
                      ),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(25)),
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
      ],
    );
  }
}
