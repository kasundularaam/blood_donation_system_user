import 'package:blood_donation_system_user/core/constants/strings.dart';
import 'package:blood_donation_system_user/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/donations_page.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/request_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = [
    HomePage(),
    DonationsPage(),
    RequestPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(Strings.homeIcon),
              label: "Home",
              backgroundColor: AppColors.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(Strings.donationsIcon),
              label: "Donations",
              backgroundColor: AppColors.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(Strings.requestIcon),
              label: "Request",
              backgroundColor: AppColors.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(Strings.profileIcon),
              label: "Profile",
              backgroundColor: AppColors.primaryColor,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.lightElv0,
          unselectedItemColor: AppColors.lightElv0.withOpacity(0.7),
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5,
        ),
      ),
    );
  }
}
