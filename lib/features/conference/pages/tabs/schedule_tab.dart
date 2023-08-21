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
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: scheduleQData!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 24);
                    },
                    itemBuilder: (BuildContext context, int scheduleIndex) {
                      return ScheduleCard(
                        scheduleIndex: scheduleIndex,
                        scheduleQData: scheduleQData,
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
    );
  }
}
