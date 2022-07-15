import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'settings',
        style: TextStyle(
            color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
      ),
    );
  }
}
