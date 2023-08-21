import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../core/const/app_color.dart';
import '../../../core/const/text_style.dart';
import '../models/organizer_model.dart';
import '../models/schedule_model.dart';
import '../models/speaker_model.dart';
import '../models/sponsor_model.dart';
import '../services/bronze_sponsor_gql_service.dart';
import '../services/gold_sponsor_gql_service.dart';
import '../services/organizer_gql_service.dart';
import '../services/schedule_gql_service.dart';
import '../services/silver_sponsor_gql_service.dart';
import '../services/speaker_gql_service.dart';
import 'tabs/organizer_tab.dart';
import 'tabs/schedule_tab.dart';
import 'tabs/speaker_tab.dart';
import 'tabs/sponsor_tab.dart';

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
  final OrganizerGraphQLService _organizerGraphQLService =
      OrganizerGraphQLService();
  final SpeakerGraphQLService _speakerGraphQLService = SpeakerGraphQLService();
  final ScheduleGraphQLService _scheduleGraphQLService =
      ScheduleGraphQLService();

  final GoldSponsorGraphQLService _goldSponsorGraphQLService =
      GoldSponsorGraphQLService();
  final SolverSponsorGraphQLService _silverSponsorGraphQLService =
      SolverSponsorGraphQLService();
  final BronzeSponsorGraphQLService _bronzeSponsorGraphQLService =
      BronzeSponsorGraphQLService();

  List<OrganizerModel>? _organizerData;
  //
  List<SpeakerModel>? _speakersData;
  //
  List<ScheduleModel>? _scheduleData;
  //
  List<SponsorModel>? _goldSponsorsData;
  List<SponsorModel>? _silverSponsorsData;
  List<SponsorModel>? _bronzeSponsorsData;

  @override
  void initState() {
    super.initState();
    log('conferenceId: ${widget.conferenceId}');
    _loadOrganizersData();
    _loadSpeakersData();
    _loadSchedulesData();
    _loadGoldSponsorsData();
    _loadSilverSponsorsData();
    _loadBronzeSponsorsData();
  }

  Future<void> _loadOrganizersData() async {
    _organizerData = null;
    _organizerData =
        await _organizerGraphQLService.getConference(widget.conferenceId);
    setState(() {});
  }

  Future<void> _loadSpeakersData() async {
    _speakersData = null;
    _speakersData =
        await _speakerGraphQLService.getConference(widget.conferenceId);
    setState(() {});
  }

  Future<void> _loadSchedulesData() async {
    _scheduleData = null;
    _scheduleData =
        await _scheduleGraphQLService.getConference(widget.conferenceId);
    setState(() {});
  }

  Future<void> _loadGoldSponsorsData() async {
    _goldSponsorsData = null;
    _goldSponsorsData =
        await _goldSponsorGraphQLService.getConference(widget.conferenceId);
    setState(() {});
  }

  Future<void> _loadSilverSponsorsData() async {
    _silverSponsorsData = null;
    _silverSponsorsData =
        await _silverSponsorGraphQLService.getConference(widget.conferenceId);
    setState(() {});
  }

  Future<void> _loadBronzeSponsorsData() async {
    _bronzeSponsorsData = null;
    _bronzeSponsorsData =
        await _bronzeSponsorGraphQLService.getConference(widget.conferenceId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
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
              child: _speakersData == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : TabBarView(
                      children: [
                        OrganizerTab(organizerQData: _organizerData),
                        Speaker(speakerQData: _speakersData),
                        ScheduleTab(scheduleQData: _scheduleData),
                        SponsorTab(
                          goldSponsorQData: _goldSponsorsData,
                          silverSponsorQData: _silverSponsorsData,
                          bronzeSponsorQData: _bronzeSponsorsData,
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
