import 'package:flutter/material.dart';
import 'package:react_conf/const/color.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.kVeryLightGray,
        title: Image.asset(
          'assets/images/logo_black.png',
          height: 48,
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Conference'),
          ],
        ),
      ),
    );
  }
}
