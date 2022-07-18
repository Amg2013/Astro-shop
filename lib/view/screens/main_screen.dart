import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/controller/cart_controller.dart';
import 'package:shooping_app/controller/main_controller.dart';
import 'package:shooping_app/routes/app_routes.dart';
import 'package:shooping_app/utils/theme.dart';

import '../../controller/cart_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final mainController = Get.find<MainController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(
      () {
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            title:
                Text(mainController.title[mainController.currentIndex.value]),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            actions: [
              Obx(() {
                return Badge(
                  position: BadgePosition.topEnd(top: 2, end: 5),
                  animationDuration: Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
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
              })
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              mainController.currentIndex.value = index;
            },
            backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
            currentIndex: mainController.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                  icon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.category,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                  icon: Icon(
                    Icons.category,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                  icon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                  icon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: ''),
            ],
          ),
          body: IndexedStack(
            index: mainController.currentIndex.value,
            children: mainController.item.value,
          ),
        );
      },
    ));
  }
}
