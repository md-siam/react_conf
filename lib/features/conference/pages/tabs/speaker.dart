import 'package:flutter/material.dart';

class Speaker extends StatelessWidget {
  const Speaker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Speaker'),
        ],
      ),
    );
  }
}
