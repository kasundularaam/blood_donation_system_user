import '../screens/auth/auth_blood_type.dart';
import '../screens/home_screen/home_screen.dart';

import '../screens/auth/authActivePage.dart';
import '../screens/auth/authInactivePage.dart';
import '../screens/auth/authNewPage.dart';
import '../screens/auth/authNicPage.dart';
import '../screens/landing_screen/landing_page.dart';
import 'package:flutter/material.dart';

import '../../core/exceptions/route_exception.dart';

class AppRouter {
  static const String landingPage = '/';
  static const String homeScreen = '/homeScreen';
  static const String authNicPage = '/authNicPage';
  static const String authActivePage = '/authActivePage';
  static const String authInactivePage = '/authInactivePage';
  static const String authNewPage = '/authNewPage';
  static const String authBloodType = '/authBloodType';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingPage:
        return MaterialPageRoute(
          builder: (_) => const LandingPage(),
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
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case authBloodType:
        return MaterialPageRoute(
          builder: (_) => const AuthBloodType(),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
