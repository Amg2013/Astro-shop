import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/controller/payment_controller.dart';
import 'package:shooping_app/routes/app_routes.dart';
import 'package:shooping_app/utils/theme.dart';
import 'package:shooping_app/view/widget/payment/phone_text_field.dart';
import 'package:shooping_app/view/widget/text_utils.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  int radioContainerIndex = 1;
  bool changeColor = false;
  TextEditingController phoneTextEditingController = TextEditingController();
  final paymentController = Get.find<PaymentController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            buildRadioContainer(
                context: context,
                color: changeColor ? Colors.white : Colors.grey.shade300,
                value: 1,
                onChanged: (int? value) {
                  radioContainerIndex = value!;
                  changeColor = !changeColor;
                  setState(() {});
                },
                title: 'Asroo shop',
                name: 'Assro Store',
                phone: '07-289-35',
                address: 'beniseuf/Bba/telcafmanseour',
                icon: Container()),
            const SizedBox(
              height: 10,
            ),
            buildRadioContainer(
                context: context,
                color: changeColor ? Colors.grey.shade300 : Colors.white,
                value: 2,
                onChanged: (int? value) {
                  radioContainerIndex = value!;
                  changeColor = !changeColor;
                  setState(() {});
                },
                title: 'Delivery',
                name: 'shehab adel',
                phone: paymentController.phoneNumber.value.tr,
                address: 'beniseuf/Bba/telcafmanseour',
                icon: InkWell(
                  onTap: () {
                    Get.defaultDialog(
                        title: "Enter Your Phone Number".tr,
                        titleStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        radius: 10,
                        textCancel: 'Cancel'.tr,
                        backgroundColor: Colors.white,
                        cancelTextColor: Colors.black,
                        textConfirm: 'Save'.tr,
                        confirmTextColor: Colors.black,
                        onCancel: () {
                          Get.toNamed(AppRoutes.paymentScreenRoute);
                        },
                        onConfirm: () {
                          Get.back();
                          paymentController.phoneNumber.value =
                              phoneTextEditingController.text;
                        },
                        buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                        content: PhoneTextForm(
                          phoneTextEditingController:
                              phoneTextEditingController,
                        ));
                  },
                  child: Icon(
                    Icons.contact_phone,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                    size: 30,
                  ),
                )),
          ],
        ));
  }

  Widget buildRadioContainer(
      {required Color color,
      required int value,
      required Function onChanged,
      required String title,
      required String name,
      required String phone,
      required String address,
      required Widget icon,
      required BuildContext context}) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
              value: value,
              groupValue: radioContainerIndex,
              fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
              onChanged: (int? value) {
                onChanged(value);
              }),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    underLine: TextDecoration.none,
                    text: title),
                const SizedBox(
                  width: 5,
                ),
                TextUtils(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    underLine: TextDecoration.none,
                    text: name),
                const SizedBox(
                  width: 5,
                ),
                Row(
                  children: [
                    TextUtils(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        underLine: TextDecoration.none,
                        text: 'Egypt +2'),
                    const SizedBox(
                      width: 8,
                    ),
                    TextUtils(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        underLine: TextDecoration.none,
                        text: phone),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .13,
                    ),
                    SizedBox(
                      child: icon,
                    )
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                TextUtils(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    underLine: TextDecoration.none,
                    text: address),
              ],
            ),
          )
        ],
      ),
    );
  }
}
