import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:shooping_app/services/TfliteModel.dart';
import '../../utils/theme.dart';
import '../widget/home/search_form_text.dart';
import '../widget/text_utils.dart';

import '../widget/home/card_item.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: SpeedDial(
        closeManually: true,
        spaceBetweenChildren: 12,
        child: IconButton(onPressed: null, icon: Icon(Icons.menu_outlined)),
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              child: Icon(Icons.add_a_photo_outlined),
              label: 'image classification ',
              onTap: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return TfliteModel();
                    },
                  )),
          SpeedDialChild(
            child: IconButton(onPressed: null, icon: Icon(Icons.abc)),
          ),
          SpeedDialChild(
            child: IconButton(onPressed: null, icon: Icon(Icons.abc)),
          )
        ],
      ),
      backgroundColor: context.theme.colorScheme.background,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height * .26,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? darkGreyClr : mainColor,
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 13, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      underLine: TextDecoration.none,
                      text: 'Find Your'.tr),
                  const SizedBox(
                    height: 5,
                  ),
                  TextUtils(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      underLine: TextDecoration.none,
                      text: 'INSPIRATION'.tr),
                  const SizedBox(
                    height: 20,
                  ),
                  SearchTextForm(),
                  // SearchTextForm(),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => const TfliteModel()));
                  //   },
                  //   child: Container(
                  //     height: 50,
                  //     width: 220,
                  //     decoration: BoxDecoration(
                  //         border: Border.all(
                  //             style: BorderStyle.solid,
                  //             width: 1,
                  //             strokeAlign: 1)),
                  //     child: Row(children: [
                  //       Text('search using image'),
                  //       Icon(Icons.add_a_photo_outlined)
                  //     ]),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: TextUtils(
                  fontSize: 20,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                  underLine: TextDecoration.none,
                  text: 'Categories'.tr),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CardItems(),
        ],
      ),
    );
  }
}
