import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/const/app_color.dart';
import '../models/schedule_model.dart';
import 'custom_list_tile.dart';

class ScheduleCard extends StatelessWidget {
  final int scheduleIndex;
  final List<ScheduleModel>? scheduleQData;

  const ScheduleCard({
    Key? key,
    required this.scheduleIndex,
    this.scheduleQData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.kVeryLightGray,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  scheduleQData![scheduleIndex].day,
                  style: const TextStyle(
                    fontSize: 20,
                    color: AppColors.kBlack,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  _parseDateStr(scheduleQData![scheduleIndex].day),
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.kBlack,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ListView.builder(
              itemCount: scheduleQData![scheduleIndex].intervals.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return scheduleQData![scheduleIndex]
                        .intervals[index]
                        .sessions
                        .isNotEmpty
                    ? CustomListTile(
                        begin: scheduleQData![scheduleIndex]
                            .intervals[index]
                            .begin,
                        end: scheduleQData![scheduleIndex].intervals[index].end,
                        sessionsTitle: scheduleQData![scheduleIndex]
                            .intervals[index]
                            .sessions[0]
                            .title,
                      )
                    : const SizedBox.square();
              },
            ),
          ],
        ),
      ),
    );
  }

  String _parseDateStr(String inputString) {
    try {
      DateTime parse = DateTime.parse(inputString);
      //
      return DateFormat.EEEE().format(parse);
    } catch (e) {
      log(e.toString());
      String fixedYear = inputString.split('-').first;
      String fixedMonth = inputString.split('-').elementAt(1).padLeft(2, '0');
      String fixedDay = inputString.split('-').last;
      String modifiedDate = '$fixedYear-$fixedMonth-$fixedDay';
      //
      DateTime parse = DateTime.parse(modifiedDate);
      //
      return DateFormat.EEEE().format(parse);
    }
  }
}
