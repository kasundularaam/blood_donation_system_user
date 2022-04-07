import 'package:flutter/material.dart';

import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';

class AuthBloodType extends StatefulWidget {
  const AuthBloodType({Key? key}) : super(key: key);

  @override
  State<AuthBloodType> createState() => _AuthBloodTypeState();
}

class _AuthBloodTypeState extends State<AuthBloodType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
          child: Text(
        "Auth Blood Type",
        style: AppTextStyles.h1Light,
      )),
    );
  }
}
