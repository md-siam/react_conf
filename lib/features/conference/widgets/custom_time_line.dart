import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../core/const/color.dart';

class CustomTimeLine extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final Widget child;
  const CustomTimeLine({
    Key? key,
    required this.isFirst,
    required this.isLast,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: const LineStyle(
        color: AppColors.kYellow,
      ),
      indicatorStyle: IndicatorStyle(
        width: 48,
        height: 48,
        indicator: SvgPicture.asset(
          'assets/images/electric_bolt.svg',
          fit: BoxFit.cover,
        ),
      ),
      endChild: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: child,
      ),
    );
  }
}
