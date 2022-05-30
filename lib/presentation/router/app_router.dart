import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/bds_donation.dart';
import '../../data/models/bds_user.dart';
import '../../logic/auth_nic_cubit/auth_nic_cubit.dart';
import '../../logic/create_account_cubit/create_account_cubit.dart';
import '../../logic/donation_page_cubit/donation_page_cubit.dart';
import '../../logic/landing_cubit/landing_cubit.dart';
import '../../logic/login_cubit/login_cubit.dart';
import '../../logic/show_report_cubit/show_report_cubit.dart';

import '../../logic/update_blood_type_cubit/update_blood_type_cubit.dart';
import '../../logic/verify_account_cubit/verify_account_cubit.dart';
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
          builder: (_) => BlocProvider(
            create: (context) => AuthNicCubit(),
            child: const AuthNicPage(),
          ),
        );
      case authActivePage:
        final BdsUser user = settings.arguments as BdsUser;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(),
            child: AuthActivePage(
              user: user,
            ),
          ),
        );
      case authInactivePage:
        final BdsUser user = settings.arguments as BdsUser;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => VerifyAccountCubit(),
            child: AuthInactivePage(
              user: user,
            ),
          ),
        );
      case authNewPage:
        final String nic = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CreateAccountCubit(),
            child: AuthNewPage(
              nic: nic,
            ),
          ),
        );
      case authBloodType:
        final BdsUser user = settings.arguments as BdsUser;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => UpdateBloodTypeCubit(),
            child: AuthBloodType(user: user),
          ),
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
