import 'package:blood_donation_system_user/logic/donation_map_cubit/donation_map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../logic/donations_cubit/donations_cubit.dart';
import '../../../logic/profile_page_cubit/profile_page_cubit.dart';
import '../../../logic/sign_out_cubit/sign_out_cubit.dart';
import 'pages/donations_page.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/request_page.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = [
    BlocProvider(
      create: (context) => DonationMapCubit(),
      child: const HomePage(),
    ),
    BlocProvider(
      create: (context) => DonationsCubit(),
      child: const DonationsPage(),
    ),
    const RequestPage(),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignOutCubit(),
        ),
        BlocProvider(
          create: (context) => ProfilePageCubit(),
        ),
      ],
      child: const ProfilePage(),
    ),
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
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
              ),
              label: "Home",
              backgroundColor: AppColors.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.water_drop_rounded,
              ),
              label: "Donations",
              backgroundColor: AppColors.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.airline_seat_flat_rounded,
              ),
              label: "Request",
              backgroundColor: AppColors.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_rounded,
              ),
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
