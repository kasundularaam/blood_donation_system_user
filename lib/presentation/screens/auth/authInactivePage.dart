import 'package:flutter/material.dart';

import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';

class AuthInactivePage extends StatefulWidget {
  const AuthInactivePage({Key? key}) : super(key: key);

  @override
  State<AuthInactivePage> createState() => _AuthInactivePageState();
}

class _AuthInactivePageState extends State<AuthInactivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Text(
          "Auth Inactive",
          style: AppTextStyles.h1Light,
        ),
      ),
    );
  }
}
