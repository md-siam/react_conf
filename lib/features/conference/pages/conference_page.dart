import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/const/app_color.dart';
import '../models/conference_model.dart';
import '../services/conf_page_gql_service.dart';
import '../widgets/custom_conf_card.dart';
import '../widgets/custom_time_line.dart';
import 'conference_detail_page.dart';

class ConferencePage extends StatefulWidget {
  final Widget appBarTitle;
  const ConferencePage({
    Key? key,
    required this.appBarTitle,
  }) : super(key: key);

  @override
  State<ConferencePage> createState() => _ConferencePageState();
}

class _ConferencePageState extends State<ConferencePage> {
  final ConfPageGraphQLService _graphQLService = ConfPageGraphQLService();

  List<ConferenceModel>? _queryData;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    _queryData = null;
    _queryData = await _graphQLService.getConference();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.kVeryLightGray,
        title: widget.appBarTitle,
      ),
      body: _queryData == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 16, right: 24, bottom: 40),
              itemCount: _queryData!.length,
              itemBuilder: (BuildContext context, int index) {
                return _queryData![index].conferences.isEmpty
                    ? const SizedBox.shrink()
                    : CustomTimeLine(
                        isFirst: index == 0 ? true : false,
                        isLast:
                            index == (_queryData!.length - 1) ? true : false,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => ConferenceDetailPage(
                                  conferenceId:
                                      _queryData![index].conferences[0].id,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: CustomConfCard(
                              day: _queryData![index].conferences[0].startDate,
                              name: _queryData![index].conferences[0].name,
                              slogan: _queryData![index].conferences[0].slogan,
                            ),
                          ),
                        ),
                      );
              },
            ),
    );
  }
}
