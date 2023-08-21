import 'package:flutter/material.dart';

import '../../models/schedule_model.dart';

class ScheduleTab extends StatelessWidget {
  final List<ScheduleModel>? scheduleQData;
  const ScheduleTab({
    Key? key,
    this.scheduleQData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return scheduleQData == null || scheduleQData!.isEmpty
        ? Center(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 3),
                const Text(
                  'No information available..!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(scheduleQData![0].day),
              ],
            ),
          );
  }
}
