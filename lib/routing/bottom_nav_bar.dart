
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../core/const/color.dart';
import '../features/conference/pages/conference_page.dart';
import '../features/sponsor/page/sponsors_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    ConferencePage(
      appBarTitle: Image.asset(
        'assets/images/logo_black.png',
        height: 48,
      ),
    ),
    const SponsorPage(
      appBarTitle: 'Our Sponsors',
    ),
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