import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TextUtils extends StatelessWidget {
  String text;
  double fontSize;
  Color color;
  FontWeight fontWeight;
  TextDecoration underLine;

  TextUtils(
      {required this.fontSize,
      required this.color,
      required this.fontWeight,
      required this.underLine,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.lato(
          textStyle: TextStyle(
              decoration: underLine,
              fontSize: fontSize,
              color: color,
              fontWeight: fontWeight),
        ));
  }
}
