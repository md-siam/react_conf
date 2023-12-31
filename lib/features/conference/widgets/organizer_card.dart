import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/const/app_color.dart';

class OrganizerCard extends StatelessWidget {
  final String imageLink;
  final String sponsorsName;
  final String about;
  final String? websiteLink;

  const OrganizerCard(
      {Key? key,
      required this.imageLink,
      required this.sponsorsName,
      required this.about,
      required this.websiteLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (websiteLink != null) {
          final Uri socialUrl = Uri.parse(websiteLink!);
          if (await canLaunchUrl(socialUrl)) {
            await launchUrl(socialUrl);
          }
        }
      },
      child: Material(
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
                child: Container(
                  width: 100,
                  height: 100,
                  color: const Color.fromARGB(255, 235, 233, 233),
                  alignment: Alignment.center,
                  child: imageLink.endsWith('.svg')
                      ? SvgPicture.network(
                          imageLink,
                          fit: BoxFit.fitWidth,
                        )
                      : Image.network(
                          imageLink,
                          fit: BoxFit.fitWidth,
                        ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width - 230,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sponsorsName,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.kBlack,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '$about...',
                      maxLines: 4,
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
      ),
    );
  }
}
