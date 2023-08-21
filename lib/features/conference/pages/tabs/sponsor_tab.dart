import 'package:flutter/material.dart';

import '../../../../core/const/app_color.dart';
import '../../models/sponsor_model.dart';
import '../../widgets/sponsor_card.dart';

class SponsorTab extends StatelessWidget {
  final List<SponsorModel>? goldSponsorQData;
  final List<SponsorModel>? silverSponsorQData;
  final List<SponsorModel>? bronzeSponsorQData;

  const SponsorTab({
    Key? key,
    this.goldSponsorQData,
    this.silverSponsorQData,
    this.bronzeSponsorQData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24).copyWith(top: 15, bottom: 0),
      child: SingleChildScrollView(
        controller: null,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            goldSponsorQData == null || goldSponsorQData!.isEmpty
                ? const SizedBox.shrink()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Gold Sponsor',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.kBlack,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      //
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: goldSponsorQData!.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 20);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return SponsorCard(
                            imageLink: goldSponsorQData![index].image.url,
                            sponsorsName: goldSponsorQData![index].name,
                            about: goldSponsorQData![index].about,
                            websiteLink:
                                goldSponsorQData![index].social.homepage,
                          );
                        },
                      ),
                    ],
                  ),
            //
            //
            silverSponsorQData == null || silverSponsorQData!.isEmpty
                ? const SizedBox.shrink()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Divider(
                        thickness: 2,
                        color: AppColors.kYellow,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Silver Sponsor',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.kBlack,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      //
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: silverSponsorQData!.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 20);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return SponsorCard(
                            imageLink: silverSponsorQData![index].image.url,
                            sponsorsName: silverSponsorQData![index].name,
                            about: silverSponsorQData![index].about,
                            websiteLink:
                                silverSponsorQData![index].social.homepage,
                          );
                        },
                      ),
                    ],
                  ),
            //
            //
            bronzeSponsorQData == null || bronzeSponsorQData!.isEmpty
                ? const SizedBox.shrink()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Divider(
                        thickness: 2,
                        color: AppColors.kYellow,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Bronze Sponsor',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.kBlack,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      //
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: bronzeSponsorQData!.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 20);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return SponsorCard(
                            imageLink: bronzeSponsorQData![index].image.url,
                            sponsorsName: bronzeSponsorQData![index].name,
                            about: bronzeSponsorQData![index].about,
                            websiteLink:
                                bronzeSponsorQData![index].social.homepage,
                          );
                        },
                      ),
                    ],
                  ),
            const SizedBox(height: 24),
            (goldSponsorQData == null || goldSponsorQData!.isEmpty) &&
                    (silverSponsorQData == null ||
                        silverSponsorQData!.isEmpty) &&
                    (bronzeSponsorQData == null || bronzeSponsorQData!.isEmpty)
                ? Center(
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 3),
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
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
