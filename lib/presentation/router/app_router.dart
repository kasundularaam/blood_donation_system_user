import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/bds_donation.dart';
import '../../logic/donation_page_cubit/donation_page_cubit.dart';
import '../../logic/landing_cubit/landing_cubit.dart';
import '../../logic/show_report_cubit/show_report_cubit.dart';

import '../screens/auth/authActivePage.dart';
import '../screens/auth/authInactivePage.dart';
import '../screens/auth/authNewPage.dart';
import '../screens/auth/authNicPage.dart';
import '../screens/auth/auth_blood_type.dart';
import '../screens/donation_screen/donation_page.dart';
import '../screens/landing_screen/landing_page.dart';
import 'package:flutter/material.dart';

import '../../core/exceptions/route_exception.dart';
import '../screens/user_screen/user_screen.dart';

class AppRouter {
  static const String landingPage = '/';
  static const String homeScreen = '/homeScreen';
  static const String authNicPage = '/authNicPage';
  static const String authActivePage = '/authActivePage';
  static const String donationPage = '/donationPage';
  static const String authInactivePage = '/authInactivePage';
  static const String authNewPage = '/authNewPage';
  static const String authBloodType = '/authBloodType';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LandingCubit(),
            child: const LandingPage(),
          ),
        );

      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => const UserScreen(),
        );
      case authNicPage:
        return MaterialPageRoute(
          builder: (_) => const AuthNicPage(),
        );
      case authActivePage:
        return MaterialPageRoute(
          builder: (_) => const AuthActivePage(),
        );
      case authInactivePage:
        return MaterialPageRoute(
          builder: (_) => const AuthInactivePage(),
        );
      case authNewPage:
        return MaterialPageRoute(
          builder: (_) => const AuthNewPage(),
        );
      case authBloodType:
        return MaterialPageRoute(
          builder: (_) => const AuthBloodType(),
        );
      case donationPage:
        final BdsDonation donation = settings.arguments as BdsDonation;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => DonationPageCubit(),
                ),
                BlocProvider(
                  create: (context) => ShowReportCubit(),
                )
              ],
              child: DonationPage(
                donation: donation,
              )),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
