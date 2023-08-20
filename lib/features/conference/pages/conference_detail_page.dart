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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
        body: const Column(
          children: [
            Material(
              elevation: 10,
              child: TabBar(
                indicatorWeight: 3.0,
                labelColor: AppColors.kYellow,
                labelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelColor: AppColors.kDeepGray,
                unselectedLabelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                indicatorColor: AppColors.kYellow,
                tabs: [
                  Tab(
                    icon: FittedBox(
                      child: Text('Organizer'),
                    ),
                  ),
                  Tab(
                    icon: FittedBox(
                      child: Text('Speakers'),
                    ),
                  ),
                  Tab(
                    icon: FittedBox(
                      child: Text('Schedule'),
                    ),
                  ),
                  Tab(
                    icon: FittedBox(
                      child: Text('Sponsors'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
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
