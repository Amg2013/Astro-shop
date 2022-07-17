import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/utils/theme.dart';
import 'package:shooping_app/view/widget/text_utils.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 13),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  underLine: TextDecoration.none,
                  text: 'Total'),
              Text(
                '\$ 68',
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
              )
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 60,
              margin: EdgeInsets.only(right: 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 0,
                      primary: Get.isDarkMode ? pinkClr : mainColor),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Check Out',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.shopping_cart)
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
