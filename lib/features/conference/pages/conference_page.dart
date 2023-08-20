import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:react_conf/core/const/color.dart';

import '../../../core/repository/timeline_tile/src/tile.dart';
import '../models/conference_model.dart';
import '../services/conf_page_gql_service.dart';
import '../widgets/custom_conf_card.dart';
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
    //
    // print(_conferences.);
    //
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.kVeryLightGray,
        title: widget.appBarTitle,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => const ConferenceDetailPage()),
              );
            },
            child: const Text('Detail\nPage'),
          ),
        ],
      ),
      body: _queryData == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(24),
              itemCount: _queryData!.length,
              separatorBuilder: (BuildContext context, int index) =>
                  _queryData![index].conferences.isEmpty
                      ? const SizedBox.shrink()
                      : const SizedBox(height: 40),
              itemBuilder: (BuildContext context, int index) {
                return _queryData![index].conferences.isEmpty
                    ? const SizedBox.shrink()
                    : Row(
                        children: [
                          // TimelineTile(),
                          GestureDetector(
                            onTap: () {
                              //
                              log('id: ${_queryData![index].conferences[0].id}');
                              //
                            },
                            child: CustomConfCard(
                              day: _queryData![index]
                                  .conferences[0]
                                  .schedules[0]
                                  .day,
                              name: _queryData![index].conferences[0].name,
                            ),
                          ),
                        ],
                      );
              },
            ),
    );
  }
}
