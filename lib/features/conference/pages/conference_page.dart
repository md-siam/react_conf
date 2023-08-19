import 'package:flutter/material.dart';
import 'package:react_conf/core/const/color.dart';

class ConferencePage extends StatelessWidget {
  final Widget appBarTitle;
  const ConferencePage({
    Key? key,
    required this.appBarTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.kVeryLightGray,
        title: appBarTitle,
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
