import 'package:flutter/material.dart';

import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';

class AuthActivePage extends StatefulWidget {
  const AuthActivePage({Key? key}) : super(key: key);

  @override
  State<AuthActivePage> createState() => _AuthActivePageState();
}

class _AuthActivePageState extends State<AuthActivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
          child: Text(
        "Auth Active",
        style: AppTextStyles.h1Light,
      )),
    );
  }
}
