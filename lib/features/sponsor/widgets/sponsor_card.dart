import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SponsorCard extends StatelessWidget {
  final String imageLink;
  const SponsorCard({Key? key, required this.imageLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset('assets/sponsors/$imageLink'),
        const SizedBox(height: 16),
      ],
    );
  }
}
