import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:react_conf/core/const/color.dart';

import 'conference_detail_page.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Conference'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const ConferenceDetailPage()),
                );
              },
              child: const Text('Press'),
            ),
          ],
        ),
      ),
    );
  }
}
