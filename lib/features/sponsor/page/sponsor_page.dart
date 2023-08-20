import 'package:flutter/material.dart';
import 'package:react_conf/core/const/color.dart';

import '../../../core/const/text_style.dart';
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
          style: appBarHeaderTStyle,
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
                  cardName: 'gold_sponsor.svg',
                ),
                SponsorCard(
                  cardName: 'silver_sponsors.svg',
                ),
                SponsorCard(
                  cardName: 'bronze_sponsors.svg',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
