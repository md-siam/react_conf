import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../core/const/color.dart';
import '../../../core/const/text_style.dart';
import 'tabs/organizer.dart';
import 'tabs/schedule.dart';
import 'tabs/speaker.dart';
import 'tabs/sponsor.dart';

class ConferenceDetailPage extends StatefulWidget {
  final String conferenceId;
  const ConferenceDetailPage({
    Key? key,
    required this.conferenceId,
  }) : super(key: key);

  @override
  State<ConferenceDetailPage> createState() => _ConferenceDetailPageState();
}

class _ConferenceDetailPageState extends State<ConferenceDetailPage> {
  @override
  void initState() {
    super.initState();
    log(widget.conferenceId);
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
          title: Text(
            'Conference Info',
            style: appBarHeaderTStyle,
          ),
        ),
        body: Column(
          children: [
            Material(
              elevation: 10,
              child: TabBar(
                indicatorWeight: 3.0,
                labelColor: AppColors.kYellow,
                labelStyle: selectedTabTStyle,
                unselectedLabelColor: AppColors.kDeepGray,
                unselectedLabelStyle: unSelectedTabTStyle,
                indicatorColor: AppColors.kYellow,
                tabs: const [
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
            const Expanded(
              child: TabBarView(
                children: [
                  Organizer(),
                  Speaker(),
                  Schedule(),
                  Sponsor(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
