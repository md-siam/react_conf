import 'package:flutter/material.dart';

import '../../models/conference_detail_model.dart';

class Schedule extends StatelessWidget {
  final List<ConferenceDetailModel>? queryData;
  const Schedule({Key? key, this.queryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Schedule'),
        ],
      ),
    );
  }
}
