import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../core/const/app_color.dart';

class CustomConfCard extends StatelessWidget {
  final String day;
  final String name;
  final String slogan;
  const CustomConfCard({
    Key? key,
    required this.day,
    required this.name,
    required this.slogan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _parseDateStr(day),
          style: const TextStyle(
            fontSize: 17,
            color: AppColors.kDeepGray,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 5.0,
          decoration: const BoxDecoration(
            color: AppColors.kYellow,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.kVeryLightGray,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0.0, 0.75),
              ),
            ],
          ),
          child: Row(
            children: [
              SvgPicture.asset('assets/images/marker.svg'),
              const SizedBox(width: 20),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 22,
                        color: AppColors.kDeepBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      slogan,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.kDeepGray,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// This method format DateTime to [day-monthName-Year]
  ///
  String _parseDateStr(String inputString) {
    try {
      DateTime parse = DateTime.parse(inputString);
      //
      return '${parse.day} ${DateFormat.MMM().format(parse)}, ${parse.year}';
    } catch (e) {
      log(e.toString());
      String fixedYear = inputString.split('-').first;
      String fixedMonth = inputString.split('-').elementAt(1).padLeft(2, '0');
      String fixedDay = inputString.split('-').last;
      String modifiedDate = '$fixedYear-$fixedMonth-$fixedDay';
      //
      DateTime parse = DateTime.parse(modifiedDate);
      //
      return '${parse.day} ${DateFormat.MMM().format(parse)}, ${parse.year}';
    }
  }
}
