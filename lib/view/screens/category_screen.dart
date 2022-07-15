import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'category',
      style: TextStyle(
          color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
    ));
  }
}
