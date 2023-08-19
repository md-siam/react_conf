import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/const/color.dart';
import 'routing/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'React Conf',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kYellow),
      ),
      home: const BottomNavBar(),
    );
  }
}
