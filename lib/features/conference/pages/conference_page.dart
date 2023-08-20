import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:react_conf/core/const/color.dart';

import '../models/conference_model.dart';
import '../services/conf_page_gql_service.dart';
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

  List<ConferenceModel>? _conferences;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    _conferences = null;
    _conferences = await _graphQLService.getConference();
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
      ),
      body: _conferences == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Conference'),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const ConferenceDetailPage()),
                      );
                    },
                    child: const Text('Press'),
                  ),
                ],
              ),
            ),
    );
  }
}
