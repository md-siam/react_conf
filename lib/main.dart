import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'const/color.dart';
import 'pages/home_page.dart';
import 'pages/sponsors_page.dart';

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

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SponsorPage(appBarTitle: 'Our Sponsors'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Symbols.today, size: 26),
            label: 'Conference',
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.campaign, size: 36),
            label: 'Sponsors',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.kYellow,
        onTap: _onItemTapped,
      ),
    );
  }
}
