import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/theme.dart';
import '../widget/payment/delivery_container_widget.dart';
import '../widget/payment/payment_method_widget.dart';

import '../widget/text_utils.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(
        title: Text('Payment'.tr),
        elevation: 0,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none,
                text: 'Shipping to'.tr,
              ),
              const SizedBox(
                height: 20,
              ),
              const DeliveryContainerWidget(),
              const SizedBox(
                height: 20,
              ),
              TextUtils(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none,
                text: 'Payment method'.tr,
              ),
              const SizedBox(
                height: 20,
              ),
              PaymentMethodWidget(),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: TextUtils(
                    fontSize: 20,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    underLine: TextDecoration.none,
                    text: 'Total'.tr),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                        elevation: 0),
                    onPressed: () {},
                    child: Text(
                      'Pay Now'.tr,
                      style: const TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
