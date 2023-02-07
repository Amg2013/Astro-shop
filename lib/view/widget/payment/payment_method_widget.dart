import 'package:flutter/material.dart';
import 'package:shooping_app/utils/theme.dart';
import '../text_utils.dart';

class PaymentMethodWidget extends StatefulWidget {
  PaymentMethodWidget({Key? key}) : super(key: key);

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  int radioPaymentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          buildRadioPayment(
              name: 'Paypal',
              image: 'assets/images/paypal.png',
              value: 1,
              scale: 0.7,
              onChanged: (int? value) {
                radioPaymentIndex = value!;
                setState(() {});
              }),
          const SizedBox(
            height: 15,
          ),
          buildRadioPayment(
              name: 'Google play',
              image: 'assets/images/google.png',
              value: 2,
              scale: 0.8,
              onChanged: (int? value) {
                radioPaymentIndex = value!;
                setState(() {});
              }),
          const SizedBox(
            height: 15,
          ),
          buildRadioPayment(
              name: 'Paypal',
              image: 'assets/images/credit.png',
              value: 3,
              scale: 0.7,
              onChanged: (int? value) {
                radioPaymentIndex = value!;
                setState(() {});
              }),
        ],
      ),
    );
  }

  Widget buildRadioPayment(
      {required String image,
      required double scale,
      required Function onChanged,
      required int value,
      required String name}) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                scale: scale,
              ),
              const SizedBox(
                width: 10,
              ),
              TextUtils(
                underLine: TextDecoration.none,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                text: name,
                color: Colors.black,
              )
            ],
          ),
          Radio(
              value: value,
              groupValue: radioPaymentIndex,
              fillColor: MaterialStateColor.resolveWith((states) => mainColor),
              onChanged: (int? value) {
                onChanged(value);
              })
        ],
      ),
    );
  }
}
