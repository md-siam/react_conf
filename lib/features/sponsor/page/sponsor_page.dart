import 'package:flutter/material.dart';
import 'package:react_conf/core/const/color.dart';

import '../widgets/sponsor_card.dart';

class SponsorPage extends StatelessWidget {
  final String appBarTitle;
  const SponsorPage({
    Key? key,
    required this.appBarTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.kVeryLightGray,
        title: Text(
          appBarTitle,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.kDeepBlue,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24).copyWith(bottom: 10),
        child: const SingleChildScrollView(
          controller: null,
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                SponsorCard(
                  imageLink: 'gold_sponsor.svg',
                ),
                SponsorCard(
                  imageLink: 'silver_sponsors.svg',
                ),
                SponsorCard(
                  imageLink: 'bronze_sponsors.svg',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
