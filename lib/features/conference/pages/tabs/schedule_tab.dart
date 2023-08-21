import 'package:flutter/material.dart';

import '../../models/schedule_model.dart';
import '../../widgets/schedule_card.dart';

class ScheduleTab extends StatelessWidget {
  final List<ScheduleModel>? scheduleQData;
  const ScheduleTab({
    Key? key,
    this.scheduleQData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24).copyWith(top: 15, bottom: 0),
      child: scheduleQData == null || scheduleQData!.isEmpty
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
          : SingleChildScrollView(
              controller: null,
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScheduleCard(
                    scheduleIndex: 0,
                    scheduleQData: scheduleQData,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
    );
  }
}
