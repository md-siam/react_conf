import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../core/const/app_color.dart';
import '../../../core/const/text_style.dart';
import '../models/conference_detail_model.dart';
import '../services/conf_detail_page_gql_service.dart';
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
  final ConfDetailPageGraphQLService _graphQLService =
      ConfDetailPageGraphQLService();

  List<ConferenceDetailModel>? _queryData;

  @override
  void initState() {
    super.initState();
    log('conferenceId: ${widget.conferenceId}');
    _load();
  }

  Future<void> _load() async {
    _queryData = null;
    _queryData = await _graphQLService.getConference(widget.conferenceId);
    setState(() {});
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
            Expanded(
              child: _queryData == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : TabBarView(
                      children: [
                        Organizer(queryData: _queryData),
                        Speaker(queryData: _queryData),
                        Schedule(queryData: _queryData),
                        Sponsor(queryData: _queryData),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
