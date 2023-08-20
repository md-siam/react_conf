import 'package:flutter/material.dart';
import 'package:react_conf/core/const/app_color.dart';

/// TextStyle for different types of [Header]
///
TextStyle appBarHeaderTStyle = const TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: AppColors.kDeepBlue,
);

/// TextStyle for [Tab] label text style
///
TextStyle selectedTabTStyle = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w700,
);

TextStyle unSelectedTabTStyle = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
);
