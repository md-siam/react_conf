import 'package:flutter/material.dart';
import 'tabs/organizer.dart';
import 'tabs/schedule.dart';
import 'tabs/speaker.dart';
import 'tabs/sponsor.dart';

import '../../../core/const/color.dart';

class ConferenceDetailPage extends StatefulWidget {
  const ConferenceDetailPage({Key? key}) : super(key: key);

  @override
  State<ConferenceDetailPage> createState() => _ConferenceDetailPageState();
}

class _ConferenceDetailPageState extends State<ConferenceDetailPage> {
  int initialIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: initialIndex,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          backgroundColor: AppColors.kVeryLightGray,
          iconTheme: const IconThemeData(color: AppColors.kBlack),
          title: const Text(
            'Conference Info',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.kDeepBlue,
            ),
          ),
        ),
        body: Column(
          children: [
            Material(
              elevation: 10,
              child: TabBar(
                indicatorColor: AppColors.kYellow,
                onTap: (int newIndex) {
                  setState(() {
                    initialIndex = newIndex;
                  });
                },
                tabs: [
                  Tab(
                    icon: FittedBox(
                      child: Text(
                        'Organizer',
                        style: TextStyle(
                          fontSize: 14,
                          color: initialIndex == 0
                              ? AppColors.kYellow
                              : AppColors.kDeepGray,
                          fontWeight: initialIndex == 0
                              ? FontWeight.w700
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    icon: FittedBox(
                      child: Text(
                        'Speakers',
                        style: TextStyle(
                          fontSize: 14,
                          color: initialIndex == 1
                              ? AppColors.kYellow
                              : AppColors.kDeepGray,
                          fontWeight: initialIndex == 1
                              ? FontWeight.w700
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    icon: FittedBox(
                      child: Text(
                        'Schedule',
                        style: TextStyle(
                          fontSize: 14,
                          color: initialIndex == 2
                              ? AppColors.kYellow
                              : AppColors.kDeepGray,
                          fontWeight: initialIndex == 2
                              ? FontWeight.w700
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    icon: FittedBox(
                      child: Text(
                        'Sponsors',
                        style: TextStyle(
                          fontSize: 14,
                          color: initialIndex == 3
                              ? AppColors.kYellow
                              : AppColors.kDeepGray,
                          fontWeight: initialIndex == 3
                              ? FontWeight.w700
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  Organizer(),
                  Speaker(),
                  Schedule(),
                  Sponsor(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
