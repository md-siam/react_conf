import 'package:flutter/material.dart';

import '../../models/speaker_model.dart';
import '../../widgets/speaker_card.dart';

class Speaker extends StatelessWidget {
  final List<SpeakerModel>? speakerQData;
  const Speaker({Key? key, this.speakerQData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24).copyWith(top: 15, bottom: 0),
      child: speakerQData == null || speakerQData!.isEmpty
          ? const Center(
              child: Text(
                'No information available..!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          : SingleChildScrollView(
              controller: null,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: speakerQData!.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 20);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return SpeakerCard(
                        imageLink: speakerQData![index].image.url!,
                        speakersName: speakerQData![index].name,
                        twitterUrl: speakerQData![index].social.twitter,
                        linkedInUrl: speakerQData![index].social.linkedin,
                        homepageUrl: speakerQData![index].social.homepage,
                        githubUrl: speakerQData![index].social.github,
                        about: speakerQData![0].about,
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
    );
  }
}
