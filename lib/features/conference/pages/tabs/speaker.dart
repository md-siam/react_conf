import 'package:flutter/material.dart';

import '../../models/conference_detail_model.dart';

class Speaker extends StatelessWidget {
  final List<ConferenceDetailModel>? queryData;
  const Speaker({Key? key, required this.queryData}) : super(key: key);

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
