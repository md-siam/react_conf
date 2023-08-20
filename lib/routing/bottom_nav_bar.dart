import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../core/const/color.dart';
import '../features/conference/pages/conference_page.dart';
import '../features/sponsor/page/sponsor_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = [
    ConferencePage(
      appBarTitle: SvgPicture.asset(
        'assets/images/app_title.svg',
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
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 10.0,
              offset: Offset(0.0, 0.60),
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: const [
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
      ),
    );
  }
}
