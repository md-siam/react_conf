import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/const/app_color.dart';

class SpeakerCard extends StatelessWidget {
  final String imageLink;
  final String speakersName;
  final String? twitterUrl;
  final String? linkedInUrl;
  final String? homepageUrl;
  final String? githubUrl;
  final String about;

  const SpeakerCard({
    Key? key,
    required this.imageLink,
    required this.speakersName,
    this.twitterUrl,
    this.linkedInUrl,
    this.homepageUrl,
    this.githubUrl,
    required this.about,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.kVeryLightGray,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageLink,
                height: 130,
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width - 230,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    speakersName,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.kBlack,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          if (twitterUrl != null) {
                            final Uri socialUrl = Uri.parse(twitterUrl!);
                            if (await canLaunchUrl(socialUrl)) {
                              await launchUrl(socialUrl);
                            }
                          }
                        },
                        child: SvgPicture.asset(
                          'assets/speakers/twitter.svg',
                          width: 18,
                          height: 18,
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () async {
                          if (linkedInUrl != null) {
                            final Uri socialUrl = Uri.parse(linkedInUrl!);
                            if (await canLaunchUrl(socialUrl)) {
                              await launchUrl(socialUrl);
                            }
                          }
                        },
                        child: SvgPicture.asset(
                          'assets/speakers/linked_in.svg',
                          width: 18,
                          height: 18,
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () async {
                          if (homepageUrl != null) {
                            final Uri socialUrl = Uri.parse(homepageUrl!);
                            if (await canLaunchUrl(socialUrl)) {
                              await launchUrl(socialUrl);
                            }
                          }
                        },
                        child: SvgPicture.asset(
                          'assets/speakers/globe.svg',
                          width: 18,
                          height: 18,
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () async {
                          if (githubUrl != null) {
                            final Uri socialUrl = Uri.parse(githubUrl!);
                            if (await canLaunchUrl(socialUrl)) {
                              await launchUrl(socialUrl);
                            }
                          }
                        },
                        child: SvgPicture.asset(
                          'assets/speakers/github.svg',
                          width: 18,
                          height: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '$about...',
                    maxLines: 3,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
