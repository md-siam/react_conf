import 'package:flutter/material.dart';

import '../../models/speaker_model.dart';
import '../../widgets/speaker_card.dart';

class Speaker extends StatelessWidget {
  final List<SpeakerModel>? queryData;
  const Speaker({Key? key, this.queryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24).copyWith(bottom: 0),
      child: queryData!.isEmpty
          ? const Center(
              child: Text(
                'No information available..!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          : ListView.separated(
              itemCount: queryData!.length,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 20);
              },
              itemBuilder: (BuildContext context, int index) {
                return SpeakerCard(
                  imageLink: queryData![index].image.url!,
                  speakersName: queryData![index].name,
                  twitterUrl: queryData![index].social.twitter,
                  linkedInUrl: queryData![index].social.linkedin,
                  homepageUrl: queryData![index].social.homepage,
                  githubUrl: queryData![index].social.github,
                  about: queryData![0].about,
                );
              },
            ),
    );
  }
}
