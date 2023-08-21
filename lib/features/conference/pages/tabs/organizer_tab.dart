import 'package:flutter/material.dart';

import '../../models/organizer_model.dart';
import '../../widgets/organizer_card.dart';

class OrganizerTab extends StatelessWidget {
  final List<OrganizerModel>? organizerQData;

  const OrganizerTab({
    Key? key,
    this.organizerQData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24).copyWith(top: 15, bottom: 0),
      child: organizerQData == null || organizerQData!.isEmpty
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
          : ListView.separated(
              itemCount: organizerQData!.length,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 20);
              },
              itemBuilder: (BuildContext context, int index) {
                return OrganizerCard(
                  imageLink: organizerQData![index].image.url,
                  sponsorsName: organizerQData![index].name,
                  about: organizerQData![index].about,
                  websiteLink: organizerQData![index].social.homepage,
                );
              },
            ),
    );
  }
}
