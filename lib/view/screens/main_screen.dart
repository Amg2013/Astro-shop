import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/controller/main_controller.dart';
import 'package:shooping_app/utils/theme.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(
      () {
        return Scaffold(
          appBar: AppBar(
            title:
                Text(mainController.title[mainController.currentIndex.value]),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Get.isDarkMode ? mainColor : darkGreyClr,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/shop.png')),
            ],
          ),
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              mainController.currentIndex.value = index;
            },
            backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
            currentIndex: mainController.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? mainColor : pinkClr,
                  ),
                  icon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.category,
                    color: Get.isDarkMode ? mainColor : pinkClr,
                  ),
                  icon: Icon(
                    Icons.category,
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? mainColor : pinkClr,
                  ),
                  icon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode ? mainColor : pinkClr,
                  ),
                  icon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode ? Colors.black : Colors.white,
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
