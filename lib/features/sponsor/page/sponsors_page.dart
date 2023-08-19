import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:react_conf/core/const/color.dart';

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
        child: SingleChildScrollView(
          controller: null,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SvgPicture.asset('assets/sponsors/gold_sponsor.svg'),
              const SizedBox(height: 16),
              SvgPicture.asset('assets/sponsors/silver_sponsors.svg'),
              const SizedBox(height: 16),
              SvgPicture.asset('assets/sponsors/bronze_sponsors.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
