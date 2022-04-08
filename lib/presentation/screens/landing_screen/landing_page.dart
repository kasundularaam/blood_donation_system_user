import 'package:flutter/material.dart';

import '../../../core/constants/strings.dart';
import '../../../core/themes/app_colors.dart';
import '../../router/app_router.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  static const Duration duration = Duration(seconds: 2);

  void goToHome() => Future.delayed(duration).then((value) =>
      Navigator.pushNamedAndRemoveUntil(
          context, AppRouter.homeScreen, (route) => false));
  void goToAuth() => Future.delayed(duration).then((value) =>
      Navigator.pushNamedAndRemoveUntil(
          context, AppRouter.authNicPage, (route) => false));
  @override
  Widget build(BuildContext context) {
    goToAuth();
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Image.asset(Strings.landingPageImg),
      ),
    );
  }
}
