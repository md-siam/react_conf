import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SponsorCard extends StatelessWidget {
  final String cardName;
  const SponsorCard({Key? key, required this.cardName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6.0,
      borderRadius: BorderRadius.circular(10),
      child: SvgPicture.asset(
        'assets/sponsors/$cardName',
        width: MediaQuery.of(context).size.width - 24,
      ),
    );
  }
}
